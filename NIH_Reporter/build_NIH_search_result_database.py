import time
import sqlite3

import requests

ENDPOINT = "https://api.reporter.nih.gov/v2/projects/search"
DATABASE = "awards.db.2"


query = {
        "criteria": {
            "advanced_text_search": { "search_field": "terms,projecttitle", "search_text": "(cochlea OR \"basilar papilla\" OR \"organ of corti\" OR \"stria vascularis\" OR \"basilar membrane\" OR \"vestibular labyrinth\" OR \"semicircular canal\" OR \"vestibular macula\" OR otolith OR crista ampullaris OR utricle OR cochlea OR \"basilar papilla\" OR \"organ of corti\" OR \"stria vascular\" OR \"basilar membrane\" OR \"reissner membrane\" OR \"inner hair cell\" OR \"outer hair cell\" OR \"auditory hair cell\" OR \"spiral gangli\" OR \"auditory nerv\" OR \"vestibular gangli\" OR \"vestibular nerv\" OR \"vestibular epitheli\" OR \"vestibular labyrinth\" OR \"semicircular canal\" OR \"vestibular macula\" OR otolith OR otoconi OR crista ampullaris OR utric OR saccul)"} },
        "include_fields": [
            "FiscalYear", "ProjectNum", "ActivityCode","AwardType","Organization", "AwardAmount", "AbstractText"
            ],
        "offset": 0,
        "limit": 500,
        "sort_field": "project_start_date",
        "sort_order": "desc"
        }


def make_database():
    """JSON from the API will be inserted into this database for local use"""
    with sqlite3.connect(DATABASE) as conn:
        conn.executescript("""
    CREATE TABLE IF NOT EXISTS awards (
        fiscal_year TEXT,
        project_num TEXT,
        org_name TEXT,
        city TEXT,
        country TEXT,
        org_city TEXT,
        org_country TEXT,
        org_state TEXT,
        org_state_name TEXT,
        dept_type TEXT,
        fips_country_code TEXT,
        primary_duns TEXT,
        primary_uei TEXT,
        org_fips TEXT,
        org_ipf_code TEXT,
        org_zipcode TEXT,
        external_org_id TEXT,
        award_type TEXT,
        activity_code TEXT,
        abstract_text TEXT,
        award_amount TEXT);
    CREATE TABLE IF NOT EXISTS org_duns (
        external_org_id TEXT,
        dun TEXT);
    CREATE TABLE IF NOT EXISTS org_ueis (
        external_org_id TEXT,
        uei TEXT);""")


def add_result_to_db(json_dict):
    """Add individual record to database"""
    conn = sqlite3.connect(DATABASE)
    sql1 = """
INSERT INTO awards
    (fiscal_year,
    project_num,
    org_name,
    city,
    country,
    org_city,
    org_country,
    org_state,
    org_state_name,
    dept_type,
    fips_country_code,
    primary_duns,
    primary_uei,
    org_fips,
    org_ipf_code,
    org_zipcode,
    external_org_id,
    award_type,
    activity_code,
    abstract_text,
    award_amount) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?); """
    conn.execute(sql1, (json_dict["fiscal_year"],
    json_dict["project_num"],
    json_dict["organization"]["org_name"],
    json_dict["organization"]["city"],
    json_dict["organization"]["country"],
    json_dict["organization"]["org_city"],
    json_dict["organization"]["org_country"],
    json_dict["organization"]["org_state"],
    json_dict["organization"]["org_state_name"],
    json_dict["organization"]["dept_type"],
    json_dict["organization"]["fips_country_code"],
    json_dict["organization"]["primary_duns"],
    json_dict["organization"]["primary_uei"],
    json_dict["organization"]["org_fips"],
    json_dict["organization"]["org_ipf_code"],
    json_dict["organization"]["org_zipcode"],
    json_dict["organization"]["external_org_id"],
    json_dict["award_type"],
    json_dict["activity_code"],
    json_dict["abstract_text"],
    json_dict["award_amount"]))

    sql2 = """INSERT INTO org_duns
    (external_org_id,
    dun) VALUES (?, ?);"""

    sql3 = """INSERT INTO org_ueis
    (external_org_id,
    uei) VALUES (?, ?);"""

    if json_dict["organization"]["org_duns"]:
        for dun in json_dict["organization"]["org_duns"]:
            conn.execute(sql2, (json_dict["organization"]["external_org_id"], dun))
    if json_dict["organization"]["org_ueis"]:
        for uei in json_dict["organization"]["org_ueis"]:
            conn.execute(sql3, (json_dict["organization"]["external_org_id"], uei))
    conn.commit()


def count_total_results(q):
    """This function returns the total number of results reported by the API.
    Its purpose is to help us break up our requests into chunks of 500.
    """
    r =  requests.post(ENDPOINT, json=q)
    return r.json()['meta']['total']


def make_request(q):
    """Access the endpoint, but wait 10 seconds first"""
    print("making request")
    time.sleep(10)
    return requests.post(ENDPOINT, json=q)


def main():
    """Access the JSON endpoint 500 results at a time, and add to db"""
    make_database()
    #total_results = 8529
    total_results = count_total_results(query)
    step = 500
    all_json = []
    for i in range(0, ((total_results + step ) // step) * step, step ):
        query['offset'] = i
        r = make_request(query)
        all_json.append(r.json())
    for tranche in all_json:
        for obj in tranche["results"]:
            try:
                add_result_to_db(obj)
            except KeyError as err:
                print(f"ERROR: {err}\n")


main()

import json
import time
import urllib.parse

import requests

BASE_URL = "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi"


def build_url(mindate, maxdate, term):
    """Construct the full API request URL with encoded parameters."""
    params = {
        'db': "pubmed",
        'term': term,
        'datetype': "pdat",
        'mindate': mindate,
        'maxdate': maxdate,
        'retstart': 0,
        'retmax': 60,
        'tool': "biomed3",
        'retmode': "json"
    }
    encoded_params = urllib.parse.urlencode(params)
    return f"{BASE_URL}?{encoded_params}"


def run_query(url):
    """Execute a GET request to the specified URL and return the response text."""
    return requests.get(url).text


def fetch_and_print_result(mindate, maxdate, term):
    """Fetch result count from API and print it."""
    url = build_url(mindate, maxdate, term)
    data = json.loads(run_query(url))
    count = data['esearchresult'].get('count', 'N/A')
    print(f"{count}")


def make_date_range(name, query_string, start=1825, end=2024):
    periods = {}
    for year in range(start, end + 1, 10):
        period_end = min(year + 9, end)
        periods[f"{name}_{year}-{period_end}"] = (year, period_end, query_string)
    return periods


if __name__ == "__main__":
    search_terms = {
            "all_1970": (1970, 1971, '"Reissner membrane" OR "tectorial membrane" OR cochlea OR "stria vascularis" OR "basilar membrane" OR "spiral ganglion" OR "organ of corti" OR "vestibular macula" OR "crista ampullaris" OR utricle OR saccule OR otolith OR "semicircular canal" OR "vestibular labyrinth" NOT prostatic NOT laryngeal'),
    #       "all_2024": (2024, 2025, '"Reissner membrane" OR "tectorial membrane" OR cochlea OR "stria vascularis" OR "basilar membrane" OR "spiral ganglion" OR "organ of corti" OR "vestibular macula" OR "crista ampullaris" OR utricle OR saccule OR otolith OR "semicircular canal" OR "vestibular labyrinth" NOT prostatic NOT laryngeal'),
            "all":      (1825, 2025, '"Reissner membrane" OR "tectorial membrane" OR cochlea OR "stria vascularis" OR "basilar membrane" OR "spiral ganglion" OR "organ of corti" OR "vestibular macula" OR "crista ampullaris" OR utricle OR saccule OR otolith OR "semicircular canal" OR "vestibular labyrinth" NOT prostatic NOT laryngeal'),
    #       "auditory_2024": (2024, 2025, '"Reissner membrane" OR "tectorial membrane" OR cochlea OR "stria vascularis" OR "basilar membrane" OR "spiral ganglion" OR "organ of corti" NOT "vestibular macula" NOT "crista ampullaris" NOT utricle OR saccule NOT otolith NOT "semicircular canal" NOT "vestibular labyrinth" NOT prostatic NOT laryngeal'),
            "auditory": (1825, 2025, '"Reissner membrane" OR "tectorial membrane" OR cochlea OR "stria vascularis" OR "basilar membrane" OR "spiral ganglion" OR "organ of corti" NOT "vestibular macula" NOT "crista ampullaris" NOT utricle OR saccule NOT otolith NOT "semicircular canal" NOT "vestibular labyrinth" NOT prostatic NOT laryngeal'),
            "basilar": (1825, 2025, '"basilar membrane" NOT "vestibular macula" NOT "crista ampullaris" NOT utricle NOT saccule NOT otolith NOT "semicircular canal" NOT "vestibular labyrinth"'),
            "cochlea": (1825, 2025, 'cochlea NOT "vestibular macula" NOT "crista ampullaris" NOT utricle NOT saccule NOT otolith NOT "semicircular canal" NOT "vestibular labyrinth"'),
            "crista": (1825, 2025, '"crista ampullaris" NOT "tectorial membrane" NOT "basilar papilla" NOT "organ of corti" NOT "Reissner membrane" NOT "spiral ganglion" NOT "stria vascularis" NOT "basilar membrane" NOT prostatic NOT laryngeal'),
            "organofcorti": (1825, 2025, '"organ of corti" NOT "vestibular macula" NOT "crista ampullaris" NOT utricle NOT saccule NOT otolith NOT "semicircular canal" NOT "vestibular labyrinth"'),
            "other": (2015, 2025, 'NOT utricle NOT saccule NOT "vestibular macula" NOT "vestibular labyrinth" NOT "crista ampullaris" NOT "semicircular canal" NOT otolith NOT "tectorial membrane" NOT "basilar papilla" NOT "organ of corti" NOT "Reissner membrane" NOT "spiral ganglion" NOT "stria vascularis" NOT "basilar membrane" NOT prostatic NOT laryngeal'),
            "otolith": (1825, 2025, 'otolith NOT "vesibular macula" NOT "tectorial membrane" NOT "basilar papilla" NOT "organ of corti" NOT "Reissner membrane" NOT "spiral ganglion" NOT "stria vascularis" NOT "basilar membrane" NOT prostatic NOT laryngeal'),
            "tectorial": (1825, 2025, '"tectorial membrane" NOT "vestibular macula" NOT "crista ampullaris" NOT utricle NOT saccule NOT otolith NOT "semicircular canal" NOT "vestibular labyrinth"'),
            "saccule": (1825, 2025, 'saccule NOT "tectorial membrane" NOT "basilar papilla" NOT "organ of corti" NOT "Reissner membrane" NOT "spiral ganglion" NOT "stria vascularis" NOT "basilar membrane" NOT prostatic NOT laryngeal'),
            "sgn": (1825, 2025, '"spiral ganglion" NOT "vestibular macula" NOT "crista ampullaris" NOT utricle NOT saccule NOT otolith NOT "semicircular canal" NOT "vestibular labyrinth"'),
            "ssc": (1825, 2025, '"semicircular canal" NOT "tectorial membrane" NOT "basilar papilla" NOT "organ of corti" NOT "Reissner membrane" NOT "spiral ganglion" NOT "stria vascularis" NOT "basilar membrane" NOT prostatic NOT laryngeal'),
    #       "stria": (1825, 2025, '"stria vascularis" NOT "vestibular macula" NOT "crista ampullaris" NOT utricle NOT saccule NOT otolith NOT "semicircular canal" NOT "vestibular labyrinth"'),
            "striavascularis": (1825, 2025, '"stria vascularis" NOT "vestibular macula" NOT "crista ampullaris" NOT utricle NOT saccule NOT otolith NOT "semicircular canal" NOT "vestibular labyrinth"'),
            "Reissner": (1825, 2025, '"Reissner membrane" NOT "vestibular macula" NOT "crista ampullaris" NOT utricle NOT saccule NOT otolith NOT "semicircular canal" NOT "vestibular labyrinth"'),
            "utricle": (1825, 2025, 'otolith NOT "tectorial membrane" NOT "basilar papilla" NOT "organ of corti" NOT "Reissner membrane" NOT "spiral ganglion" NOT "stria vascularis" NOT "basilar membrane" NOT prostatic NOT laryngeal'),
    #       "vestib_2024": (2024, 2025, 'NOT "Reissner membrane" NOT "tectorial membrane" NOT cochlea NOT "stria vascularis" NOT "basilar membrane" NOT "spiral ganglion" NOT "organ of corti" OR "vestibular macula" OR "crista ampullaris" OR utricle OR saccule OR otolith OR "semicircular canal" NOT laryngeal NOT prostatic'),
            "vestib": (1825, 2025, 'NOT "Reissner membrane" NOT "tectorial membrane" NOT cochlea NOT "stria vascularis" NOT "basilar membrane" NOT "spiral ganglion" NOT "organ of corti" OR "vestibular macula" OR "crista ampullaris" OR utricle OR saccule OR otolith OR "semicircular canal" NOT laryngeal NOT prostatic'),
            "vl": (1825, 2025, '"vestibular labyrinth"'),
            "vm": (1825, 2025, '"vestibular maculae" NOT "tectorial membrane" NOT "basilar papilla" NOT "organ of corti" NOT "Reissner membrane" NOT "spiral ganglion" NOT "stria vascularis" NOT "basilar membrane" NOT prostatic NOT laryngeal')
     }

    auditory_range = make_date_range("auditory", search_terms["auditory"][-1])
    vestibular_range = make_date_range("vestibular", search_terms["vestib"][-1])
    other_range  = make_date_range("other", search_terms["other"][-1])
    all_  = make_date_range("all", search_terms["all"][-1])
    search_terms |= auditory_range
    search_terms |= vestibular_range
    search_terms |= other_range
    search_terms |= all_

    for key, args in search_terms.items():
        time.sleep(1)
        print(f"{key}", end=', ')
        fetch_and_print_result(*args)

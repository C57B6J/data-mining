#Search all clinical trials containing all ear terms
import requests
import json

queries = {
"unnamed": "cochlea OR utricle OR semicircular canal OR vestibular OR auditory OR otolith OR otoconia OR organ of corti OR ear disease OR hearing loss OR presbycusis OR deaf OR vertigo OR dizziness OR labyrinthitis OR Usher Syndrome OR Neurofibromatosis type 2 OR vestibular schwannoma OR acoustic neuroma",
"all": "cochlea OR utricle OR semicircular canal OR vestibular OR auditory OR otolith OR otoconia OR organ of corti OR ear disease OR hearing loss OR presbycusis OR deaf OR vertigo OR dizziness OR labyrinthitis OR Usher Syndrome OR Neurofibromatosis type 2 OR vestibular schwannoma OR acoustic neuroma OR Heimler syndrome OR Norrie disease OR Perrault syndrome OR Pendred syndrome OR Waardenburg syndrome OR Treacher Collins syndrome OR Branchio-oto-renal syndrome OR Stickler syndrome OR Alport syndrome OR Usher syndrome OR CHARGE syndrome OR Jervell and Lange-Nielsen syndrome OR Ramsay Hunt syndrome",
"all_completed": "cochlea OR utricle OR semicircular canal OR vestibular OR auditory OR otolith OR otoconia OR organ of corti OR ear disease OR hearing loss OR presbycusis OR deaf OR vertigo OR dizziness OR labyrinthitis OR Usher Syndrome OR Neurofibromatosis type 2 OR vestibular schwannoma OR acoustic neuroma OR Heimler syndrome OR Norrie disease OR Perrault syndrome OR Pendred syndrome OR Waardenburg syndrome OR Treacher Collins syndrome OR Branchio-oto-renal syndrome OR Stickler syndrome OR Alport syndrome OR Usher syndrome OR CHARGE syndrome OR Jervell and Lange-Nielsen syndrome OR Ramsay Hunt syndrome",
"auditory": "cochlea OR organ of corti OR hearing loss OR deaf OR presbycusis OR auditory OR Neurofibramotosis type 2 OR Alport syndrome OR Branchio-Oto-Renal Syndrome OR CHARGE syndrome OR Heimler syndrome OR Jervell and Lange-Nielsen syndrome OR Norrie Disease OR Pendred syndrome OR Perrault syndrome OR Stickler syndrome OR Treacher Collins syndrome OR Usher syndrome OR Waardenburg syndrome OR Ramsay hunt syndrome AND NOT utricle AND NOT semicircular canal AND NOT saccule AND NOT vestibular AND NOT otolith AND NOT otoconia AND NOT vertigo AND NOT dizziness AND NOT labyrinthitis", 
"auditory_completed": "cochlea OR organ of corti OR hearing loss OR deaf OR presbycusis OR auditory OR Neurofibramotosis type 2 OR Alport syndrome OR Branchio-Oto-Renal Syndrome OR CHARGE syndrome OR Heimler syndrome OR Jervell and Lange-Nielsen syndrome OR Norrie Disease OR Pendred syndrome OR Perrault syndrome OR Stickler syndrome OR Treacher Collins syndrome OR Usher syndrome OR Waardenburg syndrome OR Ramsay Hunt syndrome AND NOT utricle AND NOT semicircular canal AND NOT saccule AND NOT vestibular AND NOT otolith AND NOT otoconia AND NOT vertigo AND NOT dizziness AND NOT labyrinthitis", 
"other":"NOT cochlea NOT utricle NOT semicircular canal NOT vestibular NOT auditory NOT otolith NOT otoconia NOT organ of corti NOT ear disease NOT hearing loss NOT presbycusis NOT deaf NOT vertigo NOT dizziness NOT labyrinthitis NOT Usher Syndrome NOT Neurofibromatosis type 2 NOT vestibular schwannoma NOT acoustic neuroma NOT Pendred syndrome NOT Waardenburg syndrome NOT Treacher Collins syndrome NOT Branchio-oto-renal syndrome NOT Stickler syndrome NOT Alport syndrome NOT Usher syndrome NOT CHARGE syndrome NOT Jervell and Lange-Nielsen syndrome",
"vestib": "semicircular canal OR vestibular OR otolith OR otoconia OR ear disease OR vertigo OR dizziness OR Alport syndrome OR Branchio-oto-renal syndrome OR CHARGE syndrome OR Heimler syndrome OR Jervell and Lange-Nielsen syndrome OR Norrie disease OR Pendred syndrome OR Perrault syndrome OR Stickler syndrome OR Treacher Collins syndrome OR Usher syndrome OR Waardenburg syndrome OR Neurofibramotosis type 2 OR Ramsay Hunt syndrome OR utricle OR saccule labyrinthitis AND NOT hearing loss AND NOT presbycusis AND NOT organ of corti AND NOT deaf AND NOT cochlea", 
"vestib_completed": "semicircular canal OR vestibular OR otolith OR otoconia OR ear disease OR vertigo OR dizziness OR Alport syndrome OR Branchio-oto-renal syndrome OR CHARGE syndrome OR Heimler syndrome OR Jervell and Lange-Nielsen syndrome OR Norrie disease OR Pendred syndrome OR Perrault syndrome OR Stickler syndrome OR Treacher Collins syndrome OR Usher syndrome OR Waardenburg syndrome OR Neurofibramotosis type 2 OR Ramsay Hunt syndrome OR utricle OR saccule labyrinthitis AND NOT hearing loss AND NOT presbycusis AND NOT organ of corti AND NOT deaf AND NOT cochlea", 
"clinicaltrials_syndromes": "Heimler syndromer OR Norrie disease OR Perrault syndrome OR Pendred syndrome OR Waardenburg syndrome OR Treacher Collins syndrome OR Branchio-oto-renal syndrome OR Stickler syndrome OR Alport syndrome OR Usher syndrome OR CHARGE syndrome OR Jervell and Lange-Nielsen syndrome"
}

def query_clinical_trials_gov(cond):
    url = "https://clinicaltrials.gov/api/v2/studies"
    params = {
        "format": "json",
        "query.cond": cond,
        "query.titles": cond,
        "countTotal": "true",
        "filter.overallStatus": "COMPLETED,ACTIVE_NOT_RECRUITING,ENROLLING_BY_INVITATION,NOT_YET_RECRUITING,RECRUITING,SUSPENDED,TERMINATED,WITHDRAWN,AVAILABLE,NO_LONGER_AVAILABLE,TEMPORARILY_NOT_AVAILABLE,APPROVED_FOR_MARKETING,WITHHELD,UNKNOWN",
        "fields": "Condition,BriefTitle,OfficialTitle,BriefSummary"
    }
    headers = {
        "accept": "application/json"
    }
    response = requests.get(url, headers=headers, params=params)
    if response.status_code == 200:
        return json.dumps(response.json())
    else:
        return response.content


for category in queries.keys():
    print(category.upper() + "  -  " + str(json.loads(query_clinical_trials_gov(queries[category]))["totalCount"]))

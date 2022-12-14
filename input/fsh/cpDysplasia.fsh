Profile: CPDysplasia
Parent: Observation
Id: cp-dysplasia
Title: "Dysplasia (Observation)"
Description: "Is this polyp severely dysplastic?"
* ^version = "0.0.1"
* ^publisher = "Not published"
* ^contact.name = "Dan Heslinga"
* ^contact.telecom[0].system = #email
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* status from cp-final-or-amended
* category 1..1
// * category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory "Laboratory"
* category = $OBSCAT#laboratory "Laboratory"
// this laboratory category expressly includes histology
// * code 1..1 // redundant, code is 1..1 in Observation. 
* code = $SNOMEDCT#55237006 "Severe dysplasia (morphologic abnormality)"
* value[x] 1..1
* value[x] only boolean
* subject 1..1
* subject only Reference(cp-patient) 

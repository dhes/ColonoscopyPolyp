Profile: CPNoMalignantNeoplasm
Parent: Observation
Id: cp-no-malignant-neoplasm
Title: "No Malignant Neoplasm (Observation)"
Description: "Is evidence absent of malignant neoplasm in this polyp?"
// Watch out! "true" means there is no evidence of malignanct neoplasm.
* ^version = "0.0.1"
* ^publisher = "Not published"
* ^contact.name = "Dan Heslinga"
* ^contact.telecom[0].system = #email
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* status from cp-final-or-amended  // wrong status test written; status is already 1..1 in Observation
* category 1..1
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory "Laboratory"
// * code 1..1 // redundant, code is 1..1 in Observation. 
* code = $SNOMEDCT#110396000 "No evidence of malignant neoplasm (finding)"
* value[x] 1..1
* value[x] only boolean
// * valueCodeableConcept from cp-histopathology-vs (required)
* subject 1..1
* subject only Reference(cp-patient) 

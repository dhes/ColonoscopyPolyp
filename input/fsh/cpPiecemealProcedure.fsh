Profile: CPPiecemealProcedure
Parent: Observation
Id: cp-piecemeal-procedure
Title: "Colonscopy Polyp Piecemeal Excision"
Description: "Was this polyp excised piecemeal?"
* ^version = "0.0.1"
* ^publisher = "Not published"
* ^contact.name = "Dan Heslinga"
* ^contact.telecom[0].system = #email
* ^contact.telecom[=].value = "dan@heslinga.us"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* status from cp-final-or-amended  // wrong status test written; status is already 1..1 in Observation
* category 1..1
* category = http://terminology.hl7.org/CodeSystem/observation-category#procedure
// * code 1..1 // redundant, code is 1..1 in Observation. 
* code = $SNOMEDCT#787139004 // "Piecemeal excision (procedure)"
* value[x] 1..1
* value[x] only boolean
// * valueCodeableConcept from cp-histopathology-vs (required)
* subject 1..1
* subject only Reference(cp-patient) 

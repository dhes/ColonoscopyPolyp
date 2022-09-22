Profile: CPPathology
Parent: Observation
Id: cp-pathology
Title: "Histopathology (Observation)"
Description: "The histopathology of a polyp obtain via colonoscopy"
* ^version = "0.0.1"
* ^publisher = "Not published"
* ^contact.name = "Dan Heslinga"
* ^contact.telecom[0].system = #email
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* status from cp-final-or-amended
* category 1..1
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory "Laboratory"
// * code 1..1 // redundant, code is 1..1 in Observation. 
* code = $LOINC#34574-4 "Pathology report final diagnosis"
* value[x] 1..1 
* value[x] only CodeableConcept
* valueCodeableConcept from cp-histopathology-vs (required)
* subject 1..1
* subject only Reference(cp-patient) 

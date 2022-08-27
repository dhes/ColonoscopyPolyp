Profile: CPPolypDetailObservationHistopathology
Parent: Observation
Description: "The histopathology of a polyp"

* category 1..1
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code 1..1
* valueBoolean 1..1
* subject 1..1 
* subject only Reference(Patient)

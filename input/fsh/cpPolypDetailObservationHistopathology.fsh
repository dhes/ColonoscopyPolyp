Profile: CPPolypDetailObservationHistopathology
Parent: Observation
Description: "The histopathology of a polyp"

* status = $OBSSTATUS#final
* category 1..1
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code 1..1
* code = $LOINC#34574-4 //Pathology report final diagnosis
* value[x] 1..1
* value[x] only CodeableConcept
// * valueCodeableConcept 1..1
// * value[x] from cp-histopathology-vs
* valueCodeableConcept from cp-histopathology-vs (required)
* subject 1..1 
* subject only Reference(cp-patient)
// there should be one for every CPSpecimen/CPResult

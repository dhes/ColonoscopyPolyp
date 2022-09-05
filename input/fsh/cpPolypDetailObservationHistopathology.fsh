Profile: CPPolypDetailObservationHistopathology
Parent: Observation
Description: "The histopathology of a polyp"

* status from cp-final-or-amended  // wrong status test written; status is already 1..1 in Observation
* category 1..1
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
// * code 1..1 // redundant, code is 1..1 in Observation. 
* code = $LOINC#34574-4 //Pathology report final diagnosis // test done WrongCode
* value[x] 1..1 // 0 test done
* value[x] only CodeableConcept // valueQuantity test produces more than one error
* valueCodeableConcept from cp-histopathology-vs (required)
* subject 1..1 // test done
* subject only Reference(Patient) 

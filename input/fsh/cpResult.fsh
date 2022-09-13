Profile: CPResult
Parent: Observation
Id: cp-result
Title: "Polyp Test Result"
Description: "Results of tests on a polyp including histopathology and other details."
* ^version = "0.0.1"
* ^publisher = "Not published"
* ^contact.name = "Dan Heslinga"
* ^contact.telecom[0].system = #email
* ^contact.telecom[=].value = "dan@heslinga.us"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* subject 1..1
* subject only Reference(cp-patient) 
* status from cp-final-or-amended
* code = $SNOMEDCT#122645001 // Polyp from large intestine obtained by polypectomy (specimen)
* specimen only Reference(cp-specimen) 
* hasMember 4..4
* hasMember only Reference(cp-pathology-observation or cp-piecemeal-procedure or cp-dysplasia-observation or cp-no-malignant-neoplasm-observation)
// gonna need some slicing here....
// * hasMember[1] only Reference(cp-piecemeal-procedure)
// * hasMember[2] only Reference(cp-dysplasia-observation)
// * hasMember[3] only Reference(cp-no-malignant-neoplasm-observation)
            
Instance: example-cpBundle
InstanceOf: CPBundle
Usage: #example
Title: "Example CPBundle"
Description: "Example of a CPBundle that has a full set of resources."
* type = #collection
* entry[0].resource = example-cpPatient
* entry[+].resource = example-cpDiagnosticReport
* entry[+].resource = example-cpSpecimen
* entry[+].resource = example-cpResult
* entry[+].resource = example-cpPathology
* entry[+].resource = example-cpPiecemeal
* entry[+].resource = example-cpDysplasia
* entry[+].resource = example-cpNoMalignantNeoplasm


Instance: example-cpResult11
InstanceOf: CPResult
Usage: #example
Title: "Example CPResult 11"
Description: "..."
* subject.reference = "Patient/example-cpPatient"
* status = #final
* specimen.reference = "Specimen/example-cpSpecimen11"
* specimen.display = "COLD BIOPSY X 5: SIGMOID COLON 6"
* hasMember[pathology].reference = "Observation/example-cpPathology-hyperplastic-polyp"
* hasMember[pathology].display = "Hyperplastic polyp of intestine (disorder)"
// * hasMember[piecemeal].reference = "Observation/example-cpPiecemeal-false"
// * hasMember[piecemeal].display = "Piecemeal excision false"
* hasMember[severeDysplasia].reference = "Observation/example-cpDysplasia-false"
* hasMember[severeDysplasia].display = "Severe dysplasia false"
* hasMember[noMalignancy].reference = "Observation/example-cpNoMalignantNeoplasm-true"
* hasMember[noMalignancy].display = "No evidence of malignant neoplasm true"
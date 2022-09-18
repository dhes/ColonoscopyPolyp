Instance: example-cpResult12
InstanceOf: CPResult
Usage: #example
Title: "Example CPResult"
Description: "Example CPResult"
* subject.reference = "Patient/example-cpPatient"
* status = #final
* specimen.reference = "Specimen/example-specimen12"
* specimen.display = "E. COLD BIOPSY: RECTAL POLYP 1"
* hasMember[pathology].reference = "Observation/example-cpPathology-tubular-adenoma"
* hasMember[pathology].display = "Tubular adenoma of colon"
* hasMember[piecemeal].reference = "Observation/example-cpPiecemeal-false"
* hasMember[piecemeal].display = "Piecemeal excision false"
* hasMember[severeDysplasia].reference = "Observation/example-cpDysplasia-false"
* hasMember[severeDysplasia].display = "Severe dysplasia false"
* hasMember[noMalignancy].reference = "Observation/example-cpNoMalignantNeoplasm-true"
* hasMember[noMalignancy].display = "No evidence of malignant neoplasm true"
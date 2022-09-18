Instance: example-cpResult13
InstanceOf: CPResult
Usage: #example
Title: "Example CPResult"
Description: "Example CPResult"
* subject.reference = "Patient/example-cpPatient"
* status = #final
* specimen.reference = "Specimen/example-specimen13"
* specimen.display = "E. COLD BIOPSY: RECTAL POLYP 2"
* hasMember[pathology].reference = "Observation/example-cpPathology-hyperplastic-polyp"
* hasMember[pathology].display = "Hyperplastic polyp of intestine (disorder)"
* hasMember[piecemeal].reference = "Observation/example-cpPiecemeal-false"
* hasMember[piecemeal].display = "Piecemeal excision false"
* hasMember[severeDysplasia].reference = "Observation/example-cpDysplasia-false"
* hasMember[severeDysplasia].display = "Severe dysplasia false"
* hasMember[noMalignancy].reference = "Observation/example-cpNoMalignantNeoplasm-true"
* hasMember[noMalignancy].display = "No evidence of malignant neoplasm true"
Instance: example-cpResult12
InstanceOf: CPResult
Usage: #example
Title: "Example CPResult"
Description: "Example CPResult"
* subject.reference = "Patient/example-cpPatient"
* status = #final
* specimen.reference[0] = "Specimen/example-specimen"
* specimen.display[0] = "A. Ascending colon polyp cold snare"
* hasMember[pathology].reference = "Observation/example-cpPathology"
* hasMember[pathology].display = "Tubular adenoma of colon"
* hasMember[piecemeal].reference = "Observation/example-cpPiecemeal"
* hasMember[piecemeal].display = "Piecemeal excision false"
* hasMember[severeDysplasia].reference = "Observation/example-cpDysplasia"
* hasMember[severeDysplasia].display = "Severe dysplasia false"
* hasMember[noMalignancy].reference = "Oservation/example-cpNoMalignantNeoplasm"
* hasMember[noMalignancy].display = "No evidence of malignant neoplasm true"
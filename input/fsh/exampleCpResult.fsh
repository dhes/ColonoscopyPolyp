Instance: example-cpResult
InstanceOf: CPResult
Usage: #example
Title: "Example CPResult"
Description: "Example CPResult"
* subject.reference = "Patient/example-cpPatient"
* status = #final
* specimen.reference[0] = "Specimen/example-specimen"
* specimen.display[0] = "A. Ascending colon polyp cold snare"
* hasMember.reference[0] = "Observation/example-cpPathology"
* hasMember.display[0] = "Tubular adenoma of colon"
* hasMember.reference[+] = "Observation/example-cpPiecemeal"
* hasMember.display[+] = "Piecemeal excision false"
* hasMember.reference[+] = "Observation/example-cpDysplasia"
* hasMember.display[+] = "Severe dysplasia false"
* hasMember.reference[+] = "Oservation/example-cpNoMalignantNeoplasm"
* hasMember.display[+] = "No evidence of malignant neoplasm true"
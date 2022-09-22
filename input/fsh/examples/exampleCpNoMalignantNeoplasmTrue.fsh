Instance: example-cpNoMalignantNeoplasm-true
InstanceOf: CPNoMalignantNeoplasm
Usage: #example
Title: "Example CPNoMalignantNeoplasm"
Description: "Does this polyp have NO signs of malignant neoplasm?"
* subject.reference = "Patient/example-cpPatient"
* status = $OBSSTATUS#final
* valueBoolean = true
Instance: example-cpDysplasia-false
InstanceOf: CPDysplasia
Usage: #example
Title: "Example CPDysplasia"
Description: "Is this polyp severely dysplastic?"
* subject.reference = "Patient/example-cpPatient"
* status = $OBSSTATUS#final
* valueBoolean = false
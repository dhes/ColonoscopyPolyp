Instance: example-cpSpecimen0
InstanceOf: CPSpecimen
Usage: #example
Title: "Example CPSpecimen 0"
Description: "First example CPSpecimen"
* subject.reference = "Patient/example-cpPatient"
* status = #available
* collection
  * bodySite = $SNOMEDCT#32713005 "Cecum structure (body structure)"
  * quantity = 3 'mm'
  * method = $SNOMEDCT#65801008 "Excision (procedure)"
  * collectedDateTime = "2021-10-04T00:00:00.000Z"
* note.text = "A. COLD BIOPSY: CECAL POLYP"
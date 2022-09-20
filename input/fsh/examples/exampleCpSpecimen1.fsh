Instance: example-cpSpecimen1
InstanceOf: CPSpecimen
Usage: #example
Title: "Example CPSpecimen 1"
Description: "Second example CPSpecimen"
* subject.reference = "Patient/example-cpPatient"
* status = #available
* collection
  * bodySite = $SNOMEDCT#9040008 "Ascending colon structure (body structure)"
  * quantity = 6 'mm'
  * method = $SNOMEDCT#65801008 "Excision (procedure)"
  * collectedDateTime = "2021-10-04T00:00:00.000Z"
* note.text = "B. COLD SNARE: ASCENDING COLON POLYP 1"
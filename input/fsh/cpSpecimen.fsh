// CP = ColonscopyPolyp
// template mcodeCancerPatient
Profile: CPSpecimen
Parent: Specimen
Id: cp-specimen
Title: "Polyp Specimen Obtained During a Colonoscopy Procedure"
Description: "A polyp specimen obtained during a colonoscopy procedure."
* ^version = "0.0.1"
* ^publisher = "Not published"
* ^contact.name = "Dan Heslinga"
* ^contact.telecom[0].system = #email
* ^contact.telecom[=].value = "dan@heslinga.us"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* status = #available
* collection
  * bodySite from cp-body-site
  * method = $SNOMEDCT#129304002 // Excision - action
  * quantity = $UCUM#mm // millimeters
  * collected[x] 1..1 // period or datetime should be OK
* subject 1..1
* subject only Reference(cp-patient) 
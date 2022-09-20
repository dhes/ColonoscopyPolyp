// CP = ColonscopyPolyp
// template mcodeCancerPatient
Profile: CPPatient
Parent: $USCorePatient
Id: cp-patient
Title: "Patient (Patient)"
Description: "A patient who has undergone colonoscopy."
* ^version = "0.0.1"
* ^publisher = "Not published"
* ^contact.name = "Dan Heslinga"
* ^contact.telecom[0].system = #email
* ^contact.telecom[=].value = "dan@heslinga.us"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* . MS
* deceased[x] MS


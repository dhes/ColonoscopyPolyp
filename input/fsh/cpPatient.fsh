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
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* . MS
* deceased[x] 1..1 MS  // I want you to tell me this patient isn't dead. Either type will do. If you're alive its deceasedBoolean = false. If you're dead deceasedBoolean = true is OK but deceasedDateTime = 09-11-2001 would be better.


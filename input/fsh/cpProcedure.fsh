Profile: CPProcdeure
Parent: Procedure
Id: cp-patient
Title: "Patient (Patient)"
Description: "A patient who has undergone colonoscopy."
* ^version = "0.0.1"
* ^publisher = "Not published"
* ^contact.name = "Dan Heslinga"
* ^contact.telecom[0].system = #email
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
// status is already required in the core resource
* subject only Reference(cp-patient)
* performed[x] 1..1 MS
* performed[x] only Period or dateTime // basically we need a date. If it's a period presumably it will be begina end on the same day or perhaps begin on a day and end the next day in the case of a midnight colonoscopy. 

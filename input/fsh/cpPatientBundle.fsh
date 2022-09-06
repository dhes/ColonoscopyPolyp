// this is a based on  for MCODEPatientBundle
Profile: CPPatientBundle
Parent: Bundle
Id: cp-patient-bundle
Title: "ColonoscopyPolyp Patient Bundle Profile"
Description: "A collection of data for a colonscopy patient."
* ^version = "0.0.1"
* ^publisher = "Dan Heslinga MD LLC"
* ^contact.name = "Dan Heslinga"
// * ^contact.telecom[0].system = #url
// * ^contact.telecom[=].value = "http://www.hl7.org/Special/committees/cic"
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "dan@heslinga.us"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* type = #collection
* timestamp MS
* entry MS
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.description = "Slicing based on the profile"
* entry ^slicing.rules = #open
* entry.resource 1.. MS
* entry contains Patient 1..1 MS
* entry[Patient] ^short = "Colonoscopy Patient"
* entry[Patient] ^definition = "The Colonoscopy Patient whose data is included in the bundle."
* entry[Patient].resource only cp-patient
// * entry[DiagnosticReport]
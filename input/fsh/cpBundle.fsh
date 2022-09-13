// this is a based on  for MCODEPatientBundle
Profile: CPBundle
Parent: Bundle
Id: cp-bundle
Title: "ColonoscopyPolyp Patient Bundle Profile"
Description: "A collection of data for a colonscopy patient."
* ^version = "0.0.1"
* ^publisher = "Dan Heslinga MD LLC"
* ^contact.name = "Dan Heslinga"
* ^contact.telecom[0].system = #email
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
* entry contains patient 1..1 MS
* entry[patient] ^short = "Colonoscopy Patient"
* entry[patient] ^definition = "The Colonoscopy Patient whose data is included in the bundle."
* entry[patient].resource only $USCorePatient
// * entry[DiagnosticReport]
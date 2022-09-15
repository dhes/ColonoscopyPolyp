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
  * ^slicing.discriminator.type = #profile
  * ^slicing.discriminator.path = "resource"
  * ^slicing.description = "Slicing based on the profile"
  * ^slicing.rules = #open
* entry.resource 1.. MS
* entry contains patient 1..1 MS
* entry[patient]
  * ^short = "Colonoscopy Patient"
  * ^definition = "The Colonoscopy Patient whose data is included in the bundle."
  * resource only CPPatient 
// DiagnosticReport exactly one CPDiagnosticReport referring to...
// Specimen: at least one CPSpecimen and...
// Observation: at least one CPResult in turn referring to ....
// Observation: one each cpDysplasia, cpNoMalignantNeoplasm, cpPiecemeal, cpPathology
// Count of CPSpecimens should equal count of CPResults
// the id of each specimen in cpResult should match a cpSpecimen
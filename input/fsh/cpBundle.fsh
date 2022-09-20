// this is a based on  for MCODEPatientBundle
Profile: CPBundle
Parent: Bundle
Id: cp-bundle
Title: "ColonoscopyPolyp Bundle Profile"
Description: "A data sufficient to compute the recommended surveillance interval using CQL"
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
* entry.resource 1.. MS // is this needed? should it be bigger?
* entry contains cpPatient 1..1 MS
* entry[cpPatient]
  * ^short = "Colonoscopy Polyp Patient"
  * ^definition = "The Colonoscopy-Polyp Patient whose data is included in the bundle."
  * resource only CPPatient 
// DiagnosticReport exactly one CPDiagnosticReport referring to...
* entry contains cpDiagnosticReport 1..1 MS
* entry[cpDiagnosticReport]
  * ^short = "Colonoscopy polyp Diagnostic Report"
  * ^definition = "The Colonoscopy Polyp Diagnostic Report including polyp size and surgical pathology information. Refers to cpSpecimen and cpResult."
  * resource only CPDiagnosticReport
// Specimen: at least one CPSpecimen and...
* entry contains cpSpecimen 1.. MS
* entry[cpSpecimen]
  * ^short = "Colonoscopy Polyp Specimen"
  * ^definition = "Colonoscopy Polyp Specimen descripton including polyp size measured by the colonoscopist"
  * resource only CPSpecimen
// Observation: at least one CPResult in turn referring to ....
* entry contains cpResult 1.. MS
* entry[cpResult]
  * ^short = "Colonoscopy polyp Result"
  * ^definition = "Colonoscopy Polyp Result. Child of Observation. Has four members which are detail Observations"
  * resource only CPResult
// Children of Observation: one each cpPathology, cpPiecemeal, cpDysplasia, cpNoMalignantNeoplasm
* entry contains cpPathology 1..1
* entry[cpPathology]
  * ^short = "Colonoscopy polyp Histopathology"
  * ^definition = "Colonoscopy Polyp histopathology constrained to list of polyp findings e.g. Tubular Adenoma"
  * resource only CPPathology
* entry contains cpPiecemeal 1..1
* entry[cpPiecemeal]
  * ^short = "Colonoscopy Polyp Piecemeal"
  * ^definition = "Was this Colonoscopy Polyp excise piecemeal?"
  * resource only CPPiecemeal
* entry contains cpDysplasia 1..1
* entry[cpDysplasia]
  * ^short = "Colonoscopy Polyp Dysplasia"
  * ^definition = "Does this Colonoscopy Polyp have severe dysplasia?"
  * resource only CPDysplasia
* entry contains cpNoMalignantNeoplasm 1..1
* entry[cpNoMalignantNeoplasm] 1..1
  * ^short = "Colonoscopy Polyp No Malignant Neoplasm"
  * ^definition = "Does this Colonoscopy Polyp have evidence of malignant neoplasm?"
  * resource only CPNoMalignantNeoplasm
// Count of CPSpecimens should equal count of CPResults - already covered in cpDiagnosticReport
// the id of each specimen in cpResult should match a cpSpecimen - maybe better in cpDiagnosticReport
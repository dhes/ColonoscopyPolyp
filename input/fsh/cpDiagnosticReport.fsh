// CP = ColonscopyPolyp
// template mcodeCancerPatient
Profile: CPDiagnosticReport
Parent:cpPatient
Id: cp-diagnosticreport
Title: "Colonoscopy Patient DiagnosticReport Profil"
Description: "A diagnostic report summarizing all polyps collected at the time of colonoscopy."
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension.valueInteger = 5 // draft maturity
* ^version = "0.0.1"
* ^publisher = "Not published"
* ^contact.name = "Dan Heslinga"
// * ^contact.telecom[0].system = #url
// * ^contact.telecom[=].value = "http://www.hl7.org/Special/committees/cic"
* ^contact.telecom[0].system = #email
* ^contact.telecom[=].value = "dan@heslinga.us"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
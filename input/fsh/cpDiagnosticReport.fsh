// CP = ColonscopyPolyp
// template mcodeCancerPatient
Profile: CPDiagnosticReport
Parent: DiagnosticReport
Id: cp-diagnostic-report
Title: "DiagnosticReport"
Description: "A diagnostic report summarizing all polyps collected at the time of colonoscopy."
* ^version = "0.0.1"
* ^publisher = "Not published"
* ^contact.name = "Dan Heslinga"
* ^contact.telecom[0].system = #email
* ^contact.telecom[=].value = "dan@heslinga.us"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* status from cp-final-or-amended
* category 1..1
* category = $DiagnosticServiceSectionId#SP "Surgical Pathology" // $DiagnosticServiceSectionId a.k.a. HL-7 v2-0074
// * category = $v2-0074#SP "Surgical Pathology"
* code 1..1
* code = $SNOMEDCT#122645001 "Polyp from large intestine obtained by polypectomy (specimen)"
* effective[x] 1..1
* effective[x] only dateTime
* issued 1..1
* specimen 1..
* result 1..
* subject 1..1
* subject only Reference(cp-patient) 
* obeys specimen-count-equals-result-count

Invariant: specimen-count-equals-result-count
Severity: #error
Description: "There must be the same number of results as number of specimens"
Expression: "specimen.count() = result.count()"

Invariant: result-refers-to-cpSpecimen
Severity: #error
Description: "Each result must refer to a CPSpecimen"
Expression: "result.reference.resolve().resourceType = CPSpecimen"
Profile: CPResult
// Parent: Observation
Parent: USCoreLaboratoryResultObservationProfile
Id: cp-result
Title: "Result (Observation)"
Description: "Results of tests on a polyp including histopathology and other details."
* ^version = "0.0.1"
* ^publisher = "Not published"
* ^contact.name = "Dan Heslinga"
* ^contact.telecom[0].system = #email
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* subject 1..1
* subject only Reference(cp-patient) 
// * code = $SNOMEDCT#122645001 "Polyp from large intestine obtained by polypectomy (specimen)"
* code = $SNOMEDCT#250537006 "Histopathology finding (finding)"
// I have chosen not to require a category. It is implicit from the cpDiagnosticReport. Fixing the code as SNOMEDCT#250537006 as part of the profile should make searching with FhirPath straigtforward.
// OK, maybe I will....
* category[Laboratory] = $OBSCAT#laboratory "Laboratory"
* specimen only Reference(cp-specimen) 
* hasMember 3..3 MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this.resolve().code"
  * ^slicing.description = "Slicing based on referenced resource code attribute."
  * ^slicing.rules = #closed
* hasMember contains
    pathology 1..1 MS and
    // piecemeal 1..1 MS and
    severeDysplasia 1..1 MS and
    noMalignancy 1..1 MS
* hasMember[pathology] only Reference(CPPathology)
  * ^short = "Polyp Histopathology"
  * ^definition = "Histopathologic diagnosis"
  * ^comment = "When using this element, the Observation must validate against the specified profile."
// * hasMember[piecemeal] only Reference(CPPiecemeal)
//   * ^short = "Was this polyp excised piecemeal?"
//   * ^definition = "Was this polyp excised piecemeal?"
//   * ^comment = "When using this element, the Observation must validate against the specified profile."
* hasMember[severeDysplasia] only Reference(CPDysplasia)
  * ^short = "Is this polyp severely dysplastic?"
  * ^definition = "Is this polyp severely dysplastic?"
  * ^comment = "When using this element, the Observation must validate against the specified profile."
* hasMember[noMalignancy] only Reference(CPNoMalignantNeoplasm)
  * ^short = "Was there no evidence of malignancy in this polyp?"
  * ^definition = "Was there no evidence of malignancy in this polyp?"
  * ^comment = "When using this element, the Observation must validate against the specified profile."
// * obeys result-refers-to-cpSpecimen //redundant

// Invariant: result-refers-to-cpSpecimen
// Severity: #error
// Description: "Each result must refer to a CPSpecimen"
// Expression: "result.reference.resolve().resourceType = CPSpecimen"




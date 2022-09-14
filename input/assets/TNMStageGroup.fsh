Profile: TNMStageGroup
Parent: $mcode-cancer-stage
Id: mcode-tnm-stage-group
Title: "TNM Stage Group Profile"
Description: "The extent of cancer reprsented by the stage group, based on a TNM staging system."
* ^publisher = "HL7 International Clinical Interoperability Council"
* ^contact.name = "HL7 International Clinical Interoperability Council"
* ^contact.telecom[0].system = #url
* ^contact.telecom[=].value = "http://www.hl7.org/Special/committees/cic"
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "ciclist@lists.HL7.org"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* code from $mcode-tnm-stage-group-staging-type-vs (required)
* focus 1..1
* value[x] from $mcode-tnm-stage-group-vs (preferred)
  * ^short = "The stage group"
  * ^definition = "The overall cancer stage, such as stage group IIA."
  * ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-maxValueSet"
  * ^binding.extension.valueCanonical = "http://hl7.org/fhir/us/mcode/ValueSet/mcode-tnm-stage-group-max-vs"
* method 1..
* method from $mcode-tnm-staging-method-vs (extensible)
* hasMember MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this.resolve().code"
  * ^slicing.description = "Slicing based on referenced resource code attribute."
  * ^slicing.rules = #open
* hasMember contains
    tnmPrimaryTumorCategory 0..1 MS and
    tnmRegionalNodesCategory 0..1 MS and
    tnmDistantMetastasesCategory 0..1 MS
* hasMember[tnmPrimaryTumorCategory] only Reference(TNMPrimaryTumorCategory)
  * ^short = "TNM Primary Tumor Category"
  * ^definition = "Category of the primary tumor, based on its size and extent, and based on evidence such as physical examination, imaging, and/or biopsy."
  * ^comment = "When using this element, the Observation must validate against the specified profile."
* hasMember[tnmRegionalNodesCategory] only Reference(TNMRegionalNodesCategory)
  * ^short = "TNM  Regional Nodes Category"
  * ^definition = "Category of the presence or absence of metastases in regional lymph nodes, based on evidence such as physical examination, imaging, and/or biopsy."
  * ^comment = "When using this element, the Observation must validate against the specified profile."
* hasMember[tnmDistantMetastasesCategory] only Reference(TNMDistantMetastasesCategory)
  * ^short = "TNM  Distant Metastases Category"
  * ^definition = "Category describing the presence or absence of metastases in remote anatomical locations, based on evidence such as physical examination, imaging, and/or biopsy."
  * ^comment = "When using this element, the Observation must validate against the specified profile."
* component ^short = "Not used in this profile"
  * ^definition = "Not used in this profile"
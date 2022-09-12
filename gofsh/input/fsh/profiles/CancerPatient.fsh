Profile: CancerPatient
Parent: USCorePatientProfile
Id: mcode-cancer-patient
Title: "Cancer Patient Profile"
Description: "A patient who has been diagnosed with or is receiving medical treatment for a malignant growth or tumor. The is the most essential profile in mCODE, since it is referenced by many other profiles. The only difference between the mCODE Patient profile and the [US Core Patient Profile](http://hl7.org/fhir/us/core/StructureDefinition-us-core-patient.html) is that Patient.deceased is a [must-support](https://www.hl7.org/fhir/profiling.html#mustsupport) element in mCODE."
// * ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
// * ^extension.valueInteger = 5
* ^version = "2.1.0"
* ^publisher = "HL7 International Clinical Interoperability Council"
* ^contact.name = "HL7 International Clinical Interoperability Council"
* ^contact.telecom[0].system = #url
* ^contact.telecom[=].value = "http://www.hl7.org/Special/committees/cic"
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "ciclist@lists.HL7.org"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* . MS
* deceased[x] MS
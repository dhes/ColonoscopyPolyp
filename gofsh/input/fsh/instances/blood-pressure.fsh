Instance: blood-pressure
InstanceOf: USCoreBloodPressureProfile
Usage: #example
* meta.extension[0].url = "http://hl7.org/fhir/StructureDefinition/instance-name"
* meta.extension[=].valueString = "Blood Pressure Example"
* meta.extension[+].url = "http://hl7.org/fhir/StructureDefinition/instance-description"
* meta.extension[=].valueMarkdown = "This is a blood pressure example for the *Vitalsigns Profile*."
* status = #final
* category = $observation-category#vital-signs "Vital Signs"
  * text = "Vital Signs"
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
  * text = "Blood pressure systolic and diastolic"
* subject = Reference(example) "Amy Shaw"
* encounter.display = "GP Visit"
* effectiveDateTime = "1999-07-02"
* component[0].code = $loinc#8480-6 "Systolic blood pressure"
* component[=].code.text = "Systolic blood pressure"
* component[=].valueQuantity = 109 'mm[Hg]' "mmHg"
* component[+].code = $loinc#8462-4 "Diastolic blood pressure"
  * text = "Diastolic blood pressure"
* component[=].valueQuantity = 44 'mm[Hg]' "mmHg"
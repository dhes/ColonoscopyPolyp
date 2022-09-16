Instance: example-cpDiagnosticReport
InstanceOf: CPDiagnosticReport
Usage: #example
Title: "Example Diagnostic Report"
Description: "Example Diagnostic Report"
* status = #final
* effectiveDateTime = "2021-10-04T00:00:00.000Z"
* issued = "2021-10-05T00:00:00.000Z"
* subject = Reference(Patient/example-cpPatient)
* specimen[0]
  * reference = Reference(Specimen/example-specimen)
  * display = "A. COLD BIOPSY: CECAL POLYP"
* result[0]
  * reference = Reference(Observation/example-result)
  * display = "A. COLD BIOPSY: CECAL POLYP"
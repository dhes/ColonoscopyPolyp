Instance: example-cpDiagnosticReport
InstanceOf: CPDiagnosticReport
Usage: #example
Title: "Example Diagnostic Report"
Description: "Example Diagnostic Report"
* subject.reference = "Patient/example-cpPatient"
* status = #final
* effectiveDateTime = "2021-10-04T00:00:00.000Z"
* issued = "2021-10-05T00:00:00.000Z"
* specimen[0]
  * reference = "Specimen/example-specimen"
  * display = "A. COLD BIOPSY: CECAL POLYP"
* result[0]
  * reference = "Observation/example-result"
  * display = "A. COLD BIOPSY: CECAL POLYP"
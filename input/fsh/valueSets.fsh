ValueSet: CPHistopathology
Id: cp-histopathology-vs
Title: "Histopathology"
Description: "Possible values for colon polyp histopathology"
* $SNOMEDCT#444408007 "Tubular adenoma (disorder)"
* $SNOMEDCT#89452002 "Hyperplastic polyp of intestine (disorder)"
* $SNOMEDCT#68534000 "Intestinal mucous membrane structure (body structure)"
* $SNOMEDCT#269533000 "Carcinoma of colon"

ValueSet: CPFinalorAmended
Id: cp-final-or-amended
Title: "Allowed Observation Statuses"
Description: "Is status final or amended?"
* $OBSSTATUS#final "Final"
* $OBSSTATUS#amended "Amended"

ValueSet: CPDiagnosticReportFinalOrAmended
Id: cp-diagnostic-report-final-or-amended
Title: "Diagnostic Report Final or Amended"
Description: "Allowed diagnostic report status"
* $DiagnosticReportStatus#amended "Amended"
* $DiagnosticReportStatus#final "Final"

ValueSet: CPBodySite
Id: cp-body-site
Title: "Body Site"
Description: "Location in the large intestine from which the specimen was excised"
* $SNOMEDCT#32713005 "Cecum structure (body structure)"
* $SNOMEDCT#9040008  "Ascending colon structure (body structure)"
* $SNOMEDCT#485005   "Transverse colon structure (body structure)"
* $SNOMEDCT#32622004 "Descending colon structure (body structure)"
* $SNOMEDCT#60184004 "Sigmoid colon structure (body structure)"
* $SNOMEDCT#34402009 "Rectum structure (body structure)"

ValueSet: CPPolypLengthUnits
Id: cp-polyp-length-units
Title: "Polyp Lenth Units"
Description: "mm only"
* $UCUM#mm

ValueSet: CPExcisionMethod
Id: cp-polyp-excision-method
Title: "Excision Method"
Description: "Excised whole or piecemeal? Excision without qualifier is taken to be whole excision."
* $SNOMEDCT#65801008 "Excision (procedure)"
* $SNOMEDCT#787139004 "Piecemeal Excision (procedure)"

// other codes to be aware of:
// $SNOMEDCT#235340004 "Excision of polyp of large intestine (procedure)"
// $SNOMED#28939002 "Endoscopic polypectomy of large intestine (procedure)"
// $SNOMEDCT#129304002 "Excision - action (qualifier value)"
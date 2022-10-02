ValueSet: CPHistopathology
Id: cp-histopathology-vs
Title: "Histopathology"
Description: "Possible values for colon polyp histopathology"
* $SNOMEDCT#68534000 "Intestinal mucous membrane structure (body structure)"
* $SNOMEDCT#89452002 "Hyperplastic polyp of intestine (disorder)"
* $SNOMEDCT#444408007 "Tubular adenoma (disorder)"
* $SNOMEDCT#309084001 "Villous adenoma of colon (disorder)"
* $SNOMEDCT#312823001 "Villous adenoma of rectum (disorder)"
* $SNOMEDCT#448428002 "Tubulovillous adenoma of rectum (disorder)"
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

ValueSet: CPColonoscopyProcedure
Id: cp-colonoscopy-procedure
Title: "Colonoscopy procedure"
Description: "A myriad of ways to described essentially the same thing"
* $SNOMEDCT#28939002 "Endoscopic polypectomy of large intestine (procedure)"
// OK fine. But nobody calls it that.
* $SNOMEDCT#6019008 "Endoscopy of large intestine (procedure)"
// but didn't you take something out? 
* $SNOMEDCT#80050006 "Endoscopic biopsy of large intestine (procedure)"
// Isn't the biopsy really a polypectomy?
* $SNOMEDCT#609279008 "Endoscopic excision of tissue of large intestine (procedure)"
// Excision as in "piecemeal" or "whole"?
* $SNOMEDCT#78133002 "Endoscopic excision of lesion of large intestine (procedure) "
// OK that's it!
* $SNOMEDCT#446170008 "Colonoscopic excision of lesion of large intestine (procedure)"
// I'm not going to complain any more!
* $SNOMEDCT#73761001 "Colonoscopy (procedure) "
* $SNOMEDCT#444783004 "Screening colonoscopy (procedure)"
// There may be many more. 

// other codes to be aware of:
// $SNOMEDCT#235340004 "Excision of polyp of large intestine (procedure)"
// $SNOMED#28939002 "Endoscopic polypectomy of large intestine (procedure)"
// $SNOMEDCT#129304002 "Excision - action (qualifier value)"
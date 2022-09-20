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
Title: "Allowed Report Statuses"
Description: "Is status final or amended?"
* $ObsStatus#final
* $ObsStatus#amended

ValueSet: CPBodySite
Id: cp-body-site
Title: "Body Site"
Description: "Location in the large intestine from which the specimen may have been excised"
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
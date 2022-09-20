Resource: ColonoscopyPolypReport
Id: colonscopy-polyp-report
Title: "Colonoscopy Polyp Report"
Description: "All of the ColonoscopyPolyps excised during one procedure"
* colonoscopyDateTime 1..1 SU dateTime "Date of the colonoscopic polypectomy"
* pathologyReportDateTime 1..1 SU dateTime "Date the histopathology report was finalized"
* polyp 1..* SU ColonoscopyPolyp "A list of the polyp details from the procedure and the histopathology report"

# ColonoscopyPolyp

Primary care doctors are looking for a way to interperpret colonoscopy result programatically using published guidelines of the [US Multi-Society Task Force on Colorectal Cancer (USMSTFCC)](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7687298/pdf/nihms-1645693.pdf). The purpose of this implementation guide is to produced structured FHIR resources such that they can be accessed by a Clinical Quality Language query. The spicific aim is to calculate the appropriate period of time until the next colonoscopy (surveillance interval). Primary care doctors wish to be better informed about this interval in order to better carry out shared decision making. 

Primary care doctors need a way to ensure that the relevant data are collected in a standard, interoperable format from participating endoscopy providers and pathologists.

Proposed Participants: 

* American College of Gastroenterology (AGI)
* College of American Pathologists
* American Academy of Family Physicians

Participating study sites:

* To be determined by participants

The use case for this work is as follows:

At least one GI Endoscopist, Pathologist and Primary Care Doctor will participate. 
Endoscopies for this designated Endoscopist will be performed and recorded as usual. Biopsy specimens will be submitted and reported as usual. Once Endoscopy and Pathology reports are available a specially trained person will enter granular data gathered from procedure and pathology report into purpose-built data entry forms. This data will be used to generate FHIR resourcses, and these resources will be processed with CQL to generate a recommended surveillance interval. The CQL result will compared against the recommendation of the Endoscopist, who is asked to provide her recommended surveillance interval based on her understanding of USMSTFCC guidelines.

The with training the data entry form should be fairly intuitive to fill out. The data model itself is fairly simple, but the FHIR model becomes rather complicated. The FHIR profiles are patterned after the [FHIR DiagnosticReport example showing a laboratory report with multiple specimens and panels](https://hl7.org/fhir/diagnosticreport-example-ghp.json.html). The following core resources are used: 

* Patient
* DiagnosticReport
* Specimen
* Observation

These new resource are created with profiles. The required information is just that that is needed to apply the USMSTFCC guidelines. The term ColonoscopyPolyp is used to describe the context of the required information. The required information is obtained entirely from the colonoscopy procedure report and the pathology reports describing the polyps obtained during the colonoscopy. We are not concerned with polyps from any other type or procedure; we are not concerned with any other kind of specimen collected during the colonoscopy, nor for that matter with any other finding of the colonoscopy. Thus the name ColonoscopyPolyp. 

We will use "CP" to stand in for Colonoscopy Polyp: 

* CPDiagnosticReport
* CPSpecimen
* CPResultObservation
* CPPolypDetailObservation
* CPPolypDetailObservationHistopathology
* CPPolypDetailObservationSevereDysplasia
* CPPolypDetailObservationPiecemealExcision
* CPPolypDetailObservationNoEvidenceOfMalignantNeoplasm

The USMSTFCC guidelines for follow-up are summarized as follows:

colonoscopy finding | surveillance interval (years)
---|:---:
normal | 1
1 to 2 tubular adenomas <10 mm | 7 - 10
3 to 4 tubular adenomas <10 mm | 3-5
5 to 10 tubular adenomas <10 mm | 3
Adenoma ≥10 mm | 3
Adenoma with tubulovillous or villous histology | 3
Adenoma with high-grade dysplasia | 3
| >10 adenomas on single examination | 1 |
Piecemeal resection of adenoma ≥20 mm | 1/2

Here is the high level information model: 

![](HighLevelInformationModel.png)

FHIR version 4.01 is used for FHIR resources. FHIR U.S. Core 4.0.0 profiles will be used where possible, considering that we are using a U.S. practice guideline. 

## Mapping to FHIR resources

Profile Name | FHIR element name / Path | Use Case Data Element | Comments
---|---|---|---
CPPatient | Patient.id | Patient | A patient with an id must exist for FHIR resources to reference
CPDiagnosticReport | CPDiagnosticReport.category | | http://terminology.hl7.org/CodeSystem/v2-0074#SP Surgical Pathology
CPDiagnosticReport | CPDiagnosticReport.code | | LOINC#11529-5 Surgical pathology study
CPDiagnosticReport | CPDiagnosticReport.effectiveDateTime | | 
CPDiagnosticReport | CPDiagnosticReport.issued | | 
CPDiagnosticReport | CPDiagnosticReport.specimen.reference | | link to specimen id
CPDiagnosticReport | CPDiagnosticReport.specimen.display | | short description of specimen from narrative pathology report
CPDiagnosticReport | CPDiagnosticReport.result.reference | | link to CPResultObservation.id
CPDiagnosticReport | CPDiagnosticReport.result.display | | short description of specimen from narrative pathology report
CPSpecimen | CPSpecimen.collection.bodySite | | SNOMED code for location in large intestine e.g. SNOMEDCT#32713005 Cecum structure (body structure)
CPSpecimen | CPSpecimen.collection.method | |  SNOMEDCT#129304002 Excision - action
CPSpecimen | CPSpecimen.collection.quantity | | specimen size in mm
CPSpecimen | CPSpecimen.collection.collectionDateTime | | 
CPSpecimen | CPSpecimen.type | | http://terminology.hl7.org/CodeSystem/v2-0487#POL Polyps
CPSpecimen | CPSpecimen.note | | short description of specimen from narrative pathology report
CPResultObservation | CPResultObservation.code | | SNOMEDCT#404684003 Polyp from large intestine obtained by polypectomy (specimen)
CPResultObservation | CPResultObservation.specimen.reference | | link to id of corresponding Specimen resource
CPResultObservation | CPResultObservation.specimen.display | | short description of specimen from narrative pathology report
CPResultObservation | CPResultObservation.hasMember.reference | | reference to id of CPPolypDetailObservation. Four members: histopathology (codeable concept), severe dysplasia?  (boolean), resected piecemeal?  (boolean), no evidence of malignancy? (boolean)
CPResultObservation | CPResultObservation.hasMember.display | | short description of detail CPPolypDetailObservation
CPPolypDetailObservationHistopathology | CPPolypDetailObservation.category | | http://terminology.hl7.org/CodeSystem/observation-category#laboratory Laboratory
CPPolypDetailObservationHistopathology | CPPolypDetailObservation.code | | LOINC#34574-4 Pathology report final diagnosis
CPPolypDetailObservationHistopathology | CPPolypDetailObservation.valueCodeableConcept | | One of three values:  SNOMEDCT#444408007 Tubular adenoma (disorder), SNOMEDCT#89452002 Hyperplastic polyp of intestine (disorder), SNOMEDCT#68534000 Intestinal mucous membrane structure (body structure)
CPPolypDetailObservationSevereDysplasia | CPPolypDetailObservationSevereDysplasia.category | | http://terminology.hl7.org/CodeSystem/observation-category#laboratory Laboratory
CPPolypDetailObservationSevereDysplasia | CPPolypDetailObservationSevereDysplasia.code | | SNOMEDCT#55237006 Severe dysplasia (morphologic abnormality)
CPPolypDetailObservationSevereDysplasia | CPPolypDetailObservationSevereDysplasia.valueBoolean | | true/false
CPPolypDetailObservationPiecemealExcision | CPPolypDetailObservationPiecemealExcision.category | | http://terminology.hl7.org/CodeSystem/observation-category#procedure Procedure
CPPolypDetailObservationPiecemealExcision | CPPolypDetailObservationPiecemealExcision.code | | SNOMEDCT#787139004 Piecemeal excision
CPPolypDetailObservationPiecemealExcision | CPPolypDetailObservationPiecemealExcision.valueBoolean | | true/false
CPPolypDetailObservationNoEvidenceOfMalignantNeoplasm | CPPolypDetailObservationNoEvidenceOfMalignantNeoplasm.category | | http://terminology.hl7.org/CodeSystem/observation-category#laboratory Laboratory
CPPolypDetailObservationNoEvidenceOfMalignantNeoplasm | CPPolypDetailObservationNoEvidenceOfMalignantNeoplasm.code | | SNOMEDCT#110396000 No evidence of malignant neoplasm (finding)
CPPolypDetailObservationNoEvidenceOfMalignantNeoplasm | CPPolypDetailObservationNoEvidenceOfMalignantNeoplasm.valueBoolean | | true/false

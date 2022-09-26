# ColonoscopyPolyp

Colonscopy is one of the most commonly performed diagnostic procedures in the United States. Colonoscopy is performed by inserting a flexible fiberoptic scope into a patient's large intestine. Scope of this nature are flexible and permit the endoscopist to see what is at the other end, even thought the scope itself is turned and twisted. This permits the endoscopist to examine the entire large intestine. This form of endscopy can be used to screen for colon canceer. Colonsocopy can also be used for diagnostic purposes, but it only the screening that we are interested in at present. 

Screening colonoscopy is only performed in adults and it typpically started at age 45-50 years. It is not the only form of colon cancer screening, but it is the only one we will discuss. 

When doctors perform screening colonoscopy they are mostly interested in finding pre-cancers. A pre-cancer is that is not malignant but could turn into cancer over time. These pre-cancers are referred to as polyps due to their typical shape. 

When the doctor sees a polyp during screening colonoscopy she generally takes it out by performing a biopsy. After the polyp is removed it is sent to the hospital laboratory to determine what kind of polyp it is and to make sure that it is not cancerous. There are different types of polyps that have specific names and significance that we will discuss later. 

After colonoscopy the doctor as a matter of course discussed the results with the patient. This discussion includes a general review of how the procedure went, any complications, any findings of concern etc. The only part of the discussion we are interested in here and to which we will devote our entire attention is _timing of the next colonoscopy_. 

Screening colonoscopy is not a one-time procedure. Once colon cancer screening is started, it generally continues until and advanced age. So patients have to be advised when the next colonoscopy should be performed. The formal term for this is the _sureillance interval_. This surveillance interval depends on many factors, and is determined according to a wide-used practice guideline. This guideline--while it has many inputs--lends itself nicely to computerized algorigthms. 

While the details are no import in this context, there exists programming language call Clinical Quality Language (CQL) that works well with algorithms such as this one. 

__Structured Decisions Require Structured Data__

Like any other computer application, CQL requires data that is highly structured. 

This is a problem in the realm of colonoscopy reporting. The tradition in medical records has been largely one of narrative reporting. By narrative reporting we mean sentences and paragraphs like the ones you are reading now. A structured report includes a hightly specified structure which computers can easily process. Some kinds of laboratory reporting have been highly structured for decades, especially commen lab tests such as a blood glucose. Here is an example of a fictional patient's blood glucose result in a stuctured language: 

<br>
<blockquote>
MSH|^~\&|GHH LAB|ELAB-3|GHH OE|BLDG4|200202150930||ORU^R01|CNTRL-3456|P|2.4
PID|||555-44-4444||EVERYWOMAN^EVE^E^^^^L|JONES|19620320|F|||153 FERNWOOD DR.^^STATESVILLE^OH^35292||(206)3345232|(206)752-121||||AC555444444||67-A4335^OH^20030520
OBR|1|845439^GHH OE|1045813^GHH LAB|15545^GLUCOSE|||200202150730|||||||||
555-55-5555^PRIMARY^PATRICIA P^^^^MD^^|||||||||F||||||444-44-4444^HIPPOCRATES^HOWARD H^^^^MD
OBX|1|SN|1554-5^GLUCOSE^POST 12H CFST:MCNC:PT:SER/PLAS:QN||^182|mg/dl|70_105|H|||F
</blockquote>
<br>


You can probably find the word glucose and perhaps a name and address and a few other things, but overall the structure doesn't make sense to a human reader. 

Colonoscopy reports so far not taken on such a stucture in most institutions. Such a structure is proposed here. 

In addition, the information needed for the _surveillance interval_ algorithm comes not from one report but two: a colonosocpy procedure report is typically created the day of the procedure; and a pathology report that is usually finalized the next day. Elements from each of these reports are input to the _surveillance interval_ algorithm. 

This illustration will help us with further explanation: 

![](HighLevelInformationModel2.svg)



<!--- 
Primary care doctors are looking for a way to interpret colonoscopy result programatically using published guidelines of the [US Multi-Society Task Force on Colorectal Cancer (USMSTFCC)](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7687298/pdf/nihms-1645693.pdf). The purpose of this implementation guide is to produced structured FHIR resources such that they can be accessed by a Clinical Quality Language query. The spicific aim is to calculate the appropriate period of time until the next colonoscopy (surveillance interval). Primary care doctors wish to be better informed about this interval in order to better carry out shared decision making. 

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
--->



![Procedure Report Data Elements](ProcedureReportDataElements.png){: width=800 style="float:none; margin:0px 0px 0px 0px"}

![](PathologyReportDataElements.png)


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
* CPPathology
* CPPolypDetailObservationSevereDysplasia
* CPPolypDetailObservationPiecemealExcision
* CPPolypDetailObservationNoEvidenceOfMalignantNeoplasm

The USMSTFCC guidelines for follow-up are summarized as follows:

<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
img {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 750px;
}
</style>

Colonoscopy Finding | Next Colonoscopy (years)
---|:---:
normal (no polyps)| 10
1 to 2 tubular adenomas <10 mm | 7 - 10
3 to 4 tubular adenomas <10 mm | 3-5
5 to 10 tubular adenomas <10 mm | 3
adenoma ≥10 mm | 3
adenoma with tubulovillous or villous histology | 3
adenoma with high-grade dysplasia | 3
more than 10 adenomas on single examination | 1
piecemeal resection of adenoma ≥20 mm | 1/2



Here is the high level information model: 


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
CPPathology | CPPolypDetailObservation.category | | http://terminology.hl7.org/CodeSystem/observation-category#laboratory Laboratory
CPPathology | CPPolypDetailObservation.code | | LOINC#34574-4 Pathology report final diagnosis
CPPathology | CPPolypDetailObservation.valueCodeableConcept | | One of three values:  SNOMEDCT#444408007 Tubular adenoma (disorder), SNOMEDCT#89452002 Hyperplastic polyp of intestine (disorder), SNOMEDCT#68534000 Intestinal mucous membrane structure (body structure)
CPPolypDetailObservationSevereDysplasia | CPPolypDetailObservationSevereDysplasia.category | | http://terminology.hl7.org/CodeSystem/observation-category#laboratory Laboratory
CPPolypDetailObservationSevereDysplasia | CPPolypDetailObservationSevereDysplasia.code | | SNOMEDCT#55237006 Severe dysplasia (morphologic abnormality)
CPPolypDetailObservationSevereDysplasia | CPPolypDetailObservationSevereDysplasia.valueBoolean | | true/false
CPPolypDetailObservationPiecemealExcision | CPPolypDetailObservationPiecemealExcision.category | | http://terminology.hl7.org/CodeSystem/observation-category#procedure Procedure
CPPolypDetailObservationPiecemealExcision | CPPolypDetailObservationPiecemealExcision.code | | SNOMEDCT#787139004 Piecemeal excision
CPPolypDetailObservationPiecemealExcision | CPPolypDetailObservationPiecemealExcision.valueBoolean | | true/false
CPPolypDetailObservationNoEvidenceOfMalignantNeoplasm | CPPolypDetailObservationNoEvidenceOfMalignantNeoplasm.category | | http://terminology.hl7.org/CodeSystem/observation-category#laboratory Laboratory
CPPolypDetailObservationNoEvidenceOfMalignantNeoplasm | CPPolypDetailObservationNoEvidenceOfMalignantNeoplasm.code | | SNOMEDCT#110396000 No evidence of malignant neoplasm (finding)
CPPolypDetailObservationNoEvidenceOfMalignantNeoplasm | CPPolypDetailObservationNoEvidenceOfMalignantNeoplasm.valueBoolean | | true/false

## Semantic Mappings

CodeSystems: 

Name | url | Notes
---|---|---
LOINC |  http://loinc.org | 
SNOMEDCT | http://snomed.info/sct |
ICD-10-CM | http://hl7.org/fhir/sid/icd-10-cm |
OBSCAT| http://terminology.hl7.org/CodeSystem/observation-category | procedure 'Procedure',  laboratory 'Laboratory'
v2-0074 | http://terminology.hl7.org/CodeSystem/v2-0074 | SP 'Surgical Pathology'
v2-0487 | http://terminology.hl7.org/CodeSystem/v2-0487 | POL 'Polyps'
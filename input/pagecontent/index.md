<!--- this stylesheet inserted on 2022-09-26 
Copied a style section from https://hl7.org/fhir/uv/shorthand/reference.html
As of 2022-09-26 only using .caption.
I might incorporate some of the others as I continue to edit this page.
The nth-child classes format a specific row in a single table
-->
## Making Colonoscopy Computable
<style>
    .shadeRow1 tr:nth-child(1) { background: #fff5e6; }
    .shadeRow6 tr:nth-child(6) { background: #fff5e6; }
    .shadeRow9 tr:nth-child(9) { background: #fff5e6; }
    .shadeRow10 tr:nth-child(10) { background: #fff5e6; }
    .shadeRow11 tr:nth-child(11) { background: #fff5e6; }
    .shadeRow12 tr:nth-child(12) { background: #fff5e6; }
    .shadeRow14 tr:nth-child(14) { background: #fff5e6; }
    .shadeRow15 tr:nth-child(15) { background: #fff5e6; }
    .shadeCol7 td:nth-child(7) { background: #fff5e6; }
    .shadeCol10 td:nth-child(10) { background: #fff5e6; } 
    .shadeHead7 th:nth-child(7) { background: #fff5e6; }
    .shadeHead10 th:nth-child(10) { background: #fff5e6; }
    .unshadeHead th { background: white; }
    .optional { color: #CC3F00; }
    .caption { color: darkgreen; font-weight: bold; }
    code {color: black; background: #F0F0F0;}
    h3 {margin-top: 24px;}
    h4 {margin-top: 18px;}
    h5 {margin-top: 12px;}
    p {line-height: 1.5}
</style>

### Introduction

Colonoscopy is one of the most commonly performed diagnostic procedures in the United States. Colonoscopy is performed by inserting a flexible fiberoptic scope into a patient's large intestine. Scopes of this nature are flexible and permit the endoscopist to see what is at the other end, even though the scope itself is turned and twisted. This permits the endoscopist to examine the entire large intestine. This form of endoscopy can be used to screen for colon cancer. Although colonoscopy is also commonly used for diagnostic purposes, it is only the screening aspect that we are interested in at here. 

Screening colonoscopy is only performed in adults. It is typically begun at age 45-50 years. It is not the only form of colon cancer screening, but it is the only one we will discuss here. 

When doctors perform screening colonoscopy they are mostly interested in finding pre-cancers. A pre-cancer is growth that is not malignant but could turn into cancer over time. These colon pre-cancers are referred to as polyps. 

When the doctor sees a polyp during screening colonoscopy she generally takes it out by performing a biopsy. After the polyp is removed it is sent to the a medical laboratory to determine what kind of polyp it is and in particular to make sure that it is not cancerous. There are different types of polyps that have specific names and significance that we will discuss later. 

After colonoscopy the doctor as a matter of course discusses the results with the patient. This discussion includes a general review of how the procedure went, any complications, any findings of concern etc. Of course what the patient really wants to know is whether they have cancer. In case they do have cancer, They proceed to cancer treatment and there is not longer a role for screening colonoscopy.  If they do not have cancer, the doctor must advise when the next screening colonoscopy should be performed. The timing of the next colonoscopy is our subject of interest. 

Screening colonoscopy is not a one-time procedure. Once colon cancer screening is started, it generally continues until an advanced age. The formal term for timing of follow-up is _surveillance interval_. This surveillance interval is determined according to widely-used practice guidelines which happen to lend themselves nicely to computer algorithms. 

There are many different kinds of computer application that could be used to determine the _surveillance interval_, all of them have one thing in common: They require structure data. 
<!---
While the details are not import in this context, there exists programming language call Clinical Quality Language (CQL) that works well with algorithms such as this one. 
--->

### Structured Decisions Require Structured Data
#### The Procedure Report

Like any other computer application, computers require data that is highly structured. This is a problem in the realm of colonoscopy reporting. The tradition in medical records has been largely one of narrative reporting. By narrative reporting we mean sentences and paragraphs like the ones you are reading now. A computable report has a requires predefined structure which computers can recognize and process. Some kinds of laboratory reporting have been structured for decades, especially common lab tests such as a blood glucose. Here is an example of a _structured_ report of a fictional patient's blood glucose in a format called an HL7 message. 

<br>
<blockquote>
MSH|^~\&|GHH LAB|ELAB-3|GHH OE|BLDG4|200202150930||ORU^R01|CNTRL-3456|P|2.4
PID|||555-44-4444||EVERYWOMAN^EVE^E^^^^L|JONES|19620320|F|||153 FERNWOOD DR.^^STATESVILLE^OH^35292||(206)3345232|(206)752-121||||AC555444444||67-A4335^OH^20030520
OBR|1|845439^GHH OE|1045813^GHH LAB|15545^GLUCOSE|||200202150730|||||||||
555-55-5555^PRIMARY^PATRICIA P^^^^MD^^|||||||||F||||||444-44-4444^HIPPOCRATES^HOWARD H^^^^MD
OBX|1|SN|1554-5^GLUCOSE^POST 12H CFST:MCNC:PT:SER/PLAS:QN||^182|mg/dl|70_105|H|||F
</blockquote>
<br>


You can probably find the word glucose and perhaps a name and address and a few other things in this message, but overall if doesn't make much sense to an untrained human. This is not considered a _human-readable_ format. 

In contrast, here is a section of a fictional _narrative_ style colonoscopy report:

> Two sessile polyps were found in the rectum. The polyps were 3 to 4 mm in size. These polyps were
removed with a cold biopsy forceps. Resection and retrieval were complete. Estimated blood loss was minimal.

Nothing difficult to understand here (other than the technical terms). Simple sentences. But the computer can't make it out!

Now a brief discussion of these technical terms. Polyps come in different shapes, one of which is _sessile_, which just means flat. The first sentence in this report indicates that both polyps were flat; he next sentence reports this size; the next describes how the polyps were removed; the next asserts that the polyps were completely _resected_ (cut out) and _retrieved_ (removed from the colon). All of the details in this section are important procedural details, but only three properties of the polyps are important for follow-up colonoscopy: What part of the intestine are they from? How big are they? Were they removed in a single piece or many pieces? 

We restate the report like so; 

- Polyp 1
  - location: rectum
  - size: 3-4 mm
  - piecemeal resection (not reported)
- Polyp 2
  - location: rectum
  - size: 3-4 mm
  - piecemeal resection (not reported)  
  
A word of explanation here about _piecemeal resection_. Piecemeal resection means that the polyp was cut into pieces before it was removed from the intestine. As you can see, there is no comment in the  narrative regarding piecemeal resection. Often it is assumed that resection was whole unless described as piecemeal. So a truer representation would be: 

- Polyp 1
  - location: rectum
  - size: 3-4 mm
  - piecemeal resection: false
- Polyp 2	
  - location: rectum
  - size: 3-4 mm
  - piecemeal resection: false  

This begins to illustrate the difference between _structured_ and _narrative_ reports. Narratives read like a book or a newspaper article, as previously mentioned. Structured reports in contrast may read more like an outline (if they are _human-readable_ at all). The lists that I have presented in Figures x and y illustrate what a simple _human-readable_ model might look like. 

So much for the procedure report for now. More is needed to determine the follow-up interval. The information needed for the _surveillance interval_ algorithm comes not from one report but two: a colonoscopy _procedure report_ (which you have seen), and a _pathology report_. Elements from each of these reports are inputs to the _surveillance interval_ algorithm. 

#### The Pathology Report

Now we move on to the pathology report. Here is am excerpt from a fictional pathology report: 

> E. COLD BIOPSY: RECTAL POLYPS X 2:
 TUBULAR ADENOMA (X1) AND HYPERPLASTIC POLYP (X1).

These report tend to be terse and more technical. In a more conversational style it might read: "Regarding the two polyps removed from the rectum as per the procedure report, which we have enumerated as E. COLD BIOPSY: RECTAL POLYPS x 2: one is a TUBULAR ADENOMA and the other is a HYPERPLASTIC POLYP."
So the pathology report ties itself into the procedure report by repeating back the location of the polyps before removal, the method of removal and the number of polyps. In that fashion anyone reading the report can tell which polyps the pathologist is talking about.  

If we are determining the follow-up interval, the only information of import are _TUBULAR ADENOMA_ and _HYPERPLASTIC POLYP_. One of the polyps is a tubular adenoma and the other is a hyperplastic polyp. A tubular adenoma is a benign growth which can transform into cancer. A hyperplastic polyp is also a benign growth but is less likely to transform. These two phrase are mostly likely unfamiliar to people not employed in healthcare, but a detailed description is not needed for our purposes. If you are curious about these terms you may take a look at [this](https://www.webmd.com/colorectal-cancer/colorectal-tubular-adenoma) and [this](https://www.webmd.com/cancer/ss/slideshow-polyps). 

There are two more elements of concern from the pathology report which are conspicuous by their absence: _severe dysplasia_ and _no evidence of malignancy_. _Dysplasia_ means _disordered growth and maturation of cells_. Tissue that has dysplasia is not cancerous but is more likely to turn into cancer. _No evidence of malignancy_ just means that no cancer was found. The convention in pathology is often to report these features only when they are present. In this report nothing is said, which means there is no _severe dysplasia_ and _no evidence of malignancy_. Another way of presenting this would be: 

- Polyp 1
  - histopathology: tubular adenoma
  - severe dysplasia: false
  - no evidence of malignancy: true
- Polyp 2
  - histopathology: hyperplastic polyp
  - severe dysplasia: false
  - no evidence of malignancy: true

This figure summarizes what we have discussed so far: 

![](HighLevelInformationModel2.svg)

#### A Unified Report

Now that we have a general idea of the type of information that we need to make our _surveillance colonoscopy_ decision, we will bring what we have together to prepare for the next step -- translating it into FHIR. 

Merging the procedure and pathology reports together, we have:

- Polyp 1
  - location: rectum
  - size: 3-4 mm
  - piecemeal resection: false
  - histopathology: tubular adenoma
  - severe dysplasia: false
  - no evidence of malignancy: true
- Polyp 2
  - location: rectum
  - size: 3-4 mm
  - piecemeal resection: false
  - histopathology: hyperplastic polyp
  - severe dysplasia: false
  - no evidence of malignancy: true

This example report contains two polyps. Every colonoscopy polyp report will have at least one specimen, but can contain many more. Generalizing this model accordingly: 

- Patient: {string}
- Procedure Date: {date}
- Pathology Report Date: {date}
  - Polyp 1
    - location: {string}
    - size: {number}
    - piecemeal resection: {boolean}
    - histopathology: {string}
    - severe dysplasia: {boolean}
    - no evidence of malignancy: {boolean}
  - Polyp 2
    - location: {string}
    - size: {number}
    - piecemeal resection: {boolean}
    - histopathology: {string}
    - severe dysplasia: {boolean}
    - no evidence of malignancy: {boolean}
  - ...
  - Polyp N
    - location: {string}
    - size: {number}
    - piecemeal resection: {boolean}
    - histopathology: {string}
    - severe dysplasia: {boolean}
    - no evidence of malignancy: {boolean}

Here we have substituted specifics with data types and wrapped the whole thing with patient information and report dates. Now we have a rough _logical model_ that represents our polyp report. 

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

![Procedure Report Data Elements](ProcedureReportDataElements.png){: width=800 style="float:none; margin:0px 0px 0px 0px"}

![Pathology Report Data Elements](PathologyReportDataElements.png){: width=800 style="float:none; margin:0px 0px 0px 0px"}

--->

## Translating to the FHIR data model

From this point we get technical. It's time to map this logical model to FHIR. From here will need to know something about FHIR to fully understand the details. I suggest your start [here](https://www.hl7.org/fhir/), 

The building blocks of FHIR are resources. [_FHIR resources_](https://www.hl7.org/fhir/resource.html) are basic information models that can be used to represent health data. The task at hand is to link or _map_ our basic logical model to FHIR resources. FHIR resources are built with [_FHIR data types_](https://www.hl7.org/fhir/datatypes.html). FHIR resources and data types are determined by HL7, a health standards organization. HL7 standards are voted upon a broad community of healthcare IT professionals. 

We will use these resources: 

* Patient
* Procedure
* DiagnosticReport
* Specimen
* Observation

... and these data types: 

- Reference
- id
- CodeableConcept
- dateTime
- boolean
- SimpleQuantity

The Patient and Procedure resources require little modification, we will skip over those details for now. We will incorporate the patient into the report by reference ... that is to say buy using a FHIR Reference. A FHIR reference has the structure {Resource/id} so we will use {Patient/patient.id}. For purposes of this report the only additional information needed from the procedure is the date. For the overall report we select the DiagnosticReport, and the pathology report date becomes the DiagnosticReport.dateTime. So far we have: 

- Patient -> Reference(Patient/Patient.id)
- Procedure Date -> Procedure.dateTime
- Pathology Report Date -> DiagnosticReport.dateTime

That covers the top level elements. For each Polyp N the connection is: 

- Polyp N
  - location -> Specimen.collection.bodySite(CodeableConcept)
  - size -> Specimen.collection.quantity(SimpleQuantity)
  - piecemeal resection -> Specimen.collection.method(CodeableConcept)
  - histopathology -> Result(Observation).hasMember[Pathology](Observation).valueCodeableConcept
  - severe dysplasia -> Result(Observation).hasMember[Dysplasia](Observation).valueBoolean
  - no evidence of malignancy -> Result(Observation).hasMember[NoMalignantNeoplasm](Observation).valueBoolean

There's some nesting here which needs explanation. The FHIR standard allows you to create custom Resources--called Profiles--from base resources. In this implementation we are creating four Profiles based on the Observation resource. Each of these profiles is preceded by a "cp" which indicates Colonoscopy Polyp:

- cpResult
- cpSpecimen
- cpPathology
- cpDysplasia
- cpNoMalignantNeoplasm

Each of these Profiles are constrained by their Categories and CodeableConcepts You can example the details in the Artifacts Summary provided with this implementation guide. 

The overall structure of the report is: 

<pre><code>
Patient
├── Procedure
|   └── cpDiagnosticReport
|       ├── cpSpecimen[n]
|       |     └── collection
|       |         └── bodySite
|       |         ├── quantity
|       |         └── method
|       └── cpResult[n]
|             └── hasMember
|                 └── cpPathology
|                 ├── cpDysplasia
|                 └── cpNoMalignantNeoplasm
</code></pre>

The model patterned after the [FHIR DiagnosticReport example showing a laboratory report with multiple specimens and panels](https://hl7.org/fhir/diagnosticreport-example-ghp.json.html). It uses the base DiagnosticReport specimen element to describe the source location of the polyp along with its size and method of removal. The method is constrained to the coded values 'excision' and 'piecemeal excision'. cpResult involves nested Observation resources. cpResult is itself an Observation resource with three hasMember elements which are in turn based on the Observation resource. These are all tied together by FHIR References which essentially act as primary keys, connecting the appropriate Observation and Specimen details together under the umbrella of the DiagnosticReport. 


Now for examples. Again we will skip over Patient and Procedure, which are proforma. Fhir resources are typically represented with JSON, XML or Turtle. With examples we will use [FHIR Shorthand](https://hl7.org/fhir/uv/shorthand/) for readability. 

Example DiagnosticReport: 

<pre><code>
1  * subject.reference = "Patient/example-cpPatient"
2  * status = #final
3  * effectiveDateTime = "2021-10-04T00:00:00.000Z"
4  * issued = "2021-10-05T00:00:00.000Z"
5  * specimen[0]
6    * reference = "Specimen/example-cpSpecimen0"
7    * display = "COLD BIOPSY: RECTAL POLYPS X 2 #1"
8  * result[0]
9    * reference = "Observation/example-cpResult0"
10   * display = "COLD BIOPSY: RECTAL POLYPS X 2 #1"
11 * specimen[1]
12   * reference = "Specimen/example-cpSpecimen1"
13   * display = "COLD BIOPSY: RECTAL POLYPS X 2 #2"
14 * result[1]
15   * reference = "Observation/example-cpResult1"
16   * display = "COLD BIOPSY: RECTAL POLYPS X 2 #2"</pre></code>
  
Line-by-Line Walkthrough

<pre><code>1  The subject of the report is a patient with id=example-cpPatient
2  This report is final. 
3  The procedure date
4  The pathology report date
5  The first cpSpecimen
6  The Reference cpSpecimen's id is example-cpSpecimen0.
7  The narrative description of this polyp from the pathology report
8  The first CPResult
9  The Reference cpResult's id is example-cpResult0.
10 The narrative description of this polyp from the pathology report
11 The second cpSpecimen
12 The Reference cpSpecimen's id is example-cpSpecimen1.
13 The narrative description of this polyp from the pathology report
14 The second CPResult
15 The Reference cpResult's id is example-cpResult1.
16 The narrative description of this polyp from the pathology report</pre></code>

Here is the first example CPSpecimen from the above DiagnosticReport; 

<pre><code>
1  * subject.reference = "Patient/example-cpPatient"
2  * status = #available
3  * collection
4    * bodySite = $SNOMEDCT#32713005 "Cecum structure (body structure)"
5    * quantity = 3 'mm'
6    * method = $SNOMEDCT#65801008 "Excision (procedure)"
7    * collectedDateTime = "2021-10-04T00:00:00.000Z"
8  * note.text = "A. COLD BIOPSY: CECAL POLYP"
</pre></code>

...with walkthrough: 

<pre><code>
1  Patient reference with id
2  The report is available
3  Details of specimen collection
4  This polyp was collected from the cecum
5  The size of this polyp was 3 mm
6  This polyp was removed whole (not piecemeal)
7  The collection time of this polyp
8  The narrative description of this polyp from the pathology report
</pre></code>

Here is the corresponding CPReport0 from the above DiagnosticReport:

<pre><code>1  * subject.reference = "Patient/example-cpPatient"
2  * status = #final
3  * specimen
4    * reference = "Specimen/example-cpSpecimen0"
5    * display = "A. Ascending colon polyp cold snare"
6  * hasMember[pathology]
7    * reference = "Observation/example-cpPathology-tubular-adenoma"
8    * display = "Tubular adenoma of colon"
9  * hasMember[severeDysplasia]
10   * reference = "Observation/example-cpDysplasia-false"
11   * display = "Severe dysplasia false"
12 * hasMember[noMalignancy]
13   * reference = "Observation/example-cpNoMalignantNeoplasm-true"
14   * display = "No evidence of malignant neoplasm true"</pre></code>

...with Walkthrough:

<pre><code>
1  The subject of this report
2  This report is final.
3  The Specimen that this result corresponds to 
4  The Reference to the corresponding Specimen which has id example-cpSpecimen0
5  The narrative description of this polyp from the pathology report
6  The pathology member
7  Reference to the Obsevervation that contains the histopathology of the specimen
8  The narrative description of this polyp from the pathology report
9  The dysplasia member
10 The reference to the Observation that contains the dysplasia value
11 The narrative description of this polyp from the pathology report
12 the noMalignancy member
13 Reference to the Observation that contains the noMalignancy value
14 The narrative description of this polyp from the pathology report
</pre></code>

And finally at the most granular level, the cpPathology, cpDysplasia and cpNoMalignancy Observations: 

CPPathology: 

<pre><code>
* subject.reference = "Patient/example-cpPatient"
* status = $OBSSTATUS#final
* valueCodeableConcept = $SNOMEDCT#444408007 "Tubular adenoma (disorder)"
</pre></code>

CPDysplasia: 

<pre><code>
* subject.reference = "Patient/example-cpPatient"
* status = $OBSSTATUS#final
* valueBoolean = false
</pre></code>

CPNoMalignantNeoplasm:

<pre><code>
* subject.reference = "Patient/example-cpPatient"
* status = $OBSSTATUS#final
* valueBoolean = true
</pre></code>

<!--- With training the data entry form should be fairly intuitive to fill out. The data model itself is fairly simple, but the FHIR model becomes rather complicated. The following core resources are used: 


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

-->

The USMSTFCC guidelines for follow-up are summarized as follows:

<span class="caption">Table 1. Practice Guideline for Follow-up Colonoscopy</span>

| Colonoscopy Finding                             | Next Colonoscopy (years) |
| ----------------------------------------------- | :----------------------: |
| normal (no polyps)                              |            10            |
| 1 to 2 tubular adenomas <10 mm                  |          7 - 10          |
| 3 to 4 tubular adenomas <10 mm                  |           3-5            |
| 5 to 10 tubular adenomas <10 mm                 |            3             |
| adenoma ≥10 mm                                  |            3             |
| adenoma with tubulovillous or villous histology |            3             |
| adenoma with high-grade dysplasia               |            3             |
| more than 10 adenomas on single examination     |            1             |
| piecemeal resection of adenoma ≥20 mm           |           1/2            |
{: class="grid"}


FHIR version 4.01 is used for FHIR resources. FHIR U.S. Core 4.0.0 profiles will be used where possible, considering that we are using a U.S. practice guideline. 

### Mapping to FHIR resources

<!---

| Profile Name                                          | FHIR element name / Path                                           | Use Case Data Element | Comments                                                                                                                                                                                                   |
| ----------------------------------------------------- | ------------------------------------------------------------------ | --------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| CPPatient                                             | Patient.id                                                         | Patient               | A patient with an id must exist for FHIR resources to reference                                                                                                                                            |
| CPDiagnosticReport                                    | CPDiagnosticReport.category                                        |                       | http://terminology.hl7.org/CodeSystem/v2-0074#SP Surgical Pathology                                                                                                                                        |
| CPDiagnosticReport                                    | CPDiagnosticReport.code                                            |                       | LOINC#11529-5 Surgical pathology study                                                                                                                                                                     |
| CPDiagnosticReport                                    | CPDiagnosticReport.effectiveDateTime                               |                       |
| CPDiagnosticReport                                    | CPDiagnosticReport.issued                                          |                       |
| CPDiagnosticReport                                    | CPDiagnosticReport.specimen.reference                              |                       | link to specimen id                                                                                                                                                                                        |
| CPDiagnosticReport                                    | CPDiagnosticReport.specimen.display                                |                       | short description of specimen from narrative pathology report                                                                                                                                              |
| CPDiagnosticReport                                    | CPDiagnosticReport.result.reference                                |                       | link to CPResultObservation.id                                                                                                                                                                             |
| CPDiagnosticReport                                    | CPDiagnosticReport.result.display                                  |                       | short description of specimen from narrative pathology report                                                                                                                                              |
| CPSpecimen                                            | CPSpecimen.collection.bodySite                                     |                       | SNOMED code for location in large intestine e.g. SNOMEDCT#32713005 Cecum structure (body structure)                                                                                                        |
| CPSpecimen                                            | CPSpecimen.collection.method                                       |                       | SNOMEDCT#129304002 Excision - action                                                                                                                                                                       |
| CPSpecimen                                            | CPSpecimen.collection.quantity                                     |                       | specimen size in mm                                                                                                                                                                                        |
| CPSpecimen                                            | CPSpecimen.collection.collectionDateTime                           |                       |
| CPSpecimen                                            | CPSpecimen.type                                                    |                       | http://terminology.hl7.org/CodeSystem/v2-0487#POL Polyps                                                                                                                                                   |
| CPSpecimen                                            | CPSpecimen.note                                                    |                       | short description of specimen from narrative pathology report                                                                                                                                              |
| CPResultObservation                                   | CPResultObservation.code                                           |                       | SNOMEDCT#404684003 Polyp from large intestine obtained by polypectomy (specimen)                                                                                                                           |
| CPResultObservation                                   | CPResultObservation.specimen.reference                             |                       | link to id of corresponding Specimen resource                                                                                                                                                              |
| CPResultObservation                                   | CPResultObservation.specimen.display                               |                       | short description of specimen from narrative pathology report                                                                                                                                              |
| CPResultObservation                                   | CPResultObservation.hasMember.reference                            |                       | reference to id of CPPolypDetailObservation. Four members: histopathology (codeable concept), severe dysplasia?  (boolean), resected piecemeal?  (boolean), no evidence of malignancy? (boolean)           |
| CPResultObservation                                   | CPResultObservation.hasMember.display                              |                       | short description of detail CPPolypDetailObservation                                                                                                                                                       |
| CPPathology                                           | CPPolypDetailObservation.category                                  |                       | http://terminology.hl7.org/CodeSystem/observation-category#laboratory Laboratory                                                                                                                           |
| CPPathology                                           | CPPolypDetailObservation.code                                      |                       | LOINC#34574-4 Pathology report final diagnosis                                                                                                                                                             |
| CPPathology                                           | CPPolypDetailObservation.valueCodeableConcept                      |                       | One of three values:  SNOMEDCT#444408007 Tubular adenoma (disorder), SNOMEDCT#89452002 Hyperplastic polyp of intestine (disorder), SNOMEDCT#68534000 Intestinal mucous membrane structure (body structure) |
| CPPolypDetailObservationSevereDysplasia               | CPPolypDetailObservationSevereDysplasia.category                   |                       | http://terminology.hl7.org/CodeSystem/observation-category#laboratory Laboratory                                                                                                                           |
| CPPolypDetailObservationSevereDysplasia               | CPPolypDetailObservationSevereDysplasia.code                       |                       | SNOMEDCT#55237006 Severe dysplasia (morphologic abnormality)                                                                                                                                               |
| CPPolypDetailObservationSevereDysplasia               | CPPolypDetailObservationSevereDysplasia.valueBoolean               |                       | true/false                                                                                                                                                                                                 |
| CPPolypDetailObservationPiecemealExcision             | CPPolypDetailObservationPiecemealExcision.category                 |                       | http://terminology.hl7.org/CodeSystem/observation-category#procedure Procedure                                                                                                                             |
| CPPolypDetailObservationPiecemealExcision             | CPPolypDetailObservationPiecemealExcision.code                     |                       | SNOMEDCT#787139004 Piecemeal excision                                                                                                                                                                      |
| CPPolypDetailObservationPiecemealExcision             | CPPolypDetailObservationPiecemealExcision.valueBoolean             |                       | true/false                                                                                                                                                                                                 |
| CPPolypDetailObservationNoEvidenceOfMalignantNeoplasm | CPPolypDetailObservationNoEvidenceOfMalignantNeoplasm.category     |                       | http://terminology.hl7.org/CodeSystem/observation-category#laboratory Laboratory                                                                                                                           |
| CPPolypDetailObservationNoEvidenceOfMalignantNeoplasm | CPPolypDetailObservationNoEvidenceOfMalignantNeoplasm.code         |                       | SNOMEDCT#110396000 No evidence of malignant neoplasm (finding)                                                                                                                                             |
| CPPolypDetailObservationNoEvidenceOfMalignantNeoplasm | CPPolypDetailObservationNoEvidenceOfMalignantNeoplasm.valueBoolean |                       | true/false                                                                                                                                                                                                 |
-->

### Semantic Mappings

<span class="caption">Table 2. Code Systems</span>

| Name      | url                                                        | Notes                                           |
| --------- | ---------------------------------------------------------- | ----------------------------------------------- |
| LOINC     | http://loinc.org                                           |                                                 |
| SNOMEDCT  | http://snomed.info/sct                                     |                                                 |
| ICD-10-CM | http://hl7.org/fhir/sid/icd-10-cm                          |                                                 |
| OBSCAT    | http://terminology.hl7.org/CodeSystem/observation-category | procedure 'Procedure',  laboratory 'Laboratory' |
| v2-0074   | http://terminology.hl7.org/CodeSystem/v2-0074              | SP 'Surgical Pathology'                         |
| v2-0487   | http://terminology.hl7.org/CodeSystem/v2-0487              | POL 'Polyps'                                    |
{: class="grid"}
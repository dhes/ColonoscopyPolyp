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
* CPPolypObservation
* CPPolypDetailObservation


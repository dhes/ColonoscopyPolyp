# Making Colonoscopy Computable

This repository and its companion [Computing Colonoscopy](https://github.com/dhes/CQL-Testing-Framework) are aimed at creating tools to make colonoscopy-related decisions more computable. Colonoscopy reports are traditionally published in narrative format in medical practice in the United States. A certain decision that follows the colonoscopy--when the following colonoscopy should be performed--follows from a widely-used [clinical practice guideline](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7389642/table/T4/?report=objectonly). This guideline is in table format, and is a narrative list of if-then rules. 

Boxwala has introduced a [knowledge representation framework](https://academic.oup.com/jamia/article/18/Supplement_1/i132/797073?login=false). This framework is use to categorize knowledge [_artifacts_](https://artifacts.ai/what-is-an-artifact/) at the [CDS Connect](https://cds.ahrq.gov/cdsconnect) web site. By the Boxwala classification, the follow-up colonoscopy guidelines are level 2 or 'semi-structured', which means "Semi-structured text that describes the recommendations for implementation in CDS". The aim here is to translate this into level three or "Structured". This means "Structured code that is interpretable by a computer (includes data elements, value sets, logic)". [Lacson et al](https://academic.oup.com/jamiaopen/article/5/2/ooac024/6566384?login=false) summarize this as: "unstructured (ie, narrative text), semistructured (ie, organized text), structured (ie, computer interpretable), and executable (ie, CDS interpretable). [Tso et al](https://pubmed.ncbi.nlm.nih.gov/28269916/) describe a 13-step process of "..that outlines all of the steps used to translate CPG knowledge into a CDS integrated with existing health information technology."

![Knowledge Levels](/input/images/KnowledgeLevels.png)
<sub>From https://cds.ahrq.gov/cdsconnect/about (scroll down to Knowledge Levels)</sub>

 Note: input/tests/cpBundle/result/passForTransaction.json is for uploading to the LogicaHealth sandbox. 

 Update 2022-10-22: 

 The IG author tool takes fsh-formatted Profiles and examples (which live in the _input/fsh_ directory) and creates new files, which it places in the _output_ directory. One fsh example file of special interest is exampleCpBundle.fsh. From this example file is created a file named Bundle-example-cpBundle.json. This file is available in the IG in the examples tab of the cbBundle profile page. This file brings together all resources for one example patient and all of the information needed to run the next-colonoscopy CQL. The purpose of this is to facilitate import the bundle to a FHIR server such as [_HAPI_](https://hapi.fhir.org/baseR4/swagger-ui/) or [Logica Health](https://sandbox.logicahealth.org) Using this IG authoring tool it is not possible to automatically create an import-ready file. A request object needs to be added to each bundle entry. For this you use collection-to-transaction.js which is located in the root directory, like so:

 ```
 node collection-to-transaction.js
 ```
 This script takes loads output/Bundle-example-cpBundle.json and adds a request object to each entry. The result is a newly created file called Bundle-example-cpBundle-transaction.json, also in the output directory. This file gets overwritten every time you run the script. As of 2022-10-12 Bundle-example-cpBundle-transaction.json successfully uploads to the Logica Health sandbox. 

 [Using CDS Hooks to increase SMART on FHIR app utilization: a cluster-randomized trial](https://academic.oup.com/jamia/article/29/9/1461/6596176)

[Igniting Harmonized Digital Clinical Quality Measurement through Terminology, CQL, and FHIR](https://www.thieme-connect.de/products/ejournals/abstract/10.1055/s-0039-3402755)

[A landscape survey of planned SMART/HL7 bulk FHIR data access API implementations and tools](https://academic.oup.com/jamia/article-abstract/28/6/1284/6155897?redirectedFrom=fulltext)

[The ecosystem of apps and software integrated with certified health information technology](https://academic.oup.com/jamia/article/28/11/2379/6364773)

- "Therefore, the 21st Century Cures Act (Cures Act) of 2016, required health IT developers to publish APIs that allow “health information from such technology to be accessed, exchanged, and used without special effort through the use of APIs or successor technology or standards, as provided for under applicable law.”
- "Federal rule-making finalized in 2020 requires that certified API technology within EHRs must conform to the FHIR data exchange standard and that API developers must provide public access to the documentation associated with these APIs to facilitate third-party integration of apps and software with the EHR."
- "...developers of certified health IT have until December 2022 to comply with the slate of new API certification requirements..."
- "NORC’s research, like the CHCF survey, found that EHR developers were providing resources and public APIs to third-party developers to connect to their data systems, but that standards-based APIs, including FHIR, were not as widely used. They note that at the time of their study, ONC had not required standards within the adopted API certification criteria nor had a version of FHIR with normative requirements been finalized. Since then, such a FHIR version—Release 4—was finalized and adopted as a standard for certifying the new Health IT Certification Program criterion, Standardized API for Patient and Population Services (45 CFR 170.315(g)(10)). This could be seen as a stabilizing force to encourage adoption of this standard by EHR developers and use by third-party application and software developers to integrate their technology with EHR data systems."
- "This study provides an early look at what we see as a maturing market for third-party integration, but in need of more standardization and harmony."
- "The data show that while the total number of apps that integrated with EHR systems increased from 2019 to 2020, the proportion of apps that support the FHIR data exchange standard—about 1 in 5—remained relatively unchanged."
- "We also found that FHIR-based apps were more likely to be found when listed across multiple galleries. The proportion of apps supporting FHIR was 2 times greater among apps that were listed in 3 or more galleries (46%) compared to apps listed in 1 gallery (20%). This may indicate that FHIR-based apps can connect to multiple EHR systems more easily compared to apps that rely solely on proprietary APIs. "


[Driving innovation in health systems through an apps-based information economy](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4556429/)
- "Healthcare data will soon be accessible using standard, open software interfaces. Here, we describe how these interfaces could lead to improved healthcare by facilitating the development of software applications (apps) that can be shared across physicians, health care organizations, translational researchers, and patients. We provide recommendations for next steps and resources for the myriad stakeholders. If challenges related to efficacy, accuracy, utility, safety, privacy, and security can be met, this emerging apps model for health information technology will open up the point of care for innovation and connect patients at home to their healthcare data."

[Using CDS Hooks to increase SMART on FHIR app utilization: a cluster-randomized trial](https://academic.oup.com/jamia/article/29/9/1461/6596176)
- "Contextually relevant CDS Hooks prompts led to a significant increase in SMART on FHIR app utilization."
- "CDS Hooks is a promising mechanism for recommending SMART on FHIR apps for several reasons. "
- "In this study, we conceived and conducted the first RCT to formally evaluate the use of CDS Hooks to provide clinical care recommendations. "	
- This article describe the implementation of calculator-based CDS Hooks in the ED at the University of Utah. It is a good case study of the implementation of CDS Hooks. "
- "The results from this study demonstrate that contextually relevant CDS Hooks prompts recommending the use of a SMART on FHIR app can significantly increase app utilization. "
- "Providers in the intervention group used the MDCalc for EHR app to view a study calculator in 6.0% of the unique interactions compared to 2.6% in the control group."
- "MDCalc for EHR app usage was significantly greater for the intervention group providers for 2 of the 6 calculators (Canadian C-spine rule and Wells’ criteria for pulmonary embolism). App usage was greater for the remaining 4 calculators, but these differences were not statistically significant. App use with any study calculator increased from 3.5% to 4.6% (P value .57) for senior EM providers and from 1.2% to 8.2% (P value .003) for junior EM providers (Table 4). In addition, the percentage of providers who viewed at least 1 study calculator in the app during a unique interaction increased from 37.1% in the control group to 80% in the intervention group (P value <.001). "
- "The results from this study demonstrate that contextually relevant CDS Hooks prompts recommending the use of a SMART on FHIR app can significantly increase app utilization."
- "To our knowledge, CDS Hooks is available at this time in production environments in Epic (all sites) and Cerner (limited deployment). AllScripts publicly announced support of the standard in February 2020,18 but it is not yet available in production systems." (One wonders of these hooks call proprietary EHR apps vs FHIR apps using CQL. Neither he acronym CQL nor the phrase Clinical Quality Language appear in the text. They do say that they are calling a SMART on FHIR app. )

[The Current State of FHIR Implementation by EHR Vendors](https://techno-soft.com/current-state-of-fhir-implementation-by-ehr-vendors.html/)

- Apparently published in 2021
- "It looks like there are issues and limitations in all the options and for each of the discussed EHRs. The FHIR standard, DSTU2-R4, provides ways to get to this data but the current level of FHIR implementation by the major EHRs do not provide such support. Vendor’s own proprietary APIs can be used with some limitations. HL7 2.x seems to be the only option for this use case. However, it has its own limitations. On the flip side, FHIR, CDS Hooks and SMART on FHIR seems to be the best option to access individual patient data."

[Lush Group](https://lgisoftware.com/fhir-solutions/cds-hooks) CDS hooks service examples. 

[ElationEMR](https://help.elationemr.com/s/article/clinical-reminders-for-clinical-quality-measures) clinical reminder help

[Integrating](https://langate.com/integrating-a-smart-on-fhir-app-with-the-cerner-ehr/) a Smart on FHIR app with cerner EHR. 

This is a vendor-based web site. 

[Epic EHR-EMR Integration with FHIR Endpoints](https://www.clarity-ventures.com/articles/epic-ehr-emr-integrations-with-fhir-endpoints) 

Check out the references at the bottom. This is a vendor-based web site. 

[ONC Information Blocking](https://www.healthit.gov/topic/information-blocking)

- "An actor subject to the information blocking regulations could be found to have committed information blocking if the actor engages in a practice that is likely to prevent, or materially discourage, or otherwise inhibit (interfere with) the access, exchange, or use of EHI." Would vendor refusal to provide structured data export (e.g. FHIR) constitute inhibition of use of EHI in the sense that it would prevent the user from testing (or using) CDS services?
  
[Standards-based Application Programming Interface (API) Certification Criterion](https://www.healthit.gov/sites/default/files/page2/2020-03/APICertificationCriterion.pdf)
- this pdf is linked here and also stored in my personal dropbox account. 

[New Applicability Dates included in ONC Interim Final Rule](https://www.healthit.gov/sites/default/files/2022-08/Highlighted_Regulatory_Dates_All.pdf)
- this pdf is linked here and also stored in my personal dropbox account. 

[The 21st Century Cures Act: A Competitive Apps Market and the Risk of Innovation Blocking](https://www.jmir.org/2020/12/e24824)
- "The major EHR vendors now have app store equivalents, like the Epic App Orchard, Cerner App Gallery, or AllScripts Application Store, as do new entrant companies constructing proprietary health care app ecosystems separate from the EHR vendors"
- "Health system leaders would be right to ask how much they should be expected to pay to get their own data out of EHR products they have already purchased."
- "EHR vendors may circumvent the spirit of the Cures Act and ONC rule by levying prohibitive revenue-sharing schemes for apps that access a modified version of the public API, charge for favorable placement in EHR-associated app stores, or limit important usability features, for example, requiring nonpreferred apps to frequently “log back in” to receive updated data."

[Nice historical intro to FHIR](https://youtu.be/MMfe181tmwU)

[Intersystems FHIR developer resources](https://www.intersystems.com/fhir/develop-with-intersystems-fhir/)
- they have a sandbox....
- Their product is HealthConnect
- This is an Intersystems presentation directed toward thier current customers. 
- The presenter mentions the JASON Report Task Force Final Report which set the direction for Health APIs (see next topic)

[JASON Report Task Force Final Report](https://www.healthit.gov/sites/default/files/facas/Joint_HIT_JTF%20Final%20Report%20v2_2014-10-15.pdf)

[Who is JASON?](https://en.wikipedia.org/wiki/JASON_(advisory_group))

[2018 SMART on FHIR tutorial](https://xela7.github.io/smart-on-fhir-tutorial/)

Files that end in .scale were .fsh files that are now obsolete. 
# Making Colonoscopy Computable

This repository and its companion [Computing Colonoscopy](https://github.com/dhes/CQL-Testing-Framework) are aimed at creating tools to make colonoscopy-related decisions more computable. Colonoscopy reports are traditionally published in narrative format in medical practice in the United States. A certain decision that follows the colonoscopy--when the following colonoscopy should be performed--follows from a widely-used [clinical practice guideline](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7389642/table/T4/?report=objectonly). This guideline is in table format, and is a narrative list of if-then rules. 

Boxwala has introduced a [knowledge representation framework](https://academic.oup.com/jamia/article/18/Supplement_1/i132/797073?login=false). This framework is use to categorize knowledge [_artifacts_](https://artifacts.ai/what-is-an-artifact/) at the [CDS Connect](https://cds.ahrq.gov/cdsconnect) web site. By the Boxwala classification, the follow-up colonoscopy guidelines are level 2 or 'semi-structured', which means "Semi-structured text that describes the recommendations for implementation in CDS". The aim here is to translate this into level three or "Structured". This means "Structured code that is interpretable by a computer (includes data elements, value sets, logic)".

![Knowledge Levels](/input/images/KnowledgeLevels.png)
<sub>From https://cds.ahrq.gov/cdsconnect/about (scroll down to Knowledge Levels)</sub>

 Note: input/tests/cpBundle/result/passForTransaction.json is for uploading to the LogicaHealth sandbox. 

 Update 2022-10-22: 

 The IG author tool takes fsh-formatted Profiles and examples (which live in the _input/fsh_ directory) and creates new files, which it places in the _output_ directory. One fsh example file of special interest is exampleCpBundle.fsh. From this example file is created a file named Bundle-example-cpBundle.json. This file is available in the IG in the examples tab of the cbBundle profile page. This file brings together all resources for one example patient and all of the information needed to run the next-colonoscopy CQL. The purpose of this is to facilitate import the bundle to a FHIR server such as [_HAPI_](https://hapi.fhir.org/baseR4/swagger-ui/) or [Logica Health](https://sandbox.logicahealth.org) Using this IG authoring tool it is not possible to automatically create an import-ready file. A request object needs to be added to each bundle entry. For this you use collection-to-transaction.js which is located in the root directory, like so:

 ```
 node collection-to-transaction.js
 ```
 This script takes loads output/Bundle-example-cpBundle.json and adds a request object to each entry. The result is a newly created file called Bundle-example-cpBundle-transaction.json, also in the output directory. This file gets overwritten every time you run the script. As of 2022-10-12 Bundle-example-cpBundle-transaction.json successfully uploads to the Logica Health sandbox. 
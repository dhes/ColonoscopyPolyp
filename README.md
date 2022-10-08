# Making Colonoscopy Computable

This repository and its companion [Computing Colonoscopy](https://github.com/dhes/CQL-Testing-Framework) are aimed at creating tools to make colonoscopy-related decisions more computable. Colonoscopy reports are traditionally published in narrative format in medical practice in the United States. A certain decision that follows the colonoscopy--when the following colonoscopy should be performed--follows from a widely-used [clinical practice guideline](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7389642/table/T4/?report=objectonly). This guideline is in table format, and is a narrative list of if-then rules. 

Boxwala has introduced a [knowledge representation framework](https://academic.oup.com/jamia/article/18/Supplement_1/i132/797073?login=false). This framework is use to categorize knowledge 'artifacts' at the [CDS Connect](https://cds.ahrq.gov/cdsconnect) web site. By the Boxwala classification, the follow-up colonoscopy guidelines are level 2 or 'semi-structured', which means "Semi-structured text that describes the recommendations for implementation in CDS". The aim here is to translate this into level three or 'structure'. This means "Structured code that is interpretable by a computer (includes data elements, value sets, logic)'.



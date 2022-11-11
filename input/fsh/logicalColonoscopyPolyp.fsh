Logical: ColonoscopyPolyp
Id: colonoscopyPolyp
// validator doesn't seem to like dashes in Id because it creares elements with dashes
// e.g. Id: colonoscopy-polyp
Title: "Colonoscopy Polyp"
Description: "The natural way most people would think about the data needed about a polyp to compute surveillance colonoscopy"
* bodySite 1..1 SU CodeableConcept "What portion of the large intestine was the polyp excised from?"
* bodySite from cp-body-site
* length 1..1 SU Quantity "How long is the polyp?"
* length from cp-polyp-length-units
// *  1..1 SU CodableConcept "Was this polyp excised whole or in piecemeal?"
* method 1..1 SU CodeableConcept "Excised whole or piecemeal?"
* method from cp-polyp-excision-method
* pathology 1..1 SU CodeableConcept "What is the histopathology of the polyp?"
* pathology from cp-histopathology-vs
// * piecemealExcision 1..1 SU boolean "Was the polyp excised piecemeal?"
* severeDysplasia 1..1 SU boolean "Was severe dysplasia present in the polyp?"
* noEvidenceOfMalignantNeoplasm 1..1 SU boolean "Was there NO evidence of malignancy in the polyp?"
* note 1..1 string "Description of the polyp from the narrative report"
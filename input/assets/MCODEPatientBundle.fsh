// this is a model for CPBundle
Profile: MCODEPatientBundle
Parent: Bundle
Id: mcode-patient-bundle
Title: "mCODE Patient Bundle Profile"
Description: "A collection of data for an mCODE cancer patient."
* ^version = "2.0.0"
* ^publisher = "HL7 International Clinical Interoperability Council"
* ^contact.name = "HL7 International Clinical Interoperability Council"
* ^contact.telecom[0].system = #url
* ^contact.telecom[=].value = "http://www.hl7.org/Special/committees/cic"
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "ciclist@lists.HL7.org"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* type = #collection
* timestamp MS
* entry MS
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.description = "Slicing based on the profile"
* entry ^slicing.rules = #open
* entry.resource 1.. MS
* entry contains cancerPatient 1..1 MS
* entry[cancerPatient] ^short = "Cancer Patient"
* entry[cancerPatient] ^definition = "The Cancer Patient whose data is included in the bundle."
* entry[cancerPatient].resource only $mcode-cancer-patient
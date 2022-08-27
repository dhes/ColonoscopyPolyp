// CP = ColonscopyPolyp
Profile: CPPatient
Parent: $USCorePatient
Id: cp-patient
Description: "Patient who underwent Colonoscopy."
// * name 1..* MS

Instance: PatientExample
InstanceOf: CPPatient
Description: "An example of a patient who underwent Colonoscopy."
* name
  * given[0] = "James"
  * family = "Pond"
* identifier 
  * system = "urn:oid:1.2.36.146.595.217.0.1"
  * value = "12345"
* gender 
  * value = "male"
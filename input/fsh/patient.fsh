// This is a simple example of a FSH file.
// This file can be renamed, and additional FSH files can be added.
// SUSHI will look for definitions in any file using the .fsh ending.
// CP = ColonscopyPolyp
Profile: CPPatient
Parent: $USCorePatient
Description: "A patient resource must be present."
// * name 1..* MS

Instance: PatientExample
InstanceOf: CPPatient
Description: "An example of a patient with a license to krill."
* name
  * given[0] = "James"
  * family = "Pond"
* identifier 
  * system = "urn:oid:1.2.36.146.595.217.0.1"
  * value = "12345"
* gender 
  * value = "male"
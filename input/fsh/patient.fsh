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
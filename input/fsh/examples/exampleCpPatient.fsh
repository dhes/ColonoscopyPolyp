Instance: example-cpPatient
InstanceOf: CPPatient
Usage: #example
Title: "Example CPPatient"
Description: "Example of a patient who underwent Colonoscopy."
* name
  * given = "Ferd"
  * family = "Berfel" 
* extension[birthsex].valueCode = #M
* gender = #male
* birthDate = "1987-02-03"
* identifier
  * system = "http://example.com"
  * value = "1325364"
* deceasedBoolean = false
Command line validator examples:

for cpPolypDetailObservationHistopathology output to json file: 
java -Xmx4g -jar validator_cli.jar /Users/danheslinga/ColonoscopyPolyp/input/tests/cpPolypDetailObservationHistopathology -ig /Users/danheslinga/ColonoscopyPolyp/output/package.tgz -output /Users/danheslinga/ColonoscopyPolyp/input/tests/cpPolypDetailObservationHistopathology/result/validationResult.json

for cpPolypDetailObservationHistopathology output to csv file: 
java -Xmx4g -jar validator_cli.jar /Users/danheslinga/ColonoscopyPolyp/input/tests/cpPolypDetailObservationHistopathology -ig /Users/danheslinga/ColonoscopyPolyp/output/package.tgz -output-style csv -output /Users/danheslinga/ColonoscopyPolyp/input/tests/cpPolypDetailObservationHistopathology/result/validationResult.csv

for cpBundle to console in csv-style: 
java -Xmx4g -jar validator_cli.jar /Users/danheslinga/ColonoscopyPolyp/input/tests/cpBundle -ig /Users/danheslinga/ColonoscopyPolyp/output/package.tgz -output-style csv

for cpBundle output to csv file :
java -Xmx4g -jar validator_cli.jar /Users/danheslinga/ColonoscopyPolyp/input/tests/cpBundle -ig /Users/danheslinga/ColonoscopyPolyp/output/package.tgz -output-style csv -output /Users/danheslinga/ColonoscopyPolyp/input/tests/cpBundle/result/validationResult.csv

To limit output to errors, add -level errors e.g.:
java -Xmx4g -jar validator_cli.jar /Users/danheslinga/ColonoscopyPolyp/input/tests/cpPolypDetailObservationHistopathology -ig /Users/danheslinga/ColonoscopyPolyp/output/package.tgz -output-style csv -output /Users/danheslinga/ColonoscopyPolyp/input/tests/cpPolypDetailObservationHistopathology/result/validationResult.csv -level errors
(actually it seems to have no effect)

for cpPatient output to csv file:
java -Xmx4g -jar validator_cli.jar /Users/danheslinga/ColonoscopyPolyp/input/tests/cpPatient -ig /Users/danheslinga/ColonoscopyPolyp/output/package.tgz -output-style csv -output /Users/danheslinga/ColonoscopyPolyp/input/tests/cpPatient/result/validationResult.csv

There isn't much point in writing tests against cpPatient because it's just us-core-patient with deceased[x] made must support. How can you test that? 

for cpDiagnosticReport to csv file: 
java -Xmx4g -jar validator_cli.jar /Users/danheslinga/ColonoscopyPolyp/input/tests/cpDiagnosticReport -ig /Users/danheslinga/ColonoscopyPolyp/output/package.tgz -output-style csv -output /Users/danheslinga/ColonoscopyPolyp/input/tests/cpDiagnosticReport/result/validationResult.csv

At the information level the FHIR validator complains that cpDiagnosticReport.code does not come from LOINC. Unfortunately LOINC has no code that matches the specificity of "Polyp from large intestine obtained by polypectomy (specimen)". In this case this IG ignores the preference for LOINC of the US core DiagnosticReport. 
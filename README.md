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

for cpPatient output to csv file :
java -Xmx4g -jar validator_cli.jar /Users/danheslinga/ColonoscopyPolyp/input/tests/cpPatient -ig /Users/danheslinga/ColonoscopyPolyp/output/package.tgz -output-style csv -output /Users/danheslinga/ColonoscopyPolyp/input/tests/cpPatient/result/validationResult.csv

There isn't much point in writing tests against cpPatient because it's just us-core-patient with deceased[x] made must support. How can you test that? 
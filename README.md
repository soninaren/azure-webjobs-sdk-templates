# Azure Functions Templates
This repository contains the templates for the [Azure Functions Portal](https://functions.azure.com/signin). Templates are pre-defined functions that demonstrate a working scenario and could be used as a starting point for more complex scenarios.

## Template Format
Template requires specific metadata files and folder structure so that [Azure Functions Portal](https://functions.azure.com/signin) can understand and graphically present it.

- **Binding.Json:** This is a metadata file for all the bindings and their possible configuration settings. It is common across all templates and is located [here](Bindings/bindings.json). It also contains metadata for binding related UI Elements and the corresponding text.

- **Function.Json:** This file contains binding data specific to each template. It provides valid values for the possible settings on a binding.

- **Code file:** Code file holds the actual code executed by the template. The name of the file depends on the Target language used by the template. For Javascript the name of the code file is `index.js`. For all the other languages this filename is `run`.

- **Metadata.Json:** UI related metadata specific to each template is present here. For e.g. Template Name, category.

- **Sample.dat:** Sample.dat contains sample input data for each template. The Run text box in the portal will be populated by the contents of the sample.dat file. The contents of this file is also used as input by the [test script](Test/TemplateTest.ps1). Refer the [template wiki]() for more information on testing templates.

- **TestOutput.json (optional):** This file is used by the [test script](Test/TemplateTest.ps1) to match the actual output with expected test output. If this file is present the template will be picked by the [test script](Test/TemplateTest.ps1) for test run. Refer the [template wiki]() for more information on testing templates.

- **Readme.md (optional):** The markdown file that presents basic information and description of the templates.

## Related Github Repositories
- [Azure Functions Portal](https://github.com/projectkudu/AzureFunctionsPortal)
- [Script SDK](https://github.com/Azure/azure-webjobs-sdk-script/)
- [Webjobs SDK Extensions](https://github.com/Azure/azure-webjobs-sdk-extensions)

## Running the Tests 
- Please refer the [wiki]() for information on testing templates with & without portal integration.

## Contribute Code or Provide Feedback
If you would like to become an active contributor to this project please follow the instructions provided in [Microsoft Azure Projects Contribution Guidelines](http://azure.github.com/guidelines.html).
If you encounter any bugs with the templates please file an issue in the [Issues](https://github.com/Azure/azure-webjobs-sdk-templates/issues) section of the project.

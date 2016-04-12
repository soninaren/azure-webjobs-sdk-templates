# Azure Functions Templates
This repository contains the templates for the [Azure Functions Portal](https://functions.azure.com/signin). Templates are pre-defined functions that demonstrate a working scenario and could be used as a starting point for more complex scenarios.

### Templates format
Template requires specific metadata files and folder structure so that [Azure Functions Portal](https://functions.azure.com/signin) can understand and graphically present it.

**Binding.Json**</br>
This is a metadata file for all the bindings and their possible configuration settings. It is common across all templates and is located [here](Bindings/bindings.json). It also contains metadata for binding related UI Elements and the corresponding text.

**Function.Json**</br>
This file contains binding data specific to each template. It provides valid values for the possible settings on a binding.

**Code file**
Code file holds the actual code executed by the template. The name of the file depends on the Target language used by the template. For Javascript the name of the code file is index.js. For all the other languages this file is named run.

**Metadata.Json**</br>
UI related metadata specific to each template is present here. For e.g. Template Name, category.

**Sample.dat**</br>
Sample.dat contains sample input data for each template. The Run text box in the portal will be populated by the contents of the sample.dat file. The contents of this file is also used as input by the [test script](Test/TemplateTest.ps1). You can find more on information on how to running tests [here]()

**readme.md (optional)**</br>
The markdown file that presents basic information and description of the templates.



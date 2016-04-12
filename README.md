# Azure Functions Templates
This repository contains the templates for the [Azure Functions Portal](https://functions.azure.com/signin). Templates are pre-defined functions that demonstrate a working scenario and could be used as a starting point for more complex scenarios.

### Templates format
Template requires specific metadata files and folder structure so that [Azure Functions Portal](https://functions.azure.com/signin) can understand and graphically present it.

**Binding.Json**</br>
This is a metadata file for all the bindings and their possible configuration settings. It is common across all templates and is located [here](Bindings/bindings.json). It also contains metadata for binding related UI Elements and the corresponding text.

**Function.Json**</br>
This file contains binding data specific to each template. It provides valid values for the possible settings on a binding.

**Metadata.Json**</br>


### This is the core `proto` repository of opensergo/opensergoapis that OpenSergo will use for Communication between different programs.


This module contains the all `proto` needed in [`OpenSergo`](https://github.com/opensergo), include:
- io.opensergo.common
- io.opensergo.faulttolerance
- io.opensergo.service_contract
- io.opensergo.transport

This module is designed with envoryproxy/validate.

[The Source Repository](https://github.com/jnan806/opensergo-proto/tree/buf.build/proto/opensergo) is in GitHub.

### How to use to generate the stub code with buf
``` yaml
    buf generate buf.build/opensergo/opensergoapis:<COMMIT_ID>|<TAG_NAME>
```
For example
``` yaml
    buf generate buf.build/opensergo/opensergoapis:c4d31e7468f24a22bc344cf77702df93
```
or example
``` yaml
    buf generate buf.build/opensergo/opensergoapis:v0.0.1
```

### How to depend on it
To depend on this module, you can use it as following in buf.yaml of you buf module
``` yaml
deps:
  - buf.build/opensergo/thirdparty:<COMMIT_ID>|<TAG_NAME>
```
For example
``` yaml
deps:
  - buf.build/opensergo/thirdparty:c4d31e7468f24a22bc344cf77702df93
```
or example
``` yaml
deps:
  - buf.build/opensergo/thirdparty:v0.0.1
```
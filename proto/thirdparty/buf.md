### This is a third-party repository which opensergo/opensergoapis would depend on.  


This module contains the all `proto` needed in `opensergo/opensergoapis`, but not in Buf Schema Registry, specifically:    
- google.protobuf


[The Source Repository](https://github.com/jnan806/opensergo-proto/tree/buf.build/proto/thirdpart) is in GitHub.

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
### Switch to Flask-XML-RPC dependency

### Change Request: PBX-2222

### Summary
The Flask-XML-RPC-Re fork has Python 3 support, but it has a coupleother problems:
* test suite does not pass
* latest code is not tagged
* uncompiled source code is not distributed via PyPI

The Flask-XML-RPC module is essentially dead upstream, but it ispackaged in EPEL 7 and Fedora.
This module will get us far enough tothepoint that we can complete phase one for this project.
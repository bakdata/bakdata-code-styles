Java Code Styles
================

IntelliJ IDEA code style settings for Bakdata's OSS projects.


How to Use It
-------------

This repository contains a script that will fetch all styles and installs them for all installed IDEs.

The easiest way to do this is with the following command in the directory of your project:
```sh
bash -c "$(curl -sL https://raw.githubusercontent.com/bakdata/bakdata-code-styles/master/install.sh)"
```

(currently only intellij)
(Windows support pending)

Java style guide
----------------

Based on https://google.github.io/styleguide/javaguide.html with the following changes:
- 4 space indent
- 120 line width


Python style guide
------------------

[See here](editor-agnostic/python/README.md)

Acknowledgements
----------------

This project uses install scripts of https://github.com/square/java-code-styles

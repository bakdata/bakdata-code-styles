# Project setup

*   Maven (Version X+) or Gradle (5+)
*   Must include either checkstyle and findbugs/error-prone or sonarqube task
*   May contain coverage tasks (Jacoco?)
*   For non-trivial projects, hierarchical components
*   Projects may have custom code styles, in which case they have to be located in a `code-style` folder of the repo
*   No binaries (unless absolutely necessary; discuss options with colleagues)

# Code style

*   [Google code style](https://google.github.io/styleguide/javaguide.html) with small modifications (discussed below)
*   Please use the respective styles of this repo (which include modifications)
*   Use final whenever possible, this usually keeps the API small and helps to find quite a bit of bugs
*   Keep visibility low (Item 13 in Effective Java), although don't be too restrictive and also use @InterfaceStability.Unstable to give users access to methods more likely to change in the near future.
*   Add factory methods for generic classes
*   Check preconditions of parameters (fail early)
*   Use checked exceptions with caution, don't subclass unless necessary (Item 59, 60 of Effective Java)

# Documentation

*   Public API must be documented with JavaDoc
    *   Every public class must documented. What's the purpose, how should a user start using your class (if it's entry point level)?
    *   Every non-trivial public should must be documented. Even setters can define conditions on the parameters (non-null, ranges).
    *   Protected/package-private methods/classes are part of the public API if the class can be subclassed and documentation does not state otherwise (Use VisibleForTesting annotation). (See Item 13 in Effective Java)
*   Non-public API should be documented when non-trivial
*   Add comments to every non-trivial block, especially for exception handling
*   No empty blocks without comments (why do you swallow a checked exception?)
*   Be sure to have minimal serialization objects (Item 74, Item 75 in Effective Java)

# Additional Resources (please expand)

*   [Effective Java, 2nd Edition.pdf](/confluence/download/attachments/8585270/Effective%20Java%2C%202nd%20Edition.pdf?version=1&modificationDate=1499755975765&api=v2)

# Common Antipattern (please expand)

Should be avoided unless you know exactly what you are doing. Probably discuss with colleagues first.
*   [Log and throw](https://stackoverflow.com/questions/6639963/why-is-log-and-throw-condsidered-an-anti-pattern)
*   [Swallow InterruptedException](https://stackoverflow.com/questions/1024651/do-i-have-to-worry-about-interruptedexceptions-if-i-dont-interrupt-anything-mys)

# Code style modifications

* 4 space indent
* 120 linewidth


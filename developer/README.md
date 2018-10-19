# Cinch Developer Documentation

# Branch Naming Conventions

The Cinch *master* branch is the primary development branch for the
proejct. Commits to master require that continuous integration tests
pass before they may be merged.

Please use the following naming conventions when creating branches:

* **release**/*major.minor*<br>
  The *release* prefix is reserved for supported Cinch release
  branches. Actual releases and pre-releases will be identified using
  tags.
  
  Tagging conventions for the release branch:

  * Patch numbers for a release will be specified in the tag, such
    that a given release will have the form *major.minor.patch*.  

  * Alpha, Beta, or Release Candidates<br>
    Any pre-release version should include the name of the pre-release,
    e.g., alpha, beta or rc, and the version of the pre-release at the
    end of the normal release version. Here are some examples:

    * Release candidate 2 of release 1.0.0 would be *1.0.0-rc.2*.
    * Alpha release 1 of release 1.0.0 would be *1.0.0-alpha.1*.

* **feature/username**/*branch\_name* or **feature**/*branch\_name*<br>
  A *feature* branch is where new development is done. However, master
  should be merged periodically into a feature branch. If the branch is
  to primarily be developed by an individual, it should include the
  *username* as part of the branch.

* **fix**/*reference*<br>
  Bug-fix branches should use the *fix* prefix, and should include
  a reference number or name, e.g., issue number or the related release
  tag.

## Creating a Release Branch

<!-- vim: set tabstop=2 shiftwidth=2 expandtab fo=cqt tw=72 : -->
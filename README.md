# UMD Foreman Templates

Foreman templates used by UMD Tier3 (originally clone from [community-templates](https://github.com/theforeman/community-templates))

# Repo metadata

So that the templates can eventually be updated automatically in Foreman, we are
adding metadata to the top of every template. This metadata can be read by a plugin
(such as [foreman_templates](https://github.com/theforeman/foreman_templates)) to
determine information abut the template. The metadata is read until the first non-comment
line, and contains, the template name, template kind, and any appropriate OS
associations. For example:

    #kind: provision
    #name: My Preseed
    #oses:
    #- Debian 6.0
    #- Debian 7.

Because all the data is contained in the metadata, filenames are arbitrary, however,
for consistency we ask that they be grouped appropriately, and end in `.erb`.

Have a look around the repo for examples.

# Testing

There is a test suite available in this repo that tries to render templates
using dummy values passing the output to ksvalidator tool which can be found
in Fedora and Red Hat repositories as part of _pykickstart_ package and in
Ubuntu repositories as part of _python-pykickstart_ package.

You will need ksvalidator from Fedora 20 or later to execute tests.
Pykickstart can be installed from git easily too. Use '-l' option to get list
of supported versions:

    $ ksvalidator -l

To start unit tests do something like:

    $ ruby -Itest test/kickstart/provision_test.rb 

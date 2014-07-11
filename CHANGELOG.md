version 0.1.64
* Use foodcritic version 3.0.3.

version 0.1.63
--------------
* Update on Travis-ci integration.

version 0.1.62
--------------
* Add recipe amazon_s3cmd::env_var. This makes deploy of creds
  as environment variables optional to the user.
* Remove explicit node.set so creds aren't exposed.

Version 0.1.61
--------------
* Update Rakefile.

Version 0.1.60
--------------
* Add cookbook 'amazon_s3cmd' to Berksfile.

Version 0.1.59
--------------
* Update CHANGELOG

Version 0.1.58
--------------
* Update README.
* Update metadata.*

Version 0.1.56
--------------
* Update metadata.json

Version 0.1.53
--------------
* Comment out reference for git cmd.
* Don't run apt-get update --fix-missing on ubuntu. bump.

Version 0.1.47
--------------
* Add installation of python-magic library.
* Fix other platform-specific issues.
* Update Gemfile & Gemfile.lock.
* Add recipe amazon_s3cmd::python_magic.
* Tmp. workaround for home directory until I have time to test https://github.com/jackl0phty/opschef-cookbook-amazon_s3cmd/pull/1

Version 0.1.42
--------------
* Fix foodcritic compliance.

Version 0.1.41
--------------
* Add install_user attribute.

Version 0.1.40
--------------
* Fix foodcritic ETSY005 in source.rb.

Version 0.1.37
-------------
* Initial cookbook upload.

# Alchemy Solid Errors

A simple integration of Solid Errors into AlchemyCMS. It adds a new menu item into the Alchemy Admin
interface and integrates the Solid Errors Backend via iframe into the Alchemy Backend. Solid Errors Backend
is only available for admin users.

![Preview of Alchemy CMS Admin Interface with Errors Menu Point selected](preview.png)

## Installation

Add the gem to your Gemfile and restart the application.

```shell
$ bundle add alchemy-solid_errors
```

## Release a new version

First, bump the version with [gem-release](https://bundler.io/guides/creating_gem.html#releasing-the-gem):

```shell
gem bump --version minor
```

Second, generate the changelog entries. Set the version parameter with the upcoming version number.

```shell
rake changelog
```

Amend that changelog into the previous commit. After that go to [Releases Page](https://github.com/sitediver/alchemy-solid_errors/releases)
and create a new release. Be aware the tag has to start with `v` (e.g `v0.2.0`). Otherwise, the Release action will fail.

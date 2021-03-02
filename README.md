SolidusPrintInvoice
===================

[![CircleCI](https://circleci.com/gh/solidusio-contrib/solidus_print_invoice.svg?style=svg)](https://circleci.com/gh/solidusio-contrib/solidus_print_invoice)

This extension provides a "Print Invoice" button on the Admin Orders view screen which generates a PDF of the order details.

This is meant to provide an example of how this can be done, and is easily extended by overriding the templates however you prefer.

Installation
------------

Add solidus_print_invoice to your Gemfile:

```ruby
gem 'solidus_print_invoice' , github: 'solidusio-contrib/solidus_print_invoice'
```

Bundle your dependencies and run the installation generator:

```shell
$ bundle install
$ rails g solidus_print_invoice:install
```

[Configuration](http://example.com/)
-------------

1. Add your own own footer texts to the locale. The current footer works with `:footer_left1` , `:footer_left2` and `:footer_right1`, `:footer_right2` where the 1 version is on the left in bold, and the 2 version the "value" on the right.

2. Override any of the partial templates. They are address, footer, totals, header, bye, and the line_items. In bye the text `:thanks` is printed. The `:extra_note` hook has been deprecated as Spree no longer supports hooks.

3. Set `:suppress_anonymous_address` option to get blank addresses for anonymous email addresses (as created by my spree_last_address extension for empty/unknown user info)

4. Set page/document options with

  ```ruby
  Spree::PrintInvoice::Config.set(prawn_options: { page_layout: :landscape, page_size: "A4", margin: [50, 100, 150, 200] })
  ```

Testing
-------

First bundle your dependencies, then run `rake`. `rake` will default to building the dummy app if it does not exist, then it will run specs, and [Rubocop](https://github.com/bbatsov/rubocop) static code analysis.

```shell
bundle
bundle exec rake
```

When testing your application's integration with this extension you may use its factories.
Simply add this require statement to your spec_helper:

```ruby
require 'solidus_print_invoice/factories'
```

Releasing
---------

Your new extension version can be released using `gem-release` like this:

```shell
bundle exec gem bump -v VERSION --tag --push --remote upstream && gem release
```

Copyright (c) 2020 Spree & Solidus Community, released under the New BSD License

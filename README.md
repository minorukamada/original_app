# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

開発環境構築

Xcodeのインストール
$ xcode-select —install

Homebrewのインストール
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew doctor

rbenvのインストール
$ brew install rbenv
$ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
$ echo 'eval "$(rbenv init -)"' >> ~/bash_profile

Rubyのインストール
$ rbnev install 2.5.1
$ rbenv global 2.5.1

RubyGemsのアップデート
$ gem update —system

Bundlerのインストール
$ gem install bundler

Railsのインストール
$ gem install rails -v 5.2.1

データベースのインストールとセットアップ
$ brew install postgresql
$ brew services start postgresql

# Changelog

All notable changes to `vscode-devcontainer-php7` will be documented in this file.

## [0.0.3 (2020-11-09)](https://github.com/ilanco/vscode-devcontainer-php7/compare/0.0.2...0.0.3)

### Changed
- fix: run xdebug install and config seperately. ([8fd2c9d](https://github.com/ilanco/vscode-devcontainer-php7/commit/8fd2c9dfc7e191ac68c2a7c5bcacd2a70a29e305))
- update: workspace Dockerfile. Switched to custom docker image based off php-cli to remove some of the unused features that MS ships. ([
7a9ed53](https://github.com/ilanco/vscode-devcontainer-php7/commit/7a9ed531b7b22f26f15479fd83ea1966003ad442))

## [0.0.2 (2020-10-28)](https://github.com/ilanco/vscode-devcontainer-php7/compare/0.0.1...0.0.2)

### Changed
- Switch to official composer docker image. Version 2 of composer is much faster and we don't need prestissimo anymore. ([61d770b](https://github.com/ilanco/vscode-devcontainer-php7/commit/61d770b0b8188abe80f3170aa7bba40f61331634))

## 0.0.1
- First beta release
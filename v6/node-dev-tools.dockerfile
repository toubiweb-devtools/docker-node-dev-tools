FROM toubiweb/node-dev:6.11

MAINTAINER Nicolas Toublanc <n.toublanc@gmail.com>

# install common build tools globally via npm
ENV GLOBAL_NPM_PACKAGES webpack webpack-dev-server karma-cli protractor typescript @angular/cli gulpjs/gulp-cli grunt-cli yo generator-generator generator-node forever nodemon node-supervisor ava

RUN sudo npm install -g $GLOBAL_NPM_PACKAGES

# upgrade inquired to fix this bug while running yeoman: https://github.com/SBoudrias/Inquirer.js/pull/297
RUN sudo npm install inquirer --upgrade

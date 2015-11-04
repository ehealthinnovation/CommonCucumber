// An example configuration file.
exports.config = {
  baseUrl: 'http://localhost:9000',

  // Cucumber configuration.
  framework: 'cucumber',
  specs: ['../../../*.feature'],

  // Do not start a Selenium Standalone sever - only run this using chrome.
  chromeOnly: true,
  chromeDriver: '../../node_modules/protractor/selenium/chromedriver'
};

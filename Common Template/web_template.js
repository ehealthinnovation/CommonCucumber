'use strict';

var ptor = protractor.getInstance();
var driver = ptor.driver;

var HttpBackend = require('http-backend-proxy');
var proxy = new HttpBackend(browser);

module.exports = function () {

  //General functions

  this.manualVerification = function (fail, success) {
    console.log("Did the expected result happen (y/n)?");
    keypress(process.stdin);

    var keypressCallback = function (ch, key) {
      if (key && key.ctrl && key.name == 'c') {
        process.stdin.pause();
      } else {
        if (key.name === 'y') {
          process.stdin.removeListener('keypress', keypressCallback);
          success();
        } else if (key.name === 'enter') {
          // The terminal only passes keys after hitting 'enter'.  So you will always get 2.
        } else {
          process.stdin.removeListener('keypress', keypressCallback);
          fail();
        }
      }
    };

    process.stdin.on('keypress', keypressCallback);
    process.stdin.resume();
  };

  function classIsPresentForId(className, elementId, fail, success) {
    element(by.id(elementId)).getAttribute('class').then(function (classes) {
      if (classes.indexOf(className) > -1) {
        if (success) {
          success();
        }
      } else {
        fail();
      }
    });
  }

  function classIsNotPresentForId(className, elementId, fail, success) {
    element(by.id(elementId)).getAttribute('class').then(function (classes) {
      if (classes.indexOf(className)) {
        success();
      } else {
        fail();
      }
    }, function (err) {
      fail(err);
    });
  }

  this.waitSeconds = function (seconds, next) {
    ptor.sleep(seconds * 1000).then(function () {
      if (next) {
        next();
      }
    });
  };

  this.elementSelect = function (selector, fail, success) {
    element(selector).click().then(
      function () {
        success();
      },
      function (err) {
        fail('Unable to select: ' + selector + ' Error: ' + err);
      }
    )
  };

  this.elementExistsById = function (id, fail, success) {
    driver.findElements(by.id(id)).then(
      function (array) {
        if (array.length > 0) {
          success();
        } else {
          fail("The element: " + id + " does not exist.")
        }
      },
      function (err) {
        fail(err);
      });
  };

  this.elementDoesNotExistById = function (id, fail, success) {
    driver.findElements(by.id(id)).then(
      function (array) {
        if (array.length === 0) {
          success();
        } else {
          fail("The element should not exist: " + id);
        }
      },
      function (err) {
        fail(err);
      });
  };

  this.elementShouldBeDisplayed = function (selector, fail, success) {
    element(selector).isDisplayed().then(
      function (display) {
        if (display) {
          success();
        } else {
          fail('element not displayed: ' + selector);
        }
      },
      function (err) {
        fail('element not found: ' + selector + ' ' + err);
      }
    );
  };

  this.elementShouldNotBeDisplayed = function (selector, fail, success) {
    element(selector).isDisplayed().then(
      function (display) {
        if (display) {
          fail('element is displayed: ' + selector);
        } else {
          success();
        }
      },
      function () {
        // element does not exist and that's ok
        success();
      }
    )
  };

  this.elementIsEnabled = function (elementId, fail, success) {
    classIsNotPresentForId('disabled', elementId, fail, success);
  };

  this.elementIsDisabled = function (elementId, fail, success) {
    classIsPresentForId('disabled', elementId, fail, success);
  };

  this.enterTextInFieldWithID = function (textToEnter, fieldID, success, fail) {
    // Get the first input after the label.
    element(by.id(fieldID)).then(function (el) {
      el.clear();
      el.sendKeys(textToEnter).then(function () {
        success();
      }, function (err) {
        fail(err);
      });
    }, function (err) {
        fail(err);
    });
  };

  //Starting the app

  this.Given(/^I launch the app$/, function (next) {
    var width = 400;
    var height = 1000;

    // Clear any session storage.  e.g. the logged in flag.
    browser.driver.manage().window().setSize(width, height);
    browser.get(ptor.baseUrl);
    next();
  });

  //Navigation
  this.Then(/^I should see the "([^"]*?)" page$/, function (pageId, next) {
    driver.findElements(by.id(pageId)).then(
      function (array) {
        if (array.length > 0) {
          next();
        } else {
          next.fail("The element: " + pageId + " does not exist.")
        }
      },
      function (err) {
        next.fail(err);
      });
  });

  //Page scroll
  this.When(/^I scroll to the (bottom|top) of the page$/, function (position, next) {
    var wait = this.waitSeconds;
    if (position === 'bottom') {
      browser.executeScript('window.scrollTo(0, document.body.scrollHeight)').then(
        function () {
          wait(1, function () {
            next();
          });
        },
        function (err) {
          next.fail(err);
        }
      );
    } else {
      browser.executeScript('window.scrollTo(0, 0)').then(
        function () {
          next();
        },
        function (err) {
          next.fail(err);
        }
      );
    }
  });

  //Elements including images
  this.Then(/^I should (see|not see) element with id "([^"]*?)"$/, function (view, elementId, next) {
    if (view === 'see') {
      this.elementExistsById(elementId, next.fail, next);
    } else {
      this.elementDoesNotExistById(elementId, next.fail, next);
    }
  });

  this.When(/^I select element with id "([^"]*?)"$/, function (elementId, next) {
    this.elementSelect(by.id(elementId), next.fail, next);
  });

  //Buttons
  this.Then(/^I should (see|not see) the "([^"]*?)" button with id "([^"]*?)"$/, function (view, buttonLabel, buttonId, next) {
    if (view === 'see') {
      this.elementExistsById(buttonId, next.fail, next);
    } else {
      this.elementDoesNotExistById(buttonId, next.fail, next);
    }
  });

  this.When(/^I select the "([^"]*?)" button with id "([^"]*?)"$/, function (buttonLabel, buttonId, next) {
    this.elementSelect(by.id(buttonId), next.fail, next);
  });

  this.Then(/^I should see the "([^"]*?)" button with id "([^"]*?)" is (enabled|disabled)$/, function (buttonLabel, buttonId, condition, next) {
    if (condition === 'enabled') {
      this.elementIsEnabled(buttonId, next.fail, next);
    } else {
      this.elementIsDisabled(buttonId, next.fail, next);
    }
  });

  this.Then(/^I should see the "([^"]*?)" button with id "([^"]*?)" has "([^"]*?)" style$/, function (buttonLabel, buttonId, style, next) {
    classIsPresentForId(style, buttonId, next.fail, next);
  });

  //Text
  this.Then(/^I should (see|not see) "([^"]*)"$/, function(visibility, text, next) {
    if (visibility === 'see') {
      element(by.xpath('//*[contains(.,"' + text + '")]')).isDisplayed().then(
        function (visible) {
          if (visible) {
            next();
          } else {
            next.fail('text is not visibile: ' + text);
          }
        },
        function (err) {
          next.fail('Unable to find partial text: ' + text + ' err: ' + err);
        }
      );
    } else {
      element(by.xpath('//*[text()="' + text + '"]')).isDisplayed().then(
        function (display) {
          if (display) {
            next.fail('element is displayed');
          } else {
            next();
          }
        },
        function () {
          // element does not exist and that's ok
          next();
        }
      )
    }
  });

  this.When(/^I select the "([^"]*)" text$/, function(text, next) {
    var selector = by.xpath('//*[text()="_TEXT_"]'.replace('_TEXT_', text));
    this.elementSelect(selector, next.fail, next);
  });

  this.Then(/^I should not see the text with id "([^"]*?)"$/, function (textId, next) {
    this.elementDoesNotExistById(textId, next.fail, next);
  });

  this.Then(/^I should see "([^"]*?)" (before|after) text with id "([^"]*?)"$/, function (text, position, id, next) {
    //TODO
    next();
  });

  //Textbox
  this.When(/^I enter "(.*?)" in the "(.*?)" textbox with id "(.*?)"$/, function(text, textboxName, textboxId, next) {
    this.enterTextInFieldWithID(text, textboxId, next.fail, next);
  });

  this.Then(/^I should (see|not see) the "([^"]*?)" textbox with id "([^"]*?)"$/, function (view, textboxName, textboxId, next) {
    if (view === 'see') {
      this.elementExistsById(textboxId, next.fail, next);
    } else {
      this.elementDoesNotExistById(textboxId, next.fail, next);
    }
  });

  this.Then(/^I should see the "([^"]*?)" textbox with id "([^"]*?)" has "([^"]*?)" style$/, function (textboxName, textboxId, style, next) {
    classIsPresentForId(style, textboxId, next.fail, next);
  });

  this.Then(/^I should see the "([^"]*?)" textbox with id "([^"]*?)" is (enabled|disabled)$/, function (textboxName, textboxId, condition, next) {
    if (condition === 'enabled') {
      this.elementIsEnabled(textboxId, next.fail, next);
    } else {
      this.elementIsDisabled(textboxId, next.fail, next);
    }
  });

  //Dropdown
  this.When(/^I select "(.*?)" for the dropdown named "(.*?)"$/, function (option, name, next) {
    var selector = by.xpath('//select[@name="_NAME_"]/option[text()="_OPTION_"]'.replace('_NAME_', name).replace('_OPTION_', option));
    this.elementSelect(selector, next.fail, next);
  });

  this.Then(/^I should (see|not see) the "(.*?)" dropdown with id "([^"]*?)"$/, function (view, dropdownLabel, dropdownId, next) {
    if (view === 'see') {
      this.elementExistsById(dropdownId, next.fail, next);
    } else {
      this.elementDoesNotExistById(dropdownId, next.fail, next);
    }
  });

  this.When(/^I select "(.*?)" for the "(.*?)" dropdown with id "(.*?)"$/, function (option, name, dropdownId, next) {
    var selector = by.xpath('//select[@id="ID"]/option[text()="_OPTION_"]'.replace('_ID_', dropdownId).replace('_OPTION_', option));
    this.elementSelect(selector, next.fail, next);
  });

  //Dialog box
  this.When(/^I select any area outside of the dialog$/, function (next) {
    console.log("Touch somewhere outside of the dialog and then press 'y'");
    this.manualVerification(next.fail, next);
  });

  this.Then(/^I should (see|not see) a dialog box with id "([^"]*?)"$/, function (view, dialogId, next) {
    if (view === 'see') {
      this.elementExistsById(dialogId, next.fail, next);
    } else {
      this.elementDoesNotExistById(dialogId, next.fail, next);
    }
  });

  //lists
  this.Then(/^I should see "([^"]*)" for the list item named "([^"]*)"$/, function (textToSearch, listItemText, next) {
    // Select a div that has a class row with the list item text and that has a child i that is an alert,
    var selector = by.xpath('//div[contains(concat(" ", normalize-space(@class), " "), " todo-list-item ") and descendant::*[contains(., "' + listItemText + '")]]/*[contains(., "' + textToSearch + '")]');
    Utility.elementShouldBeDisplayed(selector, next.fail, next);
  });

  this.Then(/^I select the "([^"]*)" option for the list item named "([^"]*)"$/, function (option, listName, next) {
    //TODO
    next();
  });

};

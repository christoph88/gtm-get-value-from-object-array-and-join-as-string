___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Get value from Object array and join as string",
  "categories": ["UTILITY"],
  "description": "Get value from Object array and join. Make sure the object type is an array.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "array",
    "displayName": "Object Array",
    "simpleValueType": true,
    "help": "An array of different objects",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "key",
    "displayName": "Key",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "help": "Which key do you want to return to the array."
  },
  {
    "type": "TEXT",
    "name": "joinSymbol",
    "displayName": "Join Symbol",
    "simpleValueType": true,
    "help": "How do you want to join the array.",
    "defaultValue": ","
  },
  {
    "type": "CHECKBOX",
    "name": "debug",
    "checkboxText": "Debug",
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

//// REQUIREMENTS
const log = require('logToConsole');
const JSON = require('JSON');

//// MAIN
data.debug && log('data =', data);

// Variables must return a value.

let returnValue;

if (typeof data.array === 'object') {
  returnValue = data.array.map((filter) => { return filter[data.key]; }).join(data.joinSymbol);
}

return returnValue;


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: test
  code: |-
    const mockData = {
      // Mocked field values
      "debug": true,
      "array": [{
        "filter_name": "deals_category",
        "filter_value": "fashion"
    },{
        "filter_name": "deals_category",
        "filter_value": "travel"
    }],
      "key": "filter_name",
      "joinSymbol": ","
    };

    // Call runCode to run the template's code.
    let variableResult = runCode(mockData);

    // Verify that the variable returns a result.
    assertThat(variableResult).isNotEqualTo(undefined);
    assertThat(variableResult).isEqualTo("deals_category,deals_category");


___NOTES___

Created on 08/07/2022, 15:14:13



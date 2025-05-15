import ballerina/http;
import ballerina/log;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        json event = {
            "orgUuid":"4f7c3eef-178e-4d4f-8a99-bb360854ffa8",
            "timestamp":"1693313008",
            "userIdpId":"6d56803b-8192-4932-a056-e03ffd9c6312",
            "action":"update",
            "entityType":"Project",
            "info": {
                "updatedProjectDetails": { 
                    "projectName":"My Test Event Project",
                    "projectDescription":"update my description"
                },
                "initialProjectDetails": {
                    "projectName":"My Test Event Project",
                    "projectDescription":"update my description again"
                },
                "projectId":"6a9a10fc-4042-4f59-ad2c-474653480eb9",
                "consumer": {
                    "key":"Wxqy0liCfLBsdpXOhkcxZz6uLPka",
                    "applicationName":""
                }
            },
            "outcome":"succeeded",
            "message":"Project update succeeded"
        };
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        log:printInfo("[AUDIT_LOG]", event = event);
        return "Hello, " + name;
    }
}

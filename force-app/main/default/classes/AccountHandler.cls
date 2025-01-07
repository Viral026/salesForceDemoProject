/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-07-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class AccountHandler {
    // Method to create an Account
    public static Account createAccount(String name, String phone, String industry) {
        // Check for CREATE permission on Account object
        if (!Schema.sObjectType.Account.isCreateable()) {
            throw new CustomException('Insufficient permissions to create Account.');
        }

        if (String.isEmpty(name)) {
            throw new CustomException('Account name cannot be empty.');
        }

        Account acc = new Account(Name = name, Phone = phone, Industry = industry);
        insert acc; // DML operation proceeds only if the above check passes
        return acc;
    }

    // Custom exception for validation
    public class CustomException extends Exception {}
}

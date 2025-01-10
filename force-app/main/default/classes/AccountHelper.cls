/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-10-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class AccountHelper {
    // Method to create a new Account
    public static Account createAccount(String accountName, String phone) {
        // Check if the user has permission to create Accounts
        if (!Schema.sObjectType.Account.isCreateable()) {
            throw new System.SecurityException('Insufficient permissions to create Account.');
        }

        Account acc = new Account(
            Name = accountName,
            Phone = phone
        );
        insert acc;
        return acc;
    }

    // Method to update an Account's phone number
    public static Account updateAccountPhone(Id accountId, String newPhone) {
        // Check if the user has permission to read and update Accounts
        if (!Schema.sObjectType.Account.isAccessible() || !Schema.sObjectType.Account.isUpdateable()) {
            throw new System.SecurityException('Insufficient permissions to update Account.');
        }

        Account acc = [SELECT Id, Phone FROM Account WHERE Id = :accountId];
        acc.Phone = newPhone;
        update acc;
        return acc;
    }
}

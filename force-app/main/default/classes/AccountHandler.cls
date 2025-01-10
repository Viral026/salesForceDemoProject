/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-07-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class AccountHandler {
    // Method to create an Account
    public static Account createAccount(String name, String phone, String industry) {
        if (String.isEmpty(name)) {
            throw new CustomException('Account name cannot be empty.');
        }
        
        Account acc = new Account(Name = name, Phone = phone, Industry = industry);
        insert acc;
        return acc;
    }

    // Custom exception for validation
    public class CustomException extends Exception {}
}
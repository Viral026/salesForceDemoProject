/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-10-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
public class AccountHelperTest {
    @isTest
    static void testCreateAccount() {
        // Test the createAccount method
        String accountName = 'Test Account';
        String phone = '1234567890';

        Account result = AccountHelper.createAccount(accountName, phone);

        // Assertions
        System.assertNotEquals(null, result.Id, 'Account should be created with an Id.');
        System.assertEquals(accountName, result.Name, 'Account Name should match.');
        System.assertEquals(phone, result.Phone, 'Phone should match.');
    }

    @isTest
    static void testUpdateAccountPhone() {
        // Create a test Account
        Account testAcc = new Account(
            Name = 'Update Test Account',
            Phone = '9876543210'
        );
        insert testAcc;

        // Update the Account's phone number
        String newPhone = '1112223333';
        Account result = AccountHelper.updateAccountPhone(testAcc.Id, newPhone);

        // Assertions
        System.assertEquals(newPhone, result.Phone, 'Phone number should be updated.');
    }
}

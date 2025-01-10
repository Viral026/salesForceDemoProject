/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-07-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
public class AccountHandlerTest {
    @isTest
    static void testCreateAccount_Success() {
        // Test data
        String testName = 'Demo Account';
        String testPhone = '123-456-7890';
        String testIndustry = 'Technology';

        // Test method
        Test.startTest();
        Account result = AccountHandler.createAccount(testName, testPhone, testIndustry);
        Test.stopTest();

        // Assertions
        System.assertNotEquals(null, result.Id, 'Account should be inserted with an ID.');
        System.assertEquals(testName, result.Name, 'Account name should match the input.');
        System.assertEquals(testPhone, result.Phone, 'Account phone should match the input.');
        System.assertEquals(testIndustry, result.Industry, 'Account industry should match the input.');
    }

    @isTest
    static void testCreateAccount_ValidationError() {
        Test.startTest();
        try {
            AccountHandler.createAccount('', null, null);
            System.assert(false, 'Expected exception was not thrown.');
        } catch (AccountHandler.CustomException ex) {
            System.assertEquals('Account name cannot be empty.', ex.getMessage());
        }
        Test.stopTest();
    }

    @isTest
    static void testBulkAccountCreation() {
        List<Account> accounts = new List<Account>();

        Test.startTest();
        for (Integer i = 0; i < 10; i++) {
            Account acc = AccountHandler.createAccount('Account ' + i, '123456789' + i, 'Finance');
            accounts.add(acc);
        }
        Test.stopTest();

        // Assertions
        System.assertEquals(10, accounts.size(), '10 accounts should have been created.');
        for (Integer i = 0; i < 10; i++) {
            System.assertNotEquals(null, accounts[i].Id, 'Each account should have an ID.');
        }
    }
}
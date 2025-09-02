@isTest public with sharing class UnitOfWorkTest {
    public UnitOfWorkTest() {

    }

    //test comment CODE CHANGE YAY
    @isTest
    public static void challengeComplete() {
        fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(
            new Schema.SObjectType[] {
                Account.SObjectType,
                Contact.SObjectType,
                Note.SObjectType
            }
        );

        for(Integer i = 0; i < 100; i++)
        {
            Account a = new Account(Name = 'TestAcc' + i);
            uow.registerNew(a);
            for(Integer j = 0; j < 5; j++)
            {
                Contact c = new Contact(Lastname = 'TestCon' + j);
                uow.registerNew(c, Contact.AccountId, a);

                Note n = new Note(Body='Test' + j, Title='Test ' + j);
                uow.registerNew(n, Note.ParentId, c);
            }
            
        }
        uow.commitWork();

        System.assertEquals(100, [Select Id from Account].size());
        System.assertEquals(500, [Select Id from Contact].size());
        System.assertEquals(500, [Select Id from Note].size());
        
    }
}
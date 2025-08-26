global with sharing class CaseService {
    global CaseService() {

    }

    global static void closeCases(Set<Id> caseIds, String reason)
    {

        List<Case> cases = [SELECT id, Reason, Status FROM Case WHERE Id IN :caseIds];
        List<Case> casesToUpdate = new List<Case>();

        for(Case c : cases){
            c.Status = 'Closed';
            c.Reason = reason;
            casesToUpdate.add(c);
        }

        update casestoUpdate;
    }
}
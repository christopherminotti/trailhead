@IsTest
public class MyIterableTest {

    
    @IsTest
    public static void testIterableForLoop(){
        
        List<String> strings = new List<String>{'Hello', 'World'};
            
        MyIterable myIterableInstance = new MyIterable(strings);
        
        System.debug('running');
        
        for(String str : myIterableInstance)
        {
            System.debug('String: ' + str);
        }
        
    }
}
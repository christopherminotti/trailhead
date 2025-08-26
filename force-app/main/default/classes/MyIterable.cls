public class MyIterable implements Iterable<String> 
{
    //TEST 8/25/2025  ...
    private List<String> strings;
    
    
    public MyIterable(List<String> strings)
    {
        this.strings = strings;
    }

    public Iterator<string> iterator()
    {
        
        return strings.iterator();
    }
}
public void setup() 
{
	String[] lines = loadStrings("words.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) 
	{
	  System.out.println(pigLatin(lines[i]));
	}
}
public void draw()
{
        //not used
}
public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
  char[] cword = sWord.toCharArray();
  char[] vowel = { 'a' , 'e' , 'i', 'o', 'u'};

  for(int i = 0; i < cword.length; i++){
    for(int z = 0; z < vowel.length; z++){
      if(cword[i] == vowel[z]){
        return i;
      }
    }
  }
	return -1;
}

public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
  ArrayList<Character> cword = new ArrayList<Character>();
  for (char c : sWord.toCharArray()){
    cword.add(c);
  }
	if(findFirstVowel(sWord) == -1)
	{
		return sWord + "ay";
	}

else if(findFirstVowel(sWord) == 0){
   return sWord + "way";
}

else if(cword.get(0) == 'q' && cword.get(1) == 'u'){
  String theWord;
  cword.remove(0);
  cword.remove(0);
  
  char[] word = new char[cword.size()];
  for(int i = 0; i < cword.size(); i++){
    word[i] = cword.get(i);
  }
  
  theWord = new String(word);

  return theWord + "quay";
}

else if(findFirstVowel(sWord) != 0){
  String theWord;
  char firstConst = cword.get(0);
  cword.remove(0);
  char[] word = new char[cword.size()];
  for(int i = 0; i < cword.size(); i++){
   word[i] = cword.get(i); 
  }
  
  theWord = new String(word);
  
  return theWord + firstConst + "ay";
 
}
	else
	{
		return "ERROR!";
	}
}

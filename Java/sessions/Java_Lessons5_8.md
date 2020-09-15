# Java Lesson 5 & 8



## Recursion

* Something calling itself

### Example: Factorial Number

Calculate the factorial result of a number n.

`n! = n*(n-1)*(n-2)*(n3)*....*1` 

`6! = 6*5*4*3*2*1` 

In a first step well do that simply with a for loop. In a second step we will do this in a recursive method call.


### Example: Fibonacci

`fib(n) = fib(n-1) + fib(n-2)`

`fib(1) = 1`

`fib(2) = 2`

Create a java program that calculates the Fibonacci number and prints it. 



## Typecasting

* ASCII table

* https://www.java-tutorial.org/typecasting.html



### String functions

* chartAt(int index)

* concat(String s)

* equals(String s) / equalsIgnoreCase(String s)

* length()

* isEmpty()

* contains(String s)

* toLowercase() / toUpperCase()

* trim()

* indexOf(String s)

* substring(int startIndex, int endIndex)

* replace/replaceAll(String search, String replace)

  * #### Regular Expressions

    * Common matching symbols

    | Regular Expression | Description                                                  |
    | :----------------- | :----------------------------------------------------------- |
    | `.`                | Matches any character                                        |
    | `^regex`           | Finds regex that must match at the beginning of the line.    |
    | `regex$`           | Finds regex that must match at the end of the line.          |
    | `[abc]`            | Set definition, can match the letter a or b or c.            |
    | `[abc][vz]`        | Set definition, can match a or b or c followed by either v or z. |
    | `[^abc]`           | When a caret appears as the first character inside square brackets, it negates the pattern. This pattern matches any character except a or b or c. |
    | `[a-d1-7]`         | Ranges: matches a letter between a and d and figures from 1 to 7, but not d1. |
    | `X|Z`              | Finds X or Z.                                                |
    | `XZ`               | Finds X directly followed by Z.                              |
    | `$`                | Checks if a line end follows.                                |

    * Meta characters

      | Regular Expression | Description                                                  |
      | :----------------- | :----------------------------------------------------------- |
      | `\d`               | Any digit, short for `[0-9]`                                 |
      | `\D`               | A non-digit, short for `[^0-9]`                              |
      | `\s`               | A whitespace character, short for `[ \t\n\x0b\r\f]`          |
      | `\S`               | A non-whitespace character, short for                        |
      | `\w`               | A word character, short for `[a-zA-Z_0-9]`                   |
      | `\W`               | A non-word character `[^\w]`                                 |
      | `\S+`              | Several non-whitespace characters                            |
      | `\b`               | Matches a word boundary where a word character is `[a-zA-Z0-9_]` |

    * Quantifiers
    
    | Regular Expression | Description                                                  | Examples                                                     |
    | :----------------- | :----------------------------------------------------------- | :----------------------------------------------------------- |
    | `*`                | Occurs zero or more times, is short for `{0,}`               | `X*` finds no or several letter X, <sbr /> `.*` finds any character sequence |
    | `+`                | Occurs one or more times, is short for `{1,}`                | `X+`- Finds one or several letter X                          |
    | `?`                | Occurs no or one times, `?` is short for `{0,1}`.            | `X?` finds no or exactly one letter X                        |
    | `{X}`              | Occurs X number of times, `{}` describes the order of the preceding liberal | `\d{3}` searches for three digits, `.{10}` for any character sequence of length 10. |
    | `{X,Y}`            | Occurs between X and Y times,                                | `\d{1,4}` means `\d` must occur at least once and at a maximum of four. |
    | `*?`               | `?` after a quantifier makes it a *reluctant quantifier*. It tries to find the smallest match. This makes the regular expression stop at the first match. |                                                              |
    
    * used in string methods
    
    | Method                                   | Description                                                  |
    | :--------------------------------------- | :----------------------------------------------------------- |
    | `s.matches("regex")`                     | Evaluates if `"regex"` matches `s`. Returns only `true` if the WHOLE string can be matched. |
    | `s.split("regex")`                       | Creates an array with substrings of `s` divided at occurrence of `"regex"`. `"regex"` is not included in the result. |
    | `s.replaceFirst("regex"), "replacement"` | Replaces first occurrence of `"regex"` with `"replacement`.  |
    | `s.replaceAll("regex"), "replacement"`   | Replaces all occurrences of `"regex"` with `"replacement`.   |

#### String functions how to

```
String text = "My name is Astrid Lasinger. Astrid Lasinger is my name.";
String text2 = "My name is §$QW=)/DCUD§()$UW EF(§Z/§)$/§$ §$ B/34 is my name.";
System.out.println("text.charAt(1): " + text.charAt(1));
//concat
// "huhuuh" + "buhu"
// "huhuuh".concat("buhu");
System.out.println(text.concat(" Another sentence.").concat(" 4."));
System.out.println(text + " Another sentence." + " 4.");

//equals
//complex datatstructure needs to be compared with equals and not ==
System.out.println("hallo".equals("hallo")); //true
System.out.println("hallo".equals("Hallo")); //false
System.out.println("hallo".equalsIgnoreCase("HALLO")); //true

//length
//size() bei arrays
System.out.println("text.length(): " + text.length());
System.out.println("Last char: " + text.charAt(text.length() - 1));

//isEmpty
String emptyString = "";
System.out.println("text.IsEmpty(): " + text.isEmpty()); //false
System.out.println("emptyString.isEmpty(): " + emptyString.isEmpty()); //true

//contains
System.out.println(text.contains("Lasinger")); //true
System.out.println(text.contains("Astrid Lasinger")); //true
System.out.println(text.contains("astrid Lasinger")); //false
System.out.println(text.contains("Lasingerw")); //false

//replace
System.out.println(text.replaceAll("Lasinger", "Meier"));

//trim
System.out.println("\n  \t   Astrid Lasinger\b     \t\n".trim());
//cuts whitespaces (all non printable chars) before and afterwards

//to lower/upperCase
System.out.println(text.toLowerCase());
System.out.println(text.toUpperCase());

//returns index of first matchting entry
System.out.println(text.indexOf("Lasinger"));

//substring
System.out.println(text.substring(3, 7));
//SVNR - get birthdate only
System.out.println("1234010190".substring(4, 10));

System.out.println("end");

//matches with RegEx
System.out.println(text.matches("^My name is.* is my name."));
System.out.println(text2.matches("^My name is.* is my name."));

//split with RegEx
String animals = "Hund;1;Katze;3;Maus;1234;Pferd;234234;";
for (String splitted : animals.split(";\\d+;")) {
    System.out.println(splitted);
}
//replace with RegEx
System.out.println(animals.replaceAll(";\\d+;", ", "));
```





#### Warmup Session 8: loneTeen

We'll say that a number is "teen" if it is in the range 13..19 inclusive. Given 2 int values, return true if one or the other is teen, but not both.

`loneTeen(13, 99) → true`
`loneTeen(21, 19) → true`
`loneTeen(13, 13) → false`

```java
public static boolean loneTeenWithoutXORWithoutExtraMethod(int agePersA, int agePersB) {
    boolean isTeenA = agePersA >= 13 && agePersA <= 19;
    boolean isTeenB = agePersB >= 13 && agePersB <= 19;
    return ((isTeenA || isTeenB) && !(isTeenA && isTeenB));
}

public static boolean loneTeenWithoutXORWithVariables(int agePersA, int agePersB) {
    boolean isTeenA = isTeen(agePersA);
    boolean isTeenB = isTeen(agePersB);
    return ((isTeenA || isTeenB) && !(isTeenA && isTeenB));
}

public static boolean loneTeenXORWithVariables(int agePersA, int agePersB) {
    boolean isTeenA = isTeen(agePersA);
    boolean isTeenB = isTeen(agePersB);
    return isTeenA ^ isTeenB;
}

public static boolean loneTeenShort(int agePersA, int agePersB) {
    return isTeen(agePersA) ^ isTeen(agePersB);
}

public static boolean isTeen(int age) {
    return (age >= 13 && age <= 19);
}


public static void main(String[] args) {
    System.out.println(loneTeenShort(12, 13)); //true
    System.out.println(loneTeenShort(13, 15)); //false
    System.out.println(loneTeenShort(15, 21)); //true
    System.out.println(loneTeenShort(21, 300)); //false
}
```





#### Exercise: BEBE-Language

Create a java program that converts a given or read in text into bebe language. 
*In einigen Varianten von Spielsprachen, wie zum Beispiel der B-Sprache (in dieser BEBE-Sprabachebe genannt), werden Vokale verdoppelt und vorgegebene Buchstaben (hier also B) oder Silben eingefügt. [Diphthonge](https://de.wikipedia.org/wiki/Diphthong) zählen dabei entweder als einzelne Vokale oder werden zertrennt.*

*Beispiel: „Kabannst dubu mibir sabageben, wobo dubu hibinfabahreben wibillst?“ („Kannst du mir sagen, wo du hinfahren willst?“)*

```java
public class BebeLanguage {

    public static void main(String[] args) {
        String text = "Kannst du mir sagen, wo du hinfahren willst? Willst du im Auto mitfahren?";
        String bebetext = encrypt(text);
        System.out.println(text.equals(decrypt(bebetext))); //true
    }

    public static String decrypt(String text) {
        //TODO
        return "";
    }

    public static String encrypt(String text) {
        String[] vocals = {"a", "e", "i", "u", "o", "A", "E", "I", "U", "O"};
        String encrypted = "";
        for (char current : text.toCharArray()) {
            encrypted = encrypted.concat(String.valueOf(current));
            for (String vocal : vocals) {
                if (vocal.equals(String.valueOf(current))) {
                    encrypted = encrypted.concat("b").concat(String.valueOf(current).toLowerCase());
                }
            }
        }
        return encrypted;
    }
}
```


#### Exercise: Ceasar Cipher

First of all, let's define what a cipher is. [A cipher is a method for encrypting a message](http://www.cs.trincoll.edu/~crypto/historical/substitution.html), intending to make it less readable. As for the Caesar cipher, it's a substitution cipher that transforms a message by shifting its letters by a given offset.

Let's say we want to shift the alphabet by 3, then letter *A* would be transformed to letter *D*, *B* to *E*, *C* to *F*, and so on.

Here is the complete matching between original and transformed letters for an offset of 3:

```plaintext
A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
D E F G H I J K L M N O P Q R S T U V W X Y Z A B C
```

```java
public class CeaserCiphre {

    public static String encrypt(String text, int offset) {
        String encrypted = "";
        for (char current : text.toCharArray()) {
            int newLetter = 0;
            if ((int) current >= (int) 'a') {
                //lower case
                newLetter = ((int) current - (int) 'a' + offset) % 26 + (int) 'a';
            } else {
                //upper case
                newLetter = ((int) current - (int) 'A' + offset) % 26 + (int) 'A';
            }
            encrypted = encrypted.concat(String.valueOf((char) newLetter));
        }
        return encrypted;
    }

    //TODO decrypt


    public static void main(String[] args) {
        String text = "MAUSXYZmausxyz";
        System.out.println(encrypt(text, 3));
    }
}
```





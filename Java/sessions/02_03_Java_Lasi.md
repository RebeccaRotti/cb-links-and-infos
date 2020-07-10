# Java Lesson 2 & 3

## Loops

#### Exercise

count to the sum from 1 to 100 and print it in a do-while, while and for-loop

```java
public static void loopCountingExample() {
    /* for */ 
    int sum = 0;
    for (int i = 1; i <= 100; i++){
        sum += i;
        //sum = sum + i;
    }
    System.out.println("The sum calculated by for-loop: " + sum);


	/* while */
	int i = 1;
	int sum2 = 0;
	while (i <= 100){
		sum2 += i;
		i++;
	}		
	System.out.println("The sum calculated by while-loop: " + sum2);
	
	/* do while */
	int j = 1; //i = 1;
	int sum3 = 0;
	do {
		sum3 += j;
		j++;
	} while (j <= 100);
	System.out.println("The sum calculated by do-while-loop: " + sum3);
}
```



## IF 

#### Exercise

##### Calculating a prime number

Calculate if a number is  prime number or not and print a message on the console afterwards. Definition of prime number: Can only be divided by 1 and itself without any rest.

```java
 public static void isNumberAPrime(int number){
     System.out.print("Calculating number " + number + ": ");
     boolean isPrime = true;
     for (int i = 2; i < number && isPrime; i++) {
         if ((number % i) == 0) {
        	 isPrime = false;
         }
     }
	 if (isPrime){
		System.out.println("Number is a prime number");
	 }
	 else {
		System.out.println("Number is no prime number");
	 }
}
```
##### Calculating a loop year

We know that every 4th year is leap year (containing a leap day in February). But every 100 years, this leap year will not take place, except it's again able to be divided by 400.

```java
 public static void isLeapYear(int year){
		boolean isLeapYear;
		if ( (year % 4) == 0){
			if ( (year % 100) == 0 ){
				if ( (year % 400) == 0){
					isLeapYear = true;
				}
				else {
					isLeapYear = false;
				}
			}
			else { 
				isLeapYear = true;
			}
		}
		else {
			isLeapYear = false;
		}
		System.out.println("The year " + year + " is a leap year: " + isLeapYear);
	}
```

##### Bum example

​	Print the value from 1 to 100 or '*', if it is a bum for a given number. When is it a bum, when the current value can be

* divided with zero rest by number,
* contains number or
* number sum can divided with zero rest by number

```java
public static void main (String[] args) {
	int number = 7; 
	//int number = Util.expectIntFromConsole(1, 9); 
	
	for (int i = 1; i < 101; i++) {
		
		boolean bum = false;
		
		// check if: i can be divided by number
		if ( (i % number) == 0 ) {
			bum = true;
		} 
		else {
			int first = i % 10;
			int second = (i/10) % 10;
			int third = (i/100) % 10;
			
			// check if: number is contained in i
			if ( (number == first) || (number == second) || (number == third) ){
				bum = true;
			}
			else {
				int numberSum = first + second + third;
				// check if: number sum is divided by number
				if ( (numberSum % number) == 0 ){
					bum = true;
				}
			}
		}
		
		if ( bum ) {
			System.out.print("*");
		}
		else {
			System.out.print(i);
		}
		System.out.print("\t");
		
		if ( (i % 10) == 0 ){
			System.out.println();
		}
	}
}
```




## Whitespaces 

* are non printable letters

* "\t" for a tab
* "\n" for a new line



## Methods

* Notation info (general)
  * \<name> is a placeholder
  * [] in between means it can be but must not be

```java
 <visibilty> [static] <returnType> <methodName>(<arguments>) {
 	...
 	//if not void
 	return value;
 }
```

* **visibility**: private, protected or public. You can use **public** for now.
* **static**: If a method is called in a static context, it always delivers the same result for the same input arguments. In a dynamic context like in object-oriented programming other values can influence the result, but we will come in a few weeks to that. For now, everything is **static**.
* **return type**: primitive datatype (int, boolean, float, double, char,...) or class (String, Scanner, ...) or **void** (no return value)
* **method name**: use a good matching name for your method, as you like. You are only not allowed to use a reserved words and primitive datatypes like: class, public, private, static, int, boolean, double, return, void, abstract, new,... 
* **arguments**: There can be no arguments or as many as you like, every single argument has a type and a name, like you create a variable. 

Together this a called signature of a method.



### Examples for method signatures:

 ```java
 public static boolean isEven(int number) {
 	return (number % 2) == 0;
 } 

 public String convertToString(double value ) { 
     ... 
     return ...
 }

 public static int getCurrentYear() { ... return ...}

 public static void printCongratulations(String firstName, String lastName, int score) { ... }
 ```



### Exercise: Methods for util class

Working with methods and starting with our util class, which we will expand and refactor in the future.
```java
package at;

import java.util.*;

public class Util {
	
	public static int rounded(int cent) {
		int euro = cent / 100;
		if ( (cent % 100) > 49 ){
			euro = euro + 1;
		}
		return euro;
	}
	
	public static void printMyName(){
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("Please enter your name: ");
		String name = scanner.nextLine();
		System.out.println("Hallo " + name);
	}
	
	public static int expectIntFromConsole(int min, int max) {
		Scanner scanner = new Scanner(System.in);
		int value;
		
		do {
			System.out.println("Please a value between " + min + " and " + max);
			value = scanner.nextInt();
		} while ( value > max || value < min );
		
		return value;
	}
}

```
Main method:
```java
import at.Util;

public class RoundExample {
	
	public static void main (String[] args) {

		System.out.println( Util.rounded( Util.expectIntFromConsole(0, 10000000)));	
	}
}
```

## Console Read in

On top (before the class statement): 

 `import java.util.*`

Use in code like:
```java
Scanner scanner = new Scanner(System.in);
String text = scanner.nextLine();
int number = scanner.nextInt();
Boolean condition = scanner.nextBoolean();`
````





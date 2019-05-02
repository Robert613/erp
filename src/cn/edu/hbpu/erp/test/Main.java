package cn.edu.hbpu.erp.test;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
 

public class Main{
		    
	    public static void main(String [] args){
	        
	          Scanner scanner = new Scanner(System.in);
	          
	          int count =0;
	          
	         int n= scanner.nextInt();
	         
	         List<Good> list = new ArrayList<>();
	         
	         for(int i=0;i<n;i++){
	        	 int a = scanner.nextInt();
	        	 
	        	 int b = scanner.nextInt();
	        	 
	        	 int c = scanner.nextInt();
	        	
	        	 Good good = new Good(a, b, c);
	        	 
	        	 list.add(good);
	        	 
	         }
	         
	         for(int i=0;i<list.size();i++){
	        	 
	        	 for(int j=0;j<list.size();j++){
	        		 
	        		 if((list.get(j).a>list.get(i).a) && (list.get(j).b>list.get(i).b) && (list.get(j).c>list.get(i).c)  ){
	        			 
	        			 count ++;
	        		 }
	        	 }
	         }
	    
	        System.out.println(count);   
	    }
	    
	    
	   
	   
	    
}


class Good {
	
	public int a;
	
	public int b;
	
	public int c;
	
	 

	public Good() {
		super();
	}

	public Good(int a, int b, int c) {
		super();
		this.a = a;
		this.b = b;
		this.c = c;
	}

	public int getA() {
		return a;
	}

	public void setA(int a) {
		this.a = a;
	}

	public int getB() {
		return b;
	}

	public void setB(int b) {
		this.b = b;
	}

	public int getC() {
		return c;
	}

	public void setC(int c) {
		this.c = c;
	}


}
 



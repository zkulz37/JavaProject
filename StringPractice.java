/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaapplication1;

/**
 *
 * @author SnakeFly
 * 
 *Input : Nhập vào một chuỗi bất kì
 * Outout : In chuỗi theo thứ tự từ bé đến lớn
 */
public class Demo2 {
    
    public static void main(String[] args){
        String a = "ABC";
        for(int i=0;i<a.length();i++){

                for(int j=i;j<a.length();j++){
                    System.out.println("i = :"+i);
                    System.out.println("j = :"+j);
                    String kq = a.substring(i,j+1);
                    System.out.println(""+kq);
                }

        }
    }
            
    
}

package cn.edu.hbpu.erp.test;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;


public class HashMapTest {
	
	
	public static void main(String[] args) {
		 
		HashMap<Integer, User> map = new HashMap<>();
		
		map.put(1, new User("小明", 26));
		
		map.put(2, new User("小花", 23));
		
		map.put(3, new User("小黑", 29));
		
		HashMap<Integer, User> sortHashMap = sortHashMap(map);
		
		System.out.println(sortHashMap);
		
	}
	
	public static  HashMap<Integer, User> sortHashMap(HashMap<Integer, User> hashMap){
		
		Set<Entry<Integer, User>> set = hashMap.entrySet();
		
		List<Entry<Integer, User>> list = new ArrayList<>(set);
		
		Collections.sort(list, new Comparator<Entry<Integer, User>>() {
				
			@Override
			public int compare(Entry<Integer, User> o1, Entry<Integer, User> o2) {
				 
				return o2.getValue().getAge()-o1.getValue().getAge();
			}
		});
		
		LinkedHashMap<Integer, User> linkedHashMap = new LinkedHashMap<>();
		
		for (Entry<Integer, User> entry : list) {
			
			linkedHashMap.put(entry.getKey(), entry.getValue());
		}
		
		return linkedHashMap;
				
		
	}

}

package com.atoudeft.dao;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class UserDAO {
	private static Map<String, String> users = new HashMap<String, String>();

	static {
		users.put("admin","admin");
		users.put("moumene","moumene");
	}

	public static boolean checkLogin(String usn, String psw)
	{
		if (users.containsKey(usn) && psw.equals(users.get(usn)))
			return true;
		return false;
	}
	public static boolean addUser(String usn, String psw)
	{
		if (users.containsKey(usn))
			return false; //l'utilisateur existe déjà
		users.put(usn, psw);
		return true;
	}
	public static int getNbUsers()
	{
		return users.size();
	}

}

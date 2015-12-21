package com.atoudeft.dao;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import com.atoudeft.entites.Book;

public class LivreDAO {
	private static List<Book> bookList = new LinkedList<Book>();
	
	private static Map<String,List<String>> comments = new HashMap<String,List<String>>();

	static {
            bookList.add(new Book("978-2-7429-8492-3","Visual Basic 2005","Gilles Nicot"));
            bookList.add(new Book("978-1-4302-2889-9","Beginning Java EE6 platform with Glassfish 3","Antonio Goncalves"));
            bookList.add(new Book("978-1-4302-2659-8","Pro Android 2","Sayed Hashimi, Satya Komatineni, Dave MacLean"));
            addComment("978-2-7429-8492-3","Se lit très bien.");
            addComment("978-2-7429-8492-3","Trop gros.");
	}

	public static List<Book> getBookList() {
		return bookList;
	}
	public static Book getBook(String isbn) {
		ListIterator<Book> it = bookList.listIterator();
		Book b;
		while (it.hasNext())
		{
			b = it.next();
			if (b.getIsbn().equals(isbn))
				return b;
		}
		return null;
	}
	public static boolean addBook(Book b) {
		if (bookList.contains(b))
			return false;
		bookList.add(b);
		return true;
	}
	
	public static List<String> getComments(String isbn) {
		return comments.get(isbn);
	}
	public static void addComment(String isbn, String comment) {
		if (comments.containsKey(isbn))
		{
			comments.get(isbn).add(comment);
		}
		else
		{
			List<String> l = new LinkedList<String>();
			l.add(comment);
			comments.put(isbn, l);
		}
	}
}

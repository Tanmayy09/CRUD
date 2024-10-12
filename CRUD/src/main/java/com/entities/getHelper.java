package com.entities;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.helper.factory;

public class getHelper {
	
	public List<Admin> getAllTeacher() {
		List<Admin> teacher = new ArrayList<>();
        try {
        	Session session = factory.getFactory().openSession();
        	Transaction tx = session.beginTransaction();
            teacher = session.createQuery("FROM Admin", Admin.class).list();
            tx.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return teacher;
	}
	
	public List<user> getAllStudent() {
		List<user> st = new ArrayList<>();
        try {
        	Session session = factory.getFactory().openSession();
        	Transaction tx = session.beginTransaction();
            st = session.createQuery("FROM user", user.class).list();
            tx.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return st;
	}
	
	public user getbyAdm(int s_ID)
	{
		user st = null;
		try {
            Session session = factory.getFactory().openSession();
            Transaction tx = session.beginTransaction();
            st = session.get(user.class, s_ID);
            tx.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return st;
	}
	
	public Admin getAdmin(int id)
	{
		 Admin st = null;
		try {
            Session session = factory.getFactory().openSession();
            Transaction tx = session.beginTransaction();
            st = session.get(Admin.class, id);
            tx.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return st;
	}
}

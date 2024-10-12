package com.entities;

import java.util.*;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.helper.factory;
import com.entities.courses;

public class Course_details 
{
	public void savecourse(Session session) {
		
		List<String> cL = new ArrayList<>();
		cL.add("BTECH(CS-AIML)");
		cL.add("BTECH(CS-DS)");
		cL.add("BTECH(CS)");
		cL.add("BTECH(ECE)");
		cL.add("BTECH(EEE)");
		cL.add("BTECH(IT)");
		cL.add("BTECH(ME)");
		cL.add("MCA");
		     
		
        try {
        	for (String cname : cL) {
                // Check if the course already exists
                Query query = session.createQuery("from courses where c_name = :cname");
                query.setParameter("cname", cname);
                courses existingCourse = (courses) query.uniqueResult();

                // If the course doesn't exist, save it
                if (existingCourse == null) {
                    int m = nextsk(session);
                    courses c = new courses();
                    c.setC_id(m);
                    c.setC_name(cname);
                    session.save(c);
                    session.flush();
                    session.clear();
                } else {
                    System.out.println("Course " + cname + " already exists. Skipping...");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	public List<courses> getAllCourses() {
        List<courses> courses = new ArrayList<>();
        try {
        	Session session = factory.getFactory().openSession();
        	Transaction tx = session.beginTransaction();
            courses = session.createQuery("FROM courses", courses.class).list();
            tx.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return courses;
    }
	
	public static int nextsk(Session s) {
		int pk = 0;
		try {
			Query q = s.createQuery("select max(id) from courses");
			Integer max =(Integer) q.uniqueResult();
			pk=(max!=null)? max:0;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
			return pk+1;
		}

}

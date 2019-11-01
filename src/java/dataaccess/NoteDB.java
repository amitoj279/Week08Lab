package dataaccess;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import models.Notes;

/**
 *
 * @author 794473
 */
public class NoteDB 
{
    public int insert(Notes note)
    {
        int r = 0;              
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        
        try 
        {
            trans.begin();
            em.persist(note);
            trans.commit();
            
            r = 1;                   
            return r;
        } 
        catch (Exception e) 
        {
            trans.rollback();
            return r;
        } 
        finally 
        {
            em.close();
        }
    }
    
    public int update(Notes note)
    {
        int r = 0;       
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        
        try 
        {
            trans.begin();
            em.merge(note);
            trans.commit();
            
            r = 1;                   
            return r;
        } 
        catch (Exception e) 
        {
            trans.rollback();
            return r;
        } 
        finally 
        {
            em.close();
        }
    }
    
    public List<Notes> getAll()
    {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try
        {
            List<Notes> tempList = em.createNamedQuery("Note.findAll", Notes.class).getResultList();
            return tempList;
        }
        finally
        {
            em.close();
        }
    }
    
    public Notes get(int noteID)
    {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try
        {
            Notes n = em.find(Notes.class, noteID);
            return n;
        }
        finally
        {
            em.close();
        }
    }
    
    public int delete(Notes note)
    {
        int r = 0;              
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        
        try 
        {
            trans.begin();
            em.remove(em.merge(note));
            trans.commit();
            
            r = 1;        
            return r;
        } 
        catch (Exception e) 
        {
            trans.rollback();
            return r;
        } 
        finally 
        {
            em.close();
        }
}
}
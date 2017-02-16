package org.neric.regents.dao;

import java.util.List;

import org.neric.regents.model.Exam;
import org.neric.regents.model.School;
import org.neric.regents.model.Setting;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;


@Repository("settingDAO")
public class SettingDAOImpl extends AbstractDao<Integer, Setting> implements SettingDAO{

	public Setting findById(int id) 
	{
		return getByKey(id);
	}

	public Setting findByKey(String key) 
	{
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("key", key));
		return (Setting) crit.uniqueResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<Setting> findAll()
	{
		Criteria crit = createEntityCriteria();
		crit.addOrder(Order.asc("id"));
		return (List<Setting>)crit.list();
	}

	@Override
	public void deleteBySettingId(int id)
	{
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("id", id));
		Setting setting = (Setting)crit.uniqueResult();
		delete(setting);
		
	}

	@Override
	public void save(Setting setting)
	{
		persist(setting);
	}
	
}

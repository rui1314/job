package org.job.biz.impl;

import java.util.List;

import org.job.biz.INewsService;
import org.job.dao.DaoTemplate;
import org.job.entity.News;
import org.job.pager.Compare;
import org.job.pager.Condition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NewsServiceImpl implements INewsService {

	@Autowired DaoTemplate daoTemplate;
	
	@Override
	public List<News> queryAllNews() {
		return daoTemplate.find(News.class).getList();
	}

	@Override
	public boolean addNews(News news) {
		// TODO Auto-generated method stub
		return daoTemplate.save(news);
	}

	@Override
	public boolean deleteNews(int id) {
		// TODO Auto-generated method stub
		News news = this.getNews(id);
		if(news!=null)return daoTemplate.delete(news);
		return false;
	}

	@Override
	public News getNews(int id) {
		// TODO Auto-generated method stub
		List<News> news = daoTemplate.find(News.class,new Condition("id",Compare.EQ,id)).getList();
		if(news!=null && news.size()>0){
			return news.get(0);
		}
		return null;
	}

}

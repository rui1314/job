package org.job.biz;

import java.util.List;

import org.job.entity.News;

public interface INewsService {

	List<News> queryAllNews();
	
	boolean addNews(News news);
	
	boolean deleteNews(int id);
	
	News getNews(int id);
}

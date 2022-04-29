package com.library.service;

import com.library.bean.New;
import com.library.dao.NewsDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class NewsService {

    @Resource//按名字或类型自动注入
    private NewsDao newsDao;

    public int addNew(New news){
    int num = newsDao.interNews(news);
    return num;
    }

    public List<New> findAllNews(){
        return newsDao.showNews();
    }


    public New finedone(int newsid){return newsDao.findone(newsid);}

    public int updateOne(New news){ return newsDao.updateOne(news);}

    public int deleteOne(int newsid){
        return newsDao.deleteOne(newsid);
    }

    }

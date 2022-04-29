package com.library.dao;

import com.library.bean.New;

import java.util.List;

public interface NewsDao {

     List<New> showNews();
     int interNews(New news);
     New findone(long newsid);
     int updateOne(New news);
     int deleteOne(long newsid);

}

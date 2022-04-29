package com.library.controller;


import com.library.bean.New;
import com.library.bean.ReaderInfo;
import com.library.service.NewsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.xml.soap.Text;
import java.util.ArrayList;
import java.util.List;

@Controller
public class NewsController {
    @Resource
    NewsService service ;



    @RequestMapping("/News_add.do")
    public ModelAndView addNew(New news){
        ModelAndView mv = new ModelAndView();
        service.addNew(news);
        return mv;
    }



    //处理查询
    @ResponseBody//
    @RequestMapping("/findAllNews.do")
    public List<New> queryNews(){

        return service.findAllNews();

    }


    @RequestMapping("/allnews.do")
    public ModelAndView admin_News(){

        List<New> news = service.findAllNews();
        ModelAndView modelAndView = new ModelAndView("admin_news");
        modelAndView.addObject("news", news);
        modelAndView.setViewName("admin_allnews");
        return modelAndView;

    }

    @RequestMapping("/news_edit.do")
    public ModelAndView newsInfoEdit(HttpServletRequest request) {
        long newsid = Long.parseLong(request.getParameter("newsid"));
        New news = service.finedone((int) newsid);
        ModelAndView modelAndView = new ModelAndView("admin_news_edit");
        modelAndView.addObject("news", news);
        modelAndView.setViewName("admin_news_edit");
        return modelAndView;
    }

    @RequestMapping("/news_edit_do.do")
    public String newsInfoEditDo(HttpServletRequest request,RedirectAttributes redirectAttributes) {
        long newsid = Long.parseLong(request.getParameter("newsid"));
        String title = request.getParameter("title");
        String note = request.getParameter("note");
        New new1 = new New();
        new1.setNewsid((int) newsid);
        new1.setTitle(title);
        new1.setNote(note);
        int i = service.updateOne(new1);
        if (i ==1){
            redirectAttributes.addFlashAttribute("succ", "通知修改成功！");
        }else {
            redirectAttributes.addFlashAttribute("error", "通知修改失败！");
        }
        System.out.println("update输出的数字："+i);
        return "redirect:/allnews.do";
    }

    @RequestMapping("/news_delete.do")
    public String newsDelete(HttpServletRequest request, RedirectAttributes redirectAttributes) {
        long newsid = Long.parseLong(request.getParameter("newsid"));
        int i = service.deleteOne((int) newsid);
        if ( i == 1) {
            redirectAttributes.addFlashAttribute("succ", "删除成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "删除失败！");
        }
        return "redirect:/allnews.do";
    }


    @RequestMapping("/news_add.do")
    public ModelAndView readerInfoAdd() {
        return new ModelAndView("admin_news_add");
    }

    //添加通知
    @RequestMapping("/news_add_do.do")
    public String newsAddDo(HttpServletRequest request,RedirectAttributes redirectAttributes) {
        New news1 = new New();
        String title = request.getParameter("title");
        String note = request.getParameter("note");
        news1.setTitle(title);
        news1.setNote(note);
        int i = service.addNew(news1);
        if (i ==1 ) {
            redirectAttributes.addFlashAttribute("succ", "添加通知成功！");
        } else {
            redirectAttributes.addFlashAttribute("succ", "添加通知失败！");
        }

        return "redirect:/allnews.do";
    }

}

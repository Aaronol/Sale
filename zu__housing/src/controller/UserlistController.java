package controller;

import java.util.List;

import javax.servlet.http.HttpSession;


import com.sun.xml.internal.ws.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Pojo.Houselist;
import Pojo.User;
import Pojo.Userlist;
import service.UserService;
import service.UserlistService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class UserlistController {

    @Autowired
    private UserlistService userlistService;

    @Autowired
    private UserService userService;


    @RequestMapping("/findhasuserlist")
    public String findhasuserlist(HttpSession httpSession, Model model) throws Exception {
        User user1 = (User) httpSession.getAttribute("user");
        Integer user_id = user1.getId();
        Userlist userlist = userlistService.findhasuserlist(user_id);
        userlist.setUser(userService.selectByPrimaryKey(userlist.getUser_id()));
        model.addAttribute("userlist", userlist);
        model.addAttribute("mainPage", "updateuserlist.jsp");
        return "zuke/main";

    }

    //查找并更新用户信息
    @RequestMapping("/checkuserlist")
    public String checkuserlist(Model model, Userlist userlist, HttpSession httpSession) throws Exception {
        String ModelViewStr = "zuke/main";
        if (userlist.getId() == null) {
            String idcard = userlist.getIdcard();
            Userlist list = userlistService.checkuserlist(idcard);

            if (list != null) {
                model.addAttribute("error", "该身份证已被绑定,一个身份证号码只能被一个账户绑定！");
                model.addAttribute("mainPage", "updateuserlist1.jsp");
                model.addAttribute("userlist", userlist);
            } else {
                int nowMaxId = userService.getNowMaxId();
                userlist.setUser_id(nowMaxId + 1);
                userlist.getUser().setId(nowMaxId + 1);
                userlistService.insertuserlist(userlist);
                userService.insert(userlist.getUser());
                this.showAllUserList(model, 1, 10);
            }
            ModelViewStr = "admin/main1";
        } else {

            Userlist list = userlistService.finduserlistupdate(userlist);
            User user = userService.selectByPrimaryKey(userlist.getUser_id());
            if (list != null) {
                model.addAttribute("error", "该身份证号码已被绑定");
                model.addAttribute("mainPage", "updateuserlist.jsp");
                model.addAttribute("userlist", userlist);
            } else {
//                if (!user.getUsername().equals(userlist.getUser().getUsername())) {
//                    ModelViewStr = "login";
//                }
                userlistService.updateuserlist(userlist);
                userService.updateByExample(userlist.getUser());
                userlist.setUser(userService.selectByPrimaryKey(userlist.getUser_id()));
                model.addAttribute("error", "更新成功");
                model.addAttribute("mainPage", "updateuserlist.jsp");
                model.addAttribute("userlist", userlist);
            }
        }
        return ModelViewStr;
    }

    @RequestMapping("/findalluserlist")
    public String findalluserlist(Model model, @RequestParam(required = false, defaultValue = "1") Integer page,
                                  @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        showAllUserList(model, page, pageSize);
        return "admin/main1";

    }

    private void showAllUserList(Model model, @RequestParam(required = false, defaultValue = "1") Integer page, @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        PageHelper.startPage(page, pageSize);
        List<Userlist> userlist = userlistService.findalluserlist();
        PageInfo<Userlist> p = new PageInfo<Userlist>(userlist);
        model.addAttribute("userlist", userlist);
        model.addAttribute("p", p);
        model.addAttribute("mainPage", "userlist.jsp");
    }

    @RequestMapping("/updateuserlistbyadmin")
    public String updateuserlist1(Model model) {
        model.addAttribute("mainPage", "updateuserlist1.jsp");
        return "admin/main1";

    }

    //删除用户信息
    @RequestMapping("/deleteuserlist")
    public String deleteuserlist(Model model, Integer id) {
        userlistService.deleteuserlist(id);
        model.addAttribute("error", "deletesuccess");
        return "redirect:findalluserlist.action";
    }
}

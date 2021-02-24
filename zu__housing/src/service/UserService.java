package service;

import java.util.List;

import Pojo.User;
import Pojo.UserExample;
import Pojo.Userlist;
import org.apache.ibatis.annotations.Param;

public interface UserService {

	public List<User> userList() throws Exception;
	public User login(User user) throws Exception;
	User selectByPrimaryKey(Integer id);
	int insert(User record);
	int updateByExample(User record);
}

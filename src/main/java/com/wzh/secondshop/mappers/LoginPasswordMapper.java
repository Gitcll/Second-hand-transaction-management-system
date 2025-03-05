package com.wzh.secondshop.mappers;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.wzh.secondshop.models.User;

public interface LoginPasswordMapper {
	
    @Select("select count(*) from user_table where id = #{id}")
    int getUserById(int id);
    
    @Update("UPDATE user_table SET password = #{password}, password2 = #{password2}, "
    		+ "pwd_rireki_1 = #{pwdRireki1}, pwd_rireki_2 = #{pwdRireki2}, pwd_rireki_3 = #{pwdRireki3}, pwd_rireki_4 = #{pwdRireki4}"
    		+ ", updateDate = #{updateDate}, endDate = #{endDate} where id = #{id};")
    int updateUser(User user);
}

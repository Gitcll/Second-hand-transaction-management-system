package com.wzh.secondshop.services;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.wzh.secondshop.mappers.LoginPasswordMapper;
import com.wzh.secondshop.models.User;
import com.wzh.secondshop.utils.DateUtils;

@Service
public class LoginPasswordService {

    @Autowired
    private LoginPasswordMapper loginPasswordMapper;
	
	public void passWordChangeProcess(User admin, String password, String password2) throws Exception{
		
		//获取当前系统日期和时间
		Calendar calToday = Calendar.getInstance();
		Date dateToday = calToday.getTime();
		SimpleDateFormat sdfYMDhmd  = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String strSysDateTime = sdfYMDhmd.format(dateToday);

		//获取当前日期
		calToday.set(Calendar.HOUR_OF_DAY, 0);
		calToday.set(Calendar.MINUTE, 0);
		calToday.set(Calendar.SECOND, 0);
		calToday.set(Calendar.MILLISECOND, 0);
		dateToday = calToday.getTime();

		
		//旧密码检查
		//检查密码过期时间
		String strKigen = DateUtils.formatDate(admin.getEndDate());
		Date dateKigen = DateUtils.parseStringToDate(strKigen);

		System.out.println("密码有效期日期：" + dateKigen + "  今天的日期:" + dateToday);

		if(dateToday.after(dateKigen)){
			//密码过期且初始化标志已初始化
			throw new Exception("该用户ID当前密码已锁定，无法登录。", null);
		}

		//新密码检查
		try{
			//检查新密码是否可用
			changeInputCheck(admin, password, password2);
		}catch(Exception e){
			throw e;
		}

		//更新新密码
		try {
			//获取系统日期+90天后的SQL Date
			calToday.add(Calendar.DATE, 90);
			Date dateSysDate90 = calToday.getTime();
			String strSysDate90 = sdfYMDhmd.format(dateSysDate90);

			//设置密码更改数据
			User updateUser = new User();
			BeanUtils.copyProperties(admin, updateUser);
			String mdsPass = DigestUtils.md5DigestAsHex((password + admin.getCode()).getBytes());
			String mdsPass2 = DigestUtils.md5DigestAsHex((password2 + admin.getCode()).getBytes());
			
			updateUser.setPassword(mdsPass2);
			updateUser.setEndDate(DateUtils.parseStringToDate(strSysDate90));
			updateUser.setPassword2(mdsPass);
			updateUser.setPwdRireki1(mdsPass);
			updateUser.setPwdRireki2(admin.getPwdRireki1());
			updateUser.setPwdRireki3(admin.getPwdRireki2());
			updateUser.setPwdRireki4(admin.getPwdRireki3());
			updateUser.setUpdateDate(DateUtils.parseStringToDate(strSysDateTime));
			loginPasswordMapper.updateUser(updateUser);
			
		}catch (Exception e){
			throw e;
		}
	}

	private void changeInputCheck(User admin, String password, String password2) throws Exception {

		int intNewPassword_Lng  = password2.length();
		if((5 > intNewPassword_Lng) || (15 < intNewPassword_Lng)){
			throw new Exception("密码长度小于8或大于15时出错", null);
		}

		//首尾为数字时出错
		if((Character.isDigit(password2.charAt(0)))
			||(Character.isDigit(password2.charAt(intNewPassword_Lng-1) ))
		){
			throw new Exception("新输入的密码包含不可用字符。有关可用规则，请参阅密码帮助。", null);
		}

		//新密码与旧密码相同时出错
		if(password2.equals(password)){
			throw new Exception("新密码与旧密码相同", null);
		}

		//密码中包含用户ID时出错
		if(-1 != (password2.toUpperCase()).indexOf(admin.getId())){
			throw new Exception("新输入的密码包含不可用字符。有关可用规则，请参阅密码帮助。", null);
		}

		//检查密码是否包含可用字符
		int intLetterFlg = 0;
		int intDigitFlg = 0;
		int intKigouFlg = 0;
		char charNewPsw = ' ';
		boolean booErrCharFlg = false;
		for(int i = 0;i<intNewPassword_Lng;i++){
			//检查连续使用相同字符
			if(i+2<intNewPassword_Lng){
				if((password2.substring(i,i+1)).equals(password2.substring(i+1,i+2))
					&& (password2.substring(i,i+1)).equals(password2.substring(i+2,i+3))){
					booErrCharFlg = true;
				}
			}

			//确认使用两种以上字符类型
			charNewPsw = password2.charAt(i);
			if(Character.isLetter(charNewPsw)){
				intLetterFlg = 1;  //A-Z,a-zを使用
			}else if(Character.isDigit(charNewPsw)){
				intDigitFlg = 1;   //0-9を使用
			}else{
				switch(charNewPsw){
					case '*':
					case '$':
					case '%':
					case '&':
					case '+':
					case '-':
					case '/':
					case ':':
					case '=':
					case '?':
					case '@':
					case '_':
					case '|':
					case '~':
						intKigouFlg = 1; //記号を使用
						break;
					default:
						booErrCharFlg = true;
						break;
				}
			}
		}
		if(booErrCharFlg){
			//使用不可用字符时出错
			throw new Exception("新输入的密码包含不可用字符。有关可用规则，请参阅密码帮助。", null);

		}

		if(2 > (intLetterFlg + intDigitFlg + intKigouFlg)){
			//2種類以上の文字を使ってない場合、エラー
			throw new Exception("密码必须使用大写字母、小写字母、数字和符号中的三种以上字符类型。", null);

		}
	}
}

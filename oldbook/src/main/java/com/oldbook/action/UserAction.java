package com.oldbook.action;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.oldbook.domain.ShopDo;
import com.oldbook.domain.UserDo;
import com.oldbook.service.ShopService;
import com.oldbook.service.UserService;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction implements Action, ModelDriven<UserDo> {

	@Autowired
	private UserService userService;
	@Autowired
	private ShopService shopService;

	private UserDo userData;
	private List<UserDo> rows;
	private int total;
	private String ids;

	@Override
	public UserDo getModel() {
		this.userData = new UserDo();
		return this.userData;
	}

	@Override
	public String execute() {
		try {
			if (this.userData.getId() != null) {
				this.userData.setUpdateTime(new Date());
				this.userService.updateUser(this.userData);
				ActionContext.getContext().getSession().put("user", this.userData);// 更新session
				return NONE;
			} else {
				return ERROR;
			}
		} catch (Exception e) {
			return ERROR;
		}
	}

	public String saveOrUpdateUser() {
		try {
			if (this.userData.getId() != null) { // 存在主键 走编辑
				this.userData.setUpdateTime(new Date());
				this.userService.updateUser(this.userData);
			} else { // 不存在主键 走新增
				this.userData.setCreateTime(new Date());
				this.userService.insertUser(this.userData);
			}
			ActionContext.getContext().getSession().put("user", this.userData);
			return NONE;
		} catch (Exception e) {
			return ERROR;
		}
	}

	public String deleteUser() {
		try {
			if (StringUtils.isNoneEmpty(ids)) {
				String[] idsArray = ids.split(",");
				UserDo user = new UserDo();
				for (int i = 0; i < idsArray.length; i++) {
					if (StringUtils.isNoneEmpty(idsArray[i])) {
						user.setId(Integer.parseInt(idsArray[i]));
						this.userService.deleteUser(user);
					}
				}
				return NONE;
			} else {
				return ERROR;
			}
		} catch (Exception e) {
			return ERROR;
		}
	}

	public String login() {
		try {
			if (StringUtils.isNoneEmpty(this.userData.getAccount())
					&& StringUtils.isNoneEmpty(this.userData.getPassword()) && StringUtils.isNoneEmpty(this.userData.getRoleTypeX())) {
				UserDo user = this.userService.loginUser(this.userData.getAccount(), this.userData.getPassword(),
						this.userData.getRoleTypeX());
				if (user != null) {
					ActionContext.getContext().getSession().put("user", user);
					ShopDo shop = new ShopDo();
					shop.setUserId(user.getId());
					List<ShopDo> shopList = shopService.listShop(shop);
					if(shopList.size()>0) {
						ActionContext.getContext().getSession().put("shop", shopList.get(0));
					}
					return NONE;
				} else {
					return ERROR;
				}
			} else {
				return ERROR;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String logout() {
		ActionContext.getContext().getSession().clear();
		return NONE;
	}

	public String updatePwd() {
		try {
			if (this.userData.getId() != null) {
				String pwd = this.userData.getPassword();
				this.userData = this.userService.selectUserById(this.userData.getId());
				this.userData.setUpdateTime(new Date());
				this.userData.setPassword(pwd);
				this.userService.updateUser(this.userData);
				ActionContext.getContext().getSession().clear();
				;// 清除session以重新登录
				return NONE;
			} else {
				return ERROR;
			}
		} catch (Exception e) {
			return ERROR;
		}
	}

	public String toUpdateUserPage() {
		try {
			if (this.userData.getId() != null) {
				this.userData = this.userService.selectUserById(this.userData.getId());
				return SUCCESS;
			} else {
				return ERROR;
			}
		} catch (Exception e) {
			return ERROR;
		}
	}

	public String listUser() {
		try {
			List<UserDo> userList = this.userService.listUser(this.userData);
			this.rows = userList;
			this.total = userList.size();
			return NONE;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public List<UserDo> getRows() {
		return rows;
	}

	public void setRows(List<UserDo> rows) {
		this.rows = rows;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public UserDo getUserData() {
		return userData;
	}

	public void setUserData(UserDo userData) {
		this.userData = userData;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

}
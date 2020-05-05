package com.oldbook.action;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.oldbook.domain.ShopDo;
import com.oldbook.domain.UserDo;
import com.oldbook.service.ShopService;
import com.oldbook.service.UserService;
import com.oldbook.utils.CommonConstants;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

public class ShopAction implements Action, ModelDriven<ShopDo> {

	@Autowired
	private ShopService shopService;
	@Autowired
	private UserService userService;

	private ShopDo shopData;
	private List<ShopDo> rows;
	private int total;
	private String ids;

	@Override
	public ShopDo getModel() {
		this.shopData = new ShopDo();
		return this.shopData;
	}

	@Override
	public String execute() {
		try {
			List<ShopDo> ShopList = this.shopService.listShop(this.shopData);
			this.rows = ShopList;
			this.total = ShopList.size();
			return NONE;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public String saveOrUpdateShop() {
		try {
			if (this.shopData.getId() != null) { // 存在主键 走编辑
				this.shopData.setUpdateTime(new Date());
				this.shopService.updateShop(this.shopData);
				ActionContext.getContext().getSession().put("shop", this.shopData);
			} else { // 不存在主键 走新增
				this.shopData.setApplyTime(new Date());
				ActionContext actionContext = ActionContext.getContext();
				UserDo user = (UserDo) actionContext.getSession().get("user");
				if(user!=null) {
					this.shopData.setUserId(user.getId());
					this.shopData.setUserName(user.getUserName()==null?user.getAccount():user.getUserName());
					this.shopData.setShopState(CommonConstants.StateType.NORMAL.value());
					user.setRoleTypeX(user.getRoleTypeX()+","+CommonConstants.RoleType.MERCHANT.value());
					user.setUpdateTime(new Date());
					userService.updateUser(user);// 更新用户角色
				}
				this.shopService.insertShop(this.shopData);
			}
			return NONE;
		} catch (Exception e) {
			return ERROR;
		}
	}

	public String deleteShop() {
		try {
			if (StringUtils.isNoneEmpty(ids)) {
				String[] idsArray = ids.split(",");
				ShopDo Shop = new ShopDo();
				for (int i = 0; i < idsArray.length; i++) {
					if (StringUtils.isNoneEmpty(idsArray[i])) {
						Shop.setId(Integer.parseInt(idsArray[i]));
						this.shopService.deleteShop(Shop);
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

	public String toUpdateShopPage() {
		try {
			if (this.shopData.getId() != null) {
				this.shopData = this.shopService.selectShopById(this.shopData.getId());
				return SUCCESS;
			} else {
				return ERROR;
			}
		} catch (Exception e) {
			return ERROR;
		}
	}

	public List<ShopDo> getRows() {
		return rows;
	}

	public void setRows(List<ShopDo> rows) {
		this.rows = rows;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public ShopDo getShopData() {
		return shopData;
	}

	public void setShopData(ShopDo shopData) {
		this.shopData = shopData;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

}
package com.oldbook.utils;

public class CommonConstants {

	/*
	 * 性别
	 */
	public static enum GenderType {
		MALE("男"), FEMALE("女");
		private String value;

		private GenderType(final String value) {
			this.value = value;
		}

		public String value() {
			return this.value;
		}
	}

	/*
	 * 角色类型
	 */
	public static enum RoleType {
		ADMINISTRATOR("管理员"), MERCHANT("商家"), CUSTOMER("客户");
		private String value;

		private RoleType(final String value) {
			this.value = value;
		}

		public String value() {
			return this.value;
		}
	}

	/*
	 * 店铺状态值
	 */
	public static enum StateType {
		NORMAL("正常"), ABNORMAL("异常");
		private String value;

		private StateType(final String value) {
			this.value = value;
		}

		public String value() {
			return this.value;
		}
	}
	
	/*
	 * 订单状态值
	 */
	public static enum OrderStateType {
		NONPAYMENT("未支付"), PAID("已支付");
		private String value;
		
		private OrderStateType(final String value) {
			this.value = value;
		}
		
		public String value() {
			return this.value;
		}
	}
	
	/*
	 * 是否提交订单状态值
	 */
	public static enum SubmitOrderType {
		NO("未提交"), YES("已提交");
		private String value;
		
		private SubmitOrderType(final String value) {
			this.value = value;
		}
		
		public String value() {
			return this.value;
		}
	}
}

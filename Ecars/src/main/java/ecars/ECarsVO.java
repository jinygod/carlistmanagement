/*
 * MemberVO Value Object
 */
package ecars;

public class ECarsVO {
	private Integer serial;
	private String var;
	private String color;
	private Integer price;
	private Integer qty;

	public ECarsVO() {}
	
	public ECarsVO(Integer serial, String var, String color, Integer price, Integer qty) {
		this.serial = serial;
		this.var = var;
		this.color = color;
		this.price = price;
		this.qty = qty;
	}
	
	public ECarsVO(String serial, String var, String color, String price, String qty) {
		if(serial != null) {
			this.serial = Integer.parseInt(serial);
		}
		this.var = var;
		this.color = color;
		this.price = Integer.parseInt(price);
		this.qty = Integer.parseInt(qty);
	}

	public Integer getSerial() {
		return serial;
	}

	public void setSerial(Integer serial) {
		this.serial = serial;
	}

	public String getVar() {
		return var;
	}

	public void setVar(String var) {
		this.var = var;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getQty() {
		return qty;
	}

	public void setQty(Integer qty) {
		this.qty = qty;
	}
	
}

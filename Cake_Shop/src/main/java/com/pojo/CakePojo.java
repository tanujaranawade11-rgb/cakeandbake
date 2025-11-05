package com.pojo;

public class CakePojo {
private int id;
private String name;
private int price;
private int discount;
private int fprice;
private String category;
private String image;
private String description;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public int getDiscount() {
	return discount;
}
public void setDiscount(int discount) {
	this.discount = discount;
}
public int getFprice() {
	return fprice;
}
public void setFprice(int fprice) {
	this.fprice = fprice;
}
public String getCategory() {
	return category;
}
public void setCategory(String category) {
	this.category = category;
}
public String getImage() {
	return image;
}
public void setImage(String image) {
	this.image = image;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public CakePojo(String name, int price, int discount, int fprice, String category, String image,
		String description) {
	super();
	this.name = name;
	this.price = price;
	this.discount = discount;
	this.fprice = fprice;
	this.category = category;
	this.image = image;
	this.description = description;
}
public CakePojo() {
	super();
	// TODO Auto-generated constructor stub
}
@Override
public String toString() {
	return "CakePojo [id=" + id + ", name=" + name + ", price=" + price + ", discount=" + discount + ", fprice="
			+ fprice + ", category=" + category + ", image=" + image + ", description=" + description + "]";
}


}

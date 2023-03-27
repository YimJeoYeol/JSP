package DTO;

public class Woori {
	//데이터베이스의 컬럼명과 동일하게 하는게 안 헷갈린다.
	String id;
	String name;
	
	int password;
	private String emial;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmial() {
		return emial;
	}
	public void setEmial(String emial) {
		this.emial = emial;
	}
	public int getPassword() {
		return password;
	}
	public void setPassword(int password) {
		this.password = password;
	}

	
}

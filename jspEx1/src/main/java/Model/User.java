package Model;

public class User {
 private String userId;
 private String name;
 private String status;

 public User(String name) {
     this.name = name;
 }
 public String getName() {
     return name;
 }
 
 public User(String userId, String name, String status) {
     this.userId = userId;
     this.name = name;
     this.status = status;
 }
 public String getUserId() {
	return userId;
 }
 public String getStatus() {
	return status;
 }
}
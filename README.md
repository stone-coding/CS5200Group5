# CS5200Group5  
**CS5200Group5 Database Design Group Project**  

## **Tech Stack**  
**Frontend:** HTML / CSS / JavaScript / jQuery / JSP  
**Backend:** SSM (Spring + SpringMVC + MyBatis)  
**Database:** MySQL 8 on GCP  

---

## **How to Set Up**  

### **1. Database Setup**  
1. **Download SQL Management Tool:**  
   - Install Navicat Premium or any other preferred SQL management tool.  
2. **Connect to GCP:**  
   - Use the SQL management tool to connect to your MySQL database hosted on GCP.
![NaviCatGCP](https://github.com/stone-coding/CS5200Group5/blob/main/Group5_Final/imgs/Screenshot%202024-11-29%20222147.png)
3. **Upload the `rent` Database File:**  
   - Copy the provided `rent` SQL file to your GCP database instance.  
   - Execute the file to set up the database structure and populate sample data.  
4. **Verify Database Setup:**  
   - Log in to your GCP SQL instance and ensure all tables and sample data are correctly configured.
![GCPInCloud](https://github.com/stone-coding/CS5200Group5/blob/main/Group5_Final/imgs/Screenshot%202024-11-29%20222250.png)

---

### **2. Frontend and Backend Setup**  
1. **Install IntelliJ IDEA:**  
   - Download and install IntelliJ IDEA (Ultimate Edition).
![UltimateIDE](https://github.com/stone-coding/CS5200Group5/blob/main/Group5_Final/imgs/Screenshot%202024-11-29%20222346.png)
2. **Set Up Java:**  
   - Install Java 8 and configure it in IntelliJ.  
3. **Install Tomcat:**  
   - Download and set up Tomcat 9 (Tomcat 8 or 10 may also work, but 9 is recommended for compatibility).
![IDEInterface](https://github.com/stone-coding/CS5200Group5/blob/main/Group5_Final/imgs/Screenshot%202024-11-29%20222358.png)
![TomCat1](https://github.com/stone-coding/CS5200Group5/blob/main/Group5_Final/imgs/Screenshot%202024-11-29%20222409.png)
![ProjectStructure1](https://github.com/stone-coding/CS5200Group5/blob/main/Group5_Final/imgs/Screenshot%202024-11-29%20222500.png)
![ProjectStructure2](https://github.com/stone-coding/CS5200Group5/blob/main/Group5_Final/imgs/Screenshot%202024-11-29%20222511.png)
4. **Configure the Project:**  
   - Import the project into IntelliJ.  
   - Navigate to the `db.properties` file under the `src` directory and configure your database connection:  

     ```properties
     jdbc.driver=com.mysql.cj.jdbc.Driver  
     jdbc.url=jdbc:mysql://<your-gcp-instance-ip>:3306/rent?characterEncoding=utf-8&serverTimezone=America/Los_Angeles  
     jdbc.username=<your-database-username>  
     jdbc.password=<your-database-password>  
     ```  

5. **Run the Tomcat Server:**  
   - Deploy the project on Tomcat and start the server.  

---

### **3. Browser Usage Tips**  
- Open **two different browsers** (e.g., Chrome and Edge).  
- Use one browser for **admin** access and the other for **tenant** access.  
- Do **not** use the same browser for both admin and tenant logins, as session conflicts may occur, causing the application to crash.
- Once user terminated a lease, the admin must delete the lease history to keep the next lease not crash.

---

### **4. Sample Credentials**  

#### **Administrator Login:**  
- **Username:** admin  
- **Password:** admin  

#### **Tenant Login:**  
- **Username:** user  
- **Password:** 123456  

---

### **5. Project Structure**  
![Structure1](https://github.com/stone-coding/CS5200Group5/blob/main/Group5_Final/imgs/Screenshot%202024-11-29%20221117.png)
![Structure2](https://github.com/stone-coding/CS5200Group5/blob/main/Group5_Final/imgs/Screenshot%202024-11-29%20221126.png)
![Structure3](https://github.com/stone-coding/CS5200Group5/blob/main/Group5_Final/imgs/Screenshot%202024-11-29%20221138.png)

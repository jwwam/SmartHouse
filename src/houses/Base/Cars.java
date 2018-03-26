package houses.Base;

import java.util.Date;



/**
 * Cars entity. @author MyEclipse Persistence Tools
 */

@SuppressWarnings("serial")
public class Cars  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private String carowner;
     private String carspace;
     private String housenumber;
     private String licensenumber;
     private String contactway;
     private String carmsg;
     private Date enddate;


    // Constructors

    /** default constructor */
    public Cars() {
    }

    
    /** full constructor */
    public Cars(String carowner, String carspace, String housenumber, String licensenumber, String contactway, String carmsg, Date enddate) {
        this.carowner = carowner;
        this.carspace = carspace;
        this.housenumber = housenumber;
        this.licensenumber = licensenumber;
        this.contactway = contactway;
        this.carmsg = carmsg;
        this.enddate = enddate;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getCarowner() {
        return this.carowner;
    }
    
    public void setCarowner(String carowner) {
        this.carowner = carowner;
    }

    public String getCarspace() {
        return this.carspace;
    }
    
    public void setCarspace(String carspace) {
        this.carspace = carspace;
    }

    public String getHousenumber() {
        return this.housenumber;
    }
    
    public void setHousenumber(String housenumber) {
        this.housenumber = housenumber;
    }

    public String getLicensenumber() {
        return this.licensenumber;
    }
    
    public void setLicensenumber(String licensenumber) {
        this.licensenumber = licensenumber;
    }

    public String getContactway() {
        return this.contactway;
    }
    
    public void setContactway(String contactway) {
        this.contactway = contactway;
    }

    public String getCarmsg() {
        return this.carmsg;
    }
    
    public void setCarmsg(String carmsg) {
        this.carmsg = carmsg;
    }

    public Date getEnddate() {
        return this.enddate;
    }
    
    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }
   

}
package houses.Action;

import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class CreateDatabase extends ActionSupport{
	
	public void Create()
	{
		Configuration cfg = new Configuration().configure();
		
		SchemaExport export = new SchemaExport(cfg);
		
		export.create(true, true);
	}

}

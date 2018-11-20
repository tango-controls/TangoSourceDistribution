//===================================================================
/**
 *	Set class description as property in database
 */
//===================================================================			
	private void write_class_property() throws DevFailed
	{	
		//	First time, check if database used
		//--------------------------------------------
		if (Util._UseDb == false)
			return;

		//	Prepeare DbDatum
		//--------------------------------------------
		DbDatum[]	data = new DbDatum[2];
		data[0] = new DbDatum("ProjectTitle");
		data[0].insert(PogoProjectTitle);

		data[1] = new DbDatum("Description");
		data[1].insert(PogoClassDescription);

		//	Call database and and values
		//--------------------------------------------
		get_db_class().put_property(data);
	}

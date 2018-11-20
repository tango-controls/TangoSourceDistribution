//===================================================================
/**
 *	Get the class property for specified name.
 *
 *	@param name The property name.
 */
//===================================================================
	public DbDatum get_class_property(String name)
	{
		for (int i=0 ; i<cl_prop.length ; i++)
			if (cl_prop[i].name.equals(name))
				return cl_prop[i];
		//	if not found, return  an empty DbDatum
		return new DbDatum(name);
	}

//===================================================================
/**
 *	Read the target properties from database.
 */
//===================================================================			
	public void get_target_property() throws DevFailed
	{
		//	Initialize your default values here.
		//------------------------------------------


		//	Read target properties from database.(Automatic code generation)
		//-------------------------------------------------------------

		//	End of Automatic code generation
		//-------------------------------------------------------------

	}

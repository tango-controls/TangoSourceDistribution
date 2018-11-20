//===================================================================
/**
 *	Method called by the read_attributes CORBA operation to
 *	read device hardware
 *
 *	@param	attr_list	Vector of index in the attribute vector
 *		of attribute to be read
 */
//===================================================================			
	public void read_attr_hardware(Vector attr_list) throws DevFailed
	{
		get_logger().info("In read_attr_hardware for "+attr_list.size()+" attribute(s)");

		//	Switch on attribute name
		//---------------------------------
	}
//===================================================================
/**
 *	Method called by the read_attributes CORBA operation to
 *	set internal attribute value.
 *
 *	@param	attr	reference to the Attribute object
 */
//===================================================================			
	public void read_attr(Attribute attr) throws DevFailed
	{
		String attr_name = attr.get_name();
		get_logger().info("In read_attr for attribute " + attr_name);

		//	Switch on attribute name
		//---------------------------------
	}

//--------	WRITE ATTRIBUTE -----------
//===================================================================
/**
 *	Method called by the write_attributes CORBA operation to
 *	write device hardware.
 *
 *	@param	attr_list	vector of index in the attribute vector
 *		of attribute to be written
 */
//===================================================================			
	public void write_attr_hardware(Vector attr_list) throws DevFailed
	{
		get_logger().info("In write_attr_hardware for "+attr_list.size()+" attribute(s)");
	
		for (int i=0 ; i<attr_list.size() ; i++)
		{
			WAttribute att = dev_attr.get_w_attr_by_ind(((Integer)(attr_list.elementAt(i))).intValue());
			String attr_name = att.get_name();

			//	Switch on attribute name
			//---------------------------------
		}
	}

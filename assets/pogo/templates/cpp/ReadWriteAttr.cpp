//+----------------------------------------------------------------------------
//
// method : 		TemplateDevServ::read_attr_hardware()
// 
// description : 	Hardware acquisition for attributes.
//
//-----------------------------------------------------------------------------
void TemplateDevServ::read_attr_hardware(vector<long> &attr_list)
{
	DEBUG_STREAM << "In read_attr_hardware for " << attr_list.size()
	             << " attribute(s)" << endl;
	
	//	Add your own code here
	//---------------------------------
}

//+----------------------------------------------------------------------------
//
// method : 		TemplateDevServ::read_attr()
// 
// description : 	Extract real attribute values from
//					hardware acquisition result.
//
//-----------------------------------------------------------------------------
void TemplateDevServ::read_attr(Tango::Attribute &attr)
{
	string &attr_name = attr.get_name();

	DEBUG_STREAM << "In read_attr for attribute " << attr_name << endl;

	//	Switch on attribute name
	//---------------------------------
}

//--------	WRITE ATTRIBUTE -----------
//+----------------------------------------------------------------------------
//
// method : 		TemplateDevServ::write_attr_hardware()
// 
// description : 	Write attribute values to hardware.
//
//-----------------------------------------------------------------------------
void TemplateDevServ::write_attr_hardware(vector<long> &attr_list)
{
	DEBUG_STREAM << "In write_attr_hardware for " << attr_list.size();
	DEBUG_STREAM << " attribute(s)" << endl;

	for (long i=0 ; i < attr_list.size() ; i++)
	{
		Tango::WAttribute &att = dev_attr->get_w_attr_by_ind(attr_list[i]);
		string attr_name = att.get_name();

		DEBUG_STREAM << "Attribute name = " << attr_name;		

		//	Switch on attribute name
		//---------------------------------
	}
}

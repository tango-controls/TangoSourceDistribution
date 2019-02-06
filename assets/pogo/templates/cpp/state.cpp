/***********	DevState Overriding method	********************/

/**
 *	Read The device state.
 *	<Br>Command DevState
 *
 * @return the device state read.
 */
	virtual Tango_DevState state_cmd();

//+----------------------------------------------------------------------------
//
// method : 		TemplateDevServ::state_cmd()
//
// description : 	command to read the device state
//
// out :		device state
//
//-----------------------------------------------------------------------------
Tango_DevState TemplateDevServ::state_cmd()
{

	DEBUG_STREAM << "In TemplateDevServ state command" << std::endl;

	return dev_state;
}


/***********	DevStatus Overriding method	********************/

/**
 *	Read The device status.
 *	<Br>Command DevStatus
 *
 * @return A String containing the device state read.
 */
	virtual std::string &status_cmd();

//+----------------------------------------------------------------------------
//
// method : 		TemplateDevServ::status_cmd()
//
// description : 	command to read the device status
//
// out :		device status
//
//-----------------------------------------------------------------------------
std::string &TemplateDevServ::status_cmd()
{

	DEBUG_STREAM << "In TemplateDevServ status command" << std::endl;

	return dev_status;
}


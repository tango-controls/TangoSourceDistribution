
//=========================================================
/**
 *	Command to read the device state
 *
 *	@return the device state code.
 */
//=========================================================
	public DevState state_cmd()
	{

		get_logger().info("In TemplateDevServ state command");
	
		return dev_state;
	}

//=========================================================
/**
 *	Command to read the device status
 *
 *	@return the device state as String.
 */
//=========================================================
	public String status_cmd()
	{

		get_logger().info("In TemplateDevServ status command");
		return dev_status;
	}


//+=============================================================================
//
// file :         TemplateDevServ.cpp
//
// description :  C++ source for the TemplateDevServ and its commands.
//                The class is derived from Device. It represents the
//                CORBA servant object which will be accessed from the
//                network. All commands which can be executed on the
//                TemplateDevServ are implemented in this file.
//
// project :      TANGO Device Server
//
// copyleft :     European Synchrotron Radiation Facility
//                BP 220, Grenoble 38043
//                FRANCE
//
//-=============================================================================
//
//  		This file is generated by POGO
//	(Program Obviously used to Generate tango Object)
//
//         (c) - Software Engineering Group - ESRF
//=============================================================================



//===================================================================
//
//	The following table gives the correspondence
//	between command and method names.
//
//	Command name	|	Method name
//	----------------------------------------
//
//===================================================================


#include <tango.h>
#include <TemplateDevServ.h>
#include <TemplateDevServClass.h>

namespace TemplateDevServ_ns
{

//+----------------------------------------------------------------------------
//
// method : 		TemplateDevServ::TemplateDevServ(std::string &s)
//
// description : 	constructor for simulated TemplateDevServ
//
// in : - cl : Pointer to the DeviceClass object
//      - s : Device name
//
//-----------------------------------------------------------------------------
TemplateDevServ::TemplateDevServ(Tango::DeviceClass *cl,std::string &s)
:Tango::Device_4Impl(cl,s.c_str())
{
	init_device();
}

TemplateDevServ::TemplateDevServ(Tango::DeviceClass *cl,const char *s)
:Tango::Device_4Impl(cl,s)
{
	init_device();
}

TemplateDevServ::TemplateDevServ(Tango::DeviceClass *cl,const char *s,const char *d)
:Tango::Device_4Impl(cl,s,d)
{
	init_device();
}
//+----------------------------------------------------------------------------
//
// method : 		TemplateDevServ::delete_device()
//
// description : 	will be called at device destruction or at init command.
//
//-----------------------------------------------------------------------------
void TemplateDevServ::delete_device()
{
	//	Delete device allocated objects
}

//+----------------------------------------------------------------------------
//
// method : 		TemplateDevServ::init_device()
//
// description : 	will be called at device initialization.
//
//-----------------------------------------------------------------------------
void TemplateDevServ::init_device()
{
	INFO_STREAM << "TemplateDevServ::TemplateDevServ() create device " << device_name << std::endl;

	// Initialise variables to default values
	//--------------------------------------------
}

//+----------------------------------------------------------------------------
//
// method : 		TemplateDevServ::always_executed_hook()
//
// description : 	method always executed before any command is executed
//
//-----------------------------------------------------------------------------
void TemplateDevServ::always_executed_hook()
{

}

}	// namespace TemplateDevServ_ns

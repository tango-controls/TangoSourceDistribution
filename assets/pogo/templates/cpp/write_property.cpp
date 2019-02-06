//+----------------------------------------------------------------------------
//
// method : 		TemplateDevServClass::write_class_property
//
// description : 	Set class description as property in database
//
//-----------------------------------------------------------------------------
void TemplateDevServClass::write_class_property()
{
	//	First time, check if database used
	//--------------------------------------------
	if (Tango::Util::_UseDb == false)
		return;

	Tango::DbData	data;
	std::string	classname = get_name();
	std::string	header;
	std::string::size_type	start, end;

	//	Put title
	Tango::DbDatum	title("ProjectTitle");
	std::string	str_title(PogoProjectTitle);
	title << str_title;
	data.push_back(title);

	//	Put Description
	Tango::DbDatum	description("Description");
	PogoClassDescription;
	description << str_desc;
	data.push_back(description);

	//	put cvs or svn location
	std::string	filename(classname);
	filename += "Class.cpp";

	// Create a string with the class ID to
	// get the string into the binary
	std::string	class_id(ClassId);

	// check for cvs information
	std::string	src_path(CvsPath);
	start = src_path.find("/");
	if (start != std::string::npos)
	{
		end   = src_path.find(filename);
		if (end>start)
		{
			std::string	strloc = src_path.substr(start, end-start);
			//	Check if specific repository
			start = strloc.find("/cvsroot/");
			if (start != std::string::npos && start>0)
			{
				std::string	repository = strloc.substr(0, start);
				if (repository.find("/segfs/") != std::string::npos)
					strloc = "ESRF:" + strloc.substr(start, strloc.length()-start);
			}
			Tango::DbDatum	cvs_loc("cvs_location");
			cvs_loc << strloc;
			data.push_back(cvs_loc);
		}
	}
	// check for svn information
	else
	{
		std::string	src_path(SvnPath);
		start = src_path.find("://");
		if (start != std::string::npos)
		{
			end = src_path.find(filename);
			if (end>start)
			{
				header = "$HeadURL: ";
				start = header.length();
				std::string	strloc = src_path.substr(start, (end-start));

				Tango::DbDatum	svn_loc("svn_location");
				svn_loc << strloc;
				data.push_back(svn_loc);
			}
		}
	}

	//	Get CVS or SVN revision tag

	// CVS tag
	std::string	tagname(TagName);
	header = "$Name: ";
	start = header.length();
	std::string	endstr(" $");

	end   = tagname.find(endstr);
	if (end != std::string::npos && end>start)
	{
		std::string	strtag = tagname.substr(start, end-start);
		Tango::DbDatum	cvs_tag("cvs_tag");
		cvs_tag << strtag;
		data.push_back(cvs_tag);
	}

	// SVN tag
	std::string	svnpath(SvnPath);
	header = "$HeadURL: ";
	start = header.length();

	end   = svnpath.find(endstr);
	if (end != std::string::npos && end>start)
	{
		std::string	strloc = svnpath.substr(start, end-start);

		std::string tagstr ("/tags/");
		start = strloc.find(tagstr);
		if ( start != std::string::npos )
		{
			start = start + tagstr.length();
			end   = strloc.find(filename);
			std::string	strtag = strloc.substr(start, end-start-1);

			Tango::DbDatum	svn_tag("svn_tag");
			svn_tag << strtag;
			data.push_back(svn_tag);
		}
	}

	//	Get URL location
	std::string	httpServ(HttpServer);
	if (httpServ.length()>0)
	{
		Tango::DbDatum	db_doc_url("doc_url");
		db_doc_url << httpServ;
		data.push_back(db_doc_url);
	}

	//	Call database and and values
	//--------------------------------------------
	get_db_class()->put_property(data);
}

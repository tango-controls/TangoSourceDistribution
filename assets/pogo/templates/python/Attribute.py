#------------------------------------------------------------------
#	Read TemplAttr attribute
#------------------------------------------------------------------
	def read_TemplAttr(self, attr):
		print "In ", self.get_name(), "::read_TemplAttr()"
		
		#	Add your own code here
		
		attr.set_value(attr_TemplAttr_read)


#------------------------------------------------------------------
#	Write TemplAttr attribute
#------------------------------------------------------------------
	def write_TemplAttr(self, attr):
		print "In ", self.get_name(), "::write_TemplAttr()"
		data=[]
		attr.get_write_value(data)
		print "Attribute value = ", data

		#	Add your own code here



#---- TemplAttr attribute State Machine -----------------
	def is_TemplAttr_allowed(self, req_type):
			#	End of Generated Code
			#	Re-Start of Generated Code
		return True

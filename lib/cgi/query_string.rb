require 'cgi'
require 'cgi/query_string/version'

module CGI::QueryString #:nodoc:
	module_function

	# Serialize an array into a query string
	#
	# Ruby version of jQuerys param method
	#
	# * *Args*    :
	#   - +hash+ -> Hash to serialize
	# * *Returns* :
	#   - a query string
	#
	def param(a)
		s = []
		add = lambda { |k,v|
			s << "#{::CGI.escape(k.to_s)}=#{::CGI.escape(v.to_s)}"
		}

		if a.is_a?(Array)
			a.each { |v,i|
				self.build_params("", v)
			}
		elsif a.is_a?(Hash)
			a.each_pair { |prefix,v|
				build_params(prefix, v, add)
			}
		end

		s.join("&").gsub(/%20/, "+")
	end

	# Builds params
	#
	# Helper function
	#
	# * *Args*    :
	#   - +string+ -> Hash to serialize
	#   - +Hash+ -> Hash to serialize
	#   - +lambda+ -> Hash to serialize
	# * *Returns* :
	#   - false
	#
	def build_params(prefix, obj, add)
		if obj.is_a?(Array)
			obj.each { |v, i|
				if !(/\[\]$/.match(prefix).nil?)
					add.call(prefix, v)
				else
					build_params("#{prefix}[#{ ((v.is_a?(Array) || v.is_a?(Hash)) ? i : "") }]", v, add)
				end
			}
		elsif obj.is_a?(Hash)
			obj.each_pair { |name,o|
				build_params("#{prefix}[#{name}]", o, add)
			}
		else
			add.call(prefix, obj)
		end

		true
	end
end
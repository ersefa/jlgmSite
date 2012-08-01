module LangHelper
	ENGLISH_LANGUAGE_NAMES = {
  		'en' => 'English',
  		'es' => 'Spanish'
	}

	 CANONICAL_IDENTIFIER_MAPPING = {
		'en' => {
		  '/'                   => '/en/',
		  '/curriculum/'        => '/en/curriculum/',
		  '/about/'             => '/en/about/',
		  '/contact/'        	=> '/en/contact/'
		},
		'es' => {
		  '/'                   => '/es/',
		  '/curriculum/'        => '/es/curriculum/',
		  '/about/'             => '/es/acerca/',
		  '/contact/'        	=> '/es/contacto/'
		}
  	}

	FLAG_LANGUAGE_URL = {
		'en' => '/images/enFlag.png',
  		'es' => '/images/esFlag.png'
	}

	 # Returns the item_id attribute of the given item.
  	def canonical_identifier_of(item)
  		language_code   = language_code_of(item)
  		pure_identifier = item.identifier[/^\/[a-z]{2}(\/.*)/, 1]
        (CANONICAL_IDENTIFIER_MAPPING[language_code] || {}).invert[pure_identifier]
    end
	
	def language_code_of(item)
		# "/en/foo/" becomes "en"
		(item.identifier.match(/^\/([a-z]{2})\//) || [])[1]
 	end	

	def translations_of(item)
		@items.select do |i| 
    		i[:ci] == item[:ci]
  		end
	end

	def language_name_for_code(code)
  		ENGLISH_LANGUAGE_NAMES[code]
	end

	def language_name_of(item)
		language_name_for_code(language_code_of(item))
	end

	def get_flag_url(item)
		FLAG_LANGUAGE_URL[language_code_of(item)]
	end
	
end


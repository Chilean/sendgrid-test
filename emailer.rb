class Emailer
	def initialize
	end

	def send_login_email
		Mail.defaults do
		  delivery_method :smtp, { :address   => "smtp.sendgrid.net",
		                           :port      => 587,
		                           :domain    => "starfinder.com",
		                           :user_name => 'bierhog-sg',
		                           :password  => '4kj9$lsie#se2',
		                           :authentication => 'plain',
		                           :enable_starttls_auto => true }
		end
	end

	def generate_login_html
		items = "THISISATESTTHISISATEST"
		template_loc = File.expand_path("../template.html.erb",__FILE__)
		template = File.read(template_loc)
		list = CompanyList.new(items, template)
		list.render()
	end
end

class CompanyList
  attr_accessor :items

  def initialize(items, template)
    @items = items
    @template = template
  end

  def render()
    ERB.new(@template).result(binding)
  end
end
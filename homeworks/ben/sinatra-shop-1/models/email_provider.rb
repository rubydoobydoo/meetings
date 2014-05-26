class EmailProvider #< ActiveRecord::Base
  @@list = []
  #has_many :mail_accounts
  def initialize(hash)
    @name = hash[:name]
    @pop_server = hash[:pop_server]
    @port = hash[:port]
    @domains = hash[:domains]
    @@list.push self
  end

  def self.list
    @@list
  end

  def self.create_all_providers
    puts "Creating Providers..."
    gmx_domains = ['@gmx.de', '@gmx.net', '@gmx.at']
    gmx = {
      name:'GMX',
      pop_server: 'pop.gmx.de',
      port: 105,
      domains: gmx_domains,
    }
    gmx = EmailProvider.new(gmx)
    "#{self.list.count} Providers created."
    # hotmail_domains = ['@hotmail.com']
    # hotmail = EmailProvider.new('Hotmail', 'pop3.live.com', 995, hotmail_domains)

    # webde_domains = ['web.de']
    # webde = EmailProvider.create('Web.de', 'pop3.web.de', 995, webde_domains)
  end

end

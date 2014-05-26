#api.rb
get '/api' do
  #puts Time.now['%Y]
  if params["name"] == "ben"
    stream do |out|
      out << EmailProvider.create_all_providers
      #sleep 0.5
      out << MailAccount.create_email_accounts
      out << "yeah1"
      MailAccount.list.each do |mail_account|
        mail_account.possible_passwords do |pw|
          out << "yeah"
          out << mail_account.try_password(pw)

        end
      end

    end
  else
    not_found
  end
end


# Person.from_address nil
#
# Order matters here... saulhoward comes last cos they all have it somewhere
val = case [message.recipient_email, message.to, message.cc, message.from].flatten.to_s
      when /company.com/ then "Saul Howard <saul@company.com>"
      when /company.com/ then "Saul Howard <saul@company.com>"
      when /saulhoward/ then "Saul Howard <saul@saulhoward.com>"
      end
Person.from_address val

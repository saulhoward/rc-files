if header["To"] =~ /person|otherperson/
    header["From"] = "Saul Howard <saul@clearlinewebdesign.com>"
    header["Company"] = "Clear Line Web Design"
    header["X-URL"] = "http://clearlinewebdesign.com"
elsif header["To"] =~ /company/
    header["From"] = "Saul Howard <saul@company.com>"
else
    # header["X-URL"] = "http://saulhoward.com" #sticks this on all
end

# header["Bcc"] = header["From"]

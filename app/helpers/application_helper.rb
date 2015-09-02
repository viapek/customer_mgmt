module ApplicationHelper

  def error_messages_for(object)
    render(:partial => 'application/error_messages', :locals => {:object => object})
  end
  
  def formatphonenumber(string)
    formatphonenumber = string.byteslice(0,3) + '-' + string.byteslice(3,4) + '-' + string.byteslice(7,4)
    return formatphonenumber
  end

end

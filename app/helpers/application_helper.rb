module ApplicationHelper
  def define_request_color(status)
    case status
    when 'open'
      'bg-green-900'
    when 'closed'
      'bg-red-900'
    when 'cancelled'
      'bg-gray-900'
    when 'in_progress'
      'bg-yellow-900'
    end
  end

  def define_last_request_status(service_request)
    case service_request.status
    when 'open'
      return "Opened at #{service_request.created_at.strftime('%d/%m/%y - %H:%M')}" 
    when 'closed'
      return "Closed at #{service_request.updated_at.strftime('%d/%m/%y - %H:%M')}"
    when 'cancelled'
      return "Cancelled at #{service_request.updated_at.strftime('%d/%m/%y - %H:%M')}"
    when 'in_progress'
      return "In progress since #{service_request.updated_at.strftime('%d/%m/%y - %H:%M')}"
    end
  end
end

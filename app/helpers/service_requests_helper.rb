module ServiceRequestsHelper
  def is_tab_selected?(current_url)
    if request.path == current_url
      return 'text-blue-500 border-b-2 font-medium tab-selected'
    end
  end
end

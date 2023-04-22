class ApplicationController < ActionController::API

  def metadata(object)
    per_page = 15
    {
      current_page: object.current_page,
      total_entries: object.total_entries,
      total_pages: (object.total_entries / per_page.to_f).ceil,
      per_page: per_page
    }
  end
end

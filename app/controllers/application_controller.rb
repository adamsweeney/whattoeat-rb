class ApplicationController < ActionController::API

  def metadata(object)
    {
      current_page: object.current_page,
      total_entries: object.total_entries,
      per_page: 15
    }
  end
end

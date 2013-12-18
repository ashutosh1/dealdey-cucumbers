module SharedMethods

  def url_to_visit(req_url)
    data_for(:home)["url"] + data_for(req_url)["url"]
  end

  def path_to_visit(path)
    @browser.navigate.to(url_to_visit(path.to_sym))
  end
  
end
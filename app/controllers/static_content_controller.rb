class StaticContentController < Spree::BaseController

  def show
    path = case params[:path]
    when Array
      '/' + params[:path].join("/")
    when String
      params[:path]
    when nil
      request.path
    end

    unless @page = Page.visible.find_by_slug(path)
      render :file => "#{RAILS_ROOT}/public/404.html", :layout => false, :status => 404
    end
  end

  private

  def accurate_title
    @page ? @page.title : nil
  end
end


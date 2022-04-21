module ErrorHandling
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :notfound

    private

    # def notfound
    def notfound(exception)
      # render plain: exception
      # render plain: exception.inspect
      # return

      logger.warn exception
      # send_file 'public/404.html'
      # render file: 'public/404.html', status: :not_found, layout: true
      render file: 'public/404.html', status: :not_found, layout: false
    end
  end
end

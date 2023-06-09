module RackSessionsFix
  extend ActiveSupport::Concern

  class FakeRackSessions < Hash
    def enabled?
      false
    end
  end

  included do
    before_action :set_fake_rack_session_for_devise
    private
    def set_fake_rack_session_for_devise
      request.env['rack.session'] ||= FakeRackSessions.new
    end
  end

end

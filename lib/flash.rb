require 'json'

class Flash
  attr_reader :now

  def initialize(req)
    cookie = req.cookies['_rails_lite_app_flash']
    if cookie
      @now = JSON.parse(cookie)
    else
      @now = {}
    end
    @flash = {}

  end

  def [](key)
    require 'byebug'
    @now[key.to_s] || @flash[key.to_s]
  end

  def []=(key, val)
    @flash[key.to_s] = val
  end


  def store_flash(res)
    res.set_cookie('_rails_lite_app_flash', path: '/', value: @flash.to_json)
  end
end

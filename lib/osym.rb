# encoding: utf-8

class Osym
  # Most basic usage:
    # Osym.sorgula("username", "password", "id_number", "13", "2013", "S1")
  # Advanced usage:
    # Osym.sorgula(username = "username", password = "password", id_number = "id_number", exam_id = "13", exam_year = "2013", exam_period = "S1")
    # Osym.sorgula(username = "username", password = "password", id_number = "id_number", exam_id = "13", exam_year = "2013", exam_period = "S1", version = 1)

  def self.sorgula(username, password, id_number, exam_id, exam_year, exam_period, 
    version = 2, open_timeout = 60, read_timeout = 60, log = true,
    wsdl = "https://sonucservis.osym.gov.tr/service.asmx?WSDL")
    response = Request.new(username, password, id_number, exam_id, exam_year, exam_period, version, open_timeout, read_timeout, log, wsdl)
    response.sorgula
  end
end

require 'osym/request'
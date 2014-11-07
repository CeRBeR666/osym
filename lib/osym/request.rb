# encoding: utf-8

require 'savon'

class Request
  # Initialize params.
  def initialize(
    username, password,
    id_number, exam_id, exam_year, exam_period,
    version, open_timeout, read_timeout, log, wsdl
    )
    
    # Authentication params
    @username = username
    @password = password

    # Examination params
    @id_number = id_number
    @exam_id = exam_id
    @exam_year = exam_year
    @exam_period = exam_period

    # SOAP params
    @version = version
    @open_timeout = open_timeout
    @read_timeout = read_timeout
    @log = log
    @wsdl = wsdl
  end

  # Initialize the SOAP client
  def sorgula
    osym_client = Savon.client(
      wsdl: "https://sonucservis.osym.gov.tr/service.asmx?WSDL",
      soap_version: @version,
      open_timeout: @open_timeout,
      read_timeout: @read_timeout,
      log: @log,
      encoding: "UTF-8",
      soap_header: {
        "AuthenticationHeader" =>
          {
            "KullaniciAdi" => @username,
            "Sifre" => @password
          },
        :attributes! => {
          "AuthenticationHeader" =>
            {
              :xmlns => 'https://sonucservis.osym.gov.tr/'
          }
        }
      }
    )

  # Create message pattern
    message = {
      "SinavId" => @exam_id.to_s,
      "SinavYili" => @exam_year.to_s,
      "SinavDonemi" => @exam_period.to_s,
      "TcKimlikNo" => @id_number.to_s
    }

  # Make the SOAP request and handle errors.
    begin
      response = osym_client.call(:sonuc_getir, message: message)
    rescue Savon::SOAPFault => error
      puts "SOAP fault. Error: #{error}"
    rescue Savon::HTTPError => error
      puts "HTTP connection error. Error: #{error}"
    end

  # Get the SOAP response and handle errors.
    begin
      response_root = response.body[:sonuc_getir_response][:sonuc_getir_result]
      return response_root
    rescue NoMethodError => error
      response.nil? ? (puts "Errors occured. Response is nil! Error: #{error}") : (puts "There is an error with the response. Error: #{error}")
    rescue Savon::InvalidResponseError => error
      puts "Not a valid response! Error: #{error}"
    end
  end
end
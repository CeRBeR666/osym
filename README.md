# ÖSYM SOAP Client GEM

SOAP client GEM for ÖSYM services.

[![Gem Version](https://badge.fury.io/rb/osym.svg)](http://badge.fury.io/rb/osym)
[![Code Climate](https://codeclimate.com/github/msdundar/osym/badges/gpa.svg)](https://codeclimate.com/github/msdundar/osym)

## Setup

```
$ gem install 'osym'
```

## Usage Examples

```ruby
require 'osym'

# Most basic usage:
sonuc = Osym.sorgula("username", "password", "id_number", "13", "2013", "S1")

# With parameter names (required only):
sonuc = Osym.sorgula(username = "username", password = "password", id_number = "id_number", exam_id = "13", exam_year = "2013", exam_period = "S1")

# With parameter names (required + extras):
sonuc = Osym.sorgula(username = "username", password = "password", id_number = "id_number", exam_id = "13", exam_year = "2013", exam_period = "S1", version = 1)

# With all parameters:
sonuc = Osym.sorgula(username = "username", password = "password", id_number = "id_number", exam_id = "13", exam_year = "2013", exam_period = "S1", version = 1, open_timeout = 60, read_timeout = 60, log = false, wsdl = "https://somecustomwsdl.com")
```

## Parameters

```ruby
sonuc = Osym.sorgula(
          username = "username",   # username
          password = "password",   # password
          id_number = "id_number", # identity number
          exam_id = "13",          # id of exam
          exam_year = "2013",      # year of exam
          exam_period = "S1",      # periof of exam. S1 for fall, S2 for spring
          version = 1,             # soap version. should be 1 or 2.
          open_timeout = 60,       # timeout duration until SOAP server opens the connection. in seconds.
          read_timeout = 60,       # timeout duration until SOAP server returns response. in seconds.
          log = false,             # logging. true or false.
          wsdl = "https://somecustomwsdl.com" # wsdl uri
        )
```

## Response

Returning response would be smilar to this:

```xml
<SonucGetirResult>
  <SinavId>string</SinavId>
  <SonucId>string</SonucId>
  <SinavAdi>string</SinavAdi>
  <TcKimlikNo>string</TcKimlikNo>
  <SinavYili>string</SinavYili>
  <SinavDonemi>string</SinavDonemi>
  <AktifMi>int</AktifMi>
  <durum>int</durum>
  <BankaOdemesiDurum>int</BankaOdemesiDurum>
  <SonucAciklamaTarihi>dateTime</SonucAciklamaTarihi>
  <XMLData>string</XMLData>
</SonucGetirResult>
```

XMLData field holds all the result and percentile datas of the student as string. XMLData string can be parsed with Nokogiri or with any other similar tools.

```ruby
doc = Nokogiri::XML method[:xml_data]
doc.encoding = 'utf-8'
puts doc.to_xml
```

## Exam IDS

| exam_id |      exam      |
| ------- | -------------- |
|    1    |      ALS       |
|    2    |      TUS       |
|    3    |      ÖSS       |
|    4    |      ÖSYS      |
|    5    |      LES       |
|    6    |      KPSS      |
|    7    |     JANDARMA   |
|    8    |      DGS       |
|    9    | DİĞER SINAVLAR |
|    10   |      ÜDS       |
|    11   |      KPDS      |
|    13   |      ALES      |
|    14   |      LYS       |
|    15   |      YDS       |


## Questions

```
msdundars@gmail.com
```
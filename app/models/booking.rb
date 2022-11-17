class Booking
  include Mongoid::Document
  include Mongoid::Timestamps

  has_one :log

  field :picap_id, type: String
  field :reference, type: String

  def self.get_booking(id)
    response = RestClient.get("https://sandbox.picap.co/api/third/bookings/#{id}?t=#{ENV["PICAP_TOKEN"]}")
    JSON.parse(response)
  end

  def self.cancel_booking(id)
    response = RestClient.patch("https://sandbox.picap.co/api/third/bookings/#{id}/cancel?t=#{ENV["PICAP_TOKEN"]}", nil)
    JSON.parse(response)
  end

  def self.get_bookings
    data = []
    current_page = 1
    response = RestClient.get("https://sandbox.picap.co/api/third/bookings?t=#{ENV["PICAP_TOKEN"]}")
    response_json = JSON.parse(response)

    while current_page <= response_json['pages']
      request = RestClient.get("https://sandbox.picap.co/api/third/bookings?page=#{current_page}&t=#{ENV["PICAP_TOKEN"]}")
      hash = JSON.parse(request)
      hash['data'].each do |item|
        data.push(item)
      end
      current_page += 1
    end

    data
  end

  def self.create_booking(options)
    body = {
      booking: {
        address: options[:address_1],
        secondary_address: 'Diagonal a la panadería',
        lat: options[:lat_1],
        lon: options[:lon_1],
        sender_phone: '3111234009',
        sender_country_code: '57',
        client_identification: '5a957e248af945001fbe678b',
        requested_service_type_id: '5c71b03a58b9ba10fa6393cf',
        return_to_origin: false,
        requires_a_driver_with_base_money: false,
        scheduled_at: nil,
        cost_center: nil,
        stops:[
          {
            address: options[:address_2],
            secondary_address: 'Diagonal al centro comercial',
            lat: options[:lat_2],
            lon: options[:lon_2],
            customer: {
              name: 'Cliente',
              country_code: '57',
              phone: '30112345678',
              email: 'docs@picap.co',
              fiscal_number: '123456789'
            },
            packages:[
              {
                indications: 'Indicaciones',
                declared_value: {
                  sub_units: 210000,
                  currency: 'COP'
                },
                reference: 'Pedido 1',
                counter_delivery: false,
                size_cd: 1
              }
            ]
          }
        ]
      }
    }

    response = RestClient.post("https://sandbox.picap.co/api/third/bookings?t=#{ENV["PICAP_TOKEN"]}", body)
    JSON.parse(response)
  end
end

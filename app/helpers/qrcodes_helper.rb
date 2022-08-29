module QrcodesHelper
  require 'chunky_png'

  def qrcode_tag(content, options = {})
    qr = ::RQRCode::QRCode.new(content, options)
    return ChunkyPNG::Image.from_datastream(qr.as_png.resize(500,500).to_datastream).to_data_url
  end
end

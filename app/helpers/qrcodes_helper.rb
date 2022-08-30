module QrcodesHelper
  require 'chunky_png'

  def qrcode_tag(content, options = {})
    qr = ::RQRCode::QRCode.new(content)
    return ChunkyPNG::Image.from_datastream(qr.as_png(border_modules: 4).resize(300,300).to_datastream).to_data_url
  end
end

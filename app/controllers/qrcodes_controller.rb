class QrcodesController < ApplicationController
  require 'rqrcode'
  require 'rqrcode_png'
  require 'chunky_png'

  def show
    content = "https://welcome-quiz-maker.herokuapp.com/users/#{current_user.id}/quizzes"
    size = 9     # 1..40
    level = :h   # l, m, q, h

    qrcode = RQRCode::QRCode.new(content, size: size, level: level)

    # NOTE: showing with default options specified explicitly
    @png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white",
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 120
    )

    # IO.binwrite("/tmp/welcome-quiz-qrcode.png", @png.to_s)
  end
end

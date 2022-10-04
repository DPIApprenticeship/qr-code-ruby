require "rqrcode"

while true
  p "What would you like to generate a qr code for (choose a number)?"
  p "1. Web address"
  p "2. SMS Message"
  p "3. WiFi Network"
  p "4. Exit the program"

  user_choice = gets.chomp
  choice_num = user_choice.to_i

  case choice_num
    when 1
      p "Please enter the web address"
      web_address = gets.chomp
      qr_code = RQRCode::QRCode.new("#{web_address}")
    when 2
      p "Enter the recipient's number:"
      phone_num = gets.chomp

      p "What message would you like to send?"
      message = gets.chomp
      qr_code = RQRCode::QRCode.new("SMSTO: #{phone_num}: #{message}")
    when 3
      p "What is the network's name?"
      network_name = gets.chomp
      p "What is the network's password?"
      network_password = gets.chomp
      qr_code = RQRCode::QRCode.new("WIFI:T:WPA;S:#{network_name};P:#{network_password};;")
    when 4
      break
    else
      p "You did not enter a valid choice"
  end

  if qr_code
    p "What would you like to call your qr code?"
    qr_code_name = gets.chomp
    png = qr_code.as_png({ :size => 500 })
    IO.binwrite("#{qr_code_name}.png", png.to_s)
  end
end




# qrcode = RQRCode::QRCode.new("https://en.wikipedia.org/wiki/QR_code")
# qrcode = RQRCode::QRCode.new("SMSTO: (555) 555-555: Hi Alice! It's")
# png = qrcode.as_png({ :size => 500})

# IO.binwrite("sometext.png", png.to_s)

require "rqrcode"

while true
  puts "What would you like to generate a qr code for (choose a number)?"
  puts "1. Web address"
  puts "2. SMS Message"
  puts "3. WiFi Network"
  puts "4. Exit the program"

  user_choice = gets.chomp
  choice_num = user_choice.to_i

  case choice_num
    when 1
      puts "Please enter the web address"
      web_address = gets.chomp
      qr_code = RQRCode::QRCode.new("#{web_address}")
    when 2
      puts "Enter the recipient's number:"
      phone_num = gets.chomp

      puts "What message would you like to send?"
      message = gets.chomp
      qr_code = RQRCode::QRCode.new("SMSTO: #{phone_num}: #{message}")
    when 3
      puts "What is the network's name?"
      network_name = gets.chomp
      puts "What is the network's password?"
      network_password = gets.chomp
      qr_code = RQRCode::QRCode.new("WIFI:T:WPA;S:#{network_name};P:#{network_password};;")
    when 4
      break
    else
      puts "You did not enter a valid choice"
  end

  if qr_code
    puts "What would you like to call your qr code?"
    qr_code_name = gets.chomp
    png = qr_code.as_png({ :size => 500 })
    IO.binwrite("#{qr_code_name}.png", png.to_s)
  end
end




# qrcode = RQRCode::QRCode.new("https://en.wikipedia.org/wiki/QR_code")
# qrcode = RQRCode::QRCode.new("SMSTO: (555) 555-555: Hi Alice! It's")
# png = qrcode.as_png({ :size => 500})

# IO.binwrite("sometext.png", png.to_s)

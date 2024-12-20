require 'telegram/bot'
require 'concurrent'

puts "Bot Started...."
token = "6456252632:AAErhNJQEZsoKkeXCwvupe88pxILtTEX-n0"


while true
  begin
    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        Concurrent::Promise.execute do
          case message
          when Telegram::Bot::Types::Message
            case message.text 
            when 'start'
              bot.api.send_message(chat_id: message.chat.id, text: "helpp")
            when '/st'
              #(2938..109372).each do |i| 
              thr_1 = ""
              thr_2 = ""
              thr_3 = ""
                begin
                  Thread.new do
                    (51652..73670).each do |i|
                      thr_2 = i
                      begin
                        bot.api.copy_message(
                          chat_id: -1001851170828,
                          from_chat_id: -1001611693204,
                          message_id: i
                        )
                        sleep 5
                      rescue Telegram::Bot::Exceptions::ResponseError => e
                        case e.error_code
                        when '429'
                          sleep_time = e.parameters['retry_after'].to_i + 1
                          puts "Rate limited. Retrying after #{sleep_time} seconds..."
                          sleep sleep_time
                          retry # Retry the same message ID after sleeping
                        when '400'
                          if e.message.include?('Bad Request: message to forward not found')
                            puts "Message ID #{i} not found. Skipping..."
                          else
                            puts "Unexpected 400 error for message ID #{i}: #{e.message}"
                          end
                        else
                          puts "Telegram API error for message ID #{i}: #{e.message}"
                        end
                      rescue StandardError => e
                        puts "Unexpected error for message ID #{i}: #{e.message}"
                      end
                    end
                  end
                  # 3309..36526
                  Thread.new do
                    (17957..36526).each do |i|
                      thr_1 = i
                      begin
                        bot.api.copy_message(
                          chat_id: -1001851170828,
                          from_chat_id: -1001611693204,
                          message_id: i
                        )
                        sleep 5
                      rescue Telegram::Bot::Exceptions::ResponseError => e
                        case e.error_code
                        when '429'
                          sleep_time = e.parameters['retry_after'].to_i + 1
                          puts "Rate limited. Retrying after #{sleep_time} seconds..."
                          sleep sleep_time
                          retry # Retry the same message ID after sleeping
                        when '400'
                          if e.message.include?('Bad Request: message to forward not found')
                            puts "Message ID #{i} not found. Skipping..."
                          else
                            puts "Unexpected 400 error for message ID #{i}: #{e.message}"
                          end
                        else
                          puts "Telegram API error for message ID #{i}: #{e.message}"
                        end
                      rescue StandardError => e
                        puts "Unexpected error for message ID #{i}: #{e.message}"
                      end
                    end
                  end
                
                  Thread.new do
                    (86174..109372).each do |i|
                      thr_3 = i
                      begin
                        bot.api.copy_message(
                          chat_id: -1001851170828,
                          from_chat_id: -1001611693204,
                          message_id: i
                        )
                        sleep 5
                      rescue Telegram::Bot::Exceptions::ResponseError => e
                        case e.error_code
                        when '429'
                          sleep_time = e.parameters['retry_after'].to_i + 1
                          puts "Rate limited. Retrying after #{sleep_time} seconds..."
                          sleep sleep_time
                          retry # Retry the same message ID after sleeping
                        when '400'
                          if e.message.include?('Bad Request: message to forward not found')
                            puts "Message ID #{i} not found. Skipping..."
                          else
                            puts "Unexpected 400 error for message ID #{i}: #{e.message}"
                          end
                        else
                          puts "Telegram API error for message ID #{i}: #{e.message}"
                        end
                      rescue StandardError => e
                        puts "Unexpected error for message ID #{i}: #{e.message}"
                      end
                    end
                  end
                
                  Thread.new do
                    begin
                      last_content = ""
                      loop do
                        # Generate the new content
                        new_content = "#{thr_1}\n#{thr_2}\n#{thr_3}"
                  
                        # Update the message only if the content has changed
                        if new_content != last_content
                          bot.api.edit_message_text(
                            chat_id: -1001779636714,
                            message_id: 4173,
                            text: "📊 <b>Forwarding Stats</b>\n<blockquote><b>Phase 1 :- </b>#{thr_1}/36526 files added\n<b>Phase 2 :-</b> #{thr_2}/73670 files added\n<b>Phase 3 :- </b>#{thr_3}/109372 files added</blockquote>\n<blockquote><b>Total number of files added :-</b> #{(thr_1.to_i).to_i + (thr_2.to_i-36526).to_i + (thr_3.to_i-73670).to_i} files</blockquote>",
                            parse_mode: 'HTML'
                          )
                          last_content = new_content # Update the last_content variable
                        else
                          # puts "No changes to the message content, skipping update."
                        end
                  
                        sleep 5
                      end
                    rescue Telegram::Bot::Exceptions::ResponseError => e
                      puts "Telegram API error: #{e.message}"
                      retry # Retry the loop if there's an error
                    rescue StandardError => e
                      puts "Unexpected error: #{e.message}"
                    end
                  end
                  
                rescue StandardError => e
                    puts e
                rescue Telegram::Bot::Exceptions::ResponseError => e
                  if e.error_code == '429'
                    sleep_time = e.parameters['retry_after'].to_i + 1
                    puts "Rate limited. Retrying after #{sleep_time} seconds..."
                    sleep sleep_time
                    retry
                  end
                end
              
            end
          when Telegram::Bot::Types::CallbackQuery
          when Telegram::Bot::Types::InlineQuery
          end
        rescue Telegram::Bot::Exceptions::ResponseError => e
          if e.error_code == '429'
            sleep_time = e.parameters['retry_after'].to_i + 1
            puts "Rate limited. Retrying after #{sleep_time} seconds..."
            sleep sleep_time
            retry
          elsif e.error_code == '502'
            puts "Bad Gateway. Telegram API returned an error: #{e.message}"
            sleep 5
            retry
          else
            puts "An unexpected error occurred: #{e.message}"
          end
        rescue StandardError => e
          bot.api.send_message(chat_id: owner_id, text: "<blockquote>#{e.message}\n#{message.chat.id}</blockquote>\nError occured. Please try report this error in the support group!", parse_mode: 'HTML')
        end
      end
    rescue Telegram::Bot::Exceptions::ResponseError => e
      if e.error_code == '429'
        sleep_time = e.parameters['retry_after'].to_i + 1
        puts "Rate limited. Retrying after #{sleep_time} seconds..."
        sleep sleep_time
        retry
        bot.api.send_message(chat_id: owner_id, text: "Rate Limited for #{sleep_time}")
      elsif e.error_code == '502'
        puts "Bad Gateway. Telegram API returned an error: #{e.message}"
        sleep 5
        retry
      elsif e.message.include?('Missing attribute: "result"')
      else
        puts "An unexpected error occurred: #{e.message}"
      end
    rescue StandardError => e
    end
  rescue StandardError => e
    puts "An unexpected error occurred: #{e.message}"
  end
end

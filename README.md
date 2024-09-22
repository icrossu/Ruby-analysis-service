 # Code Explanation
   
   ### 1. Libraries
   
  ## 1.1 Sockets
  
The code was written entirely in pure Ruby, designed to perform analysis and port scanning of a URL or IP. The scheme behind this tool consists of using the 'Sockets' library found in most programming languages.

require 'socket'  # (import socket library)

   ### 1.3 Optparse
The 'Optparse' library is used to add options to the code, making it executable from the terminal where the code is run. The purpose of this library in the code is to optimize and enhance usability. For instance, options like '-p, -t, -h' provide specific functionality to the code, such as adding ports and specific paths for port scanning.

require 'optparse'  # (import optparse library)

### 2.0 Logic

The logic of the code consists of data input, which was declared in the 'input_data' function as 'target' and 'service'.

<pre><code class="has-line-data" data-line-start="21" data-line-end="28" class="language-ruby">
def input_data
  print("Input target URL or IP: ")
  target = gets.chomp
  print("Input target service (if you have a question about service -h): ")
  service = gets.chomp
  return target, service
end
</code></pre>

With this information, we can move on to the next step.

<pre><code class="has-line-data" data-line-start="33" data-line-end="44" class="language-ruby">
def socket_analysis(target, service) # A partir do input, vamos para a próxima função, onde definimos um novo socket do tipo 'IPV4' e 'TCP'. 
  begin
    remote_info = Socket.getaddrinfo(target, service) 

    remote_info.each do |addr|
      puts "Family: #{addr[0]}, Type: #{addr[1]}, Protocol: #{addr[2]}, Address: #{addr[3]}"
    end
  rescue SocketError => e
    puts "Error: #{e.message}"  
  end
end
</code></pre>

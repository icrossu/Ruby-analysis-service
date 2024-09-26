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
def socket_analysis(target, service) 
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

In the next step, we can visualize the socket_analysis function where we will get the target and the service we want to analyze.

After that, we create a begin rescue block with the remote information variable, which will connect and retrieve information from the path and the service. We will start a loop with each do that will iterate over a data structure array and will fetch each respective piece of information from within the data structure. The code terminates upon the occurrence of an error.

### Argument Parsing:

   Utilizes the OptionParser library to handle command-line arguments for specifying the target and services to scan.

### Target Validation:

   Checks if a target is specified. If not, it prints a message and exits the program.

### Service Validation:

   Checks if services are provided. If not, defaults to a predefined list of common ports.

### Input Data Function:

   input_data function prompts the user for a target URL or IP and the target service. It returns the inputs for further processing.

### Socket Analysis Function:

   Begin Block: Starts a begin block for error handling during socket operations.

   Remote Information Retrieval:
        Socket.getaddrinfo(target, service) retrieves address information for the specified target and service.

   Iteration Over Address Information:
        Uses each do to loop through each address returned by getaddrinfo. For each address:            
        Output Information: Prints the family, type, protocol, and address of each socket address.

### Exception Handling:

  Catches SocketError to handle issues like invalid target or network errors. If an error occurs, it prints an error message.

### Main Execution Loop:

  Loops over the provided services, calling the socket_analysis function for each service, which handles the connection attempts and outputs results.

### Completion Message:

  The script completes execution, having attempted to analyze each specified service against the target.

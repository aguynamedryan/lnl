require 'uri'
splain_commands = exec_commands = false
$stdin.readlines.each do |line|
  if line =~ /^```demo$/
    exec_commands = true
  elsif line =~ /^```bash$/
    splain_commands = true
  elsif line =~ /^```$/
    puts line unless exec_commands || splain_commands
    splain_commands = exec_commands = false
  elsif splain_commands || exec_commands
    command = line.chomp
    puts "```bash"
    puts "$> #{command}"
    puts "```"
    if exec_commands
      output = `#{command}`
      puts "```bash"
      puts output
      puts "```"
    end
    explain_url = URI::HTTP.build(host: "explainshell.com", path: "/explain", query: URI.encode_www_form(cmd: command))
    puts %Q|<a href="#{explain_url}" target=_blank>'splain!</a>|
  else
    puts line
  end
end


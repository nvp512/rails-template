environments = %w(
  REDIS_URL
)

environments.select! do |key|
  ENV[key].nil?
end

unless environments.empty?
  puts "====================== WARNING ======================"
  puts "  please check below config in config/application.yml"
  puts ""
  environments.each do |key| puts "  #{key}" end
  puts "====================================================="
  raise "Config Missing"
end

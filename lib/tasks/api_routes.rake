# desc 'API Routes'

# task api_routes: :environment do
#   API::V1::Base.routes.each do |api|
#     method = api.route_method.ljust(10)
#     path = api.route_path
#     puts "     #{method} #{path}"
#   end
# end

desc 'Print out routes'

# EMY     = "\033[1;33m"
# EMC     = "\033[1;36m"
# EMW     = "\033[1;37m"
# NOCOLOR = "\033[0m"

task api_routes: :environment do
  API::V1::Base.routes.each do |route|
    info = route.instance_variable_get :@options
    description = EMW + "#{info[:description][0..39]}".rjust(40) + NOCOLOR
    method = EMC + "#{info[:method]}".center(6) + NOCOLOR
    path = EMR + "#{info[:path]}".ljust(30) + NOCOLOR
    params = EMB + "#{info[:settings][:declared_params].to_s}" + NOCOLOR

    puts "#{description}  | #{method} |  #{path}  |  #{params}"
  end
end

require_relative '/home/klenetev/work/rb_project/institute/data_base/services/cli_service'
require_relative '/home/klenetev/work/rb_project/institute/data_base/routers/router'

while true
  result = CliService.run_request

  puts "информация передана в роутер \n\n"
  Router.run_router(result)
end

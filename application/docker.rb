#
#   Author: Tom Llewellyn-Smith <tom@onixconsulting.co.uk>
#   Copyright: © Onix Consulting Limited 2012-2014. All rights reserved.
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
module MCollective
  class Application
    class Docker<MCollective::Application
        option :options,
        :description    => "docker cli options",
        :arguments      => ["--options OPTIONS", "-o OPTIONS"]

        def post_option_parser(configuration)
        configuration[:command] = ARGV.shift if ARGV.size > 0
        end

        def main
        docker = rpcclient("docker")
        unless configuration[:options].nil? then
            resp = docker.send("#{configuration[:command]}", :options => "#{configuration[:options]}")
        else
            resp = docker.send("#{configuration[:command]}")
        end
        resp.each do |result|
            if result[:data][:status] > 0 then
                # there was an error, exit with non 1 exit status
                puts result[:data][:err]
                puts result[:data][:out]
                exit 1
            else
                puts "host: #{result[:sender]}"
                result[:data][:out].each do |line|
                    puts line
                end
            end
        end
        printrpcstats :summarize => true, :caption => "%s results" % configuration[:command]
      end
    end
  end
end

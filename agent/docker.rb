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

# load our Util class
MCollective::Util.loadclass("MCollective::Util::Docker")

module MCollective
    module Agent
        class Docker<RPC::Agent
            [
                "history",
                "images",
                "info",
                "inspect",
                "login",
                "pause",
                "ps",
                "pull",
                "restart",
                "rm",
                "run",
                "start",
                "stop",
                "top",
                "version"
            ].each do |command|
                action command do
                    begin
                        # some basic input sanitisation to avoid chaining of bash commands.
                        unless request[:options].nil? then
                            request[:options].gsub!(/(.*)?(?:;|&&).*/, '\1;')
                        end
                        reply[:status] = run("docker #{command} #{request[:options]}", :stdout => :out, :stderr => :err, :chomp => true)
                    rescue => error
                        reply.fail! "error: #{error}"
                    end
                end
            end
        end
    end
end

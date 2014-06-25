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
metadata    :name        => "Docker Mcollective Agent",
            :description => "control docker via Mcollective",
            :author      => "Tom Llewellyn-Smith",
            :license     => "GPLv3",
            :version     => "0.1",
            :url         => "https://github.com/brahman81/mco-docker",
            :timeout     => 60

["history", "images", "info", "ps", "pull"].each do |command|
    action command, :description => "docker #{command}" do
        display :always  # supported in 0.4.7 and newer only

        input   :options,
                :prompt      => "docker cli options",
                :description => "optional command line options, see docker help #{command}",
                :type        => :string,
                :validation  => ".",
                :optional    => true,
                :maxlength   => 0, # no limit use with caution
                :default     => ""

        output  :reply,
                :description => "command output",
                :display_as  => "command output",
                :default     => "n/a"
    end
end

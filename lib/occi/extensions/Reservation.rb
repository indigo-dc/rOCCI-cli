##############################################################################
#  Copyright 2011 Service Computing group, TU Dortmund
#  
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#  
#      http://www.apache.org/licenses/LICENSE-2.0
#  
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
##############################################################################

##############################################################################
# Description: Implementation specific Mixin to support reservation
# Author(s): Hayati Bice, Florian Feldhaus, Piotr Kasprzak
##############################################################################

require 'singleton'

require 'occi/core/Mixin'

module OCCI
  module Mixins
    class Reservation < OCCI::Core::Mixin

      include Singleton

      @@reservation = nil

      def initialize(term, scheme, title, attributes, actions, related, entities)
        super(term, scheme, title, attributes, actions, related, entities)
      end

      # Define appropriate mixin
      begin
        actions = []
          
        related = []
        entities = []

        term = "reservation"
        scheme = "http://schemas.ogf.org/occi/#"
        title = "Reservation"

        attributes = OCCI::Core::Attributes.new()
        attributes << OCCI::Core::Attribute.new(name = 'occi.reservation.start',        mutable = false, required = true,  type = "string", range = "", default = "")
        attributes << OCCI::Core::Attribute.new(name = 'occi.reservation.duration',     mutable = false, required = true,  type = "string", range = "", default = "")
        attributes << OCCI::Core::Attribute.new(name = 'occi.reservation.preemptible',  mutable = false, required = false,  type = "string", range = "", default = "")

        MIXIN = OCCI::Core::Mixin.new(term, scheme, title, attributes, actions, related, entities)
      end
    end
  end
end
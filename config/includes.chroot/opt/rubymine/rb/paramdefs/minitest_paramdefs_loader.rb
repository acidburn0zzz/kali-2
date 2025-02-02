#
# Copyright 2000-2009 JetBrains s.r.o.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include Java

require File.dirname(__FILE__) + '/paramdefs_loader_base'
require File.dirname(__FILE__) + '/rails/paramdefs_helper'

class MiniTestParamDefsLoader < BaseParamDefsLoader
  import org.jetbrains.plugins.ruby.ruby.codeInsight.paramDefs.ParamDefProvider unless defined? ParamDefProvider

  include RailsParamDefsHelper
  include ParamDefProvider

  def registerParamDefs(manager)
    @manager = manager

    # define/context
    # rspec 2.0
    paramdef 'Module', "infect_an_assertion",
             method_ref("Object", Visibility::PUBLIC, :module => "MiniTest::Assertions"),
             nil,
             either(bool, one_of(:reverse))
  end
end
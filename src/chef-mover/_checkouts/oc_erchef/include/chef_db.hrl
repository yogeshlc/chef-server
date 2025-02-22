%% Copyright Chef Software, Inc. All Rights Reserved.
%%
%% This file is provided to you under the Apache License,
%% Version 2.0 (the "License"); you may not use this file
%% except in compliance with the License.  You may obtain
%% a copy of the License at
%%
%%   http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing,
%% software distributed under the License is distributed on an
%% "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
%% KIND, either express or implied.  See the License for the
%% specific language governing permissions and limitations
%% under the License.
%%

-record(chef_db_cb_version_delete, {
          'cookbook_delete' :: boolean() | undefined,
          'deleted_checksums' :: [ Checksum::binary()] | undefined
         }).

-record(chef_db_cb_version_update, {
          'deleted_checksums' :: [ Checksum::binary()] | undefined,
          'added_checksums' :: [ Checksum::binary()] | undefined
         }).

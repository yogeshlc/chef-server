name "server-complete"

skip_transitive_dependency_licensing true

license :project_license

# global

# libiconv (unicode character conversion library) was originally
# a dependency declared in several components out of omnibus-software.
# It was recently removed (2017Q1) from most of these components as a dep, and
# build flags were updated to not link it into the components.
#
# This led to chef-server no longer pulling it indirectly. This broke popt, which
# is defined upstream and pulled in by logrotate.
#
# TODO mp 2017-04-06 - a little further digging to see if the right answer is to
#                      conditionally add the dependency for popt on s390x.

dependency "libiconv"

dependency "private-chef-scripts" # assorted scripts used by installed instance

dependency "openresty" # load balanacer
dependency "rb-readline" # a replacement for readline due to
dependency "redis-gem" # gem for interacting with redis
dependency "openresty-lpeg"  # lua-based routing
dependency "runit"
dependency "openssl-fips-config" if fips_mode?

# the backend
dependency "postgresql96-bin" # for upgrading 9.6 -> 13.3
dependency "postgresql13"
dependency "redis" # dynamic routing controls
dependency "haproxy"
dependency "elasticsearch" # used by search

# moved earlier because it is external to this repo and pinned, so should change infrequently
dependency "chef" # for embedded chef-client -z runs (built from master - build last)

dependency "private-chef-ctl" # additional project-specific private-chef-ctl subcommands

# download the gpg-key beforehand for rhel systems to
# use when verifying add ons
dependency "gpg-key"

dependency "bookshelf"

# the front-end services
dependency "oc_bifrost"
dependency "oc_id"

# log management
dependency "logrotate"

# partybus and upgrade scripts
dependency "partybus"

# most frequently changed dependencies
# by placing these deps at the end of the build, we can take
# advantage of the git caching and increase build times
# for situations where we're changing these components.
# These are roughly sorted by build time and change frequency,
# with the quickest builds coming last.
dependency "opscode-chef-mover"
dependency "oc_erchef"
dependency "oc-chef-pedant"
dependency "private-chef-upgrades"
dependency "private-chef-cookbooks"

# ruby cleanup that's specific to how oc-id is installed in server
dependency "more-ruby-cleanup-server"

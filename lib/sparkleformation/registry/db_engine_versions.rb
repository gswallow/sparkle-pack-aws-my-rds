require 'aws-sdk-core'

db_engine_versions = ::Array.new
rds = ::Aws::RDS::Client.new

db_engine_versions = rds.describe_db_engine_versions.db_engine_versions

SfnRegistry.register(:engine_versions) do |filter = nil|
  case filter
  when *db_engine_versions.collect(&:engine).uniq
    db_engine_versions.collect { |v| v.engine_version if v.engine == filter }.compact
  else
    no_value!
  end
end

SfnRegistry.register(:latest_engine_version) do |filter = nil|
  case filter
  when *db_engine_versions.collect(&:engine).uniq
    db_engine_versions.collect { |v| v.engine_version if v.engine == filter }.compact.sort.last
  else
    no_value!
  end
end

SfnRegistry.register(:parameter_group_families) do |filter = nil|
  case filter
  when *db_engine_versions.collect(&:engine).uniq
    db_engine_versions.collect { |v| v.db_parameter_group_family if v.engine == filter }.compact.uniq.sort
  else
    no_value!
  end
end

SparkleFormation.dynamic(:raise_max_connections) do |_name, _config={}|

  parameters("#{_name}_engine_family".to_sym) do
    type 'String'
    allowed_pattern "[\\x20-\\x7E]*"
    allowed_values registry!(:parameter_group_families, _config.fetch(:engine, nil))
  end

  dynamic!(:r_d_s_d_b_parameter_group, _name).properties do
    description 'Raise max connections'
    family ref!("#{_name}_engine_family".to_sym)
    parameters do
      set!('max_connections'.disable_camel!, "GREATEST({DBInstanceClassMemory/31457280},#{_config.fetch(:max, 100)})")
    end
  end
end

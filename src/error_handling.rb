def name_error(name)
    raise ArgumentError, "Name must not be empty" if name == nil
    name = name.strip
    raise ArgumentError, "Name must not be empty" if name.empty?
end


class BorrowerSerializer
    include FastJsonapi::ObjectSerializer

    attributes(
        :name
    )
end
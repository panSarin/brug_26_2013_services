class ProductsController < AuthenticationController
  autocomplete :product, :name, :full => false
end

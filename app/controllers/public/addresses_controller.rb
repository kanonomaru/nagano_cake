class Public::AddressesController < ApplicationController
  def index
    @addresses = Addresses.new
  end
end

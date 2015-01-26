class DemosController < ApplicationController
  def index
    @doc = Docx::Document.open('Example.docx')
  end
end

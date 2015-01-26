class DocumentsController < ApplicationController
  require 'docx'
  require 'msworddoc-extractor'
  def index
    @resumes = Resume.all
    # @doc = Docx::Document.open('Doc.docx')
  #   @doc.paragraphs.each do |p|
  #   puts p.to_html
  # end

  # @doc.bookmarks.each_pair do |bookmark_name, bookmark_object|
  # puts bookmark_name
# end
  end

  def show
    @r = Resume.find(params[:id])
    @doc = Docx::Document.open('Example.docx')
    # @doc = Docx::Document.open('Example.docx')

  #   MSWordDoc::Extractor.load('Example.docx') do |doc|
  #   puts doc.header
  # end

# @doc = MSWordDoc::Extractor.load('sample.doc')
# puts @doc.contents   # doc is MSWordDoc::Essence
# # You have to close document explicitly
# @doc.close()
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)

    if @resume.save
      redirect_to resumes_path, notice: "The resume #{@resume.name} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to resumes_path, notice:  "The resume #{@resume.name} has been deleted."
  end

private
  def resume_params
    params.require(:resume).permit(:name, :attachment)
  end
end

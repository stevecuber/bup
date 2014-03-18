module Refinery
  module Careers
    class CareersController < ::ApplicationController

      before_filter :find_page, :only => [:create, :new]

      def index
        redirect_to :action => "new"
      end

      def thank_you
        @page = Refinery::Page.find_by_link_url("/careers/thank_you", :include => [:parts])
      end

      def new
        @career = Career.new
      end

      def create
        @career = Career.new(params[:career])

          uploaded_io = params[:career][:cv_id]

          if (uploaded_io.content_type == "application/pdf")
            uploaded_io = params[:career][:cv_id]
            uploaded_io_time = Time.now.strftime("%m%d%Y%H%M%S").to_s + uploaded_io.original_filename
            File.open(Rails.root.join('public', 'uploaded', uploaded_io_time), 'wb') do |file|
              file.write(uploaded_io.read)
            end
            @career.cv_link = "/uploaded/#{uploaded_io_time}"
          else
            return redirect_to "/careers/not-supported-file"
          end

          #uploaded_io = params[:career][:cv_id]
          #uploaded_io_time = Time.now.strftime("%m%d%Y%H%M%S").to_s + uploaded_io.original_filename
            #File.open(Rails.root.join('public', 'uploaded', uploaded_io_time), 'wb') do |file|
              #file.write(uploaded_io.read)
            #end

          #@career.cv_link = "/uploaded/#{uploaded_io_time}"

        if @career.save
          begin
            Mailer.notification(@career, request).deliver
          rescue => e
            logger.warn "There was an error delivering the career notification.\n#{e.message}\n"
          end

          if Career.column_names.map(&:to_s).include?('email')
            begin
              Mailer.confirmation(@career, request).deliver
            rescue => e
              logger.warn "There was an error delivering the career confirmation:\n#{e.message}\n"
            end
          else
            logger.warn "Please add an 'email' field to Career if you wish to send confirmation emails when forms are submitted."
          end

            #uploaded_io = params[:career][:cv_id]
            #File.open(Rails.root.join('public', 'uploaded', Time.now.strftime("%m%d%Y%H%M%S").to_s + uploaded_io.original_filename), 'wb') do |file|
              #file.write(uploaded_io.read)
            #end

          redirect_to refinery.thank_you_careers_careers_path
        else
          render :action => 'new'
        end
      end

    protected

      def find_page
        @page = Refinery::Page.find_by_link_url('/careers/new', :include => [:parts])
      end

    end
  end
end

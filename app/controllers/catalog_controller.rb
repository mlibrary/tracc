# frozen_string_literal: true
class CatalogController < ApplicationController

  include Blacklight::Catalog
  include Blacklight::Marc::Catalog

  configure_blacklight do |config|
    ## Class for sending and receiving requests from a search index
    # config.repository_class = Blacklight::Solr::Repository
    #
    ## Class for converting Blacklight's url parameters to into request parameters for the search index
    #config.search_builder_class = ::SearchBuilder
    #
    ## Model that maps search index responses to the blacklight response model
    # config.response_model = Blacklight::Solr::Response
    #
    ## Should the raw solr document endpoint (e.g. /catalog/:id/raw) be enabled
    # config.raw_endpoint.enabled = false

    ## Default parameters to send to solr for all search-like requests. See also SearchBuilder#processed_parameters
    
    config.default_solr_params = {
      qt: "search",
      rows: 10,
      # qf: "title_tesim description_tesim creator_tesim keyword_tesim"
      qf: "title_tesim all_text_timv"
    }

    # solr path which will be added to solr base url before the other solr params.
    #config.solr_path = 'select'
    #config.document_solr_path = 'get'

    # items to show per page, each number in the array represent another option to choose from.
    #config.per_page = [10,20,50,100]

    # solr field configuration for search results/index views
    config.index.title_field = 'title_ssi'
    #config.index.display_type_field = 'format'
    #config.index.thumbnail_field = 'thumbnail_path_ss'

    config.add_results_document_tool(:bookmark, partial: 'bookmark_control', if: :render_bookmarks_control?)

    config.add_results_collection_tool(:sort_widget)
    config.add_results_collection_tool(:per_page_widget)
    config.add_results_collection_tool(:view_type_group)

    config.add_show_tools_partial(:bookmark, partial: 'bookmark_control', if: :render_bookmarks_control?)
    #config.add_show_tools_partial(:email, callback: :email_action, validator: :validate_email_params)
    #config.add_show_tools_partial(:sms, if: :render_sms_action?, callback: :sms_action, validator: :validate_sms_params)
    #config.add_show_tools_partial(:citation)

    #config.add_nav_action(:bookmark, partial: 'blacklight/nav/bookmark', if: :render_bookmarks_control?)
    #config.add_nav_action(:search_history, partial: 'blacklight/nav/search_history')

    config.add_nav_action(:tools, partial: 'cards/tools')

    config.add_nav_action(:import, partial: 'cards/import')

    config.add_nav_action(:update, partial: 'cards/update')

    config.add_nav_action(:reports, partial: 'cards/reports')

    # solr field configuration for document/show views
    config.show.title_field = 'title_ssi'
    #config.show.display_type_field = 'format'
    #config.show.thumbnail_field = 'thumbnail_path_ss'

    # solr fields that will be treated as facets by the blacklight application
    #   The ordering of the field names is the order of the display
    #
    # Setting a limit will trigger Blacklight's 'more' facet values link.
    # * If left unset, then all facet values returned by solr will be displayed.
    # * If set to an integer, then "f.somefield.facet.limit" will be added to
    # solr request, with actual solr request being +1 your configured limit --
    # you configure the number of items you actually want _displayed_ in a page.
    # * If set to 'true', then no additional parameters will be sent to solr,
    # but any 'sniffed' request limit parameters will be used for paging, with
    # paging at requested limit -1. Can sniff from facet.limit or
    # f.specific_field.facet.limit solr request params. This 'true' config
    # can be used if you set limits in :default_solr_params, or as defaults
    # on the solr side in the request handler itself. Request handler defaults
    # sniffing requires solr requests to be made with "echoParams=all", for
    # app code to actually have it echo'd back to see it.
    #
    # :show may be set to false if you don't want the facet to be drawn in the
    # facet bar
    #
    # set :index_range to true if you want the facet pagination view to have facet prefix-based navigation
    #  (useful when user clicks "more" on a large facet and wants to navigate alphabetically across a large set of results)
    # :index_range can be an array or range of prefixes that will be used to create the navigation (note: It is case sensitive when searching values)

    config.add_facet_field 'request_type_ssi', label: 'Request Type', limit: true, index_range: 'A'..'Z'
    config.add_facet_field 'activity_type_ssi', label: 'Activity Type'
    config.add_facet_field 'card_type_ssi', label: 'Card Type'
    config.add_facet_field 'epic_ssi', label: 'Epic'
    config.add_facet_field 'requester_name_ssim', label: 'Requester Name', limit: true, index_range: 'A'..'Z'
    config.add_facet_field 'requester_div_ssim', label: 'Requester Divison', limit: true, index_range: 'A'..'Z'
    config.add_facet_field 'in_cycle_ssi', label: 'Request Cycle', limit: true, index_range: 'A'..'Z'
    
    config.add_facet_field 'start_cycle_ssi', label: 'Start Cycle', limit: true, index_range: 'A'..'Z'
    config.add_facet_field 'done_cycle_ssi', label: 'Done Cycle', limit: true, index_range: 'A'..'Z'
    config.add_facet_field 'status_ssi', label: 'Card Status', limit: true, index_range: 'A'..'Z'
    config.add_facet_field 'rationale_ssi', label: 'Rationale', limit: true, index_range: 'A'..'Z'
   
    config.add_facet_field 'lit_lead_ssim', label: 'Card LIT Lead', limit: true, index_range: 'A'..'Z'
    config.add_facet_field 'lit_dept_ssim', label: 'Card LIT Dept', limit: true, index_range: 'A'..'Z'
    config.add_facet_field 'service_lead_ssim', label: 'Card Service Lead', limit: true, index_range: 'A'..'Z'

    #config.add_facet_field 'accomplish_ssim', label: 'Accomplished', limit: true, index_range: 'A'..'Z'
    #config.add_facet_field 'benefits_ssim', label: 'Benefits', limit: true, index_range: 'A'..'Z'
    #config.add_facet_field 'at_stake_ssim', label: 'At Stake', limit: true, index_range: 'A'..'Z'
    #config.add_facet_field 'ext_pressure_sism', label: 'External Pressure', limit: true, index_range: 'A'..'Z'
    #config.add_facet_field 'non_tech_ssim', label: 'Non-Technical', limit: true, index_range: 'A'..'Z'
    #config.add_facet_field 'time_constraints_ssim', label: 'Time Constraints', limit: true, index_range: 'A'..'Z'
   
    # config.add_facet_field 'example_pivot_field', label: 'Pivot Field', :pivot => ['format', 'language_ssim']

    # config.add_facet_field 'example_query_facet_field', label: 'Publish Date', :query => {
    #    :years_5 => { label: 'within 5 Years', fq: "pub_date_ssim:[#{Time.zone.now.year - 5 } TO *]" },
    #    :years_10 => { label: 'within 10 Years', fq: "pub_date_ssim:[#{Time.zone.now.year - 10 } TO *]" },
    #    :years_25 => { label: 'within 25 Years', fq: "pub_date_ssim:[#{Time.zone.now.year - 25 } TO *]" }
    # }


    # Have BL send all facet field names to Solr, which has been the default
    # previously. Simply remove these lines if you'd rather use Solr request
    # handler defaults, or have no facets.
    config.add_facet_fields_to_solr_request!

    # solr fields to be displayed in the index (search results) view
    #   The ordering of the field names is the order of the display

    # Card index fields
    #config.add_index_field 'title_ssi', label: 'Title'
    config.add_index_field 'short_name_ssi', label: 'Short Name'
    config.add_index_field 'requester_name_ssim', label: 'Requester'
    config.add_index_field 'request_type_ssi', label: 'Request Type'
    config.add_index_field 'activity_type_ssi', label: 'Activity Type'
    config.add_index_field 'card_type_ssi', label: 'Card Type'
    config.add_index_field 'epic_ssi', label: 'Epic'
    config.add_index_field 'priority_ssi', label: 'Priority'
    config.add_index_field 'requester_div_ssim', label: 'Requester Divison'
    config.add_index_field 'status_ssi', label: 'Progress Status'
    config.add_index_field 'rationale_ssi', label: 'Rationale'
    config.add_index_field 'cycle_ssi', label: 'Request Cycle'
   
    config.add_index_field 'start_cycle_ssi', label: 'Start Cycle'
    config.add_index_field 'done_cycle_ssi', label: 'Done Cycle'   
    
    # solr fields to be displayed in the show (single result) view
    #   The ordering of the field names is the order of the display
    # Card show fields
   
    config.add_show_field 'request_type_ssi', label: 'Request Type'
    config.add_show_field 'activity_type_ssi', label: 'Activity Type'
    config.add_show_field 'card_type_ssi', label: 'Card Type'
    config.add_show_field 'epic_ssi', label: 'Epic'
    config.add_show_field 'requester_name_ssim', label: 'Requester'
    config.add_show_field 'requester_email_ssim', label: 'Requester Email'
    config.add_show_field 'requester_div_ssim', label: 'Requester Divison'
    config.add_show_field 'contact_names_ssim', label: 'Contact Names'
    config.add_show_field 'short_description_ssi', label: 'Short Description'
    config.add_show_field 'prev_work_tsim', label: 'Previous Work'

    config.add_show_field 'accomplish_tsim', label: 'Accomplished'
    config.add_show_field 'benefits_tsim', label: 'Benefits'
    config.add_show_field 'at_stake_tsim', label: 'At Stake'
    config.add_show_field 'ext_pressure_tism', label: 'External Pressure'
    config.add_show_field 'non_tech_tsim', label: 'Non-Technical'
    config.add_show_field 'time_constraints_tsim', label: 'Time Constraints'

    config.add_show_field 'goal_alignment_tsim', label: 'Goal Alignment'    
    config.add_show_field 'priority_ssi', label: 'Priority'
    config.add_show_field 'sponsor_ssim', label: 'Sponsor'
    config.add_show_field 'more_info_tsm', label: 'More Info'
    config.add_show_field 'short_name_ssi', label: 'Short Name'
    config.add_show_field 'in_cycle_ssi', label: 'Request Cycle'
    
    config.add_show_field 'start_cycle_ssi', label: 'Start Cycle'
    config.add_show_field 'done_cycle_ssi', label: 'Done Cycle'
    config.add_show_field 'status_tsi', label: 'Card Status'
    config.add_show_field 'ext_link_tsm', label: 'External Link'
    config.add_show_field 'lit_lead_tsim' , label: 'LIT Lead'
    config.add_show_field 'lit_dept_tsim', label: 'LIT Dept'
    config.add_show_field 'service_lead_tsim', label: 'Service Lead'
    config.add_show_field 'other_contacts_tsm', label: 'Other Contacts'
    config.add_show_field 'comments_tsim', label: 'Comments'
    config.add_show_field 'recorded_on_dtsi', label: 'Recorded Date'
    config.add_show_field 'created_at_dtsi', label: 'Created Date'
    config.add_show_field 'updated_at_dtsi', label: 'Updated Data'


    # "fielded" search configuration. Used by pulldown among other places.
    # For supported keys in hash, see rdoc for Blacklight::SearchFields
    #
    # Search fields will inherit the :qt solr request handler from
    # config[:default_solr_parameters], OR can specify a different one
    # with a :qt key/value. Below examples inherit, except for subject
    # that specifies the same :qt as default for our own internal
    # testing purposes.
    #
    # The :key is what will be used to identify this BL search field internally,
    # as well as in URLs -- so changing it after deployment may break bookmarked
    # urls.  A display label will be automatically calculated from the :key,
    # or can be specified manually to be different.

    # This one uses all the defaults set by the solr request handler. Which
    # solr request handler? The one set in config[:default_solr_parameters][:qt],
    # since we aren't specifying it otherwise.

    #config.add_search_field 'all_fields', label: 'All Fields'
    config.add_search_field('all_fields', label: 'All Fields') do |field|
      all_names = config.show_fields.values.map(&:field).join(" ")
      field.solr_parameters = {
        qf: "#{all_names} file_format_tesim all_text_timv",
      }
    end

    # Now we see how to over-ride Solr request handler defaults, in this
    # case for a BL "search field", which is really a dismax aggregate
    # of Solr search fields.

    # config.add_search_field('title') do |field|
    #   # solr_parameters hash are sent to Solr as ordinary url query params.
    #   field.solr_parameters = {
    #     'spellcheck.dictionary': 'title',
    #     qf: '${title_qf}',
    #     pf: '${title_pf}'
    #   }
    # end

    # using title_tesim for search becasue according to Bill ti will:
    # The deafult blacklight dynamic fields will interpret that as “string, stored, indexed”, so you’re not 
    # going to get any tokenization, so the only searches that will work will be exact and full string 
    # matches (including, e.g., punctuation and capitalization). 
    # This is the case with title_ssi
    # But with title_tesim you will get tokenization.

     config.add_search_field('title_ssi') do |field|
       field.label = "Title"
       field.solr_parameters = {
         'spellcheck.dictionary': 'title',
         qf: 'title_tesim',
         pf: 'title_tesim'
       }
     end

    # Specifying a :qt only to show it's possible, and so our internal automated
    # tests can test it. In this case it's the same as
    # config[:default_solr_parameters][:qt], so isn't actually neccesary.
    # config.add_search_field('subject') do |field|
    #   field.qt = 'search'
    #   field.solr_parameters = {
    #     'spellcheck.dictionary': 'subject',
    #     qf: '${subject_qf}',
    #     pf: '${subject_pf}'
    #   }
    # end

    # "sort results by" select (pulldown)
    # label in pulldown is followed by the name of the SOLR field to sort by and
    # whether the sort is ascending or descending (it must be asc or desc
    # except in the relevancy case).
   
    config.add_sort_field 'short_name_ssi asc',label: 'short name'
    config.add_sort_field 'status_ssi asc', label: 'status'
    config.add_sort_field 'title_ssi asc', label: 'title'


    # If there are more than this many search results, no spelling ("did you
    # mean") suggestion is offered.
    config.spell_max = 5

    # Configuration for autocomplete suggestor
    config.autocomplete_enabled = true
    config.autocomplete_path = 'suggest'
    # if the name of the solr.SuggestComponent provided in your solrcongig.xml is not the
    # default 'mySuggester', uncomment and provide it below
    # config.autocomplete_suggester = 'mySuggester'

  end

  def add_milestone
    ms = Milestone.new
    ms["card_id"] = params["card_id"]
    ms["milestone"] = params["mstone"]
    ms["cycle"] = params["in_cycle"]
    ms["recorded_on"] = params["recorded_on"]
    chk_status = (params["status"] == "on") ? 1 : 0
    chk_status = 0 if params["status"].nil?
    ms["status"] = chk_status
    ms.save
    flash[:notice] = "Milestone '#{ms["milestone"]}' saved."
    redirect_back(fallback_location: root_path)
  end

  def add_comment
    cm = Comment.new
    cm["card_id"] = params["card_id"]
    cm["comment_txt"] = params["comment_txt"]
    cm["uemail"] = params["uemail"]
    cm["recorded_on"] = params["recorded_on"]
    cm.save
    flash[:notice] = "Comment '#{cm["comment_txt"]}' saved."
    redirect_back(fallback_location: root_path)
  end

  def add_objective
    ob = Objective.new
    ob["card_id"] = params["card_id"]
    ob["objective"] = params["objective"]
    ob["cycle"] = params["cycle"]
    ob["status"] = 0
    ob["recorded_on"] = params["recorded_on"]
    ob.save
    flash[:notice] = "Objective '#{ob["objective"]}' saved."
    redirect_back(fallback_location: root_path)
  end

  def update_milestone_check
    ms = Milestone.find( params[:mstone_id] )
    # flip status on click
    ms["status"] = (ms["status"] == 1) ? 0 : 1
    ms.save
    flash[:notice] = "Milestone '#{params["mstone_milestone"]}' status updated."
    redirect_back(fallback_location: root_path)
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def milestone_params
    params.permit(:id, :card_id, :milestone, :cycle, :recorded_on, :status)
  end
end
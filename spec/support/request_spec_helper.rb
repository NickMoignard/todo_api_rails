# spec/support/request_spec_helper

# NOTE: This suport directory is not autoloaded.
# Need to disable support directory auto-loading and then
# include RequestSpecHelper as a shared module for all request specs
# This is done inside the RSpec configuration block 

module RequestSpecHelper
    # Parse JSON response to ruby hash
    def json
        JSON.parse(response.body)
    end
end
<% if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < AuthenticationContoller

  filter_access_to :all

  layout 'cms'

  def index
    @<%= plural_table_name %> = <%= orm_class.all(class_name) %>
  end

  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
  end

  def edit
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
  end

  def create
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "params[:#{singular_table_name}]") %>

    if @<%= orm_instance.save %>
      redirect_to <%= plural_table_name %>_path, <%= key_value :notice, "'#{human_name} was successfully created.'" %>
    else
      render <%= key_value :action, '"new"' %>
    end
  end

  def update
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>

    if @<%= orm_instance.update_attributes("params[:#{singular_table_name}]") %>
      redirect_to <%= plural_table_name %>_path, <%= key_value :notice, "'#{human_name} was successfully updated.'" %>
    else
      render <%= key_value :action, '"edit"' %>
    end
  end

  def destroy
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
    @<%= orm_instance.destroy %>

    redirect_to <%= index_helper %>_url
  end
end
<% end -%>

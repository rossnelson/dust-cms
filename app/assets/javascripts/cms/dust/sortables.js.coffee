Dust.sortables = {

  options : 
    disableNesting: "no-nest"
    forcePlaceholderSize: true
    handle: ".handle"
    listType: "ul"
    items: "li"
    maxLevels: 2
    opacity: .6
    placeholder: "placeholder"
    tabSize: 15
    tolerance: "pointer"
    revert: 250
    toleranceElement: "> div"

  init : ()->
    $("ul#tree").nestedSortable @options

    $('.order').bind 'click', ()->
      Dust.sortables.control = @
      if $(@).data("list-class")
        Dust.sortables.listClass = "." + $(@).data("list-class") + " .index-item"
      else
        Dust.sortables.listClass = null
      Dust.sortables.saveItems()
      false

  saveItems : ()->
    list = @buildData()
    url = $('.order').data('url')

    $.post("#{url}.json", list).done (data)->
        Dust.sortables.notice(data)

  buildData: ()->
    return {
      class_name: @className()
      list: @list()
    }

  className: ()->
    $(@control).data('class')

  list: ()->
    if @listClass == null
      @listClass = '.index-item, .sortable-item'
    children = new Array()
    @itemList = _.map($(@listClass), (item, index)->
      data =
        id: $(item).data('id')
        position: index
        parent_id: $(item).parent().parent().data('id')
        children: new Array()
      if data.parent_id
        children.push(data)
        return false
      else
        return data
    )
    @buildChildren(children)

    _.compact(@itemList)

  buildChildren: (children)->
    _.each children, (item)=>
      parent = _.findWhere(@itemList, {id: item.parent_id})
      parent.children.push(item)

  notice: (flash)->
    console.log flash
    Dust.notice = $("<div class=\'flash_#{flash.type}\'></div>")
    Dust.notice.html(flash.message)

    $('#header-wrap').after(Dust.notice[0])
    $(Dust.notice[0]).delay(2000).fadeOut ()->
      $(Dust.notice).remove()


}

function init()
    m.sportMarkupList = m.top.findNode("SportMarkupList")
    m.leagueMarkupList = m.top.findNode("LeagueMarkupList")
    m.scoreMarkupList = m.top.findNode("ScoreMarkupList")

    m.fetchJsonTask = CreateObject("roSGNode", "FetchJsonTask")
    m.fetchJsonTask.ObserveField("content", "setScoreContent")
    m.fetchJsonTask.date_offset = 0  

    m.sportMarkupList.ObserveField("itemFocused", "sportFocused")
    m.sportMarkupList.SetFocus(true)
end function

sub sportFocused() 
    focused = m.sportMarkupList.content.getChild(m.sportMarkupList.itemFocused) 
    leagues = CreateObject("roSGNode", focused.name + "Leagues")
    m.leagueMarkupList.content = leagues
    m.leagueMarkupList.ObserveField("itemFocused", "leagueFocused")
end sub

sub leagueFocused()
    focused = m.leagueMarkupList.content.getChild(m.leagueMarkupList.itemFocused)  

    m.fetchJsonTask.contenturi = focused.url
    m.fetchJsonTask.date_offset = 0
    m.fetchJsonTask.control = "RUN"
end sub

sub setScoreContent()
    m.scoreMarkupList.content = m.fetchJsonTask.content
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
  if press then
    if (key = "back") 
      if m.scoreMarkupList.hasFocus()  
        m.sportMarkupList.SetFocus(true)
        return true
      end if
      return false
    end if  
    if m.leagueMarkupList.hasFocus() 
      if key = "left"
        m.sportMarkupList.SetFocus(true)
        return true
      elseif key = "right"
        m.scoreMarkupList.SetFocus(true)
        return true
      end if
    end if    
    if m.sportMarkupList.hasFocus() 
      if key = "right"
        m.leagueMarkupList.SetFocus(true)
        return true
      end if
    end if
    if m.scoreMarkupList.hasFocus() 
      if key = "right"
        m.fetchJsonTask.date_offset = m.fetchJsonTask.date_offset + 1
        m.fetchJsonTask.control = "RUN"
      elseif  key = "left"
        m.fetchJsonTask.date_offset = m.fetchJsonTask.date_offset - 1
        m.fetchJsonTask.control = "RUN"
      end if  
      return true
    end if
  end if
  return false
end function
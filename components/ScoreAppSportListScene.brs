function init()
    m.sportMarkupList = m.top.findNode("SportMarkupList")
    m.leagueMarkupList = m.top.findNode("LeagueMarkupList")
    m.scoreMarkupList = m.top.findNode("ScoreMarkupList")

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
    m.fetchJsonTask = CreateObject("roSGNode", "FetchJsonTask")
    m.fetchJsonTask.ObserveField("content", "setScoreContent")  
    m.fetchJsonTask.contenturi = focused.url
    m.fetchJsonTask.control = "RUN"
end sub

sub setScoreContent()
    m.scoreMarkupList.content = m.fetchJsonTask.content
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
  if press then
    if (key = "back") then
      return false
    else
      if m.scoreMarkupList.hasFocus() and key = "left" 
        m.leagueMarkupList.SetFocus(true)
        return true
      end if
      if m.leagueMarkupList.hasFocus() 
        if key = "left"
          m.sportMarkupList.SetFocus(true)
          return true
        end if
        if key = "right"
          m.scoreMarkupList.SetFocus(true)
          return true
        end if
      end if
      if m.sportMarkupList.hasFocus() 
        if key = "right"
          m.leagueMarkupList.SetFocus(true)
          return true
        end if
        if key = "down"
          m.scoreMarkupList.SetFocus(true)
          return true
        end if
      end if   
    end if
  end if
  return false
end function
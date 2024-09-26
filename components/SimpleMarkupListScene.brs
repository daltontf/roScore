'********** Copyright 2016 Roku Corp.  All Rights Reserved. **********

function init()
    m.simpleMarkupList = m.top.findNode("SimpleMarkupList")
	m.simpleMarkupList.SetFocus(true)
	m.simpleMarkupList.ObserveField("itemFocused", "onFocusChanged")

    m.fetchJsonTask = CreateObject("roSGNode", "FetchJsonTask")
    m.fetchJsonTask.ObserveField("content", "setcontent")
    m.fetchJsonTask.contenturi = "http://site.api.espn.com/apis/site/v2/sports/baseball/mlb/scoreboard"
    '"http://site.api.espn.com/apis/site/v2/sports/hockey/nhl/scoreboard"
    m.fetchJsonTask.control = "RUN"
end function

sub setcontent()
    m.simpleMarkupList.content = m.fetchJsonTask.content
end sub

function onFocusChanged() as void
    print "Focus on item: " + stri(m.simpleMarkupList.itemFocused)
    print "Focus on item: " + stri(m.simpleMarkupList.itemUnfocused) + " lost"
end function



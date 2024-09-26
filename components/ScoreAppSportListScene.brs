function init()
    m.scoreMarkupList = m.top.findNode("ScoreMarkupList")
	m.scoreMarkupList.SetFocus(true)
	m.scoreMarkupList.ObserveField("itemFocused", "onFocusChanged")

    m.fetchJsonTask = CreateObject("roSGNode", "FetchJsonTask")
    m.fetchJsonTask.ObserveField("content", "setcontent")
    m.fetchJsonTask.contenturi = "http://site.api.espn.com/apis/site/v2/sports/volleyball/womens-college-volleyball/scoreboard"    
    '"http://site.api.espn.com/apis/site/v2/sports/baseball/mlb/scoreboard"
    '"http://site.api.espn.com/apis/site/v2/sports/hockey/nhl/scoreboard"
    m.fetchJsonTask.control = "RUN"
end function

sub setcontent()
    m.scoreMarkupList.content = m.fetchJsonTask.content
end sub

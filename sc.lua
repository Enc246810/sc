local console = "CONSOLE v0.1\n----------------\n"..os.date("(%H:%M:%S)   ").."Script executed.\n"

local timerOfset = {}
local blocker = {}
local aWait = {}
local ofsetOffsets = {}
local ofsetValues = {}

blocker = 0
gg.toast("\nLoading...")
gg.sleep("2000")

bitS = gg.choice({"32 Bit", "64 Bit", "Android 11 and Up"},nil, "Please select your device version.")
if bitS == nil then
  gg.toast("\nCANCEL")
  return
  else
  if bitS == 1 then
    gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS)
    timerOfset = 0x74
    console = console..os.date("(%H:%M:%S)   ").."32 Bit selected.\n"
  end
  if bitS == 2 then
    gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS)
    timerOfset = 0x9c
    console = console..os.date("(%H:%M:%S)   ").."64 Bit selected.\n"
  end
  if bitS == 3 then
    gg.setRanges(gg.REGION_OTHER | gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS)
    timerOfset = 0x9c
    console = console..os.date("(%H:%M:%S)   ").."Android 11 and Up selected.\n"
  end
end
gg.alert[[
[ By SimpleCodeStudio ]
------------------------------------------------------------
SIMCITY SCRIPT
------------------------------------------------------------
What's New?
Updated: 2
23/10/2023

✓- Added reset timer function 2. (BETA)

✓- Fixed Reset timer function.

------------------------------------------------------------
]]

function protection()
  p = gg.prompt({"Protection Key:"}, {""}, {"text"})
  if p == nil then
  else
  if p[1] == "hello" then
    console = console..os.date("(%H:%M:%S)   ").."Protection key is correct.\n"
    gg.toast("\nProtection key is correct.")
    aWait = 0
    mainMenu()
    else
      console = console..os.date("(%H:%M:%S)   ").."ERROR: Protection key is failed.\n"
      gg.alert("Check in Discord #SCS_Communtiy sc-announcements channel")
      return
  end
  end
end

function valueNotFound()
  console = console..os.date("(%H:%M:%S)   ").."ERROR: Searched value not found.\n"
	gg.alert('Value not found. Please contact the developer. (SimpleCodeStudio)')
    return
    mainMenu()
end

function ofsets()
  gg.sleep("200")
  R = gg.getResults(1)
  local ofset = {}
  ofset[1] = {}
  ofset[1].address = R[1].address + ofsetOffsets
  ofset[1].flags = gg.TYPE_DWORD
  ofset[1].value = ofsetValues
  ofset[1].freeze = false
  gg.addListItems(ofset)
  gg.setValues(ofset)
  gg.setVisible(false)
end

function productionTimer()
	  R3 = gg.getResults(1)
	  local ofset = {}
	  ofset[1] = {}
	  ofset[1].address = R3[1].address + 4
	  ofset[1].flags = gg.TYPE_DWORD
	  ofset[1].freeze = false
	  gg.addListItems(ofset)
	  gg.setVisible(false)
	  g1 = gg.getListItems(1)
if g1[1].value == 0 then
     ofsetOffsets = 0
     ofsetValues = 0
     ofsets()
    gg.clearResults()
    gg.searchNumber("9900000",gg.TYPE_DWORD)
  end
end

function productionTimer2()
	  a = gg.alert("Do you ready?", "YES", "NO")
	  if a == 1 then
		    gg.refineNumber("60000~60000000")
		    gg.getResults("200")
		    gg.editAll("0",gg.TYPE_DWORD)
		    gg.clearResults()
		    gg.clearList()
		    aWait = 0
		    gg.toast("\nSuccessful")
	end
	  if a == 2 then
		    gg.toast("\nOkay I waiting you.")
		    return
	end
end

function mainMenu()
  
  m1 = gg.choice({"⭐┃Premium", "⌛┃Set 0 All Production and Nano timers", "💵┃48k simcash", "💰┃20m simoleon", "❌┃Exit", "⚙️┃CONSOLE"},nil,"[BETA] Your date is: "..os.date("%d/%m/%Y"))
  
  if m1 == 1 then
    console = console..os.date("(%H:%M:%S)   ").."Premium features is showing.\n"
    aaa = gg.alert("Premium Features\n-> 40m Simoleon.\n-> 100% 48k Simcash. And all the achievements are here.\n-> New functions are in this script.\n-> Can auto update.\n-> Can support all languages. (You need want.)\n-> Strong Console.", "GET", "MAYBE LATER")
    if aaa == 1 then
      console = console..os.date("(%H:%M:%S)   ").."Premium/GET\n"
      gg.alert("NOTE\nYou need to get Premium lvl3 ($10) to use it.  Contact me on discord or elsewhere after you get it.  Thanks")
      gg.copyText("https://www.patreon.com/user/membership?u=86903282")
  end
    if aaa == 2 then
      console = console..os.date("(%H:%M:%S)   ").."Premium/MAYBE LATER\n"
      gg.toast("\nYou can come back later.")
      return
    end
  end
  
  if m1 == 2 then
		if blocker == 1 then
		b = gg.alert("You already reset the time. But do you want use again?", "YES", "NO")
  		if b == 1 then
  		  blocker = 0
  		  gg.toast("\nYou can use again now.")
  		  return
  		end
		end
		if blocker == 0 then
		pti = gg.choice({"Function 1 %100 auto", "Function 2 %75 auto"})
					if pti == nil then
						  gg.toast("\nCANCEL")
						  return
			else
						if pti == 1 then
					  		  console = console..os.date("(%H:%M:%S)   ").."Productions timer searching...\n"
					  		gg.toast("\nPlease Wait...")
					  		gg.clearResults()
					  			gg.searchNumber("9900000",gg.TYPE_DWORD)
					  		  if gg.getResultsCount() == 0 then
						  			valueNotFound()
						  			blocker = 1
						  			return
					end
					  		productionTimer()
					  		R2 = gg.getResults(1)
					  		local ofset = {}
					  		ofset[1] = {}
					  		ofset[1].address = R2[1].address - timerOfset
					  		ofset[1].flags = gg.TYPE_DWORD
					  		ofset[1].freeze = false
					  		gg.addListItems(ofset)
					  		gg.setVisible(false)
					  		gg.sleep("200")
					  		get2 = gg.getListItems("1")
					  		gg.clearResults()
					  		gg.searchNumber(get2[1].value,gg.TYPE_DWORD)
					  		local rslt = gg.getResults("200")
					  		gg.addListItems(rslt)
					  		rslt = nil


					  		local copy = false
					  		local rslt = gg.getListItems()
					  		if not copy then gg.removeListItems(rslt) end
					  		for i, v in ipairs(rslt) do
						  		v.address = v.address + timerOfset
						  		if copy then v.name = v.name..' #2' end
					end
					  		gg.addListItems(rslt)
					  		t = nil
					  		copy = nil


					  		revert = gg.getListItems()
					  		local rslt = gg.getListItems()
					  		for i, v in ipairs(rslt) do
						  		if v.flags == gg.TYPE_DWORD then
							  			v.value = "0"
							  			v.freeze = false
							  			v.freezeType = gg.FREEZE_NORMAL
						end
					end
					  		gg.addListItems(rslt)
					  		gg.setValues(rslt)
					  		rslt = nil
					  		gg.clearResults()
					  		gg.clearList()
					  		gg.toast("\nSuccessful")
					  		blocker = 1
					  		console = console..os.date("(%H:%M:%S)   ").."Successful.\n"
				end
			end
					if pti == 2 then
						  console = console..os.date("(%H:%M:%S)   ").."Productions timer searching...\n"
				  		gg.toast("\nPlease Wait...")
				  		gg.clearResults()
				  		gg.clearList()
				  		gg.searchNumber("9900000",gg.TYPE_DWORD)
				  		if gg.getResultsCount() == 0 then
					  			valueNotFound()
					  			blocker = 1
					  			return
				end
				  		productionTimer()
				  		R2 = gg.getResults(1)
				  		local ofset = {}
				  		ofset[1] = {}
				  		ofset[1].address = R2[1].address + 0x4
				  		ofset[1].flags = gg.TYPE_DWORD
				  		ofset[1].freeze = false
				  		gg.addListItems(ofset)
				  		gg.setVisible(false)
				  		gg.sleep("200")
				  		get2 = gg.getListItems("1")
				  		gg.clearResults()
				  		gg.searchNumber(get2[1].value,gg.TYPE_DWORD)
				  		local rslt = gg.getResults("2500")
				  		gg.addListItems(rslt)
				  		rslt = nil


				  		local copy = false
				  		local rslt = gg.getListItems()
				  		if not copy then gg.removeListItems(rslt) end
				  		for i, v in ipairs(rslt) do
					  		v.address = v.address + -0x4
					  		if copy then v.name = v.name..' #2' end
				end
				  		gg.addListItems(rslt)
				  		t = nil
				  		copy = nil


				  		revert = gg.getListItems()
				  		local rslt = gg.getListItems()
				  		for i, v in ipairs(rslt) do
					  		if v.flags == gg.TYPE_DWORD then
						  			v.freeze = false
						  			v.freezeType = gg.FREEZE_NORMAL
					end
				end
				  		gg.addListItems(rslt)
				  		rslt = nil
				  		gg.clearResults()
				  		gg.alert("Now select all saved value after click the (Selected as search results) button.")
				  		aWait = 4
				  		return
			end
		end
	  
	end
  
  if m1 == 3 then
    gg.alert("WARNING\nGet this only once!  If your simcash drops below 1000, you can use it again.  Do not forget that your simcash exceeding 49k will result in a ban.  Thanks.")
    sm = gg.choice({"King", "Megalopolis", "Master of Simoleons", "Countess"},nil,"Select a Achivements.")
	if sm == 1 then
	  console = console..os.date("(%H:%M:%S)   ").."Selected achievements is King.\n"
		smKing = gg.choice({"Level 1", "Level 2", "Level 3"},nil, 'Select "King" Achivements level.')

		if smKing == 1 then
			gg.toast("\nPlease Wait...")
			gg.clearResults()
			gg.searchNumber("3000000;20::8",gg.TYPE_DWORD)
			if gg.getResultsCount() == 0 then
				valueNotFound()
			end
			gg.refineNumber("3000000")
			gg.getResults(1)
			gg.editAll("0",gg.TYPE_DWORD)
			ofsetOffsets = 4
			ofsetValues = 48000
			ofsets()
			gg.toast("\nSuccessful")
			gg.clearResults()gg.clearList()
			console = console..os.date("(%H:%M:%S)   ").."King level 1 are set to simcash 48k.\n"
		end
		if smKing == 2 then
			gg.toast("\nPlease Wait...")
			gg.clearResults()
			gg.searchNumber("10000000;30::8",gg.TYPE_DWORD)
			if gg.getResultsCount() == 0 then
				valueNotFound()
			end
			gg.refineNumber("10000000")
			gg.getResults(1)
			gg.editAll("0",gg.TYPE_DWORD)
			ofsetOffsets = 4
			ofsetValues = 48000
			ofsets()
			gg.toast("\nSuccessful")
			gg.clearResults()gg.clearList()
			console = console..os.date("(%H:%M:%S)   ").."King level 2 are set to simcash 48k.\n"
		end
		if smKing == 3 then
			gg.toast("\nPlease Wait...")
			gg.clearResults()
			gg.searchNumber("20000000;100::8",gg.TYPE_DWORD)
			if gg.getResultsCount() == 0 then
				valueNotFound()
			end
			gg.refineNumber("20000000")
			gg.getResults(1)
			gg.editAll("0",gg.TYPE_DWORD)
			ofsetOffsets = 4
			ofsetValues = 48000
			ofsets()
			gg.toast("\nSuccessful")
			gg.clearResults()gg.clearList()
			console = console..os.date("(%H:%M:%S)   ").."King level 3 are set to simcash 48k.\n"
		end
	end
	if sm == 2 then
	  console = console..os.date("(%H:%M:%S)   ").."Selected achievements is Megalopolis.\n"
		smMp = gg.choice({"Level 1", "Level 2", "Level 3"},nil, 'Select "Megalopolis" Achivements level.')

		if smMp == 1 then
			gg.toast("\nPlease Wait...")
			gg.clearResults()
			gg.searchNumber("1500000;32::8",gg.TYPE_DWORD)
			if gg.getResultsCount() == 0 then
				valueNotFound()
			end
			gg.refineNumber("1500000")
			gg.getResults(1)
			gg.editAll("0",gg.TYPE_DWORD)
			ofsetOffsets = 4
			ofsetValues = 48000
			ofsets()
			gg.toast("\nSuccessful")
			gg.clearResults()
			console = console..os.date("(%H:%M:%S)   ").."Megalopolis level 1 are set to simcash 48k.\n"
		end
		if smMp == 2 then
			gg.toast("\nPlease Wait...")
			gg.clearResults()
			gg.searchNumber("2000000;36::8",gg.TYPE_DWORD)
			if gg.getResultsCount() == 0 then
				valueNotFound()
			end
			gg.refineNumber("2000000")
			gg.getResults(1)
			gg.editAll("0",gg.TYPE_DWORD)
			ofsetOffsets = 4
			ofsetValues = 48000
			ofsets()
			gg.toast("\nSuccessful")
			gg.clearResults()gg.clearList()
			console = console..os.date("(%H:%M:%S)   ").."Megalopolis level 2 are set to simcash 48k.\n"
		end
		if smMp == 3 then
			gg.toast("\nPlease Wait...")
			gg.clearResults()
			gg.searchNumber("2500000;40::8",gg.TYPE_DWORD)
			if gg.getResultsCount() == 0 then
				valueNotFound()
			end
			gg.refineNumber("2500000")
			gg.getResults(1)
			gg.editAll("0",gg.TYPE_DWORD)
			ofsetOffsets = 4
			ofsetValues = 48000
			ofsets()
			gg.toast("\nSuccessful")
			gg.clearResults()gg.clearList()
			console = console..os.date("(%H:%M:%S)   ").."Megalopolis level 3 are set to simcash 48k.\n"
		end
	end
	if sm == 3 then
	  console = console..os.date("(%H:%M:%S)   ").."Selected achievements is Master of Simoleon.\n"
		smMos = gg.choice({"Level 1", "Level 2", "Level 3"},nil, 'Select "Master of Simoleons" Achivements level.')

		if smMos == 1 then
			gg.toast("\nPlease Wait...")
			gg.clearResults()
			gg.searchNumber("1500000;3::8",gg.TYPE_DWORD)
			if gg.getResultsCount() == 0 then
				valueNotFound()
			end
			gg.refineNumber("1500000")
			gg.getResults(1)
			gg.editAll("0",gg.TYPE_DWORD)
			ofsetOffsets = 4
			ofsetValues = 48000
			ofsets()
			gg.toast("\nSuccessful")
			gg.clearResults()gg.clearList()
			console = console..os.date("(%H:%M:%S)   ").."Master of Simoleons level 1 are set to simcash 48k.\n"
		end
		if smMos == 2 then
			gg.toast("\nPlease Wait...")
			gg.clearResults()
			gg.searchNumber("3000000;10::8",gg.TYPE_DWORD)
			if gg.getResultsCount() == 0 then
				valueNotFound()
			end
			gg.refineNumber("3000000")
			gg.getResults(1)
			gg.editAll("0",gg.TYPE_DWORD)
			ofsetOffsets = 4
			ofsetValues = 48000
			ofsets()
			gg.toast("\nSuccessful")
			gg.clearResults()gg.clearList()
			console = console..os.date("(%H:%M:%S)   ").."Master of Simoleons level 2 are set to simcash 48k.\n"
		end
		if smMos == 3 then
			gg.toast("\nPlease Wait...")
			gg.clearResults()
			gg.searchNumber("5000000;30::8",gg.TYPE_DWORD)
			if gg.getResultsCount() == 0 then
				valueNotFound()
			end
			gg.refineNumber("5000000")
			gg.getResults(1)
			gg.editAll("0",gg.TYPE_DWORD)
			ofsetOffsets = 4
			ofsetValues = 48000
			ofsets()
			gg.toast("\nSuccessful")
			gg.clearResults()gg.clearList()
			console = console..os.date("(%H:%M:%S)   ").."Master of Simoleons level 3 are set to simcash 48k.\n"
		end
	end
	if sm == 4 then
	  console = console..os.date("(%H:%M:%S)   ").."Selected achievements is Countess.\n"
		smCt = gg.choice({"Level 1", "Level 2", "Level 3"},nil, 'Select "Countess" Achivements level.')

		if smCt == 1 then
			gg.toast("\nPlease Wait...")
			gg.clearResults()
			gg.searchNumber("200000;10::8",gg.TYPE_DWORD)
			if gg.getResultsCount() == 0 then
				valueNotFound()
			end
			gg.refineNumber("200000")
			gg.getResults(1)
			gg.editAll("0",gg.TYPE_DWORD)
			ofsetOffsets = 4
			ofsetValues = 48000
			ofsets()
			gg.toast("\nSuccessful")
			gg.clearResults()gg.clearList()
			console = console..os.date("(%H:%M:%S)   ").."Countess level 1 are set to simcash 48k.\n"
		end
		if smCt == 2 then
			gg.toast("\nPlease Wait...")
			gg.clearResults()
			gg.searchNumber("500000;20::8",gg.TYPE_DWORD)
			if gg.getResultsCount() == 0 then
				valueNotFound()
			end
			gg.refineNumber("500000")
			gg.getResults(1)
			gg.editAll("0",gg.TYPE_DWORD)
			ofsetOffsets = 4
			ofsetValues = 48000
			ofsets()
			gg.toast("\nSuccessful")
			gg.clearResults()gg.clearList()
			console = console..os.date("(%H:%M:%S)   ").."Countess level 2 are set to simcash 48k.\n"
		end
		if smCt == 3 then
			gg.toast("\nPlease Wait...")
			gg.clearResults()
			gg.searchNumber("1500000;40::8",gg.TYPE_DWORD)
			if gg.getResultsCount() == 0 then
				valueNotFound()
			end
			gg.refineNumber("1500000")
			gg.getResults(1)
			gg.editAll("0",gg.TYPE_DWORD)
			ofsetOffsets = 4
			ofsetValues = 48000
			ofsets()
			gg.toast("\nSuccessful")
			gg.clearResults()gg.clearList()
			console = console..os.date("(%H:%M:%S)   ").."Countess level 3 are set to simcash 48k.\n"
		end
	end
  end
  
  if m1 == 4 then
	aw = gg.alert("WARNING\nPlease make sure you are in the section to receive 2000 Simoleon in the war pass.", "OK WAIT", "IM READY")
	if aw == 1 then
		gg.toast("\nI waiting u...")
		return
	end
	  console = console..os.date("(%H:%M:%S)   ").."Searching Vu Pass simoleon address...\n"
    gg.toast("\nPlease Wait...")
    gg.clearResults()
    gg.searchNumber("2000;1;1;100;500::326",gg.TYPE_DWORD)
    if gg.getResultsCount() == 0 then
		valueNotFound()
    end
    gg.refineNumber("2000")
    gg.getResults("200")
    gg.editAll("20000000",gg.TYPE_DWORD)
    gg.toast("\nSuccessful")
    gg.clearResults()gg.clearList()
    console = console..os.date("(%H:%M:%S)   ").."Simoleon are set to 20.000.000.\n"
  end
  
  if m1 == 5 then
    console = console..os.date("(%H:%M:%S)   ").."Exiting..."
    print("EXIT SUCCESSFUL\n\n"..console)
    gg.setVisible(true)
    os.exit()
  end
  
  if m1 == 6 then
	  gg.alert(console)
  end
end



aWait = 2

gg.showUiButton()
while true do
  if gg.isClickedUiButton() then
    gg.setVisible(false)
    if aWait == 0 then
      mainMenu()
    end

    if aWait == 2 then
      protection()
    end
		
if aWait == 4 then
			      productionTimer2()
		end
  end
end

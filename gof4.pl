bifrost(A, B) :- travel_to(A, B).                                                               %try to bifrost from point A to B.
bifrost(A, B) :- travel_to(A, X), travel_to(X, B).

walking(A, B) :- walk_to(A, B).                                                                 %try to walk from poin A to B
walking(A, B) :- walk_to(A, X), walk_to(X, B).

bifrostandwalk(A, B) :- walking(A, B).                                                          %try to find long distanced points. USE ADVANCED, THIS ALONE WONT WORK FOR ALL, ADVANCED WORKS FOR ALL.
bifrostandwalk(A, B) :- bifrost(A, X), walking(X, B).

advancedbifrostandwalk(A, B) :- bifrostandwalk(A, B).                                           %tyr to go from a point in realm A to a point in realm B. use walk and bifrost.
advancedbifrostandwalk(A, B) :- walking(A, X), bifrostandwalk(X, B).

claimitems(A, B) :- claim(A, B).                                                                %try to claim an item from point a to point b.
claimitems(A, B) :- claim(A, X), claim(X, B).

bifrostandwalkandclaim(A, B) :- claimitems(A, B).                                               %try to claim an item from a point in one real to a point at another realm.
bifrostandwalkandclaim(A, B) :- advancedbifrostandwalk(A, X), claimitems(X, B).

discoverthetruth(A, B) :- discover(A, B).                                                       %try to discover the truth from point a to point b.
discoverthetruth(A, B) :- discover(A, X), discover(X, B).                 

bifrostandwalkanddiscover(A, B) :- discoverthetruth(A, B).                                      %try to discover the truth from a point in one realm to point at another realm.
bifrostandwalkanddiscover(A, B) :- advancedbifrostandwalk(A, X), discoverthetruth(X, B).

seecharacters(A, B) :- see(A, B).
seecharacters(A, B) :- see(A, X), see(X, B).

bifrostandwalkandseecharacters(A, B) :- seecharacters(A, B).                                    %try to see the characters from anywhere of the map to anywhere.
bifrostandwalkandseecharacters(A, B) :- advancedbifrostandwalk(A, X), seecharacters(X, B).



%TRAVEL BETWEEN REALMS

travel_to(midgard, alfheim).
travel_to(midgard, helheim).
travel_to(midgard, jotunheim).

travel_to(alfheim, midgard).
travel_to(alfheim, helheim).
travel_to(alfheim, jotunheim).

travel_to(helheim, midgard).
travel_to(helheim, alfheim).
travel_to(helheim, jotunheim).

travel_to(jotunheim, midgard).
travel_to(jotunheim, alfheim).
travel_to(jotunheim, helheim).

%TRAVEL BETWEEN REALMS

discover(freyas_home, kratos_is_god).
discover(freyas_home, atreus_is_god).
discover(the_land_of_the_giants, atreus_is_loki).

see(freyas_home, freya).
see(helheim, zeus).
see(the_land_of_the_giants, death_giants).

walk_to(midgard, mystic_gateway).
walk_to(midgard, lake_of_nine).
walk_to(lake_of_nine, midgard).
walk_to(lake_of_nine, freyas_home).
walk_to(freyas_home, lake_of_nine).
walk_to(alfheim, tyrs_bridge).
walk_to(tyrs_bridge, alfheim).
walk_to(tyrs_bridge, ringed_temple).
walk_to(ringed_temple, tyrs_bridge).
walk_to(helheim, secret_chamber_of_odin).
walk_to(secret_chamber_of_odin, helheim).
walk_to(jotunheim, the_land_of_the_giants).
walk_to(the_land_of_the_giants, jotunheim).

claim(tyrs_bridge, symbol_of_shadows_enchantment).
claim(ringed_temple, runic_war_belt).
claim(secret_chamber_of_odin, eye_of_the_outer_realm).
claim(muspelheim, grips_of_the_valkyrie).


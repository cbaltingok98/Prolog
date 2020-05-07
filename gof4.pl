/*
Celik Berk Altingok  

PLEASE LISTEN THIS WHEN REVIEWING -> https://www.youtube.com/watch?v=rOmHpI0MMKE [00:00:00] :)
God Of War 4 traveling between realms and different locations in realms.
Each location has different items to be claimed, lands to be walked on, truths to be discovered and characters to be seen.

Realm names are considered as realms and the Bifrost. Bifrost is the "machine" that is used to travel between realms.
Each realm has different paths, items, discoveries and characters. It is possible to go from one point at a realm to another point at different realm if there is a path available.

Map below shows the connections between realms, locations, items, dicoveries and their relationships. 
You can't walk to KRATOS_IS_GOD, you can only discover it, and you can't discover or walk or bifrost from claims, discoveries and characters becasue they are (one-way)
                                                                                                                                                    (ONE-WAY)
Example: From MIDGARD you can either WALK TO LAKE_OF_NINE or BIFROST to [ALFHEIM, HELHEIM, JOTUNHEIM] or more                                         (SEE)
                                                                                                                                            ----------------------> FREYA
                                                                                                                                           |
RELATIONSHIP                                                                                                                               |
                                                                  (ONE-WAY)                (TWO-WAY)                    (TWO-WAY)          |       (ONE-WAY)
                                                                  (WALK TO)                (WALK TO)                    (WALK TO)          |       (DISCOVER)
                    (ONCE GET IN, NO WAY OUT!) MYSTIC_GATEWAY  <-------------  MIDGARD  <-------------> LAKE_OF_NINE <-------------> FREYAS_HOME -------------> KRATOS_IS_GOD 
                                                                                  ^                                                         |
                                                                                  |                                                         ----------------------> ATREUS_IS_GOD    
                                                                                  | (BIFROST)(TWO-WAY)                                           (DISCOVER)(ONE-WAY) 
                                                                                  |
                                                                                  V
                               --------------------------------------------------------------------------------------------------------------                                                                  
                              ^                                                   ^                                                         ^
                              | (BIFROST)(TWO_WAY)                                |  (BIFROST)(TWO-WAY)                                     | (BIFROST)(TWO-WAY)
                              |                                                   |                                                         |
                              V                                                   V           (SEE)(ONE-WAY)                                V                         (NO ONE KNOWS HOW TO GET HERE, OR GET OUT!)
                            ALFHEIM                                              HELHEIM ---------------------> ZEUS                    JOTUNHEIM                                  MUSPELHEIM
                              ^                                                     ^                                                       ^                                             ^
                              |  (WALK TO)(TWO-WAY)                                 | (WALK TO)(TWO-WAY)                                    |                                             | (CLAIM)(ONE-WAY)
                              V                                                     V                                                       | (WALK TO)(TWO-WAY)                          --------------------> GRIPS_OF_THE_VALKYRIE
                         TYRS_BRIDGE <----------------                    SECRET_CHAMBER_OF_ODIN                                            V                                                                  (IMPOSIBBLE ITEM TO FIND)
                          |                          |                                  |                                         THE_LAND_OF_THE_GIANTS --------------------------
                          |                          |                                  | (CLAIM)(ONE-WAY)                                  |                                     | (SEE)(ONE-WAY)
                    -------  (CLAIM)(ONE-WAY)        | (WALK TO)(TWO-WAY)               V                                                   | (DISCOVER)(ONE-WAY)                 |
                    |                                |                        EYE_OF_THE_OUTER_REALM                                        |                                     |
                    V                                V                                                                                      V                                     V
        SYMBOL_OF_SHADOWS_ENCHANTMENT          RINGED_TEMPLE                                                                          ATREUS_IS_LOKI                         DEATH_GIANTS
                                                     |
                                                     |   (CLAIM)(ONE-WAY)
                                                     V
                                               RUBIC_WAR_BELT





*/

/*
num of rules : 35
WALK ANY DISTANCE ADVANCEDBIFROSTANDWALK()
IF A AND B LOCATED AT DIFFERENT REALMS USE ADVANCEDBIFROSTANDWALK()
IF CLAIM ITEMS USE BIFROSTANDWALKANDCLAIM()
IF DISCOVER TRUTHS USE BIFROSTANDWALKANDDISCOVER()
IF SEE CHARACTERS USE BIFROSTANDWALKANDSEECHARACTERS()
*/

/*
                TEST CASES
Go from freyas_home To ringed_temple --> advancedbifrostandwalk(freyas_home, ringed_temple). Expected: True  Result: True

Go from freyas_home To symbol_of_shadows_enchantment --> advancedbifrostandwalk(freyas_home, symbol_of_shadows_enchantment). Expected: False  Result: False, symbol_of_shadows_enchantment is an item and can only be claimed.

Claim symbol_of_shadows_enchantment From the_land_of_the_giants --> bifrostandwalkandclaim(the_land_of_the_giants, symbol_of_shadows_enchantment). Expected: True  Result: True

Discover kratos_is_god From ringed_temple --> bifrostandwalkanddiscover(ringed_temple, kratos_is_god). Expected: True  Result: True

See zeus from death_giants --> bifrostandwalkandseecharacters(death_giants, zeus). Expected: False  Result: False  death_giants is a character to see and has no paths to anything.

See zeus from freyas_home --> bifrostandwalkandseecharacters(freyas_home, zeus). Expected: True  Resul: True

Go from secret_chamber_of_odin to muspelheim --> advancedbifrostandwalk(secret_chamber_of_odin, muspelheim). Expected: False  Result: False  No one knows how to get to muspelheim! NO ONE!


*/



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


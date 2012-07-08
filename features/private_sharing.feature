Feature: Private sharing between a facebook and google user

Background:
  Given a LogBook exists called "Test LogBook" for game "Skyrim" and owned by "facebook_user"
  And a Section exists called "Test Section" in "Test LogBook"
  And a WorldObject exists called "Test WorldObject" in "Test Section"
  And the LogBook "Test LogBook" is marked as private
  
  And I am signed in with "google_oauth2"

Scenario: Registered users can see public LogBooks
  Given pending
  
Scenario: Registered users can see LogBooks that are shared with them
  Given pending

Scenario: Registered users cannot view a LogBook that is not shared with them
  Given pending
  
Scenario: Registered users cannot change a WorldObject in a LogBook with read-only access
  Given pending

Scenario: Registered users cannot delete a WorldObject in a LogBook with read-only access
  Given pending
  
Scenario: Registered users cannot change a Section in a LogBook with read-only access
  Given pending

Scenario: Registered users cannot delete a Section in a LogBook with read-only access
  Given pending
  
Scenario: Registered users cannot change a LogBook with read-only access
  Given pending

Scenario: Registered users cannot delete a LogBook with read-only access
  Given pending

Scenario: Registered users cannot change the list of users that have access to a LogBook that they do not own
  Given pending

Scenario: Registered users CAN change permissions on LogBooks that they own
  Given pending

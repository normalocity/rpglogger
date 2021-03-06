require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^a user named "(.*?)" with provider "(.*?)" and uid "(.*?)" exists$/ do |nickname, provider, uid|
  FactoryGirl.create(:user, nickname: nickname, provider: provider, uid: uid)
end

When /^the LogBook "(.*?)" is marked as private$/ do |title|
  @log_book = LogBook.find_by_title(title)
  @log_book.update_attribute(:is_public, false)
  @log_book.reload
end

Given /^the LogBook "(.*?)" is shared with "(.*?)" with the "(.*?)" role$/ do |log_book_title, shared_user_nickname, role|
  log_book = LogBook.find_by_title(log_book_title)
  user = User.find_by_nickname(shared_user_nickname)
  share = Share.find_or_create_by_log_book_id_and_user_id(log_book.id, user.id)
  
  share.log_book_id = log_book.id
  share.user_id = user.id
  share.role = role

  share.save
end

Given /^the LogBook "(.*?)" is NOT shared with "(.*?)"$/ do |log_book_title, not_shared_user_nickname|
  log_book = LogBook.find_by_title(log_book_title)
  user = User.find_by_nickname(not_shared_user_nickname)
  
  user.shared_log_books.delete(log_book)
end

Given /^the number of LogBooks shared with "(.*?)" with the "(.*?)" role is (\d+)$/ do |user_nickname, role, num_shared_log_books|
  User.find_by_nickname(user_nickname).shared_log_books.count.should be num_shared_log_books.to_i
end

Then /^I should see an edit WorldObject link to "(.*?)"$/ do |world_object_name|
  world_object = WorldObject.find_by_name(world_object_name)
  step "I should see a link that points to \"#{edit_section_world_object_path(world_object.section, world_object)}\""
end
Given(/^there is one list named "([^"]+)" with (\d+) closed random tasks?$/) do |listName, tasksNumber|
  list = List.create(:name => listName)

  (0...tasksNumber.to_i).each do
    task = Task.create(:title => random_task_name())
    task.close!

    list.tasks << task
  end

  list.save!
end

When(/^"([^"]+)" will be reopened$/) do |listName|
  # TODO: Pomyśl, jak ponownie otworzyć listę - zobacz w tym celu plik 'app/models/list.rb'.
end

Then(/^all tasks on "([^"]+)" should be opened$/) do |listName|
  List.where(:name => listName).first.tasks.select{ |task| task.closed }.count.should == 0
end
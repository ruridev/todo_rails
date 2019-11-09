class Todo < ApplicationRecord
  enum kinds: { important: 1 }
end

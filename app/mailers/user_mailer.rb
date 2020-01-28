class UserMailer < ApplicationMailer

  def test()

    mail(
      to: "brett@beaconguides.com",
      subject: "Testing Email"
    )

  end

end

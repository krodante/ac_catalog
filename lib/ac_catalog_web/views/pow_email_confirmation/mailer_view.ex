defmodule AcCatalogWeb.PowEmailConfirmation.MailerView do
  use AcCatalogWeb, :mailer_view

  def subject(:email_confirmation, _assigns), do: "Confirm your email address"
end

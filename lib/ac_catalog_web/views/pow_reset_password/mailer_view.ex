defmodule AcCatalogWeb.PowResetPassword.MailerView do
  use AcCatalogWeb, :mailer_view

  def subject(:reset_password, _assigns), do: "Reset password link"
end

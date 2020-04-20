defmodule AcCatalogWeb.Pow.Mailer do
  use Pow.Phoenix.Mailer
  use Bamboo.Mailer, otp_app: :ac_catalog

  require Logger

  import Bamboo.Email

  @impl true
  def cast(%{user: user, subject: subject, text: text, html: html}) do
    new_email(
      to: user.email,
      from: "animalcrossing.catalog@gmail.com",
      subject: subject,
      html_body: html,
      text_body: text
    )
  end

  @impl true
  def process(email) do
    Logger.info("E-mail sent: #{inspect email}")

    deliver_now(email)
  end
end

class Mailer < ActionMailer::Base
    def confirm_admin(order,cart)
      @subject    = 'OrderMailer#confirm'
      @body["name"] = order.guest_name
      @body["arrival_date"] =order.arrival_date
      @body["confirmation_number"] =order.confirmation_number
      @body["telephone"] =order.telephone  
      @body["items"] = order.line_items
      @body["total"] = cart.total_price
      @recipients = 'nogab@dfdsolutions.com'
      @from = 'renaissance@renaissancetoronto.com'
      @headers    = {}
    end

    def confirm_guest(order,cart)
      @subject    = 'OrderMailer#confirm'
      @body["name"] = order.guest_name
      @body["arrival_date"] =order.arrival_date
      @body["confirmation_number"] =order.confirmation_number
      @body["telephone"] =order.telephone
      @body["items"] = order.line_items
      @body["total"] = cart.total_price
      @recipients = order.email
      @from = 'renaissance@renaissancetoronto.com'
      @headers    = {}
    end

    def sent(sent_at = Time.now)
      @subject    = 'OrderMailer#sent'
      @body       = {}
      @recipients = ''
      @from       = ''
      @sent_on    = sent_at
      @headers    = {}
    end

  end


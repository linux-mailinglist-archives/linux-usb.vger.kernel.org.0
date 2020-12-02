Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 185B82CC4C7
	for <lists+linux-usb@lfdr.de>; Wed,  2 Dec 2020 19:15:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387836AbgLBSOD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Dec 2020 13:14:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:58610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387739AbgLBSOC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Dec 2020 13:14:02 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 58BBB206D5;
        Wed,  2 Dec 2020 18:13:21 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1kkWcx-00FQIv-7M; Wed, 02 Dec 2020 18:13:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 02 Dec 2020 18:13:19 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: ftdi_sio: Helpful error on GPIO attempt
In-Reply-To: <43d788c69a0f4fe3caf578b98ae72395@kernel.org>
References: <20201201141048.1461042-1-linus.walleij@linaro.org>
 <43d788c69a0f4fe3caf578b98ae72395@kernel.org>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <76a8c528f98df0797c79d870bb6587a4@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: linus.walleij@linaro.org, johan@kernel.org, linux-usb@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020-12-01 15:01, Marc Zyngier wrote:
> Hi Linus,
> 
> On 2020-12-01 14:10, Linus Walleij wrote:
>> The FTDI adapters present all potentially available GPIO
>> lines to userspace, and they are often also visibly
>> available on things like breakout boards. These are
>> appetizing targets for random GPIO tinkering such as
>> bit-banging or other industrial control over USB.
>> 
>> When a user attempts to use one of the GPIO lines, they
>> can get the opaque error -ENODEV, because the flashed
>> configuration says that the line is not in GPIO mode
>> but another alternative function.
>> 
>> We had one user run into this, debug and finally fix the
>> problem using ftx-prog.
> 
> Well, you gave me 2/3 of the solution ;-). How about adding
> a pointer to this tool? [1]
> 
>> 
>> Give the user some more helpful dmesg text and a pointer
>> to ftx-prog when the error occurs.
>> 
>> Reported-by: Marc Zyngier <maz@kernel.org>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>>  drivers/usb/serial/ftdi_sio.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/usb/serial/ftdi_sio.c 
>> b/drivers/usb/serial/ftdi_sio.c
>> index e0f4c3d9649c..405fec78f2fc 100644
>> --- a/drivers/usb/serial/ftdi_sio.c
>> +++ b/drivers/usb/serial/ftdi_sio.c
>> @@ -1841,8 +1841,11 @@ static int ftdi_gpio_request(struct gpio_chip
>> *gc, unsigned int offset)
>>  	struct ftdi_private *priv = usb_get_serial_port_data(port);
>>  	int result;
>> 
>> -	if (priv->gpio_altfunc & BIT(offset))
>> +	if (priv->gpio_altfunc & BIT(offset)) {
>> +		dev_err(&port->dev, "FTDI firmware says line is not in GPIO 
>> mode\n");
>> +		dev_err(&port->dev, "if you really know what you're doing the flash
>> can be reconfigured using ftx-prog\n");
>>  		return -ENODEV;
>> +	}
>> 
>>  	mutex_lock(&priv->gpio_lock);
>>  	if (!priv->gpio_used) {
> 
> It occurs to me that since the driver already knows which of the CBUS
> pins are unusable, we should maybe find a way to expose the line as
> "reserved", one way or another? Generic tools such as gpioinfo would
> (or should?) be able to display the status of the pin to the user.
> 
> enum gpio_v2_line_flag doesn't have a "reserved" flag, so maybe
> GPIO_V2_LINE_FLAG_USED is an adequate way to mark the line as
> being unavailable for userspace?

And to clarify what I mean, here's a patchlet that does the trick.

maz@tiger-roach:~$ sudo gpioinfo gpiochip3
gpiochip3 - 4 lines:
	line   0:      unnamed       unused  output  active-high
	line   1:      "AltFunc"     kernel  input   active-high [used]
	line   2:      "AltFunc"     kernel  input   active-high [used]
	line   3:      "AltFunc"     kernel  input   active-high [used]

It at least make clear that you can't grab the GPIO. Of course, you
don't get the message that you just added...

Thoughts?

         M.

diff --git a/drivers/usb/serial/ftdi_sio.c 
b/drivers/usb/serial/ftdi_sio.c
index e0f4c3d9649c..00da3f42139f 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -44,6 +44,8 @@
  #include "ftdi_sio.h"
  #include "ftdi_sio_ids.h"

+#include "../../gpio/gpiolib.h"
+
  #define DRIVER_AUTHOR "Greg Kroah-Hartman <greg@kroah.com>, Bill Ryder 
<bryder@sgi.com>, Kuba Ober <kuba@mareimbrium.org>, Andreas Mohr, Johan 
Hovold <jhovold@gmail.com>"
  #define DRIVER_DESC "USB FTDI Serial Converters Driver"

@@ -2143,11 +2145,13 @@ static int ftdi_gpio_init_ftx(struct 
usb_serial_port *port)
  	return result;
  }

+static const char *altfunc = "AltFunc";
+
  static int ftdi_gpio_init(struct usb_serial_port *port)
  {
  	struct ftdi_private *priv = usb_get_serial_port_data(port);
  	struct usb_serial *serial = port->serial;
-	int result;
+	int result, i;

  	switch (priv->chip_type) {
  	case FT232H:
@@ -2183,10 +2187,23 @@ static int ftdi_gpio_init(struct usb_serial_port 
*port)
  	priv->gc.can_sleep = true;

  	result = gpiochip_add_data(&priv->gc, port);
-	if (!result)
-		priv->gpio_registered = true;
+	if (result)
+		return result;

-	return result;
+	priv->gpio_registered = true;
+
+	for (i = 0; i < priv->gc.ngpio; i++) {
+		struct gpio_desc *desc;
+
+		if (!(priv->gpio_altfunc & BIT(i)))
+			continue;
+
+		desc = gpiochip_get_desc(&priv->gc, i);
+		desc->flags |= BIT(FLAG_REQUESTED);
+		desc->name = altfunc;
+	}
+
+	return 0;
  }

  static void ftdi_gpio_remove(struct usb_serial_port *port)

-- 
Jazz is not dead. It just smells funny...

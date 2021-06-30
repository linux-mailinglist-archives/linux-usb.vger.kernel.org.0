Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 328D23B808C
	for <lists+linux-usb@lfdr.de>; Wed, 30 Jun 2021 12:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233994AbhF3KIa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Jun 2021 06:08:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:40688 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233954AbhF3KI3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 30 Jun 2021 06:08:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 41A61611CE;
        Wed, 30 Jun 2021 10:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625047561;
        bh=4bVaVq2RW0tAQ/r22NkCWzOP2yVyJCoEZvtctw0YhOc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kJHFBiQBq/wpd/iDkYzYEgZiuvXaZeQuxUx8/MP8WHjdi5JmnNUz1bhAfdxrLaxxA
         TdKRiVxV3wdEUQvh/BE4Ahxf0ybhS7ih2cZT5dmXbT8d6V7ParwixNXa9mTb5vk1Wr
         WXl9jsemfkjY3vIKvCTPSyU9ueeanLNnUo6od1mo1Po6W5nuqXoqIa1YQgCBNYTYv+
         QAYm7MyPk0Nsb6sHZVQrJGCYP7OOCySa7QUZU1hG8Wxp57txElL5NTL9v12417dDQv
         ABAEN4olrUt9mT/YCNYfIwd1lyfUUNBzT5GmGLYPacSNSD416uZkqA8L7CDpiT/qoz
         OmWc0xNHuPypw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lyX6U-0002B4-2Z; Wed, 30 Jun 2021 12:05:58 +0200
Date:   Wed, 30 Jun 2021 12:05:58 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Tung Pham <Tung.Pham@silabs.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Pho Tran <Pho.Tran@silabs.com>,
        Hung Nguyen <Hung.Nguyen@silabs.com>, linux-usb@vger.kernel.org
Subject: Re: patch "USB: serial: cp210x: add support for GPIOs on CP2108"
 added to usb-next
Message-ID: <YNxCBreFm7uisstJ@hovoldconsulting.com>
References: <1624532158188214@kroah.com>
 <PH0PR11MB4888B9D24A5F90E8AA02B28B81019@PH0PR11MB4888.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR11MB4888B9D24A5F90E8AA02B28B81019@PH0PR11MB4888.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Tung,

On Wed, Jun 30, 2021 at 08:58:29AM +0000, Tung Pham wrote:

First, thanks for testing the patch.

Please make sure to CC the usb list when reporting problems. I've added
it to CC now.

> When I test the apply patch with Linux kernel.
> https://github.com/torvalds/linux/blob/master/drivers/usb/serial/cp210x.c
> 
> when I setting the CP2108 with GPIO 0 and GPIO 1 are alternative
> functions (not GPIO) using simplicity studio.
> And then test with the driver, it shows:
> root@ubuntu:/sys/class/gpio# ls
> export  gpiochip496  unexport
> root@ubuntu:/sys/class/gpio# echo 496 > /sys/class/gpio/export
> bash: echo: write error: No such device
> root@ubuntu:/sys/class/gpio# echo 497 > /sys/class/gpio/export
> bash: echo: write error: No such device
> This is what we expected because the GPIO 0 and GPIO 1 are alternative
> functions (not GPIO).

Are you sure you're using the latest mainline kernel here, that is,
5.13 here?

With recent kernel's you would not see -ENODEV ("No such device") but
rather -EINVAL ("Invalid argument").

What does "uname -a" say?

And which version of the patch are you applying? Are you sure it's the
latest?

> But when I test the branch of Mr Gregkh. 
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/tree/drivers/usb/serial/cp210x.c?h=usb-testing
> when I setting the CP2108 with GPIO 0 and GPIO 1 are alternative
> functions (not GPIO) using simplicity studio.
> And then test with the driver, it shows:
> root@ubuntu:/sys/class/gpio# ls
> export  gpiochip496  unexport
> root@ubuntu:/sys/class/gpio# echo 496 > /sys/class/gpio/export
> root@ubuntu:/sys/class/gpio# echo 497 > /sys/class/gpio/export
> That mean it still use GPIO 0 and GPIO 1 as GPIO functions.

It does seem that way, but to be sure, do the 

	/sys/class/gpio/gpio496
	/sys/class/gpio/gpio497

directories show up as well?
	
> I don't know why there is that different. We can discuss more if you
> know the information.

I just did a quick test using the code in the usb-next (testing) branch
and it seems to work as expected when hard-coding alternate functions
for some of the pins in the driver.

I did not actually reprogram the device so perhaps something is broken
with regards to reading the port configuration. But then you should see
the problem if you apply the patch to an earlier kernel as well.

Can you apply the below patch on top of Greg's usb-next (or usb-testing)
branch and send me the logs from when connecting the device?

Johan


From 4ac38b282cfa1e6a17ff9d11b886cbebce3b9654 Mon Sep 17 00:00:00 2001
From: Johan Hovold <johan@kernel.org>
Date: Wed, 30 Jun 2021 11:59:28 +0200
Subject: [PATCH] dbg: USB: serial: cp210x: dump CP2108 alternate function
 config

---
 drivers/usb/serial/cp210x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index 09b845d0da41..1628ea1e9948 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -1797,6 +1797,9 @@ static int cp2108_gpio_init(struct usb_serial *serial)
 	if (result < 0)
 		return result;
 
+	dev_info(&serial->interface->dev, "%s - %*ph\n", __func__,
+			4, config.enhancedfxn_ifc);
+
 	priv->gc.ngpio = 16;
 	priv->gpio_pushpull = le16_to_cpu(config.reset_state.gpio_mode_pb1);
 	gpio_latch = le16_to_cpu(config.reset_state.gpio_latch_pb1);
-- 
2.31.1


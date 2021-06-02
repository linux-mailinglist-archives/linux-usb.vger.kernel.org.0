Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0F9F398D75
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jun 2021 16:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbhFBOwA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Jun 2021 10:52:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:33658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230029AbhFBOv7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Jun 2021 10:51:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7BBAD613AD;
        Wed,  2 Jun 2021 14:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622645416;
        bh=D8cAd+v7MkxZGzw3Q4cEM5LVJzrj1JXIDRgnHT4GZ44=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gu/0xxkAzos6N/3Kq+4Ou9WtEMt2RgTIyQHCv/ZnMA9/V1/DKu6rybT/VX+FJbVJL
         RPcJ9D4dz0UE1je5Wun4G2DwrGZCMPkW7XzmPAuJdMgwDulD5qqdWTijoSiuyWMeaN
         0me2UaLBxHBZ0prX9mL2OSIb5lJGjuyJgmN5jdExx/tV/TL9kvEBuz42pgiokQswU4
         aj6bHnxAhFWB5hXxqwlR50rZxLBEvDjC06r0lHQdQ+po9Jrh7YEldNBvGL2P6t8hBj
         xW4HOOcoGrouhJfh2MAzEKojJOpZy4jQKLw217nC2iLouDE6G27xN2ErjxRuJFa0aH
         fcOWohv4DCobA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1loSCD-00074y-Rd; Wed, 02 Jun 2021 16:50:14 +0200
Date:   Wed, 2 Jun 2021 16:50:13 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alex =?utf-8?B?VmlsbGFjw61z?= Lasso <a_villacis@palosanto.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: cp210x module broken in 5.12.5 and 5.12.6, works in 5.11.21
 (with bisection)
Message-ID: <YLeapcNbvExeGKuE@hovoldconsulting.com>
References: <465ef3ac-4291-6392-e52b-26cc0c34dd7c@palosanto.com>
 <YLXmrmW9/fB1WbzR@hovoldconsulting.com>
 <2881bd97-f790-c4d6-aed6-de9ab8cd1a9e@palosanto.com>
 <YLZVAmYxFZ1Q/nrH@hovoldconsulting.com>
 <60705932-860a-701c-1019-16f9e16c39dd@palosanto.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <60705932-860a-701c-1019-16f9e16c39dd@palosanto.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 01, 2021 at 12:18:27PM -0500, Alex Villacís Lasso wrote:
> El 1/6/21 a las 10:40, Johan Hovold escribió:

> > Could you try applying the below patch, and with debugging enabled
> >
> > 	1. plug the device in
> > 	2. start the terminal program
> >
> > and then send me the logs?
> >
> > This should show the current device settings which appear to have flow
> > control enabled (which the driver fails to disable).

Thanks again for the log.

> $ miniterm.py /dev/ttyUSB0 115200
> Traceback (most recent call last):
>    File "/usr/bin/miniterm.py", line 976, in <module>
>      main()
>    File "/usr/bin/miniterm.py", line 932, in main
>      serial_instance.open()
>    File "/usr/lib/python3.9/site-packages/serial/serialposix.py", line 
> 288, in open
>      self._update_rts_state()
>    File "/usr/lib/python3.9/site-packages/serial/serialposix.py", line 
> 627, in _update_rts_state
>      fcntl.ioctl(self.fd, TIOCMBIS, TIOCM_RTS_str)
> BrokenPipeError: [Errno 32] Broken pipe
> 
> jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_change_speed - setting baud rate to 9600
> jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_set_flow_control - ctrl = 0x00, flow = 0x00

So the default device settings are the same as for my device and
hardware flow control is disabled.

> jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_set_flow_control - xon_limit = 0, xoff_limit = 0

Defaults to zero here too.

> jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_set_flow_control - ctrl = 0x00, flow = 0x01

Here IXON is enabled (default termios), but the IXOFF limits are also
updated to 128/128.

> jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_tiocmset_port - control = 0x0303
> jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
> 0x7 status: -32

And the next SET_MHS (modem handshaking) request fails (for RTS, as can
be seen below).

> jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_change_speed - setting baud rate to 115384
> jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_set_flow_control - ctrl = 0x00, flow = 0x01

The requested settings appear to have taken effect.

> jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_set_flow_control - xon_limit = 128, xoff_limit = 128

And the limits have been updated.

> jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_set_flow_control - ctrl = 0x01, flow = 0x40

Here DTR and RTS are asserted, and flow control disabled.

> jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_tiocmset_port - control = 0x0101

DTR can still be changed.

> jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_tiocmset_port - control = 0x0202
> jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
> 0x7 status: -32

But RTS cannot be changed, just as if auto-RTS is enabled (even if it is
not reported back).

This may be a little far-fetched but can you send me the logs (debugging
again enabled) from when:

	1. plugging the device in
	2. stty -F /dev/ttyUSB0 ixon ixoff
	3. stty -F /dev/ttyUSB0 crtscts -ixon -ixoff
	4. cat /dev/ttyUSB0	# + CTRL-C

No need to run the terminal program.

If you could also apply the below debugging patch (on top of the
previous one) which will dump some device settings during probe before
doing the above that would be great.

Hopefully this will gives some more clues but otherwise I'll probably
just leave the default IXOFF limits for CP2102N to fix the regression.

Johan


From 65b53f408b5d6b6408420ed9d1c827f80401796e Mon Sep 17 00:00:00 2001
From: Johan Hovold <johan@kernel.org>
Date: Wed, 2 Jun 2021 16:23:21 +0200
Subject: [PATCH] USB: serial: cp210x: dump communication properties

---
 drivers/usb/serial/cp210x.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index 89da00de9739..f5c9e21538f8 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -1843,6 +1843,37 @@ static void cp210x_gpio_remove(struct usb_serial *serial)
 
 #endif
 
+static void cp210x_dump_props(struct usb_serial_port *port)
+{
+	struct usb_device *udev = port->serial->dev;
+	void *buf;
+	int ret;
+
+	buf = kzalloc(256, GFP_KERNEL);
+	if (!buf)
+		return;
+
+	ret = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
+			CP210X_GET_PROPS, REQTYPE_INTERFACE_TO_HOST, 0,
+			cp210x_interface_num(port->serial), buf, 256,
+			USB_CTRL_GET_TIMEOUT);
+	if (ret < 52) {
+		dev_err(&port->dev, "failed to get props: %d\n", ret);
+		goto out;
+	}
+
+	dev_dbg(&port->dev, "wLength = %u\n", le16_to_cpup(buf));
+	dev_dbg(&port->dev, "ulMaxTxQueue = %u\n", le32_to_cpup(buf + 12));
+	dev_dbg(&port->dev, "ulMaxRxQueue = %u\n", le32_to_cpup(buf + 16));
+	dev_dbg(&port->dev, "ulProvSubType = %u\n", le32_to_cpup(buf + 24));
+	dev_dbg(&port->dev, "ulProvCapabilities = 0x%02x\n", le32_to_cpup(buf + 28));
+	dev_dbg(&port->dev, "ulSettableParams = 0x%02x\n", le32_to_cpup(buf + 32));
+	dev_dbg(&port->dev, "ulCurrentTx-Queue = %u\n", le32_to_cpup(buf + 44));
+	dev_dbg(&port->dev, "ulCurrentRx-Queue = %u\n", le32_to_cpup(buf + 48));
+out:
+	kfree(buf);
+}
+
 static int cp210x_port_probe(struct usb_serial_port *port)
 {
 	struct usb_serial *serial = port->serial;
@@ -1857,6 +1888,8 @@ static int cp210x_port_probe(struct usb_serial_port *port)
 
 	usb_set_serial_port_data(port, port_priv);
 
+	cp210x_dump_props(port);
+
 	return 0;
 }
 
-- 
2.31.1


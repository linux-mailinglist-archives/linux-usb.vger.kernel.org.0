Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9149E202CAB
	for <lists+linux-usb@lfdr.de>; Sun, 21 Jun 2020 22:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730650AbgFUUVP convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 21 Jun 2020 16:21:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730601AbgFUUVP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Jun 2020 16:21:15 -0400
Received: from smtp2.hosting90.cz (smtp2.hosting90.cz [IPv6:2a03:b780:1:0:216:3eff:fe00:24c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BA88C061794
        for <linux-usb@vger.kernel.org>; Sun, 21 Jun 2020 13:21:14 -0700 (PDT)
Received: from [46.229.122.58] (helo=[10.10.0.107])
        by smtp2.hosting90.cz with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <Jerry@jrr.cz>)
        id 1jn6Sl-0006rs-KH; Sun, 21 Jun 2020 22:21:12 +0200
Subject: [PATCH v3] usbserial: cp210x - icount support for parity error
 checking
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>
References: <b4cd2557-9a61-5ccd-32ad-48b0c68bef6b@jrr.cz>
 <20200621085816.GB95977@kroah.com>
 <03712b5a-ecb6-ae42-ff8e-8d5d6f2ed918@jrr.cz>
 <20200621095509.GA120230@kroah.com>
 <470484c8-7afc-c593-5ca9-cdb97dba39e1@jrr.cz>
 <20200621135838.GA125568@kroah.com>
From:   =?UTF-8?B?SmFyb23DrXIgxaBrb3JwaWw=?= <Jerry@jrr.cz>
Message-ID: <7bdff86f-0988-2afc-e1a6-35df2931fd5b@jrr.cz>
Date:   Sun, 21 Jun 2020 22:21:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 SeaMonkey/2.53.2
MIME-Version: 1.0
In-Reply-To: <20200621135838.GA125568@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
X-Antivirus: Clamav/CLEAN
X-Scan-Signature: f26a41e88ab709faaaec3d943cd8929d
X-Authenticated-Id: jerry@jrr.cz
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The current version of cp210x driver doesn't provide any way to detect
a parity error in received data from userspace. Some serial protocols like
STM32 bootloader protect data only by parity so application needs to
know whether parity error happened to repeat peripheral data reading.

Added support for icount (ioctl TIOCGICOUNT) which sends GET_COMM_STATUS
command to CP210X and according received flags increments fields for
parity error, frame error, break and overrun. An application can detect
an error condition after reading data from ttyUSB and reacts adequately.
There is no impact for applications which don't call ioctl TIOCGICOUNT.

The flag "hardware overrun" is not examined because CP2102 sets this bit
for the first received byte after openning of port which was previously
closed with some unreaded data in buffer. This is confusing and checking
"queue overrun" flag seems be enough.

Signed-off-by: Jaromír Škorpil <Jerry@jrr.cz>
---
v2: Simplified counting - only queue overrun checked
v3: Changed description + UTF-8 name  ;-)

  cp210x.c |   42 +++++++++++++++++++++++++++++++++++++-----
  1 file changed, 37 insertions(+), 5 deletions(-)

diff -up linux-5.8-rc1/drivers/usb/serial/cp210x.c j/drivers/usb/serial/cp210x.c
--- linux-5.8-rc1/drivers/usb/serial/cp210x.c
+++ j/drivers/usb/serial/cp210x.c
@@ -43,6 +43,8 @@ static int cp210x_tiocmget(struct tty_st
  static int cp210x_tiocmset(struct tty_struct *, unsigned int, unsigned int);
  static int cp210x_tiocmset_port(struct usb_serial_port *port,
  		unsigned int, unsigned int);
+static int cp210x_get_icount(struct tty_struct *tty,
+		struct serial_icounter_struct *icount);
  static void cp210x_break_ctl(struct tty_struct *, int);
  static int cp210x_attach(struct usb_serial *);
  static void cp210x_disconnect(struct usb_serial *);
@@ -274,6 +276,7 @@ static struct usb_serial_driver cp210x_d
  	.tx_empty		= cp210x_tx_empty,
  	.tiocmget		= cp210x_tiocmget,
  	.tiocmset		= cp210x_tiocmset,
+	.get_icount		= cp210x_get_icount,
  	.attach			= cp210x_attach,
  	.disconnect		= cp210x_disconnect,
  	.release		= cp210x_release,
@@ -393,6 +396,13 @@ struct cp210x_comm_status {
  	u8       bReserved;
  } __packed;
  
+/* cp210x_comm_status::ulErrors */
+#define CP210X_SERIAL_ERR_BREAK	BIT(0)
+#define CP210X_SERIAL_ERR_FRAME	BIT(1)
+#define CP210X_SERIAL_ERR_HW_OVERRUN	BIT(2)
+#define CP210X_SERIAL_ERR_QUEUE_OVERRUN	BIT(3)
+#define CP210X_SERIAL_ERR_PARITY	BIT(4)
+
  /*
   * CP210X_PURGE - 16 bits passed in wValue of USB request.
   * SiLabs app note AN571 gives a strange description of the 4 bits:
@@ -836,10 +846,10 @@ static void cp210x_close(struct usb_seri
  }
  
  /*
- * Read how many bytes are waiting in the TX queue.
+ * Read how many bytes are waiting in the TX queue and update error counters.
   */
-static int cp210x_get_tx_queue_byte_count(struct usb_serial_port *port,
-		u32 *count)
+static int cp210x_get_comm_status(struct usb_serial_port *port,
+		u32 *tx_count)
  {
  	struct usb_serial *serial = port->serial;
  	struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
@@ -855,7 +865,16 @@ static int cp210x_get_tx_queue_byte_coun
  			0, port_priv->bInterfaceNumber, sts, sizeof(*sts),
  			USB_CTRL_GET_TIMEOUT);
  	if (result == sizeof(*sts)) {
-		*count = le32_to_cpu(sts->ulAmountInOutQueue);
+		if (tx_count)
+			*tx_count = le32_to_cpu(sts->ulAmountInOutQueue);
+		if (sts->ulErrors & CP210X_SERIAL_ERR_BREAK)
+			port->icount.brk++;
+		if (sts->ulErrors & CP210X_SERIAL_ERR_FRAME)
+			port->icount.frame++;
+		if (sts->ulErrors & CP210X_SERIAL_ERR_QUEUE_OVERRUN)
+			port->icount.overrun++;
+		if (sts->ulErrors & CP210X_SERIAL_ERR_PARITY)
+			port->icount.parity++;
  		result = 0;
  	} else {
  		dev_err(&port->dev, "failed to get comm status: %d\n", result);
@@ -873,13 +892,26 @@ static bool cp210x_tx_empty(struct usb_s
  	int err;
  	u32 count;
  
-	err = cp210x_get_tx_queue_byte_count(port, &count);
+	err = cp210x_get_comm_status(port, &count);
  	if (err)
  		return true;
  
  	return !count;
  }
  
+static int cp210x_get_icount(struct tty_struct *tty,
+		struct serial_icounter_struct *icount)
+{
+	struct usb_serial_port *port = tty->driver_data;
+	int result;
+
+	result = cp210x_get_comm_status(port, NULL);
+	if (result)
+		return result;
+
+	return usb_serial_generic_get_icount(tty, icount);
+}
+
  /*
   * cp210x_get_termios
   * Reads the baud rate, data bits, parity, stop bits and flow control mode




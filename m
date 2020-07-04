Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81C302147E7
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jul 2020 20:25:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726895AbgGDSZI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Jul 2020 14:25:08 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:42039 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbgGDSZI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 4 Jul 2020 14:25:08 -0400
X-Originating-IP: 81.6.44.16
Received: from [172.22.0.20] (unknown [81.6.44.16])
        (Authenticated sender: hansmi@hansmi.ch)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id BF82960007;
        Sat,  4 Jul 2020 18:25:03 +0000 (UTC)
From:   Michael Hanselmann <public@hansmi.ch>
Subject: Re: [PATCH v2 6/6] USB: serial: ch341: Simulate break condition if
 not supported
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
References: <cover.1585697281.git.public@hansmi.ch>
 <91bacfa4097350b4731724f5820e06bc03e7e8f3.1585697281.git.public@hansmi.ch>
 <20200514144721.GG25962@localhost>
 <6e29707b-6774-9f25-25ac-4b4cd202a017@msgid.hansmi.ch>
 <20200630113906.GA3334@localhost>
X-Hello-World:  This header intentionally left blank
Message-ID: <f34a9b6e-ec2a-0873-e97b-2d5b2170e2ff@msgid.hansmi.ch>
Date:   Sat, 4 Jul 2020 20:25:03 +0200
MIME-Version: 1.0
In-Reply-To: <20200630113906.GA3334@localhost>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 30.06.20 13:39, Johan Hovold wrote:
> On Thu, May 28, 2020 at 12:21:11AM +0200, Michael Hanselmann wrote:
>> +		r = ch341_set_baudrate_lcr(port->serial->dev, priv,
>> +			CH341_MIN_BPS,
>> +			CH341_LCR_ENABLE_RX | CH341_LCR_ENABLE_TX |
>> +			CH341_LCR_CS8);
> 
> Continuation lines should be indented at least two tabs further.
> 
> And let's just merge the last two lines.

Done.

>> +		/*
>> +		 * Compute how long transmission will take and add a bit of
>> +		 * safety margin.
>> +		 */
> 
> Where's that margin?

That wasn't obvious indeed. It's the 10 instead of 9 in the calculation.
Updated the comment: "[…] and add a single bit of safety margin (the
actual transmission is 8 bits plus one stop bit)."

>> +		priv->break_end = jiffies + (10 * HZ / CH341_MIN_BPS);
>> +
>> +		return;
>> +	}
>> +
>> +	dev_dbg(&port->dev, "leave break state requested\n");
>> +
>> +	if (time_before(jiffies, priv->break_end)) {
>> +		/*
>> +		 * Wait until NUL byte is written and limit delay to one second
>> +		 * at most.
>> +		 */
> 
> So you could still be preempted here so that delay would wrap. Just
> store jiffies in a "now" temporary before the conditional?

Done, thank you for the suggestion.

>> +	if (priv->quirks & CH341_QUIRK_SIMULATE_BREAK) {
>> +		dev_warn_once(&port->dev,
>> +			      "hardware doesn't support real break condition, simulating instead\n");
> 
> This should probably be moved to probe and quirk_detect() and be a
> dev_info (e.g. consider having two of these devices in a system).

Done.

Updated patch included below.

Michael

---
From 41b8b06d343a69541a357d8c9d6d0fe3f22610d6 Mon Sep 17 00:00:00 2001
Message-Id: <41b8b06d343a69541a357d8c9d6d0fe3f22610d6.1593887001.git.public@hansmi.ch>
From: Michael Hanselmann <public@hansmi.ch>
Date: Thu, 5 Mar 2020 01:50:35 +0100
Subject: [PATCH] USB: serial: ch341: Simulate break condition if not supported

A subset of all CH341 devices don't support a real break condition. This
fact is already used in the "ch341_detect_quirks" function. With this
change a quirk is implemented to simulate a break condition by
temporarily lowering the baud rate and sending a NUL byte.

The primary drawbacks of this approach are that the duration of the
break can't be controlled by userland and that data incoming during
a simulated break is corrupted.

The "TTY_DRIVER_HARDWARE_BREAK" serial driver flag was investigated as
an alternative. It's a driver-wide flag and would've required
significant changes to the serial and USB-serial driver frameworks to
expose it for individual USB-serial adapters.

Tested by sending a break condition and watching the TX pin using an
oscilloscope.

Signed-off-by: Michael Hanselmann <public@hansmi.ch>
---
 drivers/usb/serial/ch341.c | 101 +++++++++++++++++++++++++++++++++----
 1 file changed, 92 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index 55a1c6dbeeb2..0cb02d1bde02 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -78,6 +78,7 @@
 #define CH341_LCR_CS5          0x00
 
 #define CH341_QUIRK_LIMITED_PRESCALER	BIT(0)
+#define CH341_QUIRK_SIMULATE_BREAK	BIT(1)
 
 static const struct usb_device_id id_table[] = {
 	{ USB_DEVICE(0x4348, 0x5523) },
@@ -94,6 +95,7 @@ struct ch341_private {
 	u8 msr;
 	u8 lcr;
 	unsigned long quirks;
+	unsigned long break_end;
 };
 
 static void ch341_set_termios(struct tty_struct *tty,
@@ -170,10 +172,9 @@ static const speed_t ch341_min_rates[] = {
  *		2 <= div <= 256 if fact = 0, or
  *		9 <= div <= 256 if fact = 1
  */
-static int ch341_get_divisor(struct ch341_private *priv)
+static int ch341_get_divisor(struct ch341_private *priv, speed_t speed)
 {
 	unsigned int fact, div, clk_div;
-	speed_t speed = priv->baud_rate;
 	bool force_fact0 = false;
 	int ps;
 
@@ -236,15 +237,16 @@ static int ch341_get_divisor(struct ch341_private *priv)
 }
 
 static int ch341_set_baudrate_lcr(struct usb_device *dev,
-				  struct ch341_private *priv, u8 lcr)
+				  struct ch341_private *priv,
+				  speed_t baud_rate, u8 lcr)
 {
 	int val;
 	int r;
 
-	if (!priv->baud_rate)
+	if (!baud_rate)
 		return -EINVAL;
 
-	val = ch341_get_divisor(priv);
+	val = ch341_get_divisor(priv, baud_rate);
 	if (val < 0)
 		return -EINVAL;
 
@@ -324,7 +326,7 @@ static int ch341_configure(struct usb_device *dev, struct ch341_private *priv)
 	if (r < 0)
 		goto out;
 
-	r = ch341_set_baudrate_lcr(dev, priv, priv->lcr);
+	r = ch341_set_baudrate_lcr(dev, priv, priv->baud_rate, priv->lcr);
 	if (r < 0)
 		goto out;
 
@@ -357,8 +359,8 @@ static int ch341_detect_quirks(struct usb_serial_port *port)
 			    USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
 			    CH341_REG_BREAK, 0, buffer, size, DEFAULT_TIMEOUT);
 	if (r == -EPIPE) {
-		dev_dbg(&port->dev, "break control not supported\n");
-		quirks = CH341_QUIRK_LIMITED_PRESCALER;
+		dev_info(&port->dev, "hardware doesn't support real break condition, using simulation instead\n");
+		quirks = CH341_QUIRK_LIMITED_PRESCALER | CH341_QUIRK_SIMULATE_BREAK;
 		r = 0;
 		goto out;
 	}
@@ -539,7 +541,8 @@ static void ch341_set_termios(struct tty_struct *tty,
 	if (baud_rate) {
 		priv->baud_rate = baud_rate;
 
-		r = ch341_set_baudrate_lcr(port->serial->dev, priv, lcr);
+		r = ch341_set_baudrate_lcr(port->serial->dev, priv,
+					   priv->baud_rate, lcr);
 		if (r < 0 && old_termios) {
 			priv->baud_rate = tty_termios_baud_rate(old_termios);
 			tty_termios_copy_hw(&tty->termios, old_termios);
@@ -558,15 +561,95 @@ static void ch341_set_termios(struct tty_struct *tty,
 	ch341_set_handshake(port->serial->dev, priv->mcr);
 }
 
+/*
+ * A subset of all CH34x devices don't support a real break condition and
+ * reading CH341_REG_BREAK fails (see also ch341_detect_quirks). This function
+ * simulates a break condition by lowering the baud rate to the minimum
+ * supported by the hardware upon enabling the break condition and sending
+ * a NUL byte.
+ *
+ * Incoming data is corrupted while the break condition is being simulated.
+ *
+ * Normally the duration of the break condition can be controlled individually
+ * by userspace using TIOCSBRK and TIOCCBRK or by passing an argument to
+ * TCSBRKP. Due to how the simulation is implemented the duration can't be
+ * controlled. The duration is always about (1s / 46bd * 9bit) = 196ms.
+ */
+static void ch341_simulate_break(struct tty_struct *tty, int break_state)
+{
+	struct usb_serial_port *port = tty->driver_data;
+	struct ch341_private *priv = usb_get_serial_port_data(port);
+	unsigned long now, delay;
+	int r;
+
+	if (break_state != 0) {
+		dev_dbg(&port->dev, "enter break state requested\n");
+
+		r = ch341_set_baudrate_lcr(port->serial->dev, priv, CH341_MIN_BPS,
+					CH341_LCR_ENABLE_RX | CH341_LCR_ENABLE_TX | CH341_LCR_CS8);
+		if (r < 0) {
+			dev_err(&port->dev,
+				"failed to change baud rate to %u: %d\n",
+				CH341_MIN_BPS, r);
+			goto restore;
+		}
+
+		r = tty_put_char(tty, '\0');
+		if (r < 0) {
+			dev_err(&port->dev,
+				"failed to write NUL byte for simulated break condition: %d\n",
+				r);
+			goto restore;
+		}
+
+		/*
+		 * Compute expected transmission duration and add a single bit
+		 * of safety margin (the actual NUL byte transmission is 8 bits
+		 * plus one stop bit).
+		 */
+		priv->break_end = jiffies + (10 * HZ / CH341_MIN_BPS);
+
+		return;
+	}
+
+	dev_dbg(&port->dev, "leave break state requested\n");
+
+	now = jiffies;
+
+	if (time_before(now, priv->break_end)) {
+		/* Wait until NUL byte is written */
+		delay = priv->break_end - now;
+		dev_dbg(&port->dev,
+			"wait %d ms while transmitting NUL byte at %u baud\n",
+			jiffies_to_msecs(delay), CH341_MIN_BPS);
+		schedule_timeout_interruptible(delay);
+	}
+
+restore:
+	/* Restore original baud rate */
+	r = ch341_set_baudrate_lcr(port->serial->dev, priv, priv->baud_rate,
+				   priv->lcr);
+	if (r < 0)
+		dev_err(&port->dev,
+			"restoring original baud rate of %u failed: %d\n",
+			priv->baud_rate, r);
+}
+
 static void ch341_break_ctl(struct tty_struct *tty, int break_state)
 {
 	const uint16_t ch341_break_reg =
 			((uint16_t) CH341_REG_LCR << 8) | CH341_REG_BREAK;
 	struct usb_serial_port *port = tty->driver_data;
+	struct ch341_private *priv = usb_get_serial_port_data(port);
 	int r;
 	uint16_t reg_contents;
 	uint8_t *break_reg;
 
+	if (priv->quirks & CH341_QUIRK_SIMULATE_BREAK) {
+		ch341_simulate_break(tty, break_state);
+		return;
+	}
+
 	break_reg = kmalloc(2, GFP_KERNEL);
 	if (!break_reg)
 		return;
-- 
2.20.1

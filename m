Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B19F917C5D3
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2020 20:00:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbgCFTA6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Mar 2020 14:00:58 -0500
Received: from mail-gateway-shared14.cyon.net ([194.126.200.67]:49996 "EHLO
        mail-gateway-shared14.cyon.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726781AbgCFTA6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Mar 2020 14:00:58 -0500
Received: from s013.cyon.net ([149.126.4.22])
        by mail-gateway-shared14.cyon.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim)
        (envelope-from <public+bounce-silo.slz.hanselmann.tv-hansmi@hansmi.ch>)
        id 1jAIDN-0003jF-Dg
        for linux-usb@vger.kernel.org; Fri, 06 Mar 2020 20:00:55 +0100
Received: from [10.20.10.231] (port=58938 helo=mail.cyon.ch)
        by s013.cyon.net with esmtpa (Exim 4.92)
        (envelope-from <public+bounce-silo.slz.hanselmann.tv-hansmi@hansmi.ch>)
        id 1jAIDM-00A74m-7k; Fri, 06 Mar 2020 20:00:52 +0100
Received: from hansmi by silo.slz.hanselmann.tv with local (Exim 4.92)
        (envelope-from <hansmi@silo.slz.hanselmann.tv>)
        id 1jAIDL-00061U-UI; Fri, 06 Mar 2020 19:00:51 +0000
From:   Michael Hanselmann <public@hansmi.ch>
To:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Cc:     Michael Hanselmann <public@hansmi.ch>,
        Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
Subject: [PATCH 4/4] ch341: Simulate break condition on HL340 variant
Date:   Fri,  6 Mar 2020 19:00:45 +0000
Message-Id: <5da11e2b99cbf37bf741addbc4c28b9f3658efa2.1583520568.git.public@hansmi.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1583520568.git.public@hansmi.ch>
References: <cover.1583520568.git.public@hansmi.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - s013.cyon.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - hansmi.ch
X-Get-Message-Sender-Via: s013.cyon.net: authenticated_id: mailrelay-cervus@hansmi.ch
X-Authenticated-Sender: s013.cyon.net: mailrelay-cervus@hansmi.ch
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-OutGoing-Spam-Status: No, score=-1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

ch34x devices of the "HL340" variant don't support a real break
condition. This fact is already used in the ch341_detect_hl340 function.
With this change a quirk is implemented to simulate a break condition by
temporarily lowering the baud rate and sending a NUL byte.

The primary drawback of this approach is that the duration of the break
can't be controlled by userland.

Signed-off-by: Michael Hanselmann <public@hansmi.ch>
---
 drivers/usb/serial/ch341.c | 102 +++++++++++++++++++++++++++++++++----
 1 file changed, 91 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index 48a704174aec..459a27a6ebcc 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -25,6 +25,10 @@
 #define DEFAULT_TIMEOUT   1000
 
 #define CH341_QUIRK_LIMITED_PRESCALER 0x01
+#define CH341_QUIRK_SIMULATE_BREAK    0x02
+
+/* Minimum baud rate */
+#define CH341_MIN_BPS 46U
 
 /* flags for IO-Bits */
 #define CH341_BIT_RTS (1 << 6)
@@ -92,6 +96,7 @@ struct ch341_private {
 	u8 msr;
 	u8 lcr;
 	u8 flags;
+	unsigned long break_end;
 };
 
 static void ch341_set_termios(struct tty_struct *tty,
@@ -170,20 +175,17 @@ static const speed_t ch341_min_rates[] = {
  *		2 <= div <= 256 if fact = 0, or
  *		9 <= div <= 256 if fact = 1
  */
-static int ch341_get_divisor(struct ch341_private *priv)
+static int ch341_get_divisor(struct ch341_private *priv, speed_t speed)
 {
 	const speed_t *min_rates;
-	speed_t speed;
 	unsigned int fact, div, clk_div;
 	int ps;
 
-	speed = priv->baud_rate;
-
 	/*
 	 * Clamp to supported range, this makes the (ps < 0) and (div < 2)
 	 * sanity checks below redundant.
 	 */
-	speed = clamp(speed, 46U, 3000000U);
+	speed = clamp(speed, CH341_MIN_BPS, 3000000U);
 
 	if (priv->flags & CH341_QUIRK_LIMITED_PRESCALER) {
 		/*
@@ -247,16 +249,17 @@ static int ch341_get_divisor(struct ch341_private *priv)
 }
 
 static int ch341_set_baudrate_lcr(struct usb_device *dev,
-				  struct ch341_private *priv, u8 lcr)
+				  struct ch341_private *priv,
+				  unsigned baud_rate, u8 lcr)
 {
 	uint16_t reg;
 	int val;
 	int r;
 
-	if (!priv->baud_rate)
+	if (!baud_rate)
 		return -EINVAL;
 
-	val = ch341_get_divisor(priv);
+	val = ch341_get_divisor(priv, baud_rate);
 	if (val < 0)
 		return -EINVAL;
 
@@ -331,7 +334,7 @@ static int ch341_configure(struct usb_device *dev, struct ch341_private *priv)
 	if (r < 0)
 		goto out;
 
-	r = ch341_set_baudrate_lcr(dev, priv, priv->lcr);
+	r = ch341_set_baudrate_lcr(dev, priv, priv->baud_rate, priv->lcr);
 	if (r < 0)
 		goto out;
 
@@ -403,7 +406,9 @@ static int ch341_port_probe(struct usb_serial_port *port)
 	if (r < 0)
 		goto error;
 	else if (r != 0)
-		priv->flags |= CH341_QUIRK_LIMITED_PRESCALER;
+		priv->flags |=
+			CH341_QUIRK_LIMITED_PRESCALER |
+			CH341_QUIRK_SIMULATE_BREAK;
 
 	usb_set_serial_port_data(port, priv);
 	return 0;
@@ -536,7 +541,8 @@ static void ch341_set_termios(struct tty_struct *tty,
 	if (baud_rate) {
 		priv->baud_rate = baud_rate;
 
-		r = ch341_set_baudrate_lcr(port->serial->dev, priv, lcr);
+		r = ch341_set_baudrate_lcr(port->serial->dev, priv,
+					   priv->baud_rate, lcr);
 		if (r < 0 && old_termios) {
 			priv->baud_rate = tty_termios_baud_rate(old_termios);
 			tty_termios_copy_hw(&tty->termios, old_termios);
@@ -555,15 +561,89 @@ static void ch341_set_termios(struct tty_struct *tty,
 	ch341_set_handshake(port->serial->dev, priv->mcr);
 }
 
+/*
+ * Devices of the "HL340" variant don't support a real break condition and
+ * reading CH341_REG_BREAK fails (see also ch341_detect_hl340). This function
+ * simulates a break condition by lowering the baud rate to the minimum
+ * supported by the hardware upon enabling the break condition and sending
+ * a NUL byte.
+ *
+ * Normally the duration of the break condition can be controlled individually
+ * by userspace using TIOCSBRK and TIOCCBRK or by passing an argument to
+ * TCSBRKP. Due to how the simulation is implemented the duration can't be
+ * controlled. The duration is always 1s / 46bd * 10bit = 217ms.
+ */
+static void ch341_simulate_break(struct tty_struct *tty, int break_state)
+{
+	struct usb_serial_port *port = tty->driver_data;
+	struct ch341_private *priv = usb_get_serial_port_data(port);
+	unsigned long delay;
+	int r;
+
+	if (break_state != 0) {
+		dev_dbg(&port->dev, "%s - Enter break state requested\n",
+			__func__);
+
+		r = ch341_set_baudrate_lcr(port->serial->dev, priv,
+			CH341_MIN_BPS,
+			CH341_LCR_ENABLE_RX | CH341_LCR_ENABLE_TX |
+			CH341_LCR_CS8);
+		if (r < 0) {
+			dev_err(&port->dev, "%s - baud rate status %d\n",
+				__func__, r);
+			goto restore;
+		}
+
+		r = tty_put_char(tty, '\0');
+		if (r < 0) {
+			dev_err(&port->dev, "%s - write status %d\n",
+				__func__, r);
+			goto restore;
+		}
+
+		priv->break_end = jiffies + (10 * HZ / CH341_MIN_BPS);
+
+		return;
+	}
+
+	dev_dbg(&port->dev, "%s - Leave break state requested\n", __func__);
+
+	if (time_before(jiffies, priv->break_end)) {
+		/* Wait until NUL byte is written */
+		delay = min_t(unsigned long, HZ, priv->break_end - jiffies);
+
+		dev_dbg(&port->dev, "%s - sleep for %d ms\n", __func__,
+			jiffies_to_msecs(delay));
+		schedule_timeout_interruptible(delay);
+	}
+
+restore:
+	/* Restore original baud rate */
+	r = ch341_set_baudrate_lcr(port->serial->dev, priv, priv->baud_rate,
+				   priv->lcr);
+	if (r < 0)
+		dev_err(&port->dev, "%s - baud rate status %d\n", __func__, r);
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
 
+	if (priv->flags & CH341_QUIRK_SIMULATE_BREAK) {
+		dev_warn_once(&port->dev,
+			      "%s - hardware doesn't support real break"
+			      " condition, simulating instead\n",
+			      __func__);
+		ch341_simulate_break(tty, break_state);
+		return;
+	}
+
 	break_reg = kmalloc(2, GFP_KERNEL);
 	if (!break_reg)
 		return;
-- 
2.20.1


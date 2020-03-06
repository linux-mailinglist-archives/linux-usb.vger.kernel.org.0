Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92F0417C5D2
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2020 20:00:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgCFTA4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Mar 2020 14:00:56 -0500
Received: from mail-gateway-shared14.cyon.net ([194.126.200.67]:49990 "EHLO
        mail-gateway-shared14.cyon.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726368AbgCFTA4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Mar 2020 14:00:56 -0500
Received: from s013.cyon.net ([149.126.4.22])
        by mail-gateway-shared14.cyon.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim)
        (envelope-from <public+bounce-silo.slz.hanselmann.tv-hansmi@hansmi.ch>)
        id 1jAIDM-0003iw-Nt
        for linux-usb@vger.kernel.org; Fri, 06 Mar 2020 20:00:54 +0100
Received: from [10.20.10.233] (port=22508 helo=mail.cyon.ch)
        by s013.cyon.net with esmtpa (Exim 4.92)
        (envelope-from <public+bounce-silo.slz.hanselmann.tv-hansmi@hansmi.ch>)
        id 1jAIDL-00A741-Gp; Fri, 06 Mar 2020 20:00:51 +0100
Received: from hansmi by silo.slz.hanselmann.tv with local (Exim 4.92)
        (envelope-from <hansmi@silo.slz.hanselmann.tv>)
        id 1jAIDL-00061P-7d; Fri, 06 Mar 2020 19:00:51 +0000
From:   Michael Hanselmann <public@hansmi.ch>
To:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Cc:     Michael Hanselmann <public@hansmi.ch>,
        Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
Subject: [PATCH 3/4] ch341: Limit prescaler on HL340 variant
Date:   Fri,  6 Mar 2020 19:00:44 +0000
Message-Id: <d76985a6dcf1b4aeec783dd8c8b59f054b51e07d.1583520568.git.public@hansmi.ch>
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

HL340 devices, a subset of all CH340 devices, do not work correctly when
the highest prescaler bit (0b100) is set. Limit these to the lower
prescaler values at the cost of timing precision.

Signed-off-by: Michael Hanselmann <public@hansmi.ch>
---
 drivers/usb/serial/ch341.c | 53 ++++++++++++++++++++++++++++----------
 1 file changed, 40 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index 0523f46f53c7..48a704174aec 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -24,6 +24,8 @@
 #define DEFAULT_BAUD_RATE 9600
 #define DEFAULT_TIMEOUT   1000
 
+#define CH341_QUIRK_LIMITED_PRESCALER 0x01
+
 /* flags for IO-Bits */
 #define CH341_BIT_RTS (1 << 6)
 #define CH341_BIT_DTR (1 << 5)
@@ -143,13 +145,19 @@ static int ch341_control_in(struct usb_device *dev,
 
 #define CH341_CLKRATE		48000000
 #define CH341_CLK_DIV(ps, fact)	(1 << (12 - 3 * (ps) - (fact)))
-#define CH341_MIN_RATE(ps)	(CH341_CLKRATE / (CH341_CLK_DIV((ps), 1) * 512))
+#define CH341_MIN_RATE(ps, fact) \
+	(CH341_CLKRATE / (CH341_CLK_DIV((ps), (fact)) * 512))
 
 static const speed_t ch341_min_rates[] = {
-	CH341_MIN_RATE(0),
-	CH341_MIN_RATE(1),
-	CH341_MIN_RATE(2),
-	CH341_MIN_RATE(3),
+	CH341_MIN_RATE(0, 0),
+	CH341_MIN_RATE(1, 0),
+	CH341_MIN_RATE(2, 0),
+	CH341_MIN_RATE(3, 0),
+
+	CH341_MIN_RATE(0, 1),
+	CH341_MIN_RATE(1, 1),
+	CH341_MIN_RATE(2, 1),
+	CH341_MIN_RATE(3, 1),
 };
 
 /*
@@ -162,24 +170,41 @@ static const speed_t ch341_min_rates[] = {
  *		2 <= div <= 256 if fact = 0, or
  *		9 <= div <= 256 if fact = 1
  */
-static int ch341_get_divisor(speed_t speed)
+static int ch341_get_divisor(struct ch341_private *priv)
 {
+	const speed_t *min_rates;
+	speed_t speed;
 	unsigned int fact, div, clk_div;
 	int ps;
 
+	speed = priv->baud_rate;
+
 	/*
 	 * Clamp to supported range, this makes the (ps < 0) and (div < 2)
 	 * sanity checks below redundant.
 	 */
 	speed = clamp(speed, 46U, 3000000U);
 
-	/*
-	 * Start with highest possible base clock (fact = 1) that will give a
-	 * divisor strictly less than 512.
-	 */
-	fact = 1;
+	if (priv->flags & CH341_QUIRK_LIMITED_PRESCALER) {
+		/*
+		 * Devices of the "HL340" variant don't work reliably when the
+		 * third bit is set in the prescaler (0b100). Limit these to
+		 * prescaler values in the range 0..3 (fact = 0) at the cost of
+		 * precision.
+		 */
+		min_rates = &ch341_min_rates[4];
+		fact = 0;
+	} else {
+		/*
+		 * Start with highest possible base clock (fact = 1) that will
+		 * give a divisor strictly less than 512.
+		 */
+		min_rates = ch341_min_rates;
+		fact = 1;
+	}
+
 	for (ps = 3; ps >= 0; ps--) {
-		if (speed > ch341_min_rates[ps])
+		if (speed > min_rates[ps])
 			break;
 	}
 
@@ -231,7 +256,7 @@ static int ch341_set_baudrate_lcr(struct usb_device *dev,
 	if (!priv->baud_rate)
 		return -EINVAL;
 
-	val = ch341_get_divisor(priv->baud_rate);
+	val = ch341_get_divisor(priv);
 	if (val < 0)
 		return -EINVAL;
 
@@ -377,6 +402,8 @@ static int ch341_port_probe(struct usb_serial_port *port)
 	r = ch341_detect_hl340(port->serial->dev);
 	if (r < 0)
 		goto error;
+	else if (r != 0)
+		priv->flags |= CH341_QUIRK_LIMITED_PRESCALER;
 
 	usb_set_serial_port_data(port, priv);
 	return 0;
-- 
2.20.1


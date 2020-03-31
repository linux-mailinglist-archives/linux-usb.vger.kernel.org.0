Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFB3219A290
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2020 01:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731553AbgCaXhi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Mar 2020 19:37:38 -0400
Received: from mail-gateway-shared02.cyon.net ([194.126.200.224]:49880 "EHLO
        mail-gateway-shared02.cyon.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728840AbgCaXhh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Mar 2020 19:37:37 -0400
Received: from s013.cyon.net ([149.126.4.22])
        by mail-gateway-shared02.cyon.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim)
        (envelope-from <public+bounce-silo.slz.hanselmann.tv-hansmi@hansmi.ch>)
        id 1jJQRp-00010I-VL
        for linux-usb@vger.kernel.org; Wed, 01 Apr 2020 01:37:36 +0200
Received: from [10.20.10.231] (port=21114 helo=mail.cyon.ch)
        by s013.cyon.net with esmtpa (Exim 4.93)
        (envelope-from <public+bounce-silo.slz.hanselmann.tv-hansmi@hansmi.ch>)
        id 1jJQRo-000qJd-OU; Wed, 01 Apr 2020 01:37:32 +0200
Received: from hansmi by silo.slz.hanselmann.tv with local (Exim 4.92)
        (envelope-from <hansmi@silo.slz.hanselmann.tv>)
        id 1jJQRo-00086E-AD; Tue, 31 Mar 2020 23:37:32 +0000
From:   Michael Hanselmann <public@hansmi.ch>
To:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Cc:     Michael Hanselmann <public@hansmi.ch>,
        Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
Subject: [PATCH v2 3/6] USB: serial: ch341: Limit prescaler on quirky chips
Date:   Tue, 31 Mar 2020 23:37:19 +0000
Message-Id: <ee0499594a75018c0e31da4af9feb8a322ff448d.1585697281.git.public@hansmi.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1585697281.git.public@hansmi.ch>
References: <cover.1585697281.git.public@hansmi.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - s013.cyon.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - hansmi.ch
X-Get-Message-Sender-Via: s013.cyon.net: authenticated_id: mailrelay-cervus@hansmi.ch
X-Authenticated-Sender: s013.cyon.net: mailrelay-cervus@hansmi.ch
X-OutGoing-Spam-Status: No, score=-1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A subset of all CH341 devices stop responding to bulk transfers, usually
after the third byte, when the highest prescaler bit (0b100) is set.
There is one exception, namely a prescaler of exactly 0b111 (fact=1,
ps=3). Limit these to the lower prescaler values at the cost of timing
precision.

Rates above 46875 baud use the same timings as the normal algorithm.
Below that the worst difference between desired and actual baud rate is
2.17 percentage points. The worst difference is 1.06 p.p. when only
looking at divisors differing from the normal algorithm.

Signed-off-by: Michael Hanselmann <public@hansmi.ch>
---
 drivers/usb/serial/ch341.c | 70 ++++++++++++++++++++++++++++----------
 1 file changed, 52 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index 9c839f67c3d4..67a5d4c3df42 100644
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
@@ -195,35 +197,67 @@ static int ch341_calc_divisor(speed_t speed, unsigned int ps,
  *		2 <= div <= 256 if fact = 0, or
  *		9 <= div <= 256 if fact = 1
  */
-static int ch341_get_divisor(speed_t speed)
+static int ch341_get_divisor(struct ch341_private *priv)
 {
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
-	 * Start with highest possible base clock and find a divisor for the
-	 * requested baud rate.
-	 */
-	for (ps = 3; ps >= 0; --ps) {
-		if (ch341_calc_divisor(speed, ps, 1U, &div, &clk_div) == 0) {
-			fact = 1;
-			break;
-		}
-
+	if (priv->quirks & CH341_QUIRK_LIMITED_PRESCALER) {
 		/*
-		 * Prefer half base clock (fact = 0) before trying lower
-		 * prescaler values. This makes the receiver more tolerant to
-		 * errors.
+		 * A subset of all CH34x devices stop responding to bulk
+		 * transfers when configured with certain prescaler values.
+		 *
+		 * fact=0, ps=0..3: Works
+		 * fact=1, ps=0..2: Unreliable
+		 * fact=1, ps=3: Works
+		 *
+		 * Limit these devices to working prescaler values at the cost
+		 * of precision for speeds up to 46875 baud above which
+		 * fact = 1 with ps = 3 is used.
 		 */
-		if (ch341_calc_divisor(speed, ps, 0U, &div, &clk_div) == 0) {
+		if (ch341_calc_divisor(speed, 3U, 1U, &div, &clk_div) == 0) {
+			ps = 3U;
+			fact = 1U;
+		} else {
 			fact = 0;
-			break;
+
+			for (ps = 3; ps >= 0; --ps) {
+				if (ch341_calc_divisor(speed, ps, fact,
+						       &div, &clk_div) == 0)
+					break;
+			}
+		}
+	} else {
+		/*
+		 * Start with highest possible base clock and find a divisor
+		 * for the requested baud rate.
+		 */
+		for (ps = 3; ps >= 0; --ps) {
+			if (ch341_calc_divisor(speed, ps, 1U,
+					       &div, &clk_div) == 0) {
+				fact = 1;
+				break;
+			}
+
+			/*
+			 * Prefer half base clock (fact = 0) before trying
+			 * lower prescaler values. This makes the receiver more
+			 * tolerant to errors.
+			 */
+			if (ch341_calc_divisor(speed, ps, 0U,
+					       &div, &clk_div) == 0) {
+				fact = 0;
+				break;
+			}
 		}
 	}
 
@@ -250,7 +284,7 @@ static int ch341_set_baudrate_lcr(struct usb_device *dev,
 	if (!priv->baud_rate)
 		return -EINVAL;
 
-	val = ch341_get_divisor(priv->baud_rate);
+	val = ch341_get_divisor(priv);
 	if (val < 0)
 		return -EINVAL;
 
@@ -353,7 +387,7 @@ static int ch341_detect_quirks(struct usb_device *dev)
 	if (r == -EPIPE) {
 		dev_dbg(&dev->dev, "%s - reading break condition register"
 			" failed (%d)\n", __func__, r);
-		r = 0;
+		r = CH341_QUIRK_LIMITED_PRESCALER;
 		goto out;
 	}
 
-- 
2.20.1


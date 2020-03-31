Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51F3219A28E
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2020 01:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731549AbgCaXhh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Mar 2020 19:37:37 -0400
Received: from mail-gateway-shared02.cyon.net ([194.126.200.224]:49870 "EHLO
        mail-gateway-shared02.cyon.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731438AbgCaXhh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Mar 2020 19:37:37 -0400
Received: from s013.cyon.net ([149.126.4.22])
        by mail-gateway-shared02.cyon.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim)
        (envelope-from <public+bounce-silo.slz.hanselmann.tv-hansmi@hansmi.ch>)
        id 1jJQRp-000104-5b
        for linux-usb@vger.kernel.org; Wed, 01 Apr 2020 01:37:35 +0200
Received: from [10.20.10.233] (port=39638 helo=mail.cyon.ch)
        by s013.cyon.net with esmtpa (Exim 4.93)
        (envelope-from <public+bounce-silo.slz.hanselmann.tv-hansmi@hansmi.ch>)
        id 1jJQRn-000qJ1-Ug; Wed, 01 Apr 2020 01:37:31 +0200
Received: from hansmi by silo.slz.hanselmann.tv with local (Exim 4.92)
        (envelope-from <hansmi@silo.slz.hanselmann.tv>)
        id 1jJQRn-000864-Gl; Tue, 31 Mar 2020 23:37:31 +0000
From:   Michael Hanselmann <public@hansmi.ch>
To:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Cc:     Michael Hanselmann <public@hansmi.ch>,
        Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
Subject: [PATCH v2 1/6] USB: serial: ch341: Reduce special cases in clock calculation
Date:   Tue, 31 Mar 2020 23:37:17 +0000
Message-Id: <2fe6e669ba744b533e5eef6407d4d38472dfe4aa.1585697281.git.public@hansmi.ch>
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

The CH341 clock prescaler and divisor calculation contained two special
cases, one to halve the clock rate if the divisor was outside the
allowed range, and the other to prefer an odd divisor by halving too
(only one special case would be applied at once).

A utility function is introduced to keep the logic for calculating the
divisor and testing whether it's within the permitted range out of
"ch341_get_divisor". The latter takes care the first special case.
Calling the utility function twice in a loop allows preferring odd
divisors.

There's another motivation for making this change: a subset of all CH341
devices doesn't work correctly with a few prescaler values. Filling the
minimum rate lookup table built at compile-time with all possible values
allows a later patch to call the utility function and absolves it from
having to consider the aforementioned special cases.

Tested by comparing the results of the previous code and the changed
code for every baud rate value from the minimum of 46 to the maximum of
3000000 bps. The computed divisors remain the same.

Signed-off-by: Michael Hanselmann <public@hansmi.ch>
---
 drivers/usb/serial/ch341.c | 90 ++++++++++++++++++++++++--------------
 1 file changed, 56 insertions(+), 34 deletions(-)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index c5ecdcd51ffc..85e7125d0194 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -140,15 +140,50 @@ static int ch341_control_in(struct usb_device *dev,
 
 #define CH341_CLKRATE		48000000
 #define CH341_CLK_DIV(ps, fact)	(1 << (12 - 3 * (ps) - (fact)))
-#define CH341_MIN_RATE(ps)	(CH341_CLKRATE / (CH341_CLK_DIV((ps), 1) * 512))
+#define CH341_MIN_RATE(ps, fact) \
+	(CH341_CLKRATE / (CH341_CLK_DIV((ps), (fact)) * 256))
 
+/* Minimum baud rate for given prescaler values */
 static const speed_t ch341_min_rates[] = {
-	CH341_MIN_RATE(0),
-	CH341_MIN_RATE(1),
-	CH341_MIN_RATE(2),
-	CH341_MIN_RATE(3),
+	CH341_MIN_RATE(0, 0),
+	CH341_MIN_RATE(0, 1),
+	CH341_MIN_RATE(1, 0),
+	CH341_MIN_RATE(1, 1),
+	CH341_MIN_RATE(2, 0),
+	CH341_MIN_RATE(2, 1),
+	CH341_MIN_RATE(3, 0),
+	CH341_MIN_RATE(3, 1),
 };
 
+static int ch341_calc_divisor(speed_t speed, unsigned int ps,
+		unsigned int fact, unsigned int *div, unsigned int *clk_div)
+{
+	const unsigned int offset = ps * 2 + fact;
+
+	if (offset >= ARRAY_SIZE(ch341_min_rates)) {
+		return -EINVAL;
+	}
+
+	if (speed > ch341_min_rates[offset]) {
+		const unsigned int min_div = fact == 0 ? 2 : 9;
+
+		/* Determine corresponding divisor, rounding down. */
+		*clk_div = CH341_CLK_DIV(ps, fact);
+		*div = CH341_CLKRATE / (*clk_div * speed);
+
+		/*
+		 * Determine whether divisor is in supported range. The upper
+		 * limit is kept one below the maximum to enable picking the
+		 * next rate if it's more accurate.
+		 */
+		if (*div >= min_div && *div < 256) {
+			return 0;
+		}
+	}
+
+	return -ERANGE;
+}
+
 /*
  * The device line speed is given by the following equation:
  *
@@ -171,30 +206,27 @@ static int ch341_get_divisor(speed_t speed)
 	speed = clamp(speed, 46U, 3000000U);
 
 	/*
-	 * Start with highest possible base clock (fact = 1) that will give a
-	 * divisor strictly less than 512.
+	 * Start with highest possible base clock and find a divisor for the
+	 * requested baud rate.
 	 */
-	fact = 1;
-	for (ps = 3; ps >= 0; ps--) {
-		if (speed > ch341_min_rates[ps])
+	for (ps = 3; ps >= 0; --ps) {
+		if (ch341_calc_divisor(speed, ps, 1U, &div, &clk_div) == 0) {
+			fact = 1;
 			break;
-	}
-
-	if (ps < 0)
-		return -EINVAL;
-
-	/* Determine corresponding divisor, rounding down. */
-	clk_div = CH341_CLK_DIV(ps, fact);
-	div = CH341_CLKRATE / (clk_div * speed);
+		}
 
-	/* Halve base clock (fact = 0) if required. */
-	if (div < 9 || div > 255) {
-		div /= 2;
-		clk_div *= 2;
-		fact = 0;
+		/*
+		 * Prefer half base clock (fact = 0) before trying lower
+		 * prescaler values. This makes the receiver more tolerant to
+		 * errors.
+		 */
+		if (ch341_calc_divisor(speed, ps, 0U, &div, &clk_div) == 0) {
+			fact = 0;
+			break;
+		}
 	}
 
-	if (div < 2)
+	if (ps < 0 || div < 2 || div > 255)
 		return -EINVAL;
 
 	/*
@@ -205,16 +237,6 @@ static int ch341_get_divisor(speed_t speed)
 			16 * speed - 16 * CH341_CLKRATE / (clk_div * (div + 1)))
 		div++;
 
-	/*
-	 * Prefer lower base clock (fact = 0) if even divisor.
-	 *
-	 * Note that this makes the receiver more tolerant to errors.
-	 */
-	if (fact == 1 && div % 2 == 0) {
-		div /= 2;
-		fact = 0;
-	}
-
 	return (0x100 - div) << 8 | fact << 2 | ps;
 }
 
-- 
2.20.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEA53EC773
	for <lists+linux-usb@lfdr.de>; Fri,  1 Nov 2019 18:24:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728608AbfKARY1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Nov 2019 13:24:27 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46668 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726944AbfKARY0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Nov 2019 13:24:26 -0400
Received: by mail-lj1-f195.google.com with SMTP id w8so10942875lji.13
        for <linux-usb@vger.kernel.org>; Fri, 01 Nov 2019 10:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YNgTx4DJVbSXhNQk3qTxiqUbOGBUshETuzGkv7oBT+Y=;
        b=ezFMNN3EzbxwYHDgtrrJfWnr8MG1/qvxTSKXDB7DVNCM7pjPz079T56e4PEaiQayL+
         AKOxjEmvUqeLVyYYgQ1viDl2R3/Bw3cvbtmc6Dm6eByYBIkWRM+v4c4JlGcgdX1QRKlV
         6SL08rixPJDDE541e6Tv3l3EUHFlqrpof/eDJHYunIeXMlNeVj9+Yl1vOU8F5Cvn3IfS
         f4Pp4qddwAAhjhoxVtH9TN4Gr8jVRrfhZi4D40l8mAZsn9IkNzcsVXmB2A94tsAsmqbX
         L2H5ABX0naiJ/jkjmPJR3kyCEZe3dPr6CuurbBHrdG+45IYP8LX43WoFsVNiqax3OWgp
         NpNg==
X-Gm-Message-State: APjAAAVHi0VY1HYM+zKH0LEpYm6zEJEN9uaatSeLhzueJBKDxTp6w80e
        CD3G6IYmVM5Xr3WsOhm6TbQacD32
X-Google-Smtp-Source: APXvYqyzKfmb++68JTeb4OhOpCsAl/UdN8hQoxfuwqtRhxAN+gPBXmEnIqYxUtUvaeVt33GVl3NtZQ==
X-Received: by 2002:a2e:7204:: with SMTP id n4mr1383413ljc.139.1572629064143;
        Fri, 01 Nov 2019 10:24:24 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id e14sm2973524ljb.75.2019.11.01.10.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 10:24:23 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iQaet-0005K5-Hh; Fri, 01 Nov 2019 18:24:23 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Jonathan Olds <jontio@i4free.co.nz>,
        Michael Dreher <michael@5dot1.de>, linux-usb@vger.kernel.org
Subject: [PATCH] USB: serial: ch341: reimplement line-speed handling
Date:   Fri,  1 Nov 2019 18:24:10 +0100
Message-Id: <20191101172410.20419-1-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The current ch341 divisor algorithm was known to give inaccurate results
for certain higher line speeds. Jonathan Olds <jontio@i4free.co.nz>
investigated this, determined the basic equations used to derive the
divisors and confirmed them experimentally [1].

The equations Jonathan used could be generalised further to:

	baud = 48000000 / (2^(12 - 3 * ps - fact) * div), where

		0 <= ps <= 3,
		0 <= fact <= 1,
		2 <= div <= 256 if fact = 0, or
		9 <= div <= 256 if fact = 1

which will also give better results for lower rates.

Notably the error is reduced for the following standard rates:

	1152000	(4.0% instead of 15% error)
	 921600	(0.16% instead of -7.5% error)
	 576000	(-0.80% instead of -5.6% error)
	    200	(0.16% instead of -0.69% error)
	    134	(-0.05% instead of -0.63% error)
	    110	(0.03% instead of -0.44% error)

but also for many non-standard ones.

The current algorithm also suffered from rounding issues (e.g. 2950000
was rounded to 2 Mbaud instead of 3 Mbaud resulting in a -32% instead of
1.7% error).

The new algorithm was inspired by the current vendor driver even if that
one only handles two higher rates that require fact=1 by hard coding the
corresponding divisors [2].

Michael Dreher <michael@5dot1.de> also did a similar generalisation of
Jonathan's work and has published his results with a very good summary
that provides further insights into how this device works [3].

[1] https://lkml.kernel.org/r/000001d51f34$bad6afd0$30840f70$@co.nz
[2] http://www.wch.cn/download/CH341SER_LINUX_ZIP.html
[3] https://github.com/nospam2000/ch341-baudrate-calculation

Reported-by: Jonathan Olds <jontio@i4free.co.nz>
Tested-by: Jonathan Olds <jontio@i4free.co.nz>
Cc: Michael Dreher <michael@5dot1.de>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/ch341.c | 97 +++++++++++++++++++++++++++++---------
 1 file changed, 75 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index 3bb1fff02bed..29f83ce1696e 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -48,12 +48,6 @@
 #define CH341_BIT_DCD 0x08
 #define CH341_BITS_MODEM_STAT 0x0f /* all bits */
 
-/*******************************/
-/* baudrate calculation factor */
-/*******************************/
-#define CH341_BAUDBASE_FACTOR 1532620800
-#define CH341_BAUDBASE_DIVMAX 3
-
 /* Break support - the information used to implement this was gleaned from
  * the Net/FreeBSD uchcom.c driver by Takanori Watanabe.  Domo arigato.
  */
@@ -144,37 +138,96 @@ static int ch341_control_in(struct usb_device *dev,
 	return 0;
 }
 
+#define CH341_CLKRATE		48000000
+#define CH341_CLK_DIV(ps, fact)	(1 << (12 - 3 * (ps) - (fact)))
+#define CH341_MIN_RATE(ps)	(CH341_CLKRATE / (CH341_CLK_DIV((ps), 1) * 512))
+
+static const speed_t ch341_min_rates[] = {
+	CH341_MIN_RATE(0),
+	CH341_MIN_RATE(1),
+	CH341_MIN_RATE(2),
+	CH341_MIN_RATE(3),
+};
+
+/*
+ * The device line speed is given by the following equation:
+ *
+ *	baud = 48000000 / (2^(12 - 3 * ps - fact) * div), where
+ *
+ *		0 <= ps <= 3,
+ *		0 <= fact <= 1,
+ *		2 <= div <= 256 if fact = 0, or
+ *		9 <= div <= 256 if fact = 1
+ */
+static int ch341_get_divisor(speed_t speed)
+{
+	unsigned int fact, div, clk_div;
+	int ps;
+
+	/*
+	 * Clamp to supported range, this makes the (ps < 0) and (div < 2)
+	 * sanity checks below redundant.
+	 */
+	speed = clamp(speed, 46U, 3000000U);
+
+	/*
+	 * Start with highest possible base clock (fact = 1) that will give a
+	 * divisor strictly less than 512.
+	 */
+	fact = 1;
+	for (ps = 3; ps >= 0; ps--) {
+		if (speed > ch341_min_rates[ps])
+			break;
+	}
+
+	if (ps < 0)
+		return -EINVAL;
+
+	/* Determine corresponding divisor, rounding down. */
+	clk_div = CH341_CLK_DIV(ps, fact);
+	div = CH341_CLKRATE / (clk_div * speed);
+
+	/* Halve base clock (fact = 0) if required. */
+	if (div < 9 || div > 255) {
+		div /= 2;
+		clk_div *= 2;
+		fact = 0;
+	}
+
+	if (div < 2)
+		return -EINVAL;
+
+	/*
+	 * Pick next divisor if resulting rate is closer to the requested one,
+	 * scale up to avoid rounding errors on low rates.
+	 */
+	if (16 * CH341_CLKRATE / (clk_div * div) - 16 * speed >=
+			16 * speed - 16 * CH341_CLKRATE / (clk_div * (div + 1)))
+		div++;
+
+	return (0x100 - div) << 8 | fact << 2 | ps;
+}
+
 static int ch341_set_baudrate_lcr(struct usb_device *dev,
 				  struct ch341_private *priv, u8 lcr)
 {
-	short a;
+	int val;
 	int r;
-	unsigned long factor;
-	short divisor;
 
 	if (!priv->baud_rate)
 		return -EINVAL;
-	factor = (CH341_BAUDBASE_FACTOR / priv->baud_rate);
-	divisor = CH341_BAUDBASE_DIVMAX;
-
-	while ((factor > 0xfff0) && divisor) {
-		factor >>= 3;
-		divisor--;
-	}
 
-	if (factor > 0xfff0)
+	val = ch341_get_divisor(priv->baud_rate);
+	if (val < 0)
 		return -EINVAL;
 
-	factor = 0x10000 - factor;
-	a = (factor & 0xff00) | divisor;
-
 	/*
 	 * CH341A buffers data until a full endpoint-size packet (32 bytes)
 	 * has been received unless bit 7 is set.
 	 */
-	a |= BIT(7);
+	val |= BIT(7);
 
-	r = ch341_control_out(dev, CH341_REQ_WRITE_REG, 0x1312, a);
+	r = ch341_control_out(dev, CH341_REQ_WRITE_REG, 0x1312, val);
 	if (r)
 		return r;
 
-- 
2.23.0


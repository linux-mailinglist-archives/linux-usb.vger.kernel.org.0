Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 300C0E996A
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2019 10:48:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbfJ3Jsf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Oct 2019 05:48:35 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45075 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726069AbfJ3Jse (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Oct 2019 05:48:34 -0400
Received: by mail-wr1-f65.google.com with SMTP id q13so1483168wrs.12
        for <linux-usb@vger.kernel.org>; Wed, 30 Oct 2019 02:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EguHOW3z0BkNAAN3xv2QiiCbmcopPjfVZsWipwxQceA=;
        b=AxvGD0QJXZ9q1VrFCQiujmLCOXrgMsrBR8PsOMK1SwGncya6z1OWbKYxGdR+DSnaln
         oyuZguclP+1M93YVAd27oqrWCbra4lt+xuQVscJley0xelq4uxzvtKvu2skvpUAnyY7x
         Bwar9jdQjwQY/h8TPvaI97FM3uISB+G8QhyLULm8lRPEGqgDhKL16fmHyQ9luX2PzjXP
         RL0uspx4yndTCLpY197OlJoTy7/mHi2aL05utQcRvtAZX4OIsaGUBq9F907lZK5CILF1
         BatZoN7hsxUVw3n2Ns7ssl38mID8MgbvmU9VvNfWYUUZjcjnfx1ak96PpIcBaz4Aw2nQ
         zIdQ==
X-Gm-Message-State: APjAAAWeTtn+oC/xVY9MaFlfX88rMlSocDpH4lNHTzIwz3NLqPIMa2iX
        h28059QeY7V+CUnygLkKznoHt7SGBOM=
X-Google-Smtp-Source: APXvYqxlLAw76mKCa7EG0u0mfzi+7M5ddKS78g0DEyTDnGEwD5yD+eXf2jUJ4X47QSDe0FLiHcuimA==
X-Received: by 2002:a5d:44c8:: with SMTP id z8mr23548633wrr.66.1572428910432;
        Wed, 30 Oct 2019 02:48:30 -0700 (PDT)
Received: from pi (100.50.158.77.rev.sfr.net. [77.158.50.100])
        by smtp.gmail.com with ESMTPSA id n11sm1658223wmd.26.2019.10.30.02.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 02:48:27 -0700 (PDT)
Received: from johan by pi with local (Exim 4.92.2)
        (envelope-from <johan@pi>)
        id 1iPkZJ-00028h-KO; Wed, 30 Oct 2019 10:47:09 +0100
Date:   Wed, 30 Oct 2019 10:47:09 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Jonathan Olds <jontio@i4free.co.nz>
Cc:     'Johan Hovold' <johan@kernel.org>, linux-usb@vger.kernel.org,
        frank@kingswood-consulting.co.uk, werner@cornelius-consult.de,
        boris@hajduk.org
Subject: Re: [PATCH] USB: serial: ch341: fix wrong baud rate setting
 calculation
Message-ID: <20191030094709.GB4691@localhost>
References: <jontio@i4free.co.nz>
 <20190608051309.4689-1-jontio@i4free.co.nz>
 <20190620134318.GL6241@localhost>
 <000001d52e0e$5303de80$f90b9b80$@co.nz>
 <000501d58e8d$b360b4d0$1a221e70$@co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000501d58e8d$b360b4d0$1a221e70$@co.nz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Jonathan,

On Wed, Oct 30, 2019 at 08:18:48AM +1300, Jonathan Olds wrote:
> Hi Johan,

And apologies for the lack of feedback on this.

I've started looking into this a few times this fall, but got side
tracked. This past couple of weeks I did find some time, but never got
around to posting before heading to ELCE this week.

I've been working on a patch that generalises the vendor driver's
algorithm based on your findings and my own experiments. I've verified
it on both ch340g and ch341a, and it gives smaller (or equal) errors for
all rates, including the following standard rates

   - 1152000 (4.0% instead of 15% error)
   - 921600 (0.16% instead of -7.5%)
   - 576000 (-0.80% instead of -5.6%)
   - 200 (0.16% instead of -0.69%)
   - 134 (-0.05% instead of -0.63%)
   - 110 (0.03% instead of -0.44%)

but also on many non-standard ones by always picking the divisors with
smallest error.

My main issue with your proposed patch was that it was still based on the
current fairly opaque implementation, and then special-cased the higher
baud rates with some "magic" constants thrown in.

I also noticed that we should always pick the higher base clock if the
resulting divisor is odd (and within the valid range). No need to
determine the actual rates and compare; the odd divisor with the higher
base clock will always give a smaller error. If it's even, we can go
with the lower base clock and halve the divisor if we want.

When it comes to handling rounding, I opted for the brute force method
also used by the current vendor driver (the one you also referred to
earlier) by determining the actual rates for div and div + 1 and picking
the closest one. This should always give the smallest error, even
though we may not care about the midpoint rates for higher speeds that
much (the current algorithm would pick 2 Mbaud instead of 3 MBaud for
2950000, resulting in an error of -32% instead of 1.7%, etc).

> Michael has also produced a patch for the Linux kernel fixing the wrong
> baud rate calculations. This can be found here...
> 
> https://github.com/nospam2000/ch341-baudrate-calculation/blob/master/patches
> /Linux_4.14.114_ch341.patch
> 
> I haven't tested his code.
> 
> He has done a write up of his investigations about the registers here...
> 
> https://github.com/nospam2000/ch341-baudrate-calculation/blob/master/README.
> md

Interesting! From a very quick glance this looks very promising
(although he doesn't seem to handle rounding yet). I'll take a closer
look and compare with what I've done.

Would you mind giving the below patch a try meanwhile? It's still
lacking a proper commit message, and I wanted to take another look at it
when I'm back from the conference.

Just wanted to let you know that I'm on it and want to get this fixed in
one way or another for v5.4.

Thanks,
Johan


From 718c9f8d6f45014dc0c14a297d1017ecc945ef26 Mon Sep 17 00:00:00 2001
From: Johan Hovold <johan@kernel.org>
Date: Wed, 30 Oct 2019 09:56:09 +0100
Subject: [PATCH] USB: ch341: reimplement line-speed handling

Based on work by Jonathan Olds <jontio@i4free.co.nz> and the algorithm
used by the vendor driver.

FIXME: add commit message

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/ch341.c | 97 +++++++++++++++++++++++++++++++-------
 1 file changed, 81 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index 3bb1fff02bed..3dcc579b2d2f 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -144,37 +144,102 @@ static int ch341_control_in(struct usb_device *dev,
 	return 0;
 }
 
+#define CH341_CLKRATE		48000000
+#define CH341_CLK_DIV(ps, fact)	(1 << (12 - 3 * ps - fact))
+#define CH341_MIN_RATE(ps)	(CH341_CLKRATE / (CH341_CLK_DIV(ps, 1) * 512))
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
+		div >>= 1;
+		clk_div <<= 1;
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
+	/* Prefer lower base clock (fact = 0) if even divisor. */
+	if (fact == 1 && div % 2 == 0) {
+		div >>= 1;
+		fact = 0;
+	}
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
 
-	while ((factor > 0xfff0) && divisor) {
-		factor >>= 3;
-		divisor--;
-	}
-
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


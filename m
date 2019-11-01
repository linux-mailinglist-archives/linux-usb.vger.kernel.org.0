Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5606BEBB64
	for <lists+linux-usb@lfdr.de>; Fri,  1 Nov 2019 01:17:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbfKAARu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 31 Oct 2019 20:17:50 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37321 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727335AbfKAARu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 31 Oct 2019 20:17:50 -0400
Received: by mail-pl1-f195.google.com with SMTP id p13so3517066pll.4
        for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2019 17:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=tI2HiWTN9M8X71NhBLTz2dfowV0b09yfhq3v9Ea61Ac=;
        b=uNQdla3ze6XQ26evtUcWBGYaa9ZORwpTspUKEgW7pC6GSzVVrIDMLt1MoGKED+qOJ1
         ujKtnCErPMoZ2dNB1cCOK2SvnYIASy5wGr6w4FKrB6WJyzAheOnVslDSkZYKQtcJ5NKX
         feK10c/8SDIFHUDfiA5OOoCXL38L7QI+3PFCf6qjYptUGfxXS5852kqJXC1UGrRl/W1h
         d93bIb9IJF+CvXY4fESZ9Ik0rjb50fRkaXbDPeZPtKh55PC//DVrzbrK0Rzl6w7u7F75
         TJXsGPTKw8anypCgQlbV49g6RmMWmsXFKidmgTgJaYwk2FSA7EbUEsNMevFetFFLMxsD
         L34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:references:in-reply-to:subject
         :date:message-id:mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=tI2HiWTN9M8X71NhBLTz2dfowV0b09yfhq3v9Ea61Ac=;
        b=rUOh5Vrv+Lw7kG4xI8bqwWvIN1zVE7Nplpie5/jKjxMgZAA5NPfNEV0Amm/WWgPfim
         21h8vfz2mUAoL6pG0o3vkHsznbZ8Dc+L0seB6hAbjxr9ssgNMr34EdfCvPFpd4a8V7ok
         Zady5eZAXCZB/QsUfCVc3fLCMiR9D0bysZ15bDcWEQZMKe903CqVQujLemVt4yRdTzsD
         Mid7fx5b2PYbbEQjUeRKqzXmU5bF79bmDoGoPlw9XA+Y/25zkE47c6j9Zoxmx9oW6MEc
         wYMcz56+N1zQOGwQUa0/K9oViFSoTkbV3hsTAMEfuiR/UBSi5h8Jb8rVGPoYO9QXj1Wd
         WwBg==
X-Gm-Message-State: APjAAAX1jrSRZP0HhyoOAdIvdkjXebkjDXvZ1JyQ9CxTknbDxkxS30g2
        wxTePmPvw0ew35AESfjAEdO5BmfB/Zg=
X-Google-Smtp-Source: APXvYqwcwEc+XkdgvyM5psl+JoFcnYCPE8F26E3fdUESs7iqASeP8mUGsXwAtDYmsXzIwteZTIeQHw==
X-Received: by 2002:a17:902:8a90:: with SMTP id p16mr9528219plo.220.1572567469468;
        Thu, 31 Oct 2019 17:17:49 -0700 (PDT)
Received: from PC201407091922 (121-74-136-26.telstraclear.net. [121.74.136.26])
        by smtp.gmail.com with ESMTPSA id x192sm4417841pfc.109.2019.10.31.17.17.45
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 31 Oct 2019 17:17:48 -0700 (PDT)
From:   "Jonathan Olds" <jontio@i4free.co.nz>
To:     "'Johan Hovold'" <johan@kernel.org>
Cc:     <linux-usb@vger.kernel.org>, <frank@kingswood-consulting.co.uk>,
        <werner@cornelius-consult.de>, <boris@hajduk.org>
References: <jontio@i4free.co.nz> <20190608051309.4689-1-jontio@i4free.co.nz> <20190620134318.GL6241@localhost> <000001d52e0e$5303de80$f90b9b80$@co.nz> <000501d58e8d$b360b4d0$1a221e70$@co.nz> <20191030094709.GB4691@localhost>
In-Reply-To: <20191030094709.GB4691@localhost>
Subject: RE: [PATCH] USB: serial: ch341: fix wrong baud rate setting calculation
Date:   Fri, 1 Nov 2019 13:17:35 +1300
Message-ID: <000901d59049$c59eaae0$50dc00a0$@co.nz>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AdWPBzJglbyQ5nPMSSqQhSfWMKCDnQBPpLMA
Content-Language: en-nz
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan,

Thanks for that.

I tested you patch out with the ch340g chip and it works fine for all
rates I tried. I used a logic analyzer and made the following
measurements...  

- wanted	measured error
- 110		0.02%
* 256000	0.26%
- 576000	0.79%
* 921600	0.16%
* 1333333	0%
- 2000000	0%
- 3000000	0%

The asterisk are the ones that are really bad with the current Linux
driver. Of the ones you that you mention my measurements match yours.
So that looks really good.

Yes the current Linux driver is a bit opaque.

BTW I had trouble patching the ch341.c file using your patch. Using...

```
wget
https://raw.githubusercontent.com/torvalds/linux/master/drivers/usb/serial/c
h341.c
patch ch341.c patch.diff
```

where `patch.diff` was your patch I kept getting either
"patch: **** unexpected end of file in patch" or
"patch: **** malformed patch at line" depending what lines I changed.

However it was easy enough to manually apply your patch by hand and
that is what I did.

Cheers,
Jonti
 

-----Original Message-----
From: Johan Hovold [mailto:johan@kernel.org] 
Sent: Wednesday, 30 October 2019 10:47 p.m.
To: Jonathan Olds
Cc: 'Johan Hovold'; linux-usb@vger.kernel.org;
frank@kingswood-consulting.co.uk; werner@cornelius-consult.de;
boris@hajduk.org
Subject: Re: [PATCH] USB: serial: ch341: fix wrong baud rate setting
calculation

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
>
https://github.com/nospam2000/ch341-baudrate-calculation/blob/master/patches
> /Linux_4.14.114_ch341.patch
> 
> I haven't tested his code.
> 
> He has done a write up of his investigations about the registers here...
> 
>
https://github.com/nospam2000/ch341-baudrate-calculation/blob/master/README.
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
+#define CH341_MIN_RATE(ps)	(CH341_CLKRATE / (CH341_CLK_DIV(ps, 1) *
512))
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
+	 * Start with highest possible base clock (fact = 1) that will give
a
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
+	 * Pick next divisor if resulting rate is closer to the requested
one,
+	 * scale up to avoid rounding errors on low rates.
+	 */
+	if (16 * CH341_CLKRATE / (clk_div * div) - 16 * speed >=
+			16 * speed - 16 * CH341_CLKRATE / (clk_div * (div +
1)))
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


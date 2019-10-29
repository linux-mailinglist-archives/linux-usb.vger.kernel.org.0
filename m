Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFC08E8FD8
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2019 20:18:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727835AbfJ2TS5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Oct 2019 15:18:57 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34043 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726855AbfJ2TS5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Oct 2019 15:18:57 -0400
Received: by mail-pg1-f194.google.com with SMTP id e4so5976694pgs.1
        for <linux-usb@vger.kernel.org>; Tue, 29 Oct 2019 12:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=n8w4VRT0SlNU5kZBGAY75tk77PpeWN4XFvvhCW1n7oU=;
        b=IvtNdgVC+7IX4w/oVg7L6O9GwklWhZWufB/Wh1KO6jGZN6zgtDyvxSDIUqpOqMEzo3
         Rqc71RN8kDTTbyFSQeiAmqAKrZJGUYvVYpd1jKgIqQO6RB2vqRkwWRh6FOiPHPGjzNFs
         FgfO4lCs+bjZP3d0nWD0MdFCGGbt2hfFqFVblnwN7V/4blIz9cETXb9PAca3Fw6WuHLm
         u2t4tGWWZNjbjuJBV4VKOraSP2hVq/RPqAjlIHQz9pNaadiWyDNReNbeHgy32Syhva5v
         DNrr3lC/lMnXtd0OYNM0WxBuLifbfjisww1aVstRTZ7BHBLhvp3ZAGEBvNT5Y+WeTUrG
         83sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:references:in-reply-to:subject
         :date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=n8w4VRT0SlNU5kZBGAY75tk77PpeWN4XFvvhCW1n7oU=;
        b=hlrbLYGnehms823C9uKxEuHXQADSq3XPw0FBTbi3K5tdsi45jQTrAM5r0C+63b6jWe
         2dxy0ONMMGEmW5RULTu+J7hmbTCOMFNNkB25Gh0deRUg0ZDHyW0uJwNWhtC1ZwISRSz8
         5Ukz9UrdDaY5T+SqWrpvqc/wDHNo209Sr/lgPlVsf4wgu43bahDJkN+kPAbqceH8ELHk
         I+uDCwYm6mvKn+st7SvwDhmZiyvCW4A30jtF1m7RMKtuK1EtVg64WkH9C4tat/Hghlkl
         MaJRqyY8JOH21Jc64CvuIRyNUvhoWcaqwisPV0wh802TodvOw7WXh+teFsw0fD4OqPq/
         0wiQ==
X-Gm-Message-State: APjAAAVmSffd3hEzNURpafd/K5sgL+7G0ay18G3J4XZSpjk1hzFOplM9
        9LK68cWTuTxKf5tkQ2ogvx5sBfz2x+U=
X-Google-Smtp-Source: APXvYqzQXwsmtX3PoutlAFLNgSHF6Ap2dURBrcEtPZxb826h9VosNxGXRsdRd5Kxr9YoiPKeZRp6/w==
X-Received: by 2002:a63:5605:: with SMTP id k5mr29424815pgb.14.1572376736593;
        Tue, 29 Oct 2019 12:18:56 -0700 (PDT)
Received: from PC201407091922 (121-74-136-26.telstraclear.net. [121.74.136.26])
        by smtp.gmail.com with ESMTPSA id v4sm14195655pff.181.2019.10.29.12.18.53
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 29 Oct 2019 12:18:55 -0700 (PDT)
From:   "Jonathan Olds" <jontio@i4free.co.nz>
To:     "'Johan Hovold'" <johan@kernel.org>
Cc:     <linux-usb@vger.kernel.org>, <frank@kingswood-consulting.co.uk>,
        <werner@cornelius-consult.de>, <boris@hajduk.org>
References: <jontio@i4free.co.nz> <20190608051309.4689-1-jontio@i4free.co.nz> <20190620134318.GL6241@localhost> <000001d52e0e$5303de80$f90b9b80$@co.nz>
In-Reply-To: <000001d52e0e$5303de80$f90b9b80$@co.nz>
Subject: RE: [PATCH] USB: serial: ch341: fix wrong baud rate setting calculation
Date:   Wed, 30 Oct 2019 08:18:48 +1300
Message-ID: <000501d58e8d$b360b4d0$1a221e70$@co.nz>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Office Outlook 12.0
Content-Language: en-nz
Thread-Index: AdUnbiGLwtclKSWwR26jtDvHA1nrnwGmsFswGCDm/4A=
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan,

Michael has also produced a patch for the Linux kernel fixing the wrong
baud rate calculations. This can be found here...

https://github.com/nospam2000/ch341-baudrate-calculation/blob/master/patches
/Linux_4.14.114_ch341.patch

I haven't tested his code.

He has done a write up of his investigations about the registers here...

https://github.com/nospam2000/ch341-baudrate-calculation/blob/master/README.
md

Cheers,
Jonti 

-----Original Message-----
From: Jonti Olds [mailto:joldsphone@gmail.com] On Behalf Of Jonathan Olds
Sent: Saturday, 29 June 2019 12:05 p.m.
To: 'Johan Hovold'
Cc: linux-usb@vger.kernel.org; frank@kingswood-consulting.co.uk;
werner@cornelius-consult.de; boris@hajduk.org; 'Jonathan Olds'
Subject: RE: [PATCH] USB: serial: ch341: fix wrong baud rate setting
calculation

Hi Johan,

Sorry for the slow reply. Thanks for the feedback.

I've amended the patch and is below. I think I've done all of your
suggestions and looks more Linux Kernelish style.

> drop the denom outmost parenthesis (also in some expressions below)

I removed the outmost parenthesis from the " denom = " line but wasn't too
sure what the "some expressions below" were. 

int only guarantees 16bits so that's why I went for ones of the form
long/s32/int32_t for some variables. I noticed that other things like
"priv->baud_rate" for example is an unsigned int so that wouldn't work for
some 16bit systems (such as the dsPIC with xc16) for speeds beyond 65KBaud.

Here's the amended patch, any feedback greatly appreciated...

For some wanted baud rates ch341_set_baudrate_lcr() calculates the "a"
value such that it produces a significantly different baud rate than the
desired one. This means some hardware can't communicate with the CH34x
chip. Particularly obvious wrong baud rates are 256000 and 921600 which
deviate by 2.3% and 7.4% respectively. This proposed patch will bring the
errors for these baud rates to below 0.5%. This patch will significantly
improve the error of some other unusual baud rates too (such as 1333333
from 10% error to 0% error). Currently ch341_set_baudrate_lcr() will
accept any baud rate and can produce a practically arbitrary large error
(for example a 40% error for 5000000). This patch does not address this
issue.

The patch has been tested on two computers and only with the CH340G chip.

With a CH340G chip with "Chip version: 0x31" on a JPIC I tested the
bitrate error using a RIGOL DS1054 scope without the patch and measured
the following...

Baud wanted	Baud measured	Error as % of wanted
50	50	0.0%
75	75.2	0.3%
110	109.5	0.5%
135	134.6	0.3%
150	150.4	0.3%
300	300.8	0.3%
600	601.3	0.2%
1200	1201.9	0.2%
1800	1801.8	0.1%
2400	2403.8	0.2%
4800	4807.7	0.2%
7200	7215	0.2%
9600	9615.4	0.2%
14400	14430	0.2%
19200	19231	0.2%
38400	38462	0.2%
56000	56054	0.1%
57600	57837	0.4%
115200	115207	0.0%
128000	127551	0.4%
230400	230415	0.0%
256000	250000	2.3%
460800	460617	0.0%
921600	853242	7.4%
1000000	999001	0.1%
1333333	1204819	9.6%
1843200	1496334	18.8%
2000000	1984127	0.8%
5000000	2985075	40.3%

Measurements and working as a libre/open office document can be found at
https://jontio.github.io/linux_kernel_work/ch43x_tests.ods

Signed-off-by: Jonathan Olds <jontio@i4free.co.nz>
---
 drivers/usb/serial/ch341.c | 46 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index 3bb1fff02bed..5ef8db2974d5 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -54,6 +54,11 @@
 #define CH341_BAUDBASE_FACTOR 1532620800
 #define CH341_BAUDBASE_DIVMAX 3
 
+/* Chip frequency is 12Mhz. not quite the same as
+ * (CH341_BAUDBASE_FACTOR>>7)
+ */
+#define CH341_OSC_FREQUENCY 12000000
+
 /* Break support - the information used to implement this was gleaned from
  * the Net/FreeBSD uchcom.c driver by Takanori Watanabe.  Domo arigato.
  */
@@ -151,6 +156,9 @@ static int ch341_set_baudrate_lcr(struct usb_device
*dev,
 	int r;
 	unsigned long factor;
 	short divisor;
+	u8 msb;
+	s32 baud_wanted;
+	u32 denom;
 
 	if (!priv->baud_rate)
 		return -EINVAL;
@@ -168,6 +176,44 @@ static int ch341_set_baudrate_lcr(struct usb_device
*dev,
 	factor = 0x10000 - factor;
 	a = (factor & 0xff00) | divisor;
 
+	/*
+	 * Calculate baud error using the 0,1,2,3 lsb and
+	 * also the error without the divisor (lsb==7).
+	 * Decide whether the divisor should be used.
+	 */
+	msb = (a >> 8) & 0xff;
+	baud_wanted = priv->baud_rate;
+	denom = (1ul << (10 - 3 * (divisor & 0x03))) * (256 - msb);
+	/*
+	 * baud_wanted==(CH341_OSC_FREQUENCY/256) implies msb==0 for no
divisor
+	 * the 100 is for rounding.
+	 */
+	if (denom && ((baud_wanted + 100) >= (((u32)CH341_OSC_FREQUENCY) >>
8))) {
+		/* Calculate error for divisor */
+		long baud_expected = ((u32)CH341_OSC_FREQUENCY) / denom;
+		u32 baud_error_difference = abs(baud_expected-baud_wanted);
+
+		/* Calculate a for no divisor */
+		u32 a_no_divisor = ((0x10000 - (((u32)CH341_OSC_FREQUENCY)
<< 8) /
+			baud_wanted + 128) & 0xff00) | 0x07;
+
+		/* a_no_divisor is only valid for msb<248 */
+		if ((a_no_divisor >> 8) < 248) {
+			/* Calculate error for no divisor */
+			long baud_expected_no_divisor =
((u32)CH341_OSC_FREQUENCY) /
+				(256 - (a_no_divisor >> 8));
+			u32 baud_error_difference_no_divisor =
+				abs(baud_expected_no_divisor-baud_wanted);
+
+			/*
+			 * If error using no divisor is less than using
+			 * a divisor then use it instead for the "a" word.
+			 */
+			if (baud_error_difference_no_divisor <
baud_error_difference)
+				a = a_no_divisor;
+		}
+	}
+
 	/*
 	 * CH341A buffers data until a full endpoint-size packet (32 bytes)
 	 * has been received unless bit 7 is set.
-- 
2.17.1

Cheers,
Jonti

-----Original Message-----
From: Johan Hovold [mailto:johan@kernel.org] 
Sent: Friday, 21 June 2019 1:43 a.m.
To: jontio
Cc: johan@kernel.org; linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: ch341: fix wrong baud rate setting
calculation

On Sat, Jun 08, 2019 at 05:13:09PM +1200, jontio wrote:
> For some wanted baud rates ch341_set_baudrate_lcr() calculates the "a"
> value such that it produces a significantly different baud rate than 
> the desired one. This means some hardware can't communicate with the 
> CH34x chip. Particularly obvious wrong baud rates are 256000 and 
> 921600 which deviate by 2.3% and 7.4% respectively. This proposed 
> patch will bring the errors for these baud rates to below 0.5%. This 
> patch will significantly improve the error of some other unusual baud 
> rates too (such as 1333333 from 10% error to 0% error). Currently 
> ch341_set_baudrate_lcr() will accept any baud rate and can produce a 
> practically arbitrary large error (for example a 40% error for 
> 5000000) this patch does not address this issue.

It doesn't hurt to expand the commit message with further details from your
other mail.

> Signed-off-by: jontio <jontio@i4free.co.nz>

You need to sign off with your full name. It should also match the From line
(author).

> ---
>  drivers/usb/serial/ch341.c | 45 
> ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c 
> index 3bb1fff02bed..7cd1d6f70b56 100644
> --- a/drivers/usb/serial/ch341.c
> +++ b/drivers/usb/serial/ch341.c
> @@ -54,6 +54,9 @@
>  #define CH341_BAUDBASE_FACTOR 1532620800  #define 
> CH341_BAUDBASE_DIVMAX 3
>  
> +/* Chip frequency is 12Mhz. not quite the same as 
> +(CH341_BAUDBASE_FACTOR>>7) */ #define CH341_OSC_FREQUENCY 12000000
> +
>  /* Break support - the information used to implement this was gleaned
from
>   * the Net/FreeBSD uchcom.c driver by Takanori Watanabe.  Domo arigato.
>   */
> @@ -168,6 +171,48 @@ static int ch341_set_baudrate_lcr(struct usb_device
*dev,
>  	factor = 0x10000 - factor;
>  	a = (factor & 0xff00) | divisor;
>  
> +	/*
> +	 * Calculate baud error using the 0,1,2,3 LSB and
> +	 * also the error without the divisor (LSB==7).
> +	 * Decide whether the divisor should be used.

Wrap also comments at 72 cols or so.

> +	 */
> +	uint32_t msB = (a>>8) & 0xFF;
> +	uint32_t lsB = a & 0xFF;
> +	int32_t baud_wanted = priv->baud_rate;
> +	uint32_t denom = ((1<<(10-3*lsB))*(256-msB));

It's not obvious from just looking at the above chunk that 3*lsB < 10.

And some style issues:

 - declare variables at the start of the function (or possibly start of
   block), and defer non-trivial initialisation
 - use the kernel types u32, s32 or plain (unsigned) int instead of the
   c99 types.
 - no camel case, msb, lsb is fine
 - add a space on both sides of operators (also in your comments)
 - drop the denom outmost parenthesis (also in some expressions below)
 - please use lowercase hex notation for consistency with the rest of
   the driver (function)

> +	/*
> +	 * baud_wanted==(CH341_OSC_FREQUENCY/256) implies MSB==0 for no
divisor
> +	 * the 100 is for rounding.
> +	 */
> +	if (denom && ((baud_wanted+100) >= 
> +(((uint32_t)CH341_OSC_FREQUENCY)>>8))) {
> +
> +		/* Calculate error for divisor */
> +		int32_t baud_expected = ((uint32_t)CH341_OSC_FREQUENCY) /
denom;
> +		uint32_t baud_error_difference =
abs(baud_expected-baud_wanted);
> +
> +		/* Calculate a for no divisor */
> +		uint32_t a_no_divisor =
((0x10000-(((uint32_t)CH341_OSC_FREQUENCY)<<8) /
> +			baud_wanted+128) & 0xFF00) | 0x07;
> +
> +		/* a_no_divisor is only valid for MSB<248 */
> +		if ((a_no_divisor>>8) < 248) {
> +
> +			/* Calculate error for no divisor */
> +			int32_t baud_expected_no_divisor =
((uint32_t)CH341_OSC_FREQUENCY) /
> +				(256-(a_no_divisor>>8));
> +			uint32_t baud_error_difference_no_divisor =
> +				abs(baud_expected_no_divisor-baud_wanted);
> +
> +			/*
> +			 * If error using no divisor is less than using
> +			 * a divisor then use it instead for the "a" word.
> +			 */
> +			if (baud_error_difference_no_divisor <
baud_error_difference)
> +				a = a_no_divisor;
> +		}
> +

Stray newline.

> +	}
> +
>  	/*
>  	 * CH341A buffers data until a full endpoint-size packet (32 bytes)
>  	 * has been received unless bit 7 is set.

Ok, I'm gonna have to look at this again, but perhaps you can consider the
style input meanwhile.

Johan


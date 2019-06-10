Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEDAE3ACFF
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2019 04:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730165AbfFJCcY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Jun 2019 22:32:24 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35874 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730055AbfFJCcY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Jun 2019 22:32:24 -0400
Received: by mail-pf1-f196.google.com with SMTP id u22so4360150pfm.3
        for <linux-usb@vger.kernel.org>; Sun, 09 Jun 2019 19:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=QUweCUwjXg7O7PTP/jbrlEgxePjg74Y2vdFGqMqgLhU=;
        b=W9Jvwg1Nb28DCNkVy2cxkJDfmRvsEeqL3s3h7F8TbA7QGLqs/2jj2hRp6VaOmLfH/R
         MZfSllllewUNgG6jUu4xCjOb/f5mIxPKqYOU56rHaRRKa2aL2FQ5sTvqPsvMZFoEKzuq
         TZdDugYMZzGmIDF0zok25RtKAp+vV425uCZhvnwCKO63ajVCHghvaFMmqhc6Y/xinRRr
         vqx1+K1PjgFefKWmOJoDayS77hc/ToILYjngnKxHRgbM0r51amM5vz3P0vy3ecOXcMOj
         JCb89Kbo2enmirJ0lzqvS3eziBWOkaYXkc0pgjvcpTFAuzoInIHfSNLIL5Rp4R81w32E
         mRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:references:in-reply-to:subject
         :date:message-id:mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=QUweCUwjXg7O7PTP/jbrlEgxePjg74Y2vdFGqMqgLhU=;
        b=OWJ3uKjiJwtRTElv3IvbZuzQ0Al8YCCbONLyhJlMs4j9eWxPit+Ok0YuIM4gXPFMJn
         LpkEygXLLsSGiWwOsSB3TnBaJjwyi+IkBBAtmUGqHfJKv1yYil59l6phittIyY3htj2E
         m1z/3TB6ifhOG7d+uehQPexzpbRsYh7zQo56JcJoGV5UefEJgMdBnBdil9rq5taUGTiP
         qzpj8MK+hV4qbUz0jXAmSsGGDP+3h4ueIUbIZ1bAFUgryRhLskSb4aphAivlNFZ7kgh3
         mfFnuYjd6QQ1zv+ecCczkVcuj+ENyGUlyNNHOZiTh7YE+U+ATlMczWnPsYXSlW3sMBK2
         1Y7Q==
X-Gm-Message-State: APjAAAUsg69TAc3IbUf3nnafYCX2oVKEO+f77tPkCFG+/WKOureaST1O
        K8YllhVaMDAnznBPY5FXZd0=
X-Google-Smtp-Source: APXvYqy1aHvT6OO2C+e58cvmb+V6MQ6EfBZATiaT8Vb6/7mjQGRP3zqLDlj0rJxtpDlb77HOufKHGQ==
X-Received: by 2002:a63:af44:: with SMTP id s4mr13665272pgo.411.1560133943685;
        Sun, 09 Jun 2019 19:32:23 -0700 (PDT)
Received: from PC201407091922 (28.215.252.27.dyn.cust.vf.net.nz. [27.252.215.28])
        by smtp.gmail.com with ESMTPSA id a3sm2590802pfo.49.2019.06.09.19.32.20
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 09 Jun 2019 19:32:23 -0700 (PDT)
From:   "Jonathan Olds" <jontio@i4free.co.nz>
To:     "'Johan Hovold'" <johan@kernel.org>
Cc:     <frank@kingswood-consulting.co.uk>, <werner@cornelius-consult.de>,
        <boris@hajduk.org>, <linux-usb@vger.kernel.org>,
        "'Jonti Olds'" <joldsphone@gmail.com>
References: <000901d50e93$7cb31470$76193d50$@co.nz> <20190603072337.GB3668@localhost> 
In-Reply-To: 
Subject: RE: linux/drivers/usb/serial/ch341.c calculates some baud rates wrong
Date:   Mon, 10 Jun 2019 14:32:16 +1200
Message-ID: <000001d51f34$bad6afd0$30840f70$@co.nz>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AdUZ3UfHN2bTxA3STX64Y2wikQAqMwDqkJjwAGrGwXA=
Content-Language: en-nz
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan,

Thanks for the info. I followed
https://nickdesaulniers.github.io/blog/2017/05/16/submitting-your-first-patc
h-to-the-linux-kernel-and-responding-to-feedback/ and made a proposal patch
("[PATCH] USB: serial: ch341: fix wrong baud rate setting calculation"
https://lore.kernel.org/linux-usb/20190608051309.4689-1-jontio@i4free.co.nz/
).

I've measured the actual baud rates for a lot of given baud rates and I
think I have deduced the formulas for calculating the "a" value. "a" is a
uint16 and split up in two, a LSB and a MSB. The current driver only uses
LSB from the set {0,1,2,3}. There is another valid LSB of 7 that the current
driver doesn't use. The formula for LSB from the set {0,1,2,3} is...

Actual baud rate == 2^(3*LSB-10)*12000000/(256-MSB), if LSB is in {0,1,2,3}
and 0<MSB<255

When LSB == 7 then things are a bit different. LSB==7 seems to switch off
the clock divider that the LSB usually does but only if MSB<248; when
MSB>=248 the clock divider is turned back on and LSB is effectively 3 again.
So we can also use the following formula...

Actual baud rate == 12000000/(256-MSB), if LSB == 7 and 0<MSB<248

So the trick is to use these formulas to find a MSB and a LSB that produce
and actual baud rate that are as close as possible to the desired baud rate.
With errors greater than say 2 to 3% hardware will start to fail to
communicate.

Looking at some common baud rates only the higher rates are affected by not
using a LSB of 7. Of the typical rates only 256000 and 921600 are affected.
However other unusual frequencies are affected too such as 1333333 and I
think you could calculate a lot more unusual affected frequencies. That
being the case I think calculating the MSB when LSB == 7 for a given wanted
baud rate might be a better solution than special cases for each affected
baud rate.

I've tested the patch with my hardware and it seems to work fine with every
setting I could throw at it. I am aware that I've only tried it on my
hardware with a CH340G chip. So trying with different chips and computers
would be a good idea (I've tested it on the CH340G chip with two computers).

My measurements/workings as a libre/open office calc file can be downloaded
from https://jontio.github.io/linux_kernel_work/ch43x_tests.ods .

I measured the following with the current driver (without my patch) using my
scope...

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

The patch will fix 256000, 1333333 and 921600 but not 1843200 and 5000000.

Cheers,
Jonti

-----Original Message-----
From: Johan Hovold [mailto:johan@kernel.org]
Sent: Monday, 3 June 2019 7:24 p.m.
To: Jonathan Olds
Cc: johan@kernel.org; frank@kingswood-consulting.co.uk;
werner@cornelius-consult.de; boris@hajduk.org
Subject: Re: linux/drivers/usb/serial/ch341.c calculates some baud rates
wrong

Hi Jonathan,

and sorry about the late reply.

On Mon, May 20, 2019 at 10:37:48AM +1200, Jonathan Olds wrote:
> Hi,
> 
> Sorry for sending this email to so many but I've never contributed to 
> the Linux kernel before and I'm not sure how this is done or who to talk
to.

You can use scripts/get_maintainer.pl to figure out which maintainers and
lists to CC.

For USB serial that would be me and we always keep the linux-usb list on CC.

It never hurts to CC the original authors as well, just like you did here.

Note that you need to send mails to list as plain text, not html.

> With a CH340 chip the ch341 driver is loaded. My chip id is 0x31 
> according to the driver debug info.
> 
> In "static int ch341_set_baudrate_lcr(struct usb_device *dev, struct 
> ch341_private *priv, u8 lcr)"
> 
> 
> Currently we have...

...

>                a = (factor & 0xff00) | divisor;

> This "a" thing is called index when used in this function...
> 
> "ch341_control_out(dev, CH341_REQ_WRITE_REG, 0x1312, a);"
> 
> This "a" is wrong for some baud rates. (I've only tried 921600 so far)
> 
> For example at 921600 baud "a" is calculated as "0xF303". This creates 
> a baud rate of about 857000 baud. This can be seen in the following
figures...

> I saw this is another driver...

...

> So this person used cases for various baud rates that have incorrect 
> rates using the method that the current Linux kernel driver implements.
> 
> I then use the 0xF307 that this calculates for 921600 baud and put an 
> if statement into the current Linux driver like so...

...

> This produced the correct baud rate as can be seen in the following 
> figure...

> I found this bug out of necessity. I made a board ( 
> http://jontio.zapto.org/jpic ) and programmed initially in Windows 
> without any baud rate issues. Then moving to Linux the board wasn't 
> able to connect as the baud rate where incorrect. So it is a real bug 
> and one that needs addressing. Fortunately the solution looks like 
> using the code with the cases in it. I have no idea where the 
> programming documentation is for this chip so this index number for 
> setting the baud rate is just a magic number to me at the moment.
> 
> What is the process to get this fix incorporated into new updates to 
> Linux kernel? If you want I can create a list of what standard baud 
> rates are incorrect and by how much with an oscilloscope; I think it 
> will only be for the very high baud rates and may only affect 921600 and
above.

Such a list would be very useful to have.

And I agree that if you can't infer the algorithm used from your
experimental data we may need to start special casing.

Please do gather the data, and send it to the list and propose a patch for
fixing the broken rates.

Thanks,
Johan


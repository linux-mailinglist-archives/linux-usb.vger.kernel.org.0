Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 898291527A4
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2020 09:50:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728028AbgBEIug (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Feb 2020 03:50:36 -0500
Received: from mail-lj1-f181.google.com ([209.85.208.181]:40001 "EHLO
        mail-lj1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727459AbgBEIug (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Feb 2020 03:50:36 -0500
Received: by mail-lj1-f181.google.com with SMTP id n18so1458641ljo.7
        for <linux-usb@vger.kernel.org>; Wed, 05 Feb 2020 00:50:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=k32FpIieMHgsQ+cGHjbrPiIA7G5rCIEiSGPLCV5q90A=;
        b=jinHOHtaQ1V3PX+ftKSEJziwkn/KPBRjGVFOKinuPRarYN2VNPCUHVWyPb3OWfAh1n
         lQ3pKuXz6aV1yYEVobNVf2HCORqb1dX8LTZadbh6laqi5Om3TgF2fA/mDJ2pqWPJAwiO
         /w8MgY7h1nVTTwaduj2uRLpmaYHvKObl/p8qSRLy8M1/1v9ggxflk9BiC/a5Sj1VyIgH
         Ly3fNxSkxNh46VDMlB/6PvbPIhHu/wi2T8uvKlKc7quMDMLxicxbBAMJD7bqWSp5nFLS
         n0k6bE5hFHpGJEHP0xbbqDLUBZR2V1AYyNFLVp70zeOvo5l2wbdjzbuqs23NEoC76KLd
         F6xQ==
X-Gm-Message-State: APjAAAXbxWMt+y2cjFPwMsF91Jk5SDsA137+9QEyruC20xOrvDa41WOK
        uNRA2OGz6Tx74bRCyDBeGpCZY2qU
X-Google-Smtp-Source: APXvYqycAEepyR9OhzyKAZ+pY/dmQvIY80q+/hXb2/MdiyF9enAu0HEq+HK/C1ucIE75aBF6gVjH9g==
X-Received: by 2002:a2e:8119:: with SMTP id d25mr19847845ljg.76.1580892634528;
        Wed, 05 Feb 2020 00:50:34 -0800 (PST)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id n3sm12665096ljc.100.2020.02.05.00.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2020 00:50:33 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1izGOR-0003r8-5R; Wed, 05 Feb 2020 09:50:43 +0100
Date:   Wed, 5 Feb 2020 09:50:43 +0100
From:   Johan Hovold <johan@kernel.org>
To:     jakub nantl <jn@forever.cz>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: ch341 garbage read with 5.5.x kernel
Message-ID: <20200205085043.GR26725@localhost>
References: <b23691c8-9219-b360-6114-93e86a8bd997@forever.cz>
 <20200205074312.GP26725@localhost>
 <fb82eb2f-ff8d-1e02-2f48-9667c86742a4@forever.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb82eb2f-ff8d-1e02-2f48-9667c86742a4@forever.cz>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 05, 2020 at 08:53:55AM +0100, jakub nantl wrote:
> On 05. 02. 20 8:43, Johan Hovold wrote:
> > There were some fixes to the baudrate handling that went into 5.5 that
> > are likely related to this.
> >
> > These changes provide more accurate output rates, but I have since
> > received one report that it may inadvertently have made the device more
> > sensitive to errors in the input rate. In that case, the reporter
> > switched to a baudrate that matches his actual rate which was 117647
> > rather than 115200 (i.e. 2.1% error) and that addressed the problem.
> >
> > Which baudrate are you using here?
> 
> my baudrate is 115200, how can I get "my" actual rate ?

You can always use a scope or logic analyser, but you can derive it
theoretically if you know what oscillator frequency the arduino is
using. You should be able to find more details in the datasheet for the
MCU in question.

For example, if you look at section 19.11 in the ATmega238p datasheet
you see that with a 16 MHz clock you may end up with a -3.5% or 2.1%
error at 115200. The latter is likely the 117647 rate mentioned above.

That said, I have a hypothesis for how we may get the best of both
worlds here.

Can you try the below patch which restores a component included in the
first version of the new algorithm, but which I ultimately deemed
redundant?

Johan


From 0b833ae9dde819ffb41c8d16d3591484d1eab04c Mon Sep 17 00:00:00 2001
From: Johan Hovold <johan@kernel.org>
Date: Wed, 5 Feb 2020 09:33:15 +0100
Subject: [PATCH] USB: serial: ch341: prefer lower divisors

Although it was assumed to not make a difference, not using the factor 2
prescaler appears to make the receiver more susceptible for errors in
the input rate. Specifically, there are reports of problems with devices
that cannot generate a 115200 rate with a smaller error than 2.1% (e.g.
117647 bps).

So whenever possible, enable the factor 2 prescaler and halve the
divisor in order to use settings closer to that of the previous
algorithm.

Fixes: 35714565089e ("USB: serial: ch341: reimplement line-speed handling")
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/ch341.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index df582fe855f0..86686e60238a 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -205,6 +205,12 @@ static int ch341_get_divisor(speed_t speed)
 			16 * speed - 16 * CH341_CLKRATE / (clk_div * (div + 1)))
 		div++;
 
+	/* Prefer lower base clock (fact = 0) if even divisor. */
+	if (fact == 1 && div % 2 == 0) {
+		div >>= 1;
+		fact = 0;
+	}
+
 	return (0x100 - div) << 8 | fact << 2 | ps;
 }
 
-- 
2.24.1


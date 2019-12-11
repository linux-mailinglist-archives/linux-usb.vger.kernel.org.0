Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53E4A11A4C8
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 08:04:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbfLKHE3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 02:04:29 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41674 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbfLKHE3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 02:04:29 -0500
Received: by mail-lf1-f65.google.com with SMTP id m30so15767211lfp.8
        for <linux-usb@vger.kernel.org>; Tue, 10 Dec 2019 23:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vincit.fi; s=ticniv;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=XNMG6GKj2NXVBB37gpma/mg5NGu0I4q3OQ4Bmc6kCpo=;
        b=EwePhHWY21uWZ5nancuGAA3ZZL8vqNmmB+tbJnRIxrjwIbKk9FVmRobcWGcREoXjwi
         WLfVyu5iuO6WcGM20DO1ehjQk78sjtb9Qc9tSZYNKOCsS8nKxIoKd1rjurnLPstJwrRR
         m5DnCW0y7r7iziVFdO+LJgdWkdwe4pJPk+Cds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=XNMG6GKj2NXVBB37gpma/mg5NGu0I4q3OQ4Bmc6kCpo=;
        b=G25Zh4YQKRV5II7aKaW92YLFJcCSPmvqB5JG5E3UBGhC7Wp9L/L7GcNi8yGVOuZBrb
         7GBWE7g2+awX+iL87dTAWxFuksk0txfCXnMExT7Vn5kqkS6n7axwwtsCrYKQiKrJzSNa
         mWQFFTcfp89tZ54eQ2XDqwyY1FgnirwT9DJ1kYgos2BDGlN+HfRloQT4e+K57n39r4k1
         HqnLgmwNE8CqQIspzkC3yQt7rsX3rL2gE/ItJwSNTGD+wD92XfuOZQy4GwqQAMA/f+/8
         3n420p4TtBOAJfepLDOxwnMPone4bgIx+19K0bNglMdn7HXDpNk6FIBnTfG6fVLLEj4m
         +rgw==
X-Gm-Message-State: APjAAAXLX4HElFo6W3N3itAagwHa9BLJyaYWlBxYaWBPE8zhctf/0AaW
        yZXNBvvxGSzxSx/+Xr9NsDlntA==
X-Google-Smtp-Source: APXvYqzt2W7l/AwM7TWljKqCEncujBjPPRV0Y2SAdAdZwpG8jO5JyK/5woahh4JAPKBdhI41X1xs2A==
X-Received: by 2002:ac2:48bc:: with SMTP id u28mr1098708lfg.81.1576047866454;
        Tue, 10 Dec 2019 23:04:26 -0800 (PST)
Received: from LAPTOPJ4R3A4KE ([213.255.177.137])
        by smtp.gmail.com with ESMTPSA id y72sm594353lfa.12.2019.12.10.23.04.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Dec 2019 23:04:25 -0800 (PST)
From:   "Erkka Talvitie" <erkka.talvitie@vincit.fi>
To:     "'Alan Stern'" <stern@rowland.harvard.edu>
Cc:     <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <claus.baumgartner@med.ge.com>
References: <1ec66c398699e95ca2b5755f6cbb8c5d2453dd71.1575893227.git.erkka.talvitie@vincit.fi> <Pine.LNX.4.44L0.1912101004240.1647-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1912101004240.1647-100000@iolanthe.rowland.org>
Subject: RE: [PATCH] USB: EHCI: Do not return -EPIPE when hub is disconnected
Date:   Wed, 11 Dec 2019 09:04:22 +0200
Message-ID: <000401d5aff1$387f1790$a97d46b0$@vincit.fi>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGmTT+zG7Q1oofVq4vr3p+FUaNtWagTQahA
Content-Language: fi
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks for the review.

> -----Original Message-----
> From: Alan Stern <stern@rowland.harvard.edu>
> Sent: tiistai 10. joulukuuta 2019 17.12
> To: Erkka Talvitie <erkka.talvitie@vincit.fi>
> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org;
> claus.baumgartner@med.ge.com
> Subject: Re: [PATCH] USB: EHCI: Do not return -EPIPE when hub is
> disconnected
> 
> On Tue, 10 Dec 2019, Erkka Talvitie wrote:
> 
> > When disconnecting a USB hub that has some child device(s) connected
> > to it (such as a USB mouse), then the stack tries to clear halt and
> > reset device(s) which are _already_ physically disconnected.
> >
> > The issue has been reproduced with:
> >
> > CPU: IMX6D5EYM10AD or MCIMX6D5EYM10AE.
> > SW: U-Boot 2019.07 and kernel 4.19.40.
> >
> > CPU: HP Proliant Microserver Gen8.
> > SW: Linux version 4.2.3-300.fc23.x86_64
> >
> > In this situation there will be error bit for MMF active yet the CERR
> > equals EHCI_TUNE_CERR + halt. Existing implementation interprets this
> > as a stall [1] (chapter 8.4.5).
> >
> > The possible conditions when the MMF will be active + halt can be
> > found from [2] (Table 4-13).
> >
> > Fix for the issue is to check whether MMF is active and PID Code is IN
> > before checking for the stall. If these conditions are true then it is
> > not a stall.
> >
> > What happens after the fix is that when disconnecting a hub with
> > attached device(s) the situation is not interpret as a stall.
> >
> > [1] https://www.usb.org/document-library/usb-20-specification,
> > usb_20.pdf [2]
> >
> https://www.intel.com/content/dam/www/public/us/en/documents/techn
> ical
> > -specifications/ehci-specification-for-usb.pdf
> >
> > Signed-off-by: Erkka Talvitie <erkka.talvitie@vincit.fi>
> > ---
> 
> Basically good, but you should always run patches through the
> scripts/checkpatch.pl script before sending them.  There are several
places
> where the formatting needs to be fixed.

Ok, I will do that.

> 
> >  drivers/usb/host/ehci-q.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/host/ehci-q.c b/drivers/usb/host/ehci-q.c
> > index 3276304..285622d 100644
> > --- a/drivers/usb/host/ehci-q.c
> > +++ b/drivers/usb/host/ehci-q.c
> > @@ -27,6 +27,10 @@
> >
> >
> > /*--------------------------------------------------------------------
> > -----*/
> >
> > +/* PID Codes that are used here, from EHCI specification, Table 3-16.
*/
> > +#define PID_CODE_IN    1
> > +#define PID_CODE_SETUP 2
> > +
> >  /* fill a qtd, returning how much of the buffer we were able to queue
> > up */
> >
> >  static int
> > @@ -190,7 +194,7 @@ static int qtd_copy_status (
> >  	int	status = -EINPROGRESS;
> >
> >  	/* count IN/OUT bytes, not SETUP (even short packets) */
> > -	if (likely (QTD_PID (token) != 2))
> > +	if (likely (QTD_PID (token) != PID_CODE_SETUP))
> 
> This should be "QTD_PID(token)" with no extra space before the left paren,
> and similarly for "likely(".  I realize you just kept the code the way it
already
> was, but we prefer to fix formatting errors like these whenever the line
gets
> changed, even if it's for a different reason.

Sure, I will fix those.

> 
> >  		urb->actual_length += length - QTD_LENGTH
> (token);
> >
> >  	/* don't modify error codes */
> > @@ -206,6 +210,11 @@ static int qtd_copy_status (
> >  		if (token & QTD_STS_BABBLE) {
> >  			/* FIXME "must" disable babbling
> device's port too */
> >  			status = -EOVERFLOW;
> > +		/* When MMF is active and PID Code is IN,
> queue is halted.
> > +		 * EHCI Specification, Table 4-13.
> > +		 */
> 
> Multi-line comments should be formatted like thus:
> 
> 		/*
> 		 * When MMF...
> 		 * EHCI ...
> 		 */

I will fix this.

> 
> > +		} else if((token & QTD_STS_MMF) &&
> (QTD_PID(token) == PID_CODE_IN))
> > +{
> 
> Try to avoid letting code extend beyond column 80 (for example, you could
> beak the line following the "&&").  Also, there should be a space between
> the "if" and the left paren -- the "if" isn't a function call!

This is a strange thing since in my editor there is a margin line visible
with 80 characters wide.
And this line is inside limits, actually my editor states that the line is
77 chars long.
That said, I will break the line from the && and fix the if.

> 
> > +			status = -EPROTO;
> >  		/* CERR nonzero + halt --> stall */
> >  		} else if (QTD_CERR(token)) {
> >  			status = -EPIPE;
> 
> When you fix up these minor issues and resubmit, you can add:
> 
> Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

Thank you!
 

> 
> Alan Stern

Erkka Talvitie


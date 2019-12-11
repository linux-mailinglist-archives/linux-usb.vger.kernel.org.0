Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4CFC11A566
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 08:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727829AbfLKHu5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 02:50:57 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34328 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726988AbfLKHu5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 02:50:57 -0500
Received: by mail-lf1-f65.google.com with SMTP id l18so15913582lfc.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Dec 2019 23:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vincit.fi; s=ticniv;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=OF4VcgKV87Q/T4f6F3k1GEneMrWrfu5Os61c29eO7J8=;
        b=iLPttJlodJt04ykS4D0fl2PJiwATh1PCXA+27ylVfvWEEfOFrvu0vJou5hpoVGXWm0
         awwgZo2q9LEaKhvd8v37TdK9P1Mw5seAAKckZkpKsQxmRi7oLGmDf5CdDPITSYZeYKU3
         FDBqhxvGzQG8mM1PxmrUI4J/BNg5sindfUVR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=OF4VcgKV87Q/T4f6F3k1GEneMrWrfu5Os61c29eO7J8=;
        b=BGCSt6J65oxdoO5/HH/xEaOkdz+uRkttV6tctDactF31uecdyNkr+fwJ3YyDl2rXlT
         LhbO2Zl41/tBVLfFwrSHhrAjyF7v0hUDJiPW0N4DFxVCGO8pee7bnf/aj7mSQjO1dVNK
         f7cpnXEThMlaP1TeZJIbjScjynDgpBBLiIRAPsHGNHEfHt4feVlA2vGIsyFJIGwjxU8K
         kGC1JlS4nXbbCWy1hcmAJfoXaNY/u2JRmYjdczpqlpfO55YR/WPNEsX0SFPN0P3cGwG8
         4Lw7yjyIu/AwtWY/7AykWW7Y+0CByCJ91eHzQlh6RR0puvb8s+HSe7nblQLlwROt+Nfy
         oreQ==
X-Gm-Message-State: APjAAAUxlJYWsPguDyDN5DzQj8VUUeuqkBjL3zgfOr0L8/9tMR5zzwjh
        EtTO4i2U9qWGQ7/IZJKoYuLttw==
X-Google-Smtp-Source: APXvYqxiOfNbhgxNH5R7TiLmMSVOggbHNxuiuPolTDKkixawooEZcfICnMrFZjDP5cCJwUzH7y5AAA==
X-Received: by 2002:a19:8c4d:: with SMTP id i13mr1268089lfj.42.1576050654785;
        Tue, 10 Dec 2019 23:50:54 -0800 (PST)
Received: from LAPTOPJ4R3A4KE ([213.255.177.137])
        by smtp.gmail.com with ESMTPSA id j22sm638594lfh.93.2019.12.10.23.50.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Dec 2019 23:50:54 -0800 (PST)
From:   "Erkka Talvitie" <erkka.talvitie@vincit.fi>
To:     "'Alan Stern'" <stern@rowland.harvard.edu>
Cc:     <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <claus.baumgartner@med.ge.com>
References: <1ec66c398699e95ca2b5755f6cbb8c5d2453dd71.1575893227.git.erkka.talvitie@vincit.fi> <Pine.LNX.4.44L0.1912101004240.1647-100000@iolanthe.rowland.org> <000401d5aff1$387f1790$a97d46b0$@vincit.fi>
In-Reply-To: <000401d5aff1$387f1790$a97d46b0$@vincit.fi>
Subject: RE: [PATCH] USB: EHCI: Do not return -EPIPE when hub is disconnected
Date:   Wed, 11 Dec 2019 09:50:52 +0200
Message-ID: <000501d5aff7$b6d56940$24803bc0$@vincit.fi>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRM5Z/lnn/WKPUI0oH6OHNTAuNiQGmTT+zAc+Ud++nIdjZcA==
Content-Language: fi
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Erkka Talvitie <erkka.talvitie@vincit.fi>
> Sent: keskiviikko 11. joulukuuta 2019 9.04
> To: 'Alan Stern' <stern@rowland.harvard.edu>
> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org;
> claus.baumgartner@med.ge.com
> Subject: RE: [PATCH] USB: EHCI: Do not return -EPIPE when hub is
> disconnected
> 
> Thanks for the review.
> 
> > -----Original Message-----
> > From: Alan Stern <stern@rowland.harvard.edu>
> > Sent: tiistai 10. joulukuuta 2019 17.12
> > To: Erkka Talvitie <erkka.talvitie@vincit.fi>
> > Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org;
> > claus.baumgartner@med.ge.com
> > Subject: Re: [PATCH] USB: EHCI: Do not return -EPIPE when hub is
> > disconnected
> >
> > On Tue, 10 Dec 2019, Erkka Talvitie wrote:
> >
> > > When disconnecting a USB hub that has some child device(s) connected
> > > to it (such as a USB mouse), then the stack tries to clear halt and
> > > reset device(s) which are _already_ physically disconnected.
> > >
> > > The issue has been reproduced with:
> > >
> > > CPU: IMX6D5EYM10AD or MCIMX6D5EYM10AE.
> > > SW: U-Boot 2019.07 and kernel 4.19.40.
> > >
> > > CPU: HP Proliant Microserver Gen8.
> > > SW: Linux version 4.2.3-300.fc23.x86_64
> > >
> > > In this situation there will be error bit for MMF active yet the
> > > CERR equals EHCI_TUNE_CERR + halt. Existing implementation
> > > interprets this as a stall [1] (chapter 8.4.5).
> > >
> > > The possible conditions when the MMF will be active + halt can be
> > > found from [2] (Table 4-13).
> > >
> > > Fix for the issue is to check whether MMF is active and PID Code is
> > > IN before checking for the stall. If these conditions are true then
> > > it is not a stall.
> > >
> > > What happens after the fix is that when disconnecting a hub with
> > > attached device(s) the situation is not interpret as a stall.
> > >
> > > [1] https://www.usb.org/document-library/usb-20-specification,
> > > usb_20.pdf [2]
> > >
> >
> https://www.intel.com/content/dam/www/public/us/en/documents/techn
> > ical
> > > -specifications/ehci-specification-for-usb.pdf
> > >
> > > Signed-off-by: Erkka Talvitie <erkka.talvitie@vincit.fi>
> > > ---
> >
> > Basically good, but you should always run patches through the
> > scripts/checkpatch.pl script before sending them.  There are several
> places
> > where the formatting needs to be fixed.
> 
> Ok, I will do that.

Nice tool! I tested it with my old patch and indeed it revealed the issues.
Now with the new patch 0 warnings or errors. Thanks for the tip!

> 
> >
> > >  drivers/usb/host/ehci-q.c | 11 ++++++++++-
> > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/usb/host/ehci-q.c b/drivers/usb/host/ehci-q.c
> > > index 3276304..285622d 100644
> > > --- a/drivers/usb/host/ehci-q.c
> > > +++ b/drivers/usb/host/ehci-q.c
> > > @@ -27,6 +27,10 @@
> > >
> > >
> > > /*------------------------------------------------------------------
> > > --
> > > -----*/
> > >
> > > +/* PID Codes that are used here, from EHCI specification, Table 3-16.
> */
> > > +#define PID_CODE_IN    1
> > > +#define PID_CODE_SETUP 2
> > > +
> > >  /* fill a qtd, returning how much of the buffer we were able to
> > > queue up */
> > >
> > >  static int
> > > @@ -190,7 +194,7 @@ static int qtd_copy_status (
> > >  	int	status = -EINPROGRESS;
> > >
> > >  	/* count IN/OUT bytes, not SETUP (even short packets) */
> > > -	if (likely (QTD_PID (token) != 2))
> > > +	if (likely (QTD_PID (token) != PID_CODE_SETUP))
> >
> > This should be "QTD_PID(token)" with no extra space before the left
> > paren, and similarly for "likely(".  I realize you just kept the code
> > the way it
> already
> > was, but we prefer to fix formatting errors like these whenever the
> > line
> gets
> > changed, even if it's for a different reason.
> 
> Sure, I will fix those.
> 
> >
> > >  		urb->actual_length += length - QTD_LENGTH
> > (token);
> > >
> > >  	/* don't modify error codes */
> > > @@ -206,6 +210,11 @@ static int qtd_copy_status (
> > >  		if (token & QTD_STS_BABBLE) {
> > >  			/* FIXME "must" disable babbling
> > device's port too */
> > >  			status = -EOVERFLOW;
> > > +		/* When MMF is active and PID Code is IN,
> > queue is halted.
> > > +		 * EHCI Specification, Table 4-13.
> > > +		 */
> >
> > Multi-line comments should be formatted like thus:
> >
> > 		/*
> > 		 * When MMF...
> > 		 * EHCI ...
> > 		 */
> 
> I will fix this.
> 
> >
> > > +		} else if((token & QTD_STS_MMF) &&
> > (QTD_PID(token) == PID_CODE_IN))
> > > +{
> >
> > Try to avoid letting code extend beyond column 80 (for example, you
> > could beak the line following the "&&").  Also, there should be a
> > space between the "if" and the left paren -- the "if" isn't a function
call!
> 
> This is a strange thing since in my editor there is a margin line visible
with 80
> characters wide.
> And this line is inside limits, actually my editor states that the line is
> 77 chars long.
> That said, I will break the line from the && and fix the if.
> 
> >
> > > +			status = -EPROTO;
> > >  		/* CERR nonzero + halt --> stall */
> > >  		} else if (QTD_CERR(token)) {
> > >  			status = -EPIPE;
> >
> > When you fix up these minor issues and resubmit, you can add:
> >
> > Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
> 
> Thank you!
> 
> 
> >
> > Alan Stern
> 
> Erkka Talvitie



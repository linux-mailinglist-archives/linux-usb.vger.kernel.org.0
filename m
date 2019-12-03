Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0BFA10FAE2
	for <lists+linux-usb@lfdr.de>; Tue,  3 Dec 2019 10:38:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726079AbfLCJi6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Dec 2019 04:38:58 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34034 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbfLCJi6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Dec 2019 04:38:58 -0500
Received: by mail-lj1-f196.google.com with SMTP id m6so3020989ljc.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Dec 2019 01:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vincit.fi; s=ticniv;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=g+8IcdK/TUF0Vi/c3MyoQWU+4Yop3SAHLyZ+SskjAt4=;
        b=RtoXyNKnxOkWnQR4QLoaK3vWlhjnZMC8fH/uEYMsa0o+gg/jMXa68V8g+jhT9lKUh2
         wXsY5I570Q4itsWPAqJahTV0wlOURRMkDpEBKQRQDezrD72wTbxSZtJzdbPl8VPLYDD6
         yn77UVZB4C1z9t0F9R2SdrU30/OtkuTjS71Bg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=g+8IcdK/TUF0Vi/c3MyoQWU+4Yop3SAHLyZ+SskjAt4=;
        b=pA98g/GwDhWArt8Qa0zfiIQaZe4N+RrGc7vY1pwF38do0+tkkn3ECd+Af+pA9031q6
         u1WN2IlN6st3Cp35CU+VCt+QcZpDcsaLVb48qQUct204oNt4PAsk4LD1gJ4vPLIP0/0p
         KQ6xZelT6O2eYg86DFibl8LgyJx+AYET7v8rJHFdepa+fy4ov9g8y36lLD5J6PTCgsQb
         Rokle3U7O3B1rSraErnM8tSw8bfCsoGnPkak+uzEoBmC6kurScOnZgk7xrhCf0FJkqPw
         zBo+q0g2viSrzgZLtw9tNTnbwhXYXXx1fxzO6yE9ZzFS+U5EePGJ4iKfo2bzRexkNZiG
         BltQ==
X-Gm-Message-State: APjAAAUYSatY6AsU/XysUxnr4Itv0RwPKaCffgppfWthX856HpkEuPJJ
        ySK12w08N9m+F9dKzd4Dt9RAciW4owo=
X-Google-Smtp-Source: APXvYqz8r9Xyw9NSYtyz43QDAiIUVgk6VkgA+eCQ5h3xhW8l/5Rcb9fNDd74WkilQGSdGHDlKX70cQ==
X-Received: by 2002:a2e:7f08:: with SMTP id a8mr1890106ljd.164.1575365934823;
        Tue, 03 Dec 2019 01:38:54 -0800 (PST)
Received: from LAPTOPJ4R3A4KE ([213.255.177.137])
        by smtp.gmail.com with ESMTPSA id l28sm974493lfk.21.2019.12.03.01.38.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Dec 2019 01:38:54 -0800 (PST)
From:   "Erkka Talvitie" <erkka.talvitie@vincit.fi>
To:     "'Alan Stern'" <stern@rowland.harvard.edu>
Cc:     <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <claus.baumgartner@med.ge.com>
References: <1046f0c10876628227b7c9f303b0582a20406b14.1575030959.git.erkka.talvitie@vincit.fi> <Pine.LNX.4.44L0.1912021349440.1559-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1912021349440.1559-100000@iolanthe.rowland.org>
Subject: RE: [RFCv1 1/1] USB: EHCI: Do not return -EPIPE when hub is disconnected
Date:   Tue, 3 Dec 2019 11:38:52 +0200
Message-ID: <01d701d5a9bd$79fc5230$6df4f690$@vincit.fi>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEpGyteMNH2h+aqkW7BIWMBbCx3ZakBIQew
Content-Language: fi
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thank you for the comments.

> -----Original Message-----
> From: Alan Stern <stern@rowland.harvard.edu>
> Sent: maanantai 2. joulukuuta 2019 21.44
> To: Erkka Talvitie <erkka.talvitie@vincit.fi>
> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org;
> claus.baumgartner@med.ge.com
> Subject: Re: [RFCv1 1/1] USB: EHCI: Do not return -EPIPE when hub is
> disconnected
> 
> On Fri, 29 Nov 2019, Erkka Talvitie wrote:
> 
> > When disconnecting a USB hub that has some child device(s) connected
> > to it (such as a USB mouse), then the stack tries to clear halt and
> > reset device(s) which are _already_ physically disconnected.
> 
> That behavior is understandable.  The kernel doesn't know that the device
> has been disconnected until it can process the notification from an
upstream
> hub, and it can't process that notification while it's trying to reset the
device.
> 

Ok. I was thinking that in this use case , it should not be trying to clear
the halt (and reset the device when the clear halt fails). And this behavior
was altered by this RFC.

> > The issue has been reproduced with:
> >
> > CPU: IMX6D5EYM10AD or MCIMX6D5EYM10AE.
> > SW: U-Boot 2019.07 and kernel 4.19.40.
> >
> > In this situation there will be error bit for MMF active yet the CERR
> > equals EHCI_TUNE_CERR + halt.
> 
> Why?  In general, setting the MMF bit does not cause the halt bit to be
set
> (set Table 4-13 in the EHCI spec).  In fact, MMF refers to errors that
occur on
> the host, not bus errors caused by a disconnected device.
 
I do not know for sure why that happens. I was suspecting that there has
been MMF error and a stall at the same time. And in this RFC it was assumed
that MMF is with greater priority than stall.
The disconnecting of a hub with attached devices cause the MMF error bit set
even though it is a host side error.

> 
> > Existing implementation
> > interprets this as a stall [1] (chapter 8.4.5).
> 
> That is the correct thing to do.  When a transaction error occurs during a
> Complete-Split transaction, the host controller is supposed to decrement
the
> CERR value, set the XACT bit, and retry the transaction unless the CERR
value
> is 0 or there isn't enough time left in the microframe.
> 
> The fact that you saw CERR equal to EHCI_TUNE_CERR and XACT clear
> probably means that your EHCI hardware is not behaving properly.
 
If you refer to the XactErr  bit (Table 4-13 [2] )with the "XACT clear" then
unfortunately I did not check it's state ,so I am not sure if it was clear.
In this patch, like also in the existing implementation, the MMF bit is
checked first and since it is active in this situation the XactErr is not
checked.

I will check this.

But as in this use case the CERR has not been decreased yet there is error
bit active (MMF) do you see it is still correct to interpret it as a stall
(even when the halt bit is set)?

I have tried to find out more details about our EHCI controller version, but
I have only found out those CPU versions. It might help in a search whether
this could be a HW issue.

> 
> > Fix for the issue is at first to check for a stall that comes after an
> > error (the CERR has been decreased).
> >
> > Then after that, check for other errors.
> >
> > And at last check for stall without other errors (the CERR equals
> > EHCI_TUNE_CERR as stall does not decrease the CERR [2] (table 3-16)).
> >
> > What happens after the fix is that when disconnecting a hub with
> > attached device(s) the situation is not interpret as a stall.
> >
> > The specification [2] is not clear about error priorities, but since
> > there is no explicit error bit for the stall, it is assumed to be
> > lower priority than other errors.
> 
> On the contrary, the specification is very clear.  Since transaction
errors cause
> CERR to be decremented until it reaches 0, a nonzero value for CERR means
> the endpoint was halted for some other reason.  And the only other reason
> is a stall.  (Or end of the microframe, but there's no way to tell if that
> happened.)
 
I see your point. EHCI specification states that babble is a serious error
and it will also cause the halt. The babble error bit is checked first. But
the specification does not say about order of the other errors or about what
to do if there is an error, no retries executed, yet a halt (stall). For
example should the XactErr be checked before the MMF.

>(Or end of the microframe, but there's no way to tell if that happened.)

I was not able to locate this from the specification. Could you please point
out where this statement is from?
Could the way to tell if "end of microframe" happened, be what is done here
- check for MMF error bit and if CERR has not been decreased?

> 
> > [1] https://www.usb.org/document-library/usb-20-specification,
> > usb_20.pdf [2]
> >
> https://www.intel.com/content/dam/www/public/us/en/documents/techn
> ical
> > -specifications/ehci-specification-for-usb.pdf
> >
> > Signed-off-by: Erkka Talvitie <erkka.talvitie@vincit.fi>
> 
> Can you duplicate this behavior on a standard PC, say with an Intel EHCI
> controller?

We tested with native Linux PC and the error did not reproduce. However I am
not sure about the used host controller in that PC.
I will check that or try to get a setup with Intel EHCI. 

> 
> >  drivers/usb/host/ehci-q.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/host/ehci-q.c b/drivers/usb/host/ehci-q.c
> > index 3276304..da7fd12 100644
> > --- a/drivers/usb/host/ehci-q.c
> > +++ b/drivers/usb/host/ehci-q.c
> > @@ -206,8 +206,9 @@ static int qtd_copy_status (
> >  		if (token & QTD_STS_BABBLE) {
> >  			/* FIXME "must" disable babbling
> device's port too */
> >  			status = -EOVERFLOW;
> > -		/* CERR nonzero + halt --> stall */
> > -		} else if (QTD_CERR(token)) {
> > +		/* CERR nonzero and less than
> EHCI_TUNE_CERR + halt --> stall.
> > +		   This handles situation where stall comes after
> an error. */
> 
> This comment doesn't make sense.  Who cares whether a stall comes after
> an error or not?  It's still a stall and should be reported.

This was basically a comment trying to answer to this commit:
ba516de332c0  USB: EHCI: check for STALL before other errors

    "The existing code doesn't do this properly, because it tests for MMF
    (Missed MicroFrame) and DBE (Data Buffer Error) before testing the
    retry counter.  Thus, if a transaction gets either MMF or DBE the
    corresponding flag is set and the transaction is retried.  If the
    second attempt receives a STALL then -EPIPE is the correct return
    value.  But the existing code would see the MMF or DBE flag instead
    and return -EPROTO, -ENOSR, or -ECOMM."

The comment tries to explain that it will not revert the fix made in the
commit ba516de332c0.


> 
> > +		} else if (QTD_CERR(token) &&
> QTD_CERR(token) < EHCI_TUNE_CERR) {
> >  			status = -EPIPE;
> 
> If an error occurs and the transaction is retried and the retry gets a
stall, then
> the final status should be -EPIPE, not something else.

This is how the RFC also works. If the transaction has been retried and gets
stall then -EPIPE is returned.
Or if there are no errors but there is a stall then -EPIPE is returned.

The only difference in this patch in comparison to the existing
implementation is that if there is an error but the 
transaction has not been retried it is not interpret as a stall even if
there is a halt.
 
> 
> >  		/* In theory, more than one of the following bits
> can be set @@
> > -228,6 +229,10 @@ static int qtd_copy_status (
> >
> 	usb_pipeendpoint(urb->pipe),
> >  				usb_pipein(urb-
> >pipe) ? "in" : "out");
> >  			status = -EPROTO;
> > +		/* CERR equals EHCI_TUNE_CERR, no other
> errors + halt --> stall.
> > +		   This handles situation where stall comes
> without error bits set.
> > +*/
> 
> If CERR is equal to EHCI_TUNE_CERR then no other errors could have
> occurred (since any error will decrement CERR).  So why shouldn't this
case
> be included with the earlier case?

That is what I also understood from the EHCI specification. If there is an
error the CERR should decrease. Only babble, data buffer error and stall (or
no error) will not decrement the CERR.
However in this use case there is an error (MMF) but the CERR still equals
to the EHCI_TUNE_CERR.

So that's why the RFC separates these. This is the logic in the RFC:

1. The first if handles the situation where the stall comes after there has
been an error AND a retry. CERR has been decreased. This is so that
ba516de332c0 is not reverted.
2. The second if handles the situation where the halt has been caused by the
stall AND there are no other errors.
3. If there are errors + halt, but no retries executed (CERR equals
EHCI_TUNE_CERR) the response here is to return error value according to the
error bit, not returning EPIPE according to the stall.
 

> 
> > +		} else if (QTD_CERR(token)) {
> > +			status = -EPIPE;
> >  		} else {	/* unknown */
> >  			status = -EPROTO;
> >  		}
> 
> Alan Stern

Erkka Talvitie



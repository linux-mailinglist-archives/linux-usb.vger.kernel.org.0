Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E987113F79
	for <lists+linux-usb@lfdr.de>; Thu,  5 Dec 2019 11:35:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729044AbfLEKfx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Dec 2019 05:35:53 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38861 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728707AbfLEKfx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Dec 2019 05:35:53 -0500
Received: by mail-lj1-f194.google.com with SMTP id k8so2956516ljh.5
        for <linux-usb@vger.kernel.org>; Thu, 05 Dec 2019 02:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vincit.fi; s=ticniv;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=iHN25jpbBFxAsQYINTK7KJYHxMQ4HgP5PGyHQV3QKIg=;
        b=XO2BeLN/FPA0Np5K+040UWQ373vaxUYX5D2cMRKAti6S6zaXEJyUHHLBjg1BBgKW1B
         XutNDJtxHqUpNhd6UlfiC8i1M4ptjD2Uaqamra0jqvbFp7GTGYYYAYTasGggJMhMftrf
         KToEGMsoF3+/VnPoWyRGNAMoErRB3WXm2ihI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=iHN25jpbBFxAsQYINTK7KJYHxMQ4HgP5PGyHQV3QKIg=;
        b=fFHYnlfrm72BDb70AzUbKCjehm3Jzp3hEp21esg0uIgNg40vHXA7KfHSRdHRsRL7XB
         PFfEFhsWv2FwFAWS9qrafBxDqZLRQhPec0ghpVvm24urG4kK7eBIJz0VjmGqlFlsJsNM
         GztrL2BXQRBNl+xA82H690YdTGjsjt4ivt8R9PtaydMt0o9iua1GQsovWAx1ZRMCTbop
         y444QEGCKS3R/i9IHuviV1nu4S3pCqZOWJOpahzEyxgQqXvA4ERwnzAcosVoSrDqLNoS
         HkFvRDDO6BZv3OwWe5pyFNDztMjfBEpYGSw3f+QCQiTH7vQ14xiu85Xnr/0G0MlNGyeX
         jiog==
X-Gm-Message-State: APjAAAUJf+f/NBwswbGSmktKDu89ytCYrvMm6nmiNrSfHUJ1pmBk+757
        5Fh9dtjizSAg0+vtQBddI24CP962kPI=
X-Google-Smtp-Source: APXvYqxtB87CMs8jU6i5D+D4+dWjYfpbcRFBmhB4+kVxOh35LWo3DAyI2yRW+ne5lsN0qB/9KDOGBQ==
X-Received: by 2002:a2e:5357:: with SMTP id t23mr5110825ljd.227.1575542150929;
        Thu, 05 Dec 2019 02:35:50 -0800 (PST)
Received: from LAPTOPJ4R3A4KE ([213.255.177.137])
        by smtp.gmail.com with ESMTPSA id u21sm4657878ljl.93.2019.12.05.02.35.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Dec 2019 02:35:50 -0800 (PST)
From:   "Erkka Talvitie" <erkka.talvitie@vincit.fi>
To:     "'Alan Stern'" <stern@rowland.harvard.edu>
Cc:     <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <claus.baumgartner@med.ge.com>
References: <020901d5aaa5$415457f0$c3fd07d0$@vincit.fi> <Pine.LNX.4.44L0.1912040917500.3941-100000@netrider.rowland.org> <020b01d5aab0$65fb6d40$31f247c0$@vincit.fi>
In-Reply-To: <020b01d5aab0$65fb6d40$31f247c0$@vincit.fi>
Subject: RE: [RFCv1 1/1] USB: EHCI: Do not return -EPIPE when hub is disconnected
Date:   Thu, 5 Dec 2019 12:35:48 +0200
Message-ID: <021d01d5ab57$c2f1ab20$48d50160$@vincit.fi>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLNrWqDzgJa61xb6YiqefHQkzkxRQHP/pTeAe8/LyalnUnyoA==
Content-Language: fi
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Erkka Talvitie <erkka.talvitie@vincit.fi>
> Sent: keskiviikko 4. joulukuuta 2019 16.38
> To: 'Alan Stern' <stern@rowland.harvard.edu>
> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org;
> claus.baumgartner@med.ge.com
> Subject: RE: [RFCv1 1/1] USB: EHCI: Do not return -EPIPE when hub is
> disconnected
> 
> 
> 
> > -----Original Message-----
> > From: Alan Stern <stern@rowland.harvard.edu>
> > Sent: keskiviikko 4. joulukuuta 2019 16.24
> > To: Erkka Talvitie <erkka.talvitie@vincit.fi>
> > Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org;
> > claus.baumgartner@med.ge.com
> > Subject: RE: [RFCv1 1/1] USB: EHCI: Do not return -EPIPE when hub is
> > disconnected
> >
> > On Wed, 4 Dec 2019, Erkka Talvitie wrote:
> >
> > > > > So if CERR == EHCI_TUNE_CERR and the QTD_PID != 1 (not IN) then
> > > > > we should return -EPIPE, as the existing code does.  But if
> > > > > QTD_PID == 1 then the code should continue, as your patch does
> > > > > -- with one
> > > > > difference: Put the additional check for EHCI_TUNE_CERR between
> > > > > the tests for DBE and XACT instead of after XACT (because XACT
> > > > > would decrement CERR whereas DBE wouldn't).
> > > >
> > > > Good point, I agree.
> > > >
> > > > >
> > > > > Can you make that change and test it?
> > > >
> > > > Sure, I have made the change and test it as soon as possible.
> > >
> > > I am not actually totally sure if I understood you correctly, but I
> tested a
> > change where the first stall check is like this (PID_CODE_IN is
> > defined as
> 1):
> > >
> > > -               } else if (QTD_CERR(token)) {
> > > +               } else if (QTD_CERR(token) && (QTD_PID (token) !=
> > > + PID_CODE_IN)) {
> > >                         status = -EPIPE;
> > >
> > > And the second stall check (now between DBE and XACT):
> > > +               } else if (QTD_CERR(token)) {
> > > +                       status = -EPIPE;
> > >
> > > Is this what you meant? Please correct me if I am wrong.
> >
> > Actually, what I meant for the first part was:
> >
> > 		} else if (QTD_CERR(token) &&
> > 				(QTD_CERR(token)
> > < EHCI_TUNE_CERR ||
> > 				 QTD_PID(token) !=
> > PID_CODE_IN)) {
> 
> Ok, now I understand the change. Good.

I tested this change and the issue did not reproduce.

However when I was writing the comments for the patch I started to think
what happens in this following scenario:

The PID Code is IN.

1. First there will be XACT, the CERR is decremented, let's say from 3 to 2
and the host controller executes a retry.
2. On this next try there will happen the condition mentioned in the Table
4-13 of the EHCI specification so that the MMF is set and the queue is
halted (because it is IN).
3. To my understanding now the execution enters to this first stall check
if, as CERR is > 0 and CERR < EHCI_TUNE_CERR.
4. The -EPIPE (stall) is returned when actually the queue was halted due to
MMF - not stall - and the -EPROTO should be returned.

Is my logic correct or am I missing something?

If you agree with me then I would like to present you a bit more bold (in a
sense of amount of refactoring) RFC. In high level this another RFC
separates 1. error check and 2. stall check. For me this approach is a bit
easier to understand from the code. Or then please  propose another
solution.

If you do not agree with this scenario then never mind the above suggestion
about RFC doing more refactoring.

> 
> >
> > And of course there should be a comment before this line, explaining
> > what
> it
> > does.  By the way, the accepted format for multi-line comments
> > is:
> >
> > 		/*
> > 		 * Blah blah blah
> > 		 * Blah blah blah
> > 		 */
> >
> 
> Thanks for the information. I noticed that my comments were different than
> the existing ones in the file and I was already about to change my
comments
> to match the existing style.
> 
> > The second part of the patch looks okay (but again, with a comment).
> 
> Yes, I will add the comment here also.
> 
> >
> > > Anyways with these changes the issue does not reproduce.
> >
> > Very good.
> 
> I will do the changes and re-test.
> 
> >
> > Alan Stern
> 
> Erkka Talvitie

Erkka Talvitie


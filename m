Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9255F112D8E
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2019 15:37:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727880AbfLDOhv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Dec 2019 09:37:51 -0500
Received: from mail-lj1-f182.google.com ([209.85.208.182]:44752 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727828AbfLDOhv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Dec 2019 09:37:51 -0500
Received: by mail-lj1-f182.google.com with SMTP id c19so8326470lji.11
        for <linux-usb@vger.kernel.org>; Wed, 04 Dec 2019 06:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vincit.fi; s=ticniv;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=tkLXK6VQG3KfE6q03OG3UE6V/Mi9CntyQ2ezY/hk8iw=;
        b=ZMDgnS3Uc6uItislWA5uEX5neeZd+pB4E5SChJ+yExp0yRLwUzMZKR4eMoWQ6HX9lb
         5M3cs4S+9Me1+IZyOxLbPlrGue35PyeVbkU9RxmHcDchb6MQ7Ssk4yqn2ZeyAIKoVQaL
         /jCjv2GBf5/pQI4Ptqb2gBhQe7SWzIL0vh8I4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=tkLXK6VQG3KfE6q03OG3UE6V/Mi9CntyQ2ezY/hk8iw=;
        b=GlVtxLoR1fb26jFOw4bnMVfJcJ8g8Py6W/bSUPCAFpYYjLIVnzI2P4N7UqxASdupco
         dHyJ3Gb58YIXiJwLFgK28z3usm87oiLgRHeICkzXhMjVmtiv85HqJIM+ouD1qNI77w4v
         uRchb1spovi7m/m3jxikEqVhYxRfPXOs5MMt/o0G2H6OJ6aDbFBKtk8HHPT57H5UArnc
         O7UMIZIW6yewd57a9S5dJ6wfUaSR6OFWnOiZgQ5P8c8QShK1toT922FmdUURVXVpyLes
         8AeNdjIJzQZvkkPVnI+sNFlfCkdD4qSMslKQqs+45Dyjyyhqm7dXL3CoKSRFgC87yMB1
         yFNA==
X-Gm-Message-State: APjAAAWj0aOfAsKpjMC/8P7e5N/5TxmBNDcawqJXpQb6hRDuqwiKTKFR
        1UcXw59QC0Wk1Qr/aYN1Jw/Rtg==
X-Google-Smtp-Source: APXvYqxushvN7XBAQWjtdb48D/znyWHCT/JcCq8vDXC1eyltCwSYrQm5hEtBY4unhhYhDr+rg1INqw==
X-Received: by 2002:a2e:6e10:: with SMTP id j16mr2278047ljc.202.1575470269558;
        Wed, 04 Dec 2019 06:37:49 -0800 (PST)
Received: from LAPTOPJ4R3A4KE ([213.255.177.137])
        by smtp.gmail.com with ESMTPSA id u21sm3227287ljl.93.2019.12.04.06.37.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Dec 2019 06:37:48 -0800 (PST)
From:   "Erkka Talvitie" <erkka.talvitie@vincit.fi>
To:     "'Alan Stern'" <stern@rowland.harvard.edu>
Cc:     <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <claus.baumgartner@med.ge.com>
References: <020901d5aaa5$415457f0$c3fd07d0$@vincit.fi> <Pine.LNX.4.44L0.1912040917500.3941-100000@netrider.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1912040917500.3941-100000@netrider.rowland.org>
Subject: RE: [RFCv1 1/1] USB: EHCI: Do not return -EPIPE when hub is disconnected
Date:   Wed, 4 Dec 2019 16:37:47 +0200
Message-ID: <020b01d5aab0$65fb6d40$31f247c0$@vincit.fi>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHP/pTeHAczo3DSAljG/2X+o/A4s6e1Yf/w
Content-Language: fi
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Alan Stern <stern@rowland.harvard.edu>
> Sent: keskiviikko 4. joulukuuta 2019 16.24
> To: Erkka Talvitie <erkka.talvitie@vincit.fi>
> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org;
> claus.baumgartner@med.ge.com
> Subject: RE: [RFCv1 1/1] USB: EHCI: Do not return -EPIPE when hub is
> disconnected
> 
> On Wed, 4 Dec 2019, Erkka Talvitie wrote:
> 
> > > > So if CERR == EHCI_TUNE_CERR and the QTD_PID != 1 (not IN) then we
> > > > should return -EPIPE, as the existing code does.  But if QTD_PID
> > > > == 1 then the code should continue, as your patch does -- with one
> > > > difference: Put the additional check for EHCI_TUNE_CERR between
> > > > the tests for DBE and XACT instead of after XACT (because XACT
> > > > would decrement CERR whereas DBE wouldn't).
> > >
> > > Good point, I agree.
> > >
> > > >
> > > > Can you make that change and test it?
> > >
> > > Sure, I have made the change and test it as soon as possible.
> >
> > I am not actually totally sure if I understood you correctly, but I
tested a
> change where the first stall check is like this (PID_CODE_IN is defined as
1):
> >
> > -               } else if (QTD_CERR(token)) {
> > +               } else if (QTD_CERR(token) && (QTD_PID (token) !=
> > + PID_CODE_IN)) {
> >                         status = -EPIPE;
> >
> > And the second stall check (now between DBE and XACT):
> > +               } else if (QTD_CERR(token)) {
> > +                       status = -EPIPE;
> >
> > Is this what you meant? Please correct me if I am wrong.
> 
> Actually, what I meant for the first part was:
> 
> 		} else if (QTD_CERR(token) &&
> 				(QTD_CERR(token)
> < EHCI_TUNE_CERR ||
> 				 QTD_PID(token) !=
> PID_CODE_IN)) {

Ok, now I understand the change. Good.

> 
> And of course there should be a comment before this line, explaining what
it
> does.  By the way, the accepted format for multi-line comments
> is:
> 
> 		/*
> 		 * Blah blah blah
> 		 * Blah blah blah
> 		 */
> 

Thanks for the information. I noticed that my comments were different than
the existing ones in the file and I was already about to change my comments
to match the existing style.

> The second part of the patch looks okay (but again, with a comment).

Yes, I will add the comment here also.

> 
> > Anyways with these changes the issue does not reproduce.
> 
> Very good.

I will do the changes and re-test.

> 
> Alan Stern

Erkka Talvitie


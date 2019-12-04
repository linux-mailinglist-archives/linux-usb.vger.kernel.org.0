Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE6E3112D61
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2019 15:24:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbfLDOYN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Dec 2019 09:24:13 -0500
Received: from netrider.rowland.org ([192.131.102.5]:33529 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727828AbfLDOYN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Dec 2019 09:24:13 -0500
Received: (qmail 4817 invoked by uid 500); 4 Dec 2019 09:24:12 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 4 Dec 2019 09:24:12 -0500
Date:   Wed, 4 Dec 2019 09:24:12 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Erkka Talvitie <erkka.talvitie@vincit.fi>
cc:     gregkh@linuxfoundation.org, <linux-usb@vger.kernel.org>,
        <claus.baumgartner@med.ge.com>
Subject: RE: [RFCv1 1/1] USB: EHCI: Do not return -EPIPE when hub is disconnected
In-Reply-To: <020901d5aaa5$415457f0$c3fd07d0$@vincit.fi>
Message-ID: <Pine.LNX.4.44L0.1912040917500.3941-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 4 Dec 2019, Erkka Talvitie wrote:

> > > So if CERR == EHCI_TUNE_CERR and the QTD_PID != 1 (not IN) then we
> > > should return -EPIPE, as the existing code does.  But if QTD_PID == 1
> > > then the code should continue, as your patch does -- with one
> > > difference: Put the additional check for EHCI_TUNE_CERR between the
> > > tests for DBE and XACT instead of after XACT (because XACT would
> > > decrement CERR whereas DBE wouldn't).
> > 
> > Good point, I agree.
> > 
> > >
> > > Can you make that change and test it?
> > 
> > Sure, I have made the change and test it as soon as possible.
> 
> I am not actually totally sure if I understood you correctly, but I tested a change where the first stall check is like this (PID_CODE_IN is defined as 1):
> 
> -               } else if (QTD_CERR(token)) {
> +               } else if (QTD_CERR(token) && (QTD_PID (token) != PID_CODE_IN)) {
>                         status = -EPIPE;
> 
> And the second stall check (now between DBE and XACT):
> +               } else if (QTD_CERR(token)) {
> +                       status = -EPIPE;
> 
> Is this what you meant? Please correct me if I am wrong.

Actually, what I meant for the first part was:

		} else if (QTD_CERR(token) &&
				(QTD_CERR(token) < EHCI_TUNE_CERR ||
				 QTD_PID(token) != PID_CODE_IN)) {

And of course there should be a comment before this line, explaining 
what it does.  By the way, the accepted format for multi-line comments 
is:

		/*
		 * Blah blah blah
		 * Blah blah blah
		 */

The second part of the patch looks okay (but again, with a comment).

> Anyways with these changes the issue does not reproduce.

Very good.

Alan Stern


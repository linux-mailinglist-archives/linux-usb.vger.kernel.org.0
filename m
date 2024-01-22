Return-Path: <linux-usb+bounces-5328-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 123CE83595D
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 03:30:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 931F51F211C8
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 02:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D8307FA;
	Mon, 22 Jan 2024 02:30:51 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id EED3963A0
	for <linux-usb@vger.kernel.org>; Mon, 22 Jan 2024 02:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705890650; cv=none; b=TuxaJ6vRBhg8cWN9CNQVLcGzFI7prbDc8fNo1S3qMD8uVapm0ZA5UcNE46SOHb7mgiXDfM1T0jjIhTj7I+6RhVVL8UhG9dRdlVRgcHx/dRqSwfsBXkwQzVzbIDCzQ+F7RXphKZufr05GJwR8/Lf+y7jDIm63R5NLIM08Y+PrKA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705890650; c=relaxed/simple;
	bh=8xW3ybRGEvj4jOZCILA/Ok4lIFbxf7SqpESBwHt6wpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TAkCYVUGmh1DNoV52KP0FSglC2+o7FFjS/pwVJnWHTIrfGbpaSuNAR4H1mUuTh8ws5g97H3Y42o0jr9fJaLsEL8RdDIZgJgGJrsRlPC7oFkK2hhRY58QeOj1GduYlwlHlOvd3xujjFK5ypcdD3uP9syYkQX0TsB7UZCieq59up8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 119102 invoked by uid 1000); 21 Jan 2024 21:30:41 -0500
Date: Sun, 21 Jan 2024 21:30:41 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: yuanlinyu 00030184 <yuanlinyu@hihonor.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [RFC PATCH] usb: udc: run disconnect callback before pull up zero
Message-ID: <af8a0f33-4f07-44f3-8ac2-bdc94a61799e@rowland.harvard.edu>
References: <20240119054813.2851201-1-yuanlinyu@hihonor.com>
 <9a483f40-83ef-4476-b94c-21506d94653a@rowland.harvard.edu>
 <20240120011149.fbrbunf4l7deckek@synopsys.com>
 <41dc2889-c087-4179-88a5-9af80064aa2b@rowland.harvard.edu>
 <1ac27ccf217d4a76bb5bb89a49c2ae4c@hihonor.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ac27ccf217d4a76bb5bb89a49c2ae4c@hihonor.com>

On Mon, Jan 22, 2024 at 01:32:39AM +0000, yuanlinyu 00030184 wrote:
> > From: Alan Stern <stern@rowland.harvard.edu>
> > Sent: Saturday, January 20, 2024 11:00 PM
> > To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> > Cc: yuanlinyu 00030184 <yuanlinyu@hihonor.com>; Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org>; linux-usb@vger.kernel.org
> > Subject: Re: [RFC PATCH] usb: udc: run disconnect callback before pull up zero
> > 
> > On Sat, Jan 20, 2024 at 01:12:04AM +0000, Thinh Nguyen wrote:
> > > On Fri, Jan 19, 2024, Alan Stern wrote:
> > > > On Fri, Jan 19, 2024 at 01:48:13PM +0800, yuan linyu wrote:
> > > > > When write UDC to empty and unbind gadget driver from gadget device, it
> > is
> > > > > possible that there are many queue failures for mass storage function.
> > >
> > > That's expected right?
> > 
> > Certainly.  And not just for mass storage; for other gadget drivers too.
> > 
> > > > > The root cause is on platform like dwc3, if pull down called first, the
> > > > > queue operation from mass storage main thread will fail as it is belong to
> > > > > another thread context and always try to receive a command from host.
> > > > >
> > > > > In order to fix it, call gadget driver disconnect callback first, mass
> > > > > storage function driver will disable endpoints and clear running flag,
> > > > > so there will be no request queue to UDC.
> > > > >
> > > > > One note is when call disconnect callback first, it mean function will
> > > > > disable endpoints before stop UDC controller.
> > > >
> > > > Exactly.  So instead of getting a bunch of errors on the gadget, now
> > > > you'll get a bunch of errors on the host.  I don't think that's any
> 
> What is host error ?

If the host is trying to communicate with the gadget at the time of the 
mode switch, it will see that something is wrong because the gadget will 
still be connected (the pullup will still be on) but it won't reply to 
any USB packets.

> Seem when host do nothing, but mass storage driver try to queue request
> which want to receive command from host.

That's true.  If the host is not trying to communicate with the gadget, 
it won't get any errors.

> > > > better.
> > > >
> > > > Why don't you change the dwc3 driver instead?  If it allowed ep_queue
> > > > operations to succeed while the pull-up is off then this problem would
> > > > go away.
> > > >
> > >
> > > I don't think we should do that either. When pullup off occurs, the
> > > device is disconnected for dwc3. usb_ep_queue() doc noted that we
> > > should return error on disconnection.
> > 
> > Oh yes, so it does.  Okay, forget that idea.
> > 
> > >  Beside, it will add unnecessary
> > > complication to dwc3 handling this.
> > 
> > How about instead just reducing the visibility of these error messages
> 
> It is already change to dev_dbg() by Wesley Cheng for dwc3.
> But it also can enable by change log level. Only delete it will not show again.

I think it's good to have those messages show up when the log level is 
set to debug.  They let developers know what's happening when they test 
changes to the gadget drivers.  If the messages really bother somebody, 
all they have to do is reduce the log level to info.

If you're still concerned about the behavior of the mass-storage 
function, you could change it.  Make it disable itself whenever it gets 
a -ESHUTDOWN error, either while submitting a request or as a completion 
status.  This should reduce the number of error messages, although it 
won't eliminate them.

(Of course, this still leaves the possibility of floods of debugging 
messages from all the other function drivers...)

> this thread just want to discuss if disable eps first then pull up zero acceptable or 
> good (reduce mode switch time ???) for all UDCs ?

I think it's not a good thing to do.  And I don't think it will reduce 
the mode switch time, because both operations still have to occur so 
they will require the same total amount of time.

Alan Stern


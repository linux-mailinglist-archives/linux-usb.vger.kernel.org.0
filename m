Return-Path: <linux-usb+bounces-11347-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2853E909B43
	for <lists+linux-usb@lfdr.de>; Sun, 16 Jun 2024 04:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 201541C209A5
	for <lists+linux-usb@lfdr.de>; Sun, 16 Jun 2024 02:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 699F116C686;
	Sun, 16 Jun 2024 02:33:38 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id AE7C82B9AE
	for <linux-usb@vger.kernel.org>; Sun, 16 Jun 2024 02:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718505218; cv=none; b=X3JH6t/xpKYtPpsc2jqDDJM9MEDSWJEztw9t58ka1aMKU3ZlythKxggY7nXQxSzthq1Ho/Jk87BSKC8cry7Iv8dStfaINejU5g9eKB7IjukF1NirYQDv6sofBfJXbey5DU/N+OY00WAnxS0R7G+W/teXjrl63QGW4KMQhs25lOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718505218; c=relaxed/simple;
	bh=ONbqzeAqs76ztTATisoNcK/GU5U+aAy/cFH/PYmU1Wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VV30h6NRRjf4RyfdKXXzXtugnzFnyVRdvFuGqtezNKDzGKb10mBi3KIM3iSfxTxz8qmR3Em+CH3qFxfTN6qqYSTFi6LpRqVX4uxizjQut7gLEPZTxv2BvW/DpdDnHmxJTDqotCUsAzbgRXwTvyDc4uj0fnLfAD9DZ9c3HHjskGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 346353 invoked by uid 1000); 15 Jun 2024 22:33:28 -0400
Date: Sat, 15 Jun 2024 22:33:28 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: USB list <linux-usb@vger.kernel.org>,
  Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: Stalling non-0-length OUT control requests in Raw Gadget/GadgetFS
Message-ID: <73838855-fe52-4d2f-a826-c5757f75bd92@rowland.harvard.edu>
References: <CA+fCnZeLRqk-FOkJ81qMY0NMZC7YnW=beTw=w_DVA=OhOnywRw@mail.gmail.com>
 <8b7aa23c-9976-46c2-b64f-1d4614aefe89@rowland.harvard.edu>
 <CA+fCnZd1UOqCiH7L1FMMqLhepiMSBfgVb-tXfc81F_VuX_zy4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+fCnZd1UOqCiH7L1FMMqLhepiMSBfgVb-tXfc81F_VuX_zy4w@mail.gmail.com>

On Sat, Jun 15, 2024 at 10:49:46PM +0200, Andrey Konovalov wrote:
> On Sat, Jun 15, 2024 at 4:12 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> > There has been a patch posted to support UDC drivers that don't
> > automatically acknowledge non-zero-length control-OUT transfers.  But
> > the patch hasn't been merged, and even if it were, all the existing UDC
> > drivers would still need to be updated.
> 
> This series below is the one you're referring to, right?
> 
> https://lore.kernel.org/linux-kernel/20190124030228.19840-1-paul.elder@ideasonboard.com/

Yes, that's it.  I'm impressed that you were able to find it; I had lost 
track of it.

> Do you know why it wasn't merged? (CC Paul). There are no comments on
> the latest version I managed to find.

I guess Felipe Balbi (the USB Gadget maintainer at the time) just wasn't 
very interested in fixing the problem.

> Also, just to check my understanding: with that series in place and
> assuming the UDC drivers are updated, a gadget driver would need to
> first do usb_ep_queue with the proper length and explicit_status ==
> true to get the data for the control OUT request, and then either do
> usb_ep_queue again with length 0 to ack or do usb_ep_set_halt to
> stall?

Yes, that's how it worked.  Alternatively, if the gadget driver didn't 
set explicit_status in the control-OUT request then the UDC core would 
automatically call usb_ep_queue again with a 0-length transfer to send 
the status.  That way existing gadget drivers would continue to work 
after the UDC drivers were updated, and updated UDC drivers wouldn't 
have to worry about doing an automatic acknowledge only some of the 
time.

Note that in order to avoid breaking things during the transition 
period, it would also be necessary to add a flag to the usb_gadget 
structure, indicating that the UDC driver has been updated to support 
explicit_status.

Alan Stern

PS: There's another weakness in the Gadget API which you might possibly 
run across in your project.  It's less likely to arise because it 
involves lengthy delays.

Say there's a control transfer with delayed status, and the gadget 
driver delays for so long that the host times out the transfer.  Then 
the host starts a new control transfer before the gadget driver queues 
its status reply.  Since the Gadget API doesn't have any way to indicate 
which control transfer a usb_request was meant for, the reply that was 
meant for the old transfer would get sent to the host, and the host 
would think it was a reply to the new transfer.

This problem could be solved by adding a unique ID tag to each 
usb_request, and passing the transfer ID as an extra argument to the 
gadget driver's setup() callback.  That would explicitly indicate which 
transfer a request was meant for.  But doing this would also require 
updating every function driver and every UDC driver.  Probably not worth 
the effort, considering how unlikely it is that the situation will ever 
arise.


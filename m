Return-Path: <linux-usb+bounces-11413-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C65E990E163
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2024 03:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 314332843BD
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2024 01:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09584BA2F;
	Wed, 19 Jun 2024 01:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KU6qhPAC"
X-Original-To: linux-usb@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9F5AD5A
	for <linux-usb@vger.kernel.org>; Wed, 19 Jun 2024 01:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718761466; cv=none; b=RaNrxRmWtxVIJG+aSMavPlvEfwp1B/cfQFh/n3cmcjvQDjN5KQirAzu+Wz+oZB9jAqSzJHXdqfV/YZsGonco8kNTIq8Eb5mGLnq2C6mVbcotH8zKkAziY/NA8NwlJ+k2V33udfMIonhJQkieeXhpb7xNwr4ozKbxYGR46f7+Kr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718761466; c=relaxed/simple;
	bh=bxqKkp5RsRrRMXQSjN5plFyhoWn8bBxpTFP0MGicwNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CbXaeAgnY/m+xjFb5nmtUbVEdmm0T7nfxnD4cB3KQqdEFA+LOt+pqRSv+GUTUikHdxlRU20e2duz+dEXxQD9ZfHOyoWkxB6QST6zVnbbcf6Wlob1gpBHeiOdvgc7b5UjYpP0h7yqhuUFr9kg/e0QZAxUor2NgDlko7lEco3FwHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KU6qhPAC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pyrite.rasen.tech (h175-177-049-156.catv02.itscom.jp [175.177.49.156])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3013CF89;
	Wed, 19 Jun 2024 03:44:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718761445;
	bh=bxqKkp5RsRrRMXQSjN5plFyhoWn8bBxpTFP0MGicwNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KU6qhPACn+CA1umxGb4v3xQV+a2U29jVoEr2XdwCejVOYBbKbfTZr3O1d6QCex17b
	 myEipwCJ5NmFcg73jERME3antpOLHtLHXEEIjdBByrDqMX9WZnUN+FVp7Q21ejzFjc
	 dm3K0sA26m4QPPNbizIHypaIDCpM0+Gr1KGcnpzQ=
Date: Wed, 19 Jun 2024 10:44:15 +0900
From: Paul Elder <paul.elder@ideasonboard.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Andrey Konovalov <andreyknvl@gmail.com>,
	USB list <linux-usb@vger.kernel.org>
Subject: Re: Stalling non-0-length OUT control requests in Raw Gadget/GadgetFS
Message-ID: <ZnI376uuUb34I1go@pyrite.rasen.tech>
References: <CA+fCnZeLRqk-FOkJ81qMY0NMZC7YnW=beTw=w_DVA=OhOnywRw@mail.gmail.com>
 <8b7aa23c-9976-46c2-b64f-1d4614aefe89@rowland.harvard.edu>
 <CA+fCnZd1UOqCiH7L1FMMqLhepiMSBfgVb-tXfc81F_VuX_zy4w@mail.gmail.com>
 <73838855-fe52-4d2f-a826-c5757f75bd92@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73838855-fe52-4d2f-a826-c5757f75bd92@rowland.harvard.edu>

On Sat, Jun 15, 2024 at 10:33:28PM -0400, Alan Stern wrote:
> On Sat, Jun 15, 2024 at 10:49:46PM +0200, Andrey Konovalov wrote:
> > On Sat, Jun 15, 2024 at 4:12 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> > > There has been a patch posted to support UDC drivers that don't
> > > automatically acknowledge non-zero-length control-OUT transfers.  But
> > > the patch hasn't been merged, and even if it were, all the existing UDC
> > > drivers would still need to be updated.
> > 
> > This series below is the one you're referring to, right?
> > 
> > https://lore.kernel.org/linux-kernel/20190124030228.19840-1-paul.elder@ideasonboard.com/
> 
> Yes, that's it.  I'm impressed that you were able to find it; I had lost 
> track of it.
> 
> > Do you know why it wasn't merged? (CC Paul). There are no comments on
> > the latest version I managed to find.
> 
> I guess Felipe Balbi (the USB Gadget maintainer at the time) just wasn't 
> very interested in fixing the problem.

So that's why we never continued with merging it...

Is it time to dust it off and try to upstream it again? :)


Paul

> 
> > Also, just to check my understanding: with that series in place and
> > assuming the UDC drivers are updated, a gadget driver would need to
> > first do usb_ep_queue with the proper length and explicit_status ==
> > true to get the data for the control OUT request, and then either do
> > usb_ep_queue again with length 0 to ack or do usb_ep_set_halt to
> > stall?
> 
> Yes, that's how it worked.  Alternatively, if the gadget driver didn't 
> set explicit_status in the control-OUT request then the UDC core would 
> automatically call usb_ep_queue again with a 0-length transfer to send 
> the status.  That way existing gadget drivers would continue to work 
> after the UDC drivers were updated, and updated UDC drivers wouldn't 
> have to worry about doing an automatic acknowledge only some of the 
> time.
> 
> Note that in order to avoid breaking things during the transition 
> period, it would also be necessary to add a flag to the usb_gadget 
> structure, indicating that the UDC driver has been updated to support 
> explicit_status.
> 
> Alan Stern
> 
> PS: There's another weakness in the Gadget API which you might possibly 
> run across in your project.  It's less likely to arise because it 
> involves lengthy delays.
> 
> Say there's a control transfer with delayed status, and the gadget 
> driver delays for so long that the host times out the transfer.  Then 
> the host starts a new control transfer before the gadget driver queues 
> its status reply.  Since the Gadget API doesn't have any way to indicate 
> which control transfer a usb_request was meant for, the reply that was 
> meant for the old transfer would get sent to the host, and the host 
> would think it was a reply to the new transfer.
> 
> This problem could be solved by adding a unique ID tag to each 
> usb_request, and passing the transfer ID as an extra argument to the 
> gadget driver's setup() callback.  That would explicitly indicate which 
> transfer a request was meant for.  But doing this would also require 
> updating every function driver and every UDC driver.  Probably not worth 
> the effort, considering how unlikely it is that the situation will ever 
> arise.


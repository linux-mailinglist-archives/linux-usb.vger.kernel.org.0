Return-Path: <linux-usb+bounces-17777-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A04E19D4F68
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2024 16:07:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 261DA1F23CB0
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2024 15:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136601CACD6;
	Thu, 21 Nov 2024 15:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="WGxaCmCW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6FC1D47A3
	for <linux-usb@vger.kernel.org>; Thu, 21 Nov 2024 15:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732201617; cv=none; b=mDZIWs0LSFBgSg5TLkLMDAbV47HR78unZLqLuXxu4GY0BLfFp6uR6medX/EwocffWMMiuyqh7yWH86VEXbERWk2ibmz9rwn4alJs5Vp4hFKBhsXjC9iAGHZwP/Lu2urA9slQvQSSt3xnkVzX8wdA90jL/yWxPw7ismlOPSAfXeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732201617; c=relaxed/simple;
	bh=iUnfgooy/b9ZDQhkodhaGLYUYpvz7Qbgfo8YDR6nLbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1UCkK7WaFtylKfkRYUzNaYJj9bQjDS7Bo7QfRczQgwklDeFXTE/Yn8lTrKRRvHl7j9/PGEzVbOFKniZ9ztda41go8/H+9hmwTE0/zLan1goQznJtQNAORZ8Um2aW3gi7lKWC192lNpg9bu9DpvU8qRsIG8wfk5GNnQLzuRtNiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=WGxaCmCW; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6d41d46162eso6038826d6.0
        for <linux-usb@vger.kernel.org>; Thu, 21 Nov 2024 07:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1732201614; x=1732806414; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZxzIUFSZp+2FxRy9UIpkCax5GS4kefJIV53cZfFhVUY=;
        b=WGxaCmCWvMs6YJDvgmzCIhmXmGuz+lFFeHGQ/VGXVRQRXIXhk+eWaDAH3siloq3HI8
         iwjyAAZwRZMUSb7mYtEyZasjdMJ870soJn6ixoOlz2zZ5qsnYhl7CfShXyeRC7Uqun0o
         O2smg1tiEAiwMlUhwQmI1UHNTVdBabGr3p6/gojSGXzM6MQnIRPwZ1369aDOOStXN5J1
         p5dpSJRdTi7ifg6AdNLF8wfPeeyThQMbJlEArPT5wU0dnGWtHn9QsDjtCDrF53dyckLA
         d73lC4u3jjXGr7te4m/9+TBzu93vHuf4fugEtH2DVtygq7ryfEqB13BUslXZ+O5K8G1J
         /mTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732201614; x=1732806414;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxzIUFSZp+2FxRy9UIpkCax5GS4kefJIV53cZfFhVUY=;
        b=tGSE5qwv7ZpSUhqjNBI4gwBzvInOXyK5/dKOYVqxCATneSTyK27flkPiTnDCaCnqGv
         jDh/4XCyw00DGT8vdHVLLAaT26/nVMKUkvAUdSFGrDAT4wMxCkr4X6AYQtySHLSEqGNT
         GAC09/7qTqtvaVUqJEU69I4cXbf621QmI4/8pv2HhXeIzsbpvSfkMQj/11epFqh9j050
         T3wzc6PIjCrzMjLpSrBmvO3K3zaOWoxaDlcGoNzkLXsfvlo1JZOhEivQTPDZgHvcbxLF
         5cXhSTMHVroOhHwYgBlirExdBl2o1d3tUgDFlLRM8i87hnR0/Nknl6/uDOdk1tOd4RyT
         BX+g==
X-Forwarded-Encrypted: i=1; AJvYcCXPUJ3uDwfZd6Vg6VOdTtfw00k4YywwrgftX3jRL49wfzDAm223lqqRZAr+gt/oU4Wjt1FV4V8UbGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdFZQJT+xtjFIu/6cC+EfH5tocVskGZV8avhQSleUN2IX//RWB
	SDtAE8TBbciNvwMVifa06p5itNFqN0080jbzQk8XZrvqA+VIKj2QSifyt6u2cQ==
X-Gm-Gg: ASbGncuJ/+CG/f9iUNV9bO2r4ikiv1Ud6G1BMGEdHhZaQc4HLTPM9jmYnO/S2p6GPaH
	2XxTlmRFICJVe6mUOYuD2tRW0xUwRLYtA3BJlUQ4nZmKehRdPPX4to61GNtPVmrZy+giA4/TEAT
	MBefC7iJGAqhlJw9hMy3cOe2CB4Krk3xWfRO56jRv2aAIuIv6qm8TDojH+iOVWcXt8xYt/KqVHG
	pn5v0xIDl8nImNaCnPd3dHSFqQ8H9f+3C8VmnjSOvl/c5/Jehk=
X-Google-Smtp-Source: AGHT+IH72BBiqZFZLG25QEFhm1QwfuqwX4woHk1d9CdqlDTfqfUGfnZc2ov2ivQZ9QIiExY2ovV4og==
X-Received: by 2002:a05:6214:e84:b0:6d4:1530:a0a3 with SMTP id 6a1803df08f44-6d4377b45b4mr72911616d6.6.1732201614204;
        Thu, 21 Nov 2024 07:06:54 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::24f4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d4381377cbsm24337696d6.122.2024.11.21.07.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 07:06:53 -0800 (PST)
Date: Thu, 21 Nov 2024 10:06:50 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: How are halted endpoints supposed to be handled in Linux?
Message-ID: <0dd70803-a074-4859-8cc9-5bd210d12536@rowland.harvard.edu>
References: <20241121001138.23a45f6c@foxbook>
 <20241121000216.kif557p3p6xyahax@synopsys.com>
 <b34b5ea0-2804-4692-bede-70ba9065c86c@rowland.harvard.edu>
 <20241121112653.06ba4ee5@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241121112653.06ba4ee5@foxbook>

On Thu, Nov 21, 2024 at 11:26:53AM +0100, Michał Pecio wrote:
> Hi Alan,
> 
> Thank you for taking the time to answer. I'm beginning to regret not
> asking this question earlier.

I hope all the material here is accurate; it's been a long time since I 
worked on these matters.

> On Wed, 20 Nov 2024 21:31:29 -0500, Alan Stern wrote:
> > > > Linux appears to ignore this part and only reset on STALL
> > > > handshake, as advised in
> > > > Documentation/driver-api/usb/error-codes.rst and practiced by
> > > > drivers - they don't seem to bother with usb_clear_halt() on
> > > > -EPROTO.  
> > 
> > This is generally a weakness in the drivers.  It would be nice if the 
> > class specifications said what to do in these situations, but most of 
> > them don't.
> 
> There is also proprietary hardware with no specification at all.

Indeed.

> > > > On the HCD side, xHCI will:
> > > > - give back the current URB with -EPROTO/-EPIPE status
> > > > - reset the host side endpoint, clearing its toggle state
> > > > - point the HC at the next URB if one exist
> > > > - restart the endpoint without waiting for hcd->endpoint_reset()
> > > > - ignore one subsequent call to hcd->endpoint_reset()  
> > 
> > This behavior is not correct.  See the kerneldoc for 
> > usb_unlink_urb() in drivers/usb/core/urb.c, especially the section 
> > labelled "Unlinking and Endpoint Queues".
> 
> OK, let's go through it.
> 
>  * But when an URB terminates with an
>  * error its queue generally stops (see below), at least until that URB's
>  * completion routine returns.
> 
> I don't see this working after xHCI adopted bottom half giveback, which
> is asynchronous. As you are the maintainer of EHCI, which also uses BH,
> how is EHCI dealing with it?

Yes, I am.

For Bulk endpoints: When a transmission error occurs, ehci-hcd removes 
the endpoint's queue header from the controller's async list, in 
addition to giving back the failed URB.  When the removal is complete, 
the queue is scanned for other unlinked URBs, and they are given back.  
After that happens, the next URB submission will cause the queue header 
to be put back on the controller's async list.

You're right about the lack of synchronization caused by use of a BH.  
The HCD has no way to know when the class driver has finished processing 
a giveback.  We do need to fix this.

> One way I see with existing APIs is to wait until the driver submits a
> new URB, but are drivers prepared for this? Is EHCI doing the same?

Yes; see above.

>  * It is guaranteed that a stopped queue
>  * will not restart until all its unlinked URBs have been fully retired,
>  * with their completion routines run
> 
> I think xHCI can currently guarantee that nothing is restarted until
> any URB unlinked for any reason is given to the BH worker, but that's
> all we have, and I just broke it in usb-next:
> 
> +               /* Try to restart the endpoint if all is done */
> +               ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
> +               /* Start giving back any TDs invalidated above */
> +               xhci_giveback_invalidated_tds(ep);
> 
> This is part of a legitimate bugfix patch tagged for stable. I should
> have insisted on keeping it a separate change, but it seemed a good idea
> at the time which would soon get implemented anyway... Maybe no more?
> 
>  * even if that's not until some time
>  * after the original completion handler returns.
> 
> Not entirely sure what this means.

Suppose URBs 1, 2, and 3 are queued when URB 1 gets a transmission 
error.  It is given back, and its completion handler unlinks URBs 2 and 
3.  The completion handler for URB 1 then returns, but the queue won't 
restart until the completion handlers for URBs 2 and 3 have returned, 
even if that doesn't occur for some time.  At least, that is the intent.

>  * The same behavior and
>  * guarantee apply when an URB terminates because it was unlinked.
> 
> Same caveat about BH asynchronicity in xHCI.
> 
> > In general, the only safe thing for class drivers to do when they get 
> > one of these errors on a bulk or interrupt endpoint is to unlink all
> > the pending URBs for the endpoint and then call usb_clear_halt() when
> > they have all completed.  I know that usb-storage does this; I
> > suspect that not many other drivers do.
> 
> Your suspicion isn't wrong AFAIK.
> 
> One more thing which is safe at least wrt data corruption is to simply
> retry the same URB without resetting anything. But if an HCD wants to
> do it, existing API gives no way to notify the driver and allow it to
> opt out and handle things differently, so it mustn't retry forever.

Yes, and in fact ehci-hcd _does_ retry up to 32 times.

> > I suppose the USB core could take care of this automatically so that 
> > neither the class drivers nor the HCDs would have to worry about it.
> > If everyone agrees that this wouldn't lead to other problems, it
> > could be implemented without too much difficulty.
> 
> This still appears to run into the double delivery problem that you
> described in the discussion linked by Thinh Nguyen, particularly in
> case of dodgy drivers for dodgy hardware.
> 
> Considering that, I'm not sure if automatically resetting anything on
> -EPROTO is a good idea.

What about automatic unlinking?

Note that some class drivers treat -EPROTO as a fatal error.  That is, 
they don't retry and their completion-resubmission loop breaks down.  
When that happens, the only way forward is to unbind the driver (for 
example, by unplugging the device).  Of course, this isn't a problem if 
the original cause of the -EPROTO error is that the device just _was_ 
unplugged.  All other cases are sufficiently rare that we don't have a 
generally agreed-upon strategy for handling them.

> > > > I wonder what other HCDs are doing in this case, and what's the
> > > > idea behind it all?  
> > 
> > As far as I know, they don't automatically send Clear-Halt requests
> > to the device or automatically unlink anything.
> 
> That's what it looks like, grepping through drivers/usb/host. But my
> question was mainly about -EPROTO. When should an HCD restart a halted
> endpoint? Should it clear the sequence state? (probably not).

Except for an immediate retry, I suspect the HCD should never restart a 
halted Bulk or Interrupt endpoint on its own initiative.  Not until 
another URB is submitted.

However, this seems impractical if the class driver wants to retain the 
existing URBs already on the endpoint's queue.  (I don't know of any 
drivers that do this, but still...)  Perhaps we should adopt the policy 
that -EPROTO, -EILSEQ, and -ETIME cause all outstanding URBs to fail and 
enforce this policy in usbcore by automatic unlinking so that HC 
drivers don't have to do it.

Alan Stern


Return-Path: <linux-usb+bounces-35923-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OVuJjwpz2mmtQYAu9opvQ
	(envelope-from <linux-usb+bounces-35923-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 04:43:08 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E67E3906EC
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 04:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F2606301CC53
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2026 02:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1C4734D929;
	Fri,  3 Apr 2026 02:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="b7HUwxs3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9DF5477E
	for <linux-usb@vger.kernel.org>; Fri,  3 Apr 2026 02:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775184166; cv=none; b=tgqI15DOOYhN8RlIdT0peTTpWlL8xPxWSH2yALNTMFWY52NQtRlTv7UDgPETCk38Gt31Fj8cQNuzHG4MPz9BFlTla4an5AWxasp/ZH/+qRUDw4SS5kqwOLl/cf/Kk5rxcDTAhtGaG/lkewxaJ68Z+uhArLlqLPtFdoK2ugQJClg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775184166; c=relaxed/simple;
	bh=I+PLWDBx1GZ6xHol9K/7NmF9+VJ4D8WPdf7TiXf6/R4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttIax2NZJ/NVlDucc1o6ExDexjW5KNuRCAXo6gjQCUwTt+c4ZDLJjAhdlH5IKUvOxDMzkOrbyge66s80KFEjgLeiHpEkS48SFN8KBeOXA93BXkgDbtmvtCfRzmGTXoSw/sT3JzzOm0OC3jGZ6JtgFiSsIcfUkViALARJeKQts2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=b7HUwxs3; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-506251815a3so14319211cf.0
        for <linux-usb@vger.kernel.org>; Thu, 02 Apr 2026 19:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1775184164; x=1775788964; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=err6ZLFRYNy9JLTudF2Xkp0k2z+ZKppGo1v45rSjDGo=;
        b=b7HUwxs3iIuIs6dQDSpC1bPJpFsdh0+degv77GPqeF4ohPE17olhcjLxWghnhOJ8Zj
         jQY29PPB9mB1lmKVG5vmFSDYUZLYlv8lMVR47PUxHRVFzwXk3C5AMAN0bG+Xbghnmv1g
         Mljh8YFMCn6obAKgYjwjKQG6OmkBF/sgOJ0x3v1GPHQRk5T+vL/VLNgQmjiqP8ugYBBD
         d55HZYflQqxuHVbizv2rQZ24QQerDSs4czhh0WZ1SIOtqWjg0b2VvuJYvmK/JOgM4top
         NW34MwNRCSJzbGs8BHVcLrHMUVmigvsj+E06/PzTywKBvcnlU3tBsWx7oKH4Bm3yMrVB
         sGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775184164; x=1775788964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=err6ZLFRYNy9JLTudF2Xkp0k2z+ZKppGo1v45rSjDGo=;
        b=NzzHQya1ff429gTV93mV6lWFxanfg6vykZbPRcOP8huWlWqQgny/rjgfLil8pnV0hl
         Uck+LZWi9nEU2Gl4dSJRf0UetNI7enbeiZmk6Q8R0wnqsqh55ARosSbWdG0k9UV2Am4L
         639h+oCpTmg/YIr7IR/FQqXepSN3+jBMODehSJc5rrQlqveozng86atkz7i5jDac1Lwv
         rKgPcT7Y+3WItsLAMfXt6kdB2hHIE0eb6gd2JWpJpcdPpPVP2vnp3Y5CgsOa12Tj1ju2
         Ngg2lK61aqP47ZfUvCO4jl4qaTZ2wse41zN6axdWKCck8YRbgeGOjF2CnQw1nMkS1e25
         uF+g==
X-Forwarded-Encrypted: i=1; AJvYcCWEpsS5PD93Joo/V9AqC6hyu6KKvhaDFmURroL95GCI2NDn1pmc3J8hBqDQreUyqy4Nq9pIKG/44SM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwygOC//Gi3+k1DxG2qqjRbqlQh+bBMWiCevhSjd/7x2EbHExMX
	E3sieLaVlpsx06W0U6ULNMiNUmD2/YoXUvJOIldhRDOge3ePa6mixp6n/5T5x6NQRcM5dDvrGNt
	vkoVJwA==
X-Gm-Gg: ATEYQzxtyhmzR6jjtPX/Qtp78DKNNFf2UseGcSRP2WA29Mk7/4R7jN6Ox7JwJXdv+lb
	5q0r9fuYxEJRNJoJ2TR//1p5sDydrcHptFOILDdEpgpjNfefA4WuTKjovu5RItM9AbwFnAQOBKW
	8uZmia2UTzziL2GE6WQjwZjbpAimUvA/8Qw0agWyGwQjOXmWv7QzxBHU7JACoeYzg83zIssRIf1
	t03q2W3+CFHIHsxCRXKGH2nnvGy2IdYUSGBOuVrcn8j0B0BMpzlecjO41tjWNd1jy1aoL2ezqZk
	RofYKAPAJMtFBSb+UGEC4dzbRf1xngD9yM/82DAW3ATnM4v0ybdCb6xK7+vgCt77ncjVIuc1E8f
	+njkGa7cvg9NM64HcArJFQyuoNMqpZZLXtgDnqcRTvfxvsFu6Btn585YL43iXb9Blwk/+nmYcYM
	FUaZDJb4hoUrQUTmryrQEuFVjo
X-Received: by 2002:a05:622a:2b03:b0:50b:5024:9091 with SMTP id d75a77b69052e-50d62b8bdcdmr24620441cf.68.1775184163802;
        Thu, 02 Apr 2026 19:42:43 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::5a82])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4b93dd10sm35239581cf.7.2026.04.02.19.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 19:42:42 -0700 (PDT)
Date: Thu, 2 Apr 2026 22:42:39 -0400
From: "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"michal.pecio@gmail.com" <michal.pecio@gmail.com>,
	"oneukum@suse.com" <oneukum@suse.com>,
	"niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Message-ID: <28a00143-85fa-4043-93a0-c2b687ff1bcd@rowland.harvard.edu>
References: <20260326011910.t7ijezht7g7ttrec@synopsys.com>
 <9cf4008e-2d12-4025-809a-8d9371f45dac@linux.intel.com>
 <20260326232400.zkplsxflhykhayyb@synopsys.com>
 <2604e951-01e8-44d0-a11e-be63b0849c23@linux.intel.com>
 <9e62ef5a-5b31-4fca-891b-d028f5bbfc05@rowland.harvard.edu>
 <54121929-d775-45a0-b31d-09b783aada5d@linux.intel.com>
 <86876c62-01d2-45da-81f3-7d4499ffa0ad@rowland.harvard.edu>
 <50e61cf7-cce9-45b4-884e-ac65f5e771d7@linux.intel.com>
 <07351d72-5cdb-45e8-90af-311a0dc49718@rowland.harvard.edu>
 <20260403015950.lx4n4zdqki37dy27@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403015950.lx4n4zdqki37dy27@synopsys.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	FROM_DN_EQ_ADDR(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35923-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,gmail.com,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]
X-Rspamd-Queue-Id: 9E67E3906EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 01:59:58AM +0000, Thinh Nguyen wrote:
> On Wed, Apr 01, 2026, stern@rowland.harvard.edu wrote:
> > On Thu, Apr 02, 2026 at 01:08:31AM +0300, Mathias Nyman wrote:
> > > On 3/31/26 18:31, stern@rowland.harvard.edu wrote:
> > > > 
> > > > How about this instead?  We add a "halted" flag to the usb_host_endpoint
> > > > structure, and the core will set this flag whenever a bulk or interrupt
> > > > URB gets a status other than 0 (before putting the URB on the bh list).
> > > > If an URB has one of these statuses, when its completion handler returns
> > > > the core will unlink all the URBs queued to the same endpoint.  Finally,
> > > > the "halted" flag should be cleared after a completion handler returns
> > > > if there are no more unlinked URBs still in the queue or URBs waiting on
> > > > the bh list to be given back.
> > > > 
> > > > The result of this is that any URB remaining in the queue when the flag
> > > > is cleared must have been submitted by the class driver _after_ the
> > > > failing URB's completion handler has run.  We can assume the class
> > > > driver knows what it's doing in this case.
> > > > 
> > > > The endpoint queue shouldn't be restarted until the "halted" flag is
> > > > cleared.  Either right away, if there are any URBs in the queue, or not
> > > > until the next URB is submitted.  Doing this might require a new HCD
> > > > callback.  (It would also mean the kerneldoc for usb_unlink_urb() would
> > > > need to be updated, because the endpoint might restart before all the
> > > > completion handlers for the unlinked URBs have run.)
> > > > 
> > > > What I'm trying to do here is come up with a single, consistent proposal
> > > > for exactly when halted endpoint queues should restart.  Maybe someone
> > > > else has a better suggestion.

> How about this:
> 
> Introduce a halted flag the following conditions:
> 
> * Introduce the halted flag in usb_host_endpoint
> * The halted flag must be implemented as a bit in a unsigned long so
>   we can use atomic bit operation

I don't see why it needs to use atomic operations.  Unless you're 
thinking that we might want to add other bitflags into the same unsigned 
long?

> * Only the HCD may set the halted flag, and only upon checking the
>   first URB completing with a halted status

Every status other than 0 should mean that the endpoint's queue is 
halted.  But not all statuses require a clear-halt or reset-endpoint to 
recover.  For instance, a short transfer when the URB_SHORT_NOT_OK flag 
is set.

Why do you want the HCD to set the flag instead of 
usb_hcd_giveback_urb()?  Just one central place is simpler than in every 
HCD.

> * Only the USB core may clear the halted flag, and only after
>   usb_reset_endpoint returns (this makes sure the HCD drained and reset
>   the endpoint before the flag is cleared and new URBs are accepted)
> * The usb_reset_endpoint must be called after clear-halt, SetInterface,
>   and SetConfiguration.

That's easy to do just by adding it into the appropriate core routines.

> * The USB core will not attempt to unlink pending URBs due to halted
>   condition
> * The HCD is responsible for completing or canceling queued URBs
>   when the halted flag is set. Cancelled and newly submitted URBs will
>   be returned with -EPIPE as long as the halted flag is set

Why make the HCD responsible for draining the queue?  It's like setting 
the halted flag; one central place is simpler and less error-prone than 
lots of separate places.

For newly submitted URBs, should the submission fail with -EPIPE, or 
should the submission succeed and then the URB complete with -EPIPE?  
The first is simpler, but drivers probably aren't prepared for it -- it 
would mean adding error handling to the submission code as well as to 
the completion handler code.

(Actually, that wouldn't matter unless the driver was queuing up 
multiple URBs, in which case it should be prepared to handle submission 
errors in the middle.)

> * The class driver is responsible to check the halted flag to
>   determine whether to initiate error recovery via usb_clear_halt
> 
> I'm trying to keep a clear separation of responsibilities between HCD
> and the USB core. Also, I try to keep the halted flag more closely match
> the state of the endpoint. 
> 
> Let me know what you think?

Making the flag match the endpoint state is a good idea.  But there is 
some ambiguity: Do you mean the state in the device, or the state in the 
HC hardware, or the state in the HCD?  After all, these aren't always 
the same.  For instance, unlinking an URB won't affect the device's 
state but it will affect the state on the host side.

Alan Stern


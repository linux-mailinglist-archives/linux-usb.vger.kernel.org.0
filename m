Return-Path: <linux-usb+bounces-35734-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJXfGDDpy2myMQYAu9opvQ
	(envelope-from <linux-usb+bounces-35734-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 17:33:04 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FAD36BBDF
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 17:33:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F0A9A3021C39
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 15:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A103D41163E;
	Tue, 31 Mar 2026 15:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="g3CMQG07"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F98410D07
	for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2026 15:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971095; cv=none; b=jW9YHSDoyL/7eHVuRy8A6dN33EVuJDMEWPD1c8lDhSNp7eMe215opn/BDB+Yyfk0U6vAiJldeXX7cNtT/eDETrF5C3synNnga0/xFBgq4vCw4KSolnjgn4ZnWo4NjnXfCJtSBZt+M84V7F/unHM7pcke5k7wkHo7W2r9pbCivoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971095; c=relaxed/simple;
	bh=H3NEMI4KOBWshWi4NQuV5G3uTxdOWMYmdrwiwd8Rgk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQMvZy8AhE6nqgMXncCsDNnxfiI+Celr+OfmftQaIdKtmX+3vvcbpJy1yfQnOCFY5/s8oUzqQHLb5w5/Ux01voTi6PSki0C2dY/ppog3BXpFDdhqonBLWwvfKBnwlpFwNIKU2X7JYJrJFDQbC7SK+1LCW+fOeT+1Tig2Qqa0Jz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=g3CMQG07; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8cd78a4ce8dso789426985a.3
        for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2026 08:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1774971081; x=1775575881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ybc/7oVlea/olVhogVfUA/ybZnq4NAauHZZAYiiB9BA=;
        b=g3CMQG07sujxkVCLp7RGIxhed+eU2hORveRRDcEAYTXiCOwzMLOS73VjITzixzY/NK
         /TSA2aguxbkiwhd0fhX1aXhDKoE/MwTZEiCUaYkGPo+HGSfIDh0KzgUjgPASFgD+BN8U
         oYfu758Fi+c+bqf8jE63+ihJ3Ab+ITz7WwR8MAyESPL+H8vtuDSLbvTIxQbPev/Qwdwe
         jvyuamfYzXnLdQfviP4c0Wqhw4bO01RugpElSGzWEr4WtL/prF+U2GC9+J8PDCu5gafY
         XHr6JdZw/f1wiSO5MvuAK1raHxj7QUeHMtcV1ucp7x2+3GhQLGKppR32MoaGK21X/YS8
         M9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971081; x=1775575881;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ybc/7oVlea/olVhogVfUA/ybZnq4NAauHZZAYiiB9BA=;
        b=CmujWBzLqkXK0ypNY3aFPR08eQ/8otATMdPoTwOCGl7l+bYKrWCHAngLUwlLVhC8Lx
         n2UWt4x3o1v2Y8WYtNmIEkppT2gSOvB0Wv6GkiiyXFjDOXRrjioUBnKik8iTsgnPkhMr
         oaGpd3EjWBI7EEIryAB5MeHQu3B8dfvZbL+Y9SXXLh+HViFCrSdsibmjOuAOg4hy0Iaw
         CMqW8HvOxgmwrrVj6UAQKcV1qywi/a1YjrkgjOYr7nLryP2YrA4DkkVqgqoH67UtnTf9
         NfscVRdrLVcH2YWWN+gNAByTepRlXCmr7Bs57tRQZfCy3GP5Vdr6/dCkJoXDjEPcYyOP
         Vvbg==
X-Forwarded-Encrypted: i=1; AJvYcCWQnU7x7Lqj1wlvICmAgYmlf23CoAbMKu2/EafGwLvb/rzQ1SDhzCRWwbrhyTLNjOUXHyIGI3q72dQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu/xe0k4v/sl6azgeDEKCvyY3bwlq9lKJlV1LY0w6qV3aLN+Ox
	1YCvlt8hriK5WbW6gu13qab9T65eV2Zp26ssmOY3pGT8Fu2zKMgHfMGPcJeaX/nzqg==
X-Gm-Gg: ATEYQzxggYMy2AuuEJ9YM4qqad6B6jNegHOyoRClOdjhh95ZKHGgBdSuU+5ehR/xjCG
	NKjwOsOhD6tNJgPuDcocXXWNybImJHKu2Bzw8nujtOUNHoPIrynNIu4I/oNqlPyiJriKuFHOIDv
	BDSQaLpDGEp5gYuCUWVIjMrHa6vu++ZXbIW8g4FSBDBUTlTuNq4II1n4/Ens01ORcTfKHhQ2smM
	rAAT5Gpn8dFdbnP04h/H0ErIeMeyD5/d3YQiepMqW71aK7wGB+JwATAO3dxvpBGuKWiy5m67/X2
	FeDyCfnvws0FKbTqG1Vhc4VvDZtU9Er5C2fPdo6C/6F+QXkT268IQVZ9L5C0cxlN7MOiuDy3qjm
	CApE2yXBfmJN4P4OGBV+35hTKhQ7uQ62NduI5+mUngKV9umNrfknrJSKRvbmrzOflcKTV2Upy12
	hIk2Z88v7OCuE2DUzYbNnnKaxK
X-Received: by 2002:a05:620a:414c:b0:8cd:8072:86f4 with SMTP id af79cd13be357-8d1b5af0465mr12696285a.25.1774971081159;
        Tue, 31 Mar 2026 08:31:21 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::5a82])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d027f0afd5sm842053185a.17.2026.03.31.08.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:31:20 -0700 (PDT)
Date: Tue, 31 Mar 2026 11:31:17 -0400
From: "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"michal.pecio@gmail.com" <michal.pecio@gmail.com>,
	"oneukum@suse.com" <oneukum@suse.com>,
	"niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Message-ID: <86876c62-01d2-45da-81f3-7d4499ffa0ad@rowland.harvard.edu>
References: <20260323122512.2019893-1-mathias.nyman@linux.intel.com>
 <20260323122512.2019893-2-mathias.nyman@linux.intel.com>
 <20260325015110.v4r5smfvdd62fcua@synopsys.com>
 <0f38e10d-ecac-4beb-ad2c-3a42c2546c3c@linux.intel.com>
 <20260326011910.t7ijezht7g7ttrec@synopsys.com>
 <9cf4008e-2d12-4025-809a-8d9371f45dac@linux.intel.com>
 <20260326232400.zkplsxflhykhayyb@synopsys.com>
 <2604e951-01e8-44d0-a11e-be63b0849c23@linux.intel.com>
 <9e62ef5a-5b31-4fca-891b-d028f5bbfc05@rowland.harvard.edu>
 <54121929-d775-45a0-b31d-09b783aada5d@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54121929-d775-45a0-b31d-09b783aada5d@linux.intel.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	FROM_DN_EQ_ADDR(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35734-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[synopsys.com,vger.kernel.org,gmail.com,suse.com,linux.intel.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,harvard.edu:email]
X-Rspamd-Queue-Id: 47FAD36BBDF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 12:34:54PM +0300, Mathias Nyman wrote:
> On 3/30/26 17:17, stern@rowland.harvard.edu wrote:
> > On Mon, Mar 30, 2026 at 03:51:46PM +0300, Mathias Nyman wrote:
> > > Ideally xhci driver would return the URB with EPIPE after STALL, and not continue
> > > processing URBs before a clear halt is sent, or a new URB is enqueued.
> > > USB core would hold off submitting URBs to xhci, buffering URBs enqueued for this
> > > STALLED endpoint until class driver urb->complete() finishes for that EPIPE URB.
> > > 
> > > Usb core could flag this endpoint as "halt_pending" before adding the EPIPE URB to
> > > the bh workqueue. Then after urb->complete() work is called and core is sure class
> > > driver  is aware of the EPIPE, then core would clear the flag and flush the buffered
> > > URBs to the host controller drivers, restarting the ring
> > 
> > This is not practical; it would result in a big slowdown for large bulk
> > transfers.  Doing this would mean the core could not send an URB to the
> > HCD until all the previous URBs for that endpoint had completed and the
> > interrupt handler had run, which would add significant latency to
> > transfers.
> 
> The URB submit buffering in core would only take place if endpoint is halted
> with EPIPE/EPROTO.
> 
> Additional latency should be limited to the time between interrupt handler
> returns a URB with EPIPE/EPROTO, and the bh workqueue finishing urb->complete()
> for that URB
> 
> URBs would normally be sent to HCD directly.
> 
> Yes, this might end up being quite complex, need to make sure it solves more
> issues than it creates.

Can that be done precisely?  I doubt it -- there are races between the 
core and the HCD and between the HCD and the hardware.

As for doing it imprecisely...  I'm not sure the advantages outweigh the 
complexity.  Anyway, if the class driver is well behaved, this buffering 
won't be needed.

> Usb core is aware of the halted endpoint before the class driver due to the bh
> workqueue giveback. To me it would make sense to make core responsible for babysitting
> the class driver urb submission for the time it withholds this information.
> 
> Whole reason for this is to prevent new URB submission from HCD restarting an endpoint
> after HCD gave back a halted URB, and HCD assuming core/class drivers are aware of
> the halt when the new URB is submitted.
> 
> Other option is that usb core would just refuse class driver from submitting URBs
> during this time. usb_submit_urb() would return with an error, but I think this might
> impact existing class drivers more.

How about this instead?  We add a "halted" flag to the usb_host_endpoint 
structure, and the core will set this flag whenever a bulk or interrupt 
URB gets a status other than 0 (before putting the URB on the bh list).  
If an URB has one of these statuses, when its completion handler returns 
the core will unlink all the URBs queued to the same endpoint.  Finally, 
the "halted" flag should be cleared after a completion handler returns 
if there are no more unlinked URBs still in the queue or URBs waiting on 
the bh list to be given back.

The result of this is that any URB remaining in the queue when the flag 
is cleared must have been submitted by the class driver _after_ the 
failing URB's completion handler has run.  We can assume the class 
driver knows what it's doing in this case.

The endpoint queue shouldn't be restarted until the "halted" flag is 
cleared.  Either right away, if there are any URBs in the queue, or not 
until the next URB is submitted.  Doing this might require a new HCD 
callback.  (It would also mean the kerneldoc for usb_unlink_urb() would 
need to be updated, because the endpoint might restart before all the 
completion handlers for the unlinked URBs have run.)

What I'm trying to do here is come up with a single, consistent proposal 
for exactly when halted endpoint queues should restart.  Maybe someone 
else has a better suggestion.

We also should add a special case for control endpoints because their 
halt conditions can get cleared automatically when the device receives a 
SETUP packet.

> > Exactly what should happen to URBs coming after one that completes with
> > -EPIPE is not immediately obvious.  If the HCD did try to send them to
> > the device right away then they would also be stalled, which is
> > obviously non-productive.  The only guarantee the kernel makes
> > about this situation is that the endpoint queue won't restart
> > until all completed or unlinked URBs have been given back (likewise for
> > -EPROTO errors).
> 
> My take is that endpoint should stop processing URBs, existing pending URBs
> should be retired by class/core, new URBs should restart the endpoint but new URBs
> are only permitted _after_ submitter is aware of the halt.

Yes, that's more or less what my proposal attempts to accomplish.

> A class driver testing USB specification should be able to resubmit a stalled URB
> (EPIPE) and expect it to complete with EPIPE again until it clears the halt.

Agreed.  

> > Here's a troubling consequence for people to consider: Suppose an
> > endpoint queue stops with -EPROTO or -EPIPE, and before the class driver
> > gets around to calling usb_clear_halt(), it is unbound.  What happens
> > the next time a driver binds to the device and tries to use the
> > endpoint?
> 
> The disable/enable interface and set config calls during unbind/bind should,
> if I remember correctly flush pending URBs and drop and re-add the endpoint,
> clearing the xhci side halt and reset toggle.

usb_probe_interface() doesn't do any of that stuff, other than a 
deferred switch to altsetting 0 if needed.

usb_unbind_interface() does call usb_enable_interface() if the interface 
is already in altsetting 0, but the reset_ep argument is false so the 
endpoint state doesn't get affected.  Should that be changed?

Alan Stern


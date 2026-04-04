Return-Path: <linux-usb+bounces-35962-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1zSmC2lv0Gmo7gYAu9opvQ
	(envelope-from <linux-usb+bounces-35962-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 03:54:49 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A6E3998A1
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 03:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDE1D303E4B9
	for <lists+linux-usb@lfdr.de>; Sat,  4 Apr 2026 01:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7ED02BDC23;
	Sat,  4 Apr 2026 01:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Ewi8/2Tg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5281DFD96
	for <linux-usb@vger.kernel.org>; Sat,  4 Apr 2026 01:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775267685; cv=none; b=EpVaSXpYzeXNbgN9VmxgOYEo5kT59jB1E+4Z7HkYHM8Jd3++vAstkcidWh1Fip+MEFd6xp47XhBb2LYoJdZ9W7Cn1KJpiKdPaWJJyltpd09nUkdSupZh4X5Ggayocf9Rw31YfhHMS3Nuxg3/hhP482OtuC4Mni4XLXd0QX2rjZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775267685; c=relaxed/simple;
	bh=Mk2VvbPkTi7fh4jL6Hn04cj0xT4lPEiLFmcwwp+s+B8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDZS72mXuaxn3ZagrtKhzv2lYaAFylzdVPYEHGKIlQWgXAUr86PZKllmu4lY5QQoHRnC0Q9VaT3BLbb3YCvNDqtaL9I8IV1SsLjASkssJrrx8cvN1rifY3ZeumFC/yWqJ/6h9YAkXiz8AwgWPPdsHn20N63JaAmyJ1QxSGqHiWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Ewi8/2Tg; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-50904a8f421so25376721cf.2
        for <linux-usb@vger.kernel.org>; Fri, 03 Apr 2026 18:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1775267683; x=1775872483; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2mAE2PFL2SF4OCAYjBOmDM+5vJAmvzcZfbm3+M7q6k0=;
        b=Ewi8/2TgcNyyJKezU0eRIBJ94mTGIFPnJu8LlWc3Cp2yladrs+JoadGQMT+UAS4ABS
         FHE/LjxdjwXoFbMosY19rnupS//tfMt2GMzztl8AV7/Ts09wZUCu7BvCMzXvbLd1PBF8
         c5XZIoWJfkKcnfMHfvJ9tCPbu/+YQMx7OWEVPh+ahfVSsma+Ii8OZVAIVp9kyQEpdEPl
         ALcrTWzuG1VHfNeZWOSIWdnUq0Xs7FKZp1p4Q0u6/W9juLg5hXU1wryQmMWP+KQOoldh
         ebG4ZE0xfwjkW/wjZonGW4g4xSEgu/ZKRUcsUf7fZehQz+A5YaBFTHsVU3bK+EAbZvJS
         f2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775267683; x=1775872483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2mAE2PFL2SF4OCAYjBOmDM+5vJAmvzcZfbm3+M7q6k0=;
        b=AU2b7rzGTKHahjjByll+/PaUiLD+DlrE2sTE1Q3uPBP9J9J1Nf3lkLXJrp4sVQIbl6
         mUrVslwwrEB0floLOLZ3eCa72Jgfhxgz6hyA1mfAHB8QrApbDFJz9tR+SiDmcJdur2oy
         bVW5lMKt/iYLCfYKaJxknABrOYks656U+tmC00org02wrAORKg74KocEHnD124hdlpj5
         JN6uYNs22nzUTlPZqQXL0oe5cosEkgRfcvN7qHTcxeRY+6/Wg2nPj3zrQsWhOQ0B4Nle
         ju/qJ5mYvRpe9CiXXURdV8iMXbM/8Tw7lJdBpqK0gZMGTpMsvpCIb2EXj2kIgai9qd/c
         SI/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxsyZu6tDCdiHRKEimjrZs64bJnhLrdLxMVx0yidRBXBRdLMGpoGFLX7Mb6qquoTvGNfNdD2Y2wYU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9b+4lWFey4G7MNvxvO//iRkx0v+51pIfdB4W/WWYyJWbuydWx
	QZV6oo2gnucCWUK+dyyFveA7lwN13EHzw6PYYfHrc7Ylmi19LT3m1IeYNpjO9JyoGw==
X-Gm-Gg: AeBDieuqBnq9/OMrJ0uq8nIulvQHyk1aKejW+zdgJy4iTk7WwZ78rbXaKR3EfkG2PDM
	M6WZkwc8ylfBx58C8Vpdn3yDzF3X/BQGR3G5vT+gWD8ngIovIi+QyXj3wHvURkdUkg8LTCq9b9Q
	LRTPyHFAGxUYNxJqElKzPgujITQo+aMoczBke8klTeDfhz9sOvEQ6A50mcmvAnrcW6VIbcPabrq
	OedVc7dDl9qisCFOBAk5sUw8ln+v93YD1CmsUnONDXD4WK57yvyXseCsvwJY4Ntgu2zbN0eKMiT
	sK/HlB1iSbKPECyXnFLf+6YjCfAXAAMpqFe6cBVyzH2S0ZtjejqxnYp8ojVQIo2BBdsXkehnrFA
	dGNRWe6sDMhXjGw6nvg8Sug76rf4MqrsdutdaE2qRx5JNKG//cFGsGKyADUDrO6Dz5Iv0AYrm8s
	ZUIDuT5MEnixaG9W8unYqOjze7
X-Received: by 2002:a05:622a:698f:b0:50d:41fa:8100 with SMTP id d75a77b69052e-50d6289bf26mr55323391cf.27.1775267682764;
        Fri, 03 Apr 2026 18:54:42 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::5a82])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4b73e7e5sm57090911cf.17.2026.04.03.18.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 18:54:41 -0700 (PDT)
Date: Fri, 3 Apr 2026 21:54:38 -0400
From: "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"michal.pecio@gmail.com" <michal.pecio@gmail.com>,
	"oneukum@suse.com" <oneukum@suse.com>,
	"niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Message-ID: <616e2a64-6feb-4ee6-bf39-a6284549f18f@rowland.harvard.edu>
References: <20260326232400.zkplsxflhykhayyb@synopsys.com>
 <2604e951-01e8-44d0-a11e-be63b0849c23@linux.intel.com>
 <9e62ef5a-5b31-4fca-891b-d028f5bbfc05@rowland.harvard.edu>
 <54121929-d775-45a0-b31d-09b783aada5d@linux.intel.com>
 <86876c62-01d2-45da-81f3-7d4499ffa0ad@rowland.harvard.edu>
 <50e61cf7-cce9-45b4-884e-ac65f5e771d7@linux.intel.com>
 <07351d72-5cdb-45e8-90af-311a0dc49718@rowland.harvard.edu>
 <20260403015950.lx4n4zdqki37dy27@synopsys.com>
 <28a00143-85fa-4043-93a0-c2b687ff1bcd@rowland.harvard.edu>
 <20260404011530.aukxllvizvmc3f3x@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404011530.aukxllvizvmc3f3x@synopsys.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	FROM_DN_EQ_ADDR(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35962-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 73A6E3998A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 04, 2026 at 01:15:52AM +0000, Thinh Nguyen wrote:
> > > How about this:
> > > 
> > > Introduce a halted flag the following conditions:
> > > 
> > > * Introduce the halted flag in usb_host_endpoint
> > > * The halted flag must be implemented as a bit in a unsigned long so
> > >   we can use atomic bit operation
> > 
> > I don't see why it needs to use atomic operations.  Unless you're 
> > thinking that we might want to add other bitflags into the same unsigned 
> > long?
> 
> Now that I think about it again, it's not needed if we have the
> requirement for clearing the flag only after usb_reset_endpoint.
> 
> > 
> > > * Only the HCD may set the halted flag, and only upon checking the
> > >   first URB completing with a halted status
> > 
> > Every status other than 0 should mean that the endpoint's queue is 
> > halted.  But not all statuses require a clear-halt or reset-endpoint to 
> > recover.  For instance, a short transfer when the URB_SHORT_NOT_OK flag 
> > is set.
> 
> It seems we're using the "halted" flag for different things. The halted
> flag to me is the endpoint's state and rather than the endpoint queue
> state. That is, if the endpoint is halted, there's an error that was
> reported on the pipe. So, an -ECONNRESET would not cause a halted
> endpoint.
> 
> > 
> > Why do you want the HCD to set the flag instead of 
> > usb_hcd_giveback_urb()?  Just one central place is simpler than in every 
> > HCD.
> 
> I'm just thinking in term of whose role to return the pending URBs.
> Typically the HCD handles when to give back URBs. If the HCD were to
> handle giving back pending URBs due to halted endpoint, then it should
> be the one to set the halted flag. However, if the core tracks and does
> both setting and clearing of the halted flag, then the core should
> handle canceling the URBs. As you said, if we can shift the burden to
> the core, that would help keep the flow consistent and centralized.
> 
> > 
> > > * Only the USB core may clear the halted flag, and only after
> > >   usb_reset_endpoint returns (this makes sure the HCD drained and reset
> > >   the endpoint before the flag is cleared and new URBs are accepted)
> > > * The usb_reset_endpoint must be called after clear-halt, SetInterface,
> > >   and SetConfiguration.
> > 
> > That's easy to do just by adding it into the appropriate core routines.
> 
> Yes.
> 
> > 
> > > * The USB core will not attempt to unlink pending URBs due to halted
> > >   condition
> > > * The HCD is responsible for completing or canceling queued URBs
> > >   when the halted flag is set. Cancelled and newly submitted URBs will
> > >   be returned with -EPIPE as long as the halted flag is set
> > 
> > Why make the HCD responsible for draining the queue?  It's like setting 
> > the halted flag; one central place is simpler and less error-prone than 
> > lots of separate places.
> > 
> > For newly submitted URBs, should the submission fail with -EPIPE, or 
> > should the submission succeed and then the URB complete with -EPIPE?  
> > The first is simpler, but drivers probably aren't prepared for it -- it 
> > would mean adding error handling to the submission code as well as to 
> > the completion handler code.
> > 
> > (Actually, that wouldn't matter unless the driver was queuing up 
> > multiple URBs, in which case it should be prepared to handle submission 
> > errors in the middle.)
> 
> I didn't think about failing immediately on submission because we would
> need to audit every class driver for that. Perhaps the core can
> intercept the URBs and immediately schedule a completion handler with
> the updated URB's status?
> 
> > 
> > > * The class driver is responsible to check the halted flag to
> > >   determine whether to initiate error recovery via usb_clear_halt
> > > 
> > > I'm trying to keep a clear separation of responsibilities between HCD
> > > and the USB core. Also, I try to keep the halted flag more closely match
> > > the state of the endpoint. 
> > > 
> > > Let me know what you think?
> > 
> > Making the flag match the endpoint state is a good idea.  But there is 
> > some ambiguity: Do you mean the state in the device, or the state in the 
> > HC hardware, or the state in the HCD?  After all, these aren't always 
> > the same.  For instance, unlinking an URB won't affect the device's 
> > state but it will affect the state on the host side.
> > 
> 
> The HCD state. If we can let the core manage the halted state, then here
> are the points where the halted state is updated (hopefully I didn't
> miss any other ones):
> 
> Endpoint is halted (reported by HCD):
> * URB returned with -EPROTO or -EPIPE
> 
> Endpoint is active (updated by the core):
> * SetConfiguration, SetInterface, clear-halt

Hmmm.  What did you think of my recent proposal in a message to Michal?  
Summarizing:

If the class driver wants to unlink queued URBs when a transaction error 
occurs, it has to do so itself in the failed URB's completion handler.  
We can make this easier by adding a usb_flush_endpoint_queue() routine 
to the core.  In the meantime, the HCD ensures that the queue is stopped 
before giving back the URB.  (Note: -EPIPE, -ENOENT, -ECONNRESET, and 
-EREMOTEIO aren't considered to be transaction errors.)

When the completion handler returns, the core will automatically call 
usb_clear_halt(), which will also reset the endpoint on the host side 
and will restart the queue.  This also happens after SetConfiguration 
and SetInterface, either explicitly or implicitly.

For -EPIPE (device sent a STALL token), the class driver has to clear 
the halt itself.  This is because stalls aren't errors; they are an 
intentional part of the USB protocol.

-ENOENT and -ECONNRESET (URB was unlinked) and -EREMOTEIO (short packet 
received with URB_SHORT_NOT_OK set) are a little trickier.  The HCD may 
or may not need to stop the queue for an unlink, possibly depending on 
whether the URB being unlinked is the active one.  When a short packet 
is received, the HC hardware may or may not stop its queue.  Either way, 
the class driver shouldn't need to take any special recovery action; any 
necessary actions should be taken automatically by the HCD and the core.

All of this applies only to bulk and interrupt endpoints.  Control 
endpoints generally need error recovery only on the host side, because 
the device resets automatically when it gets a new SETUP packet, and so 
the HCD should handle whatever is needed.  Isochronous endpoints don't 
ever halt and they shouldn't need to be reset when an error occurs.

Overall, this seems simpler than anything else we have discussed.

Alan Stern


Return-Path: <linux-usb+bounces-35945-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJRRDG3Wz2kQ1AYAu9opvQ
	(envelope-from <linux-usb+bounces-35945-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 17:02:05 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E3A3957AA
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 17:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26E81302713B
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2026 14:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91D363BD635;
	Fri,  3 Apr 2026 14:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="QHJPHaZr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EC13C457D
	for <linux-usb@vger.kernel.org>; Fri,  3 Apr 2026 14:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228165; cv=none; b=flQI/Dvo3M1JUNU67ZuiPZMyKKum8zx9rifgXGNMoPKIOEWBmHNXKVNOXD535JVjCVuEdNIyd/SP6tDM6BCduLKgar2KioKudaM1A/cn9Tpps92onG/W3U1q08eTmfrHur6tNxlHrEgKunnfdAICc5JJ69cVdL7qXw9ZzdGaBGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228165; c=relaxed/simple;
	bh=Lpvg5SrB2FLpfy6dkO+ntLJF0MPAu+guvXk3jgV/akg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pEW0oj9/t2TRLmC0wuE5HC+M+HqOEn1SxQnC6IczO0JmZwGc97JrssfZ2BUtKXn87TfgnXwFzmnPmApvO9ojoA64+6/LYdzXV4aN9je9iotrovs6F8wUphSGZ4v0/AiuBvjSj0Mpj+UIjyVHBl2dfL4iD5/86Bfaw/B3ql/vuBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=QHJPHaZr; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8cfc1aced74so318491085a.2
        for <linux-usb@vger.kernel.org>; Fri, 03 Apr 2026 07:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1775228162; x=1775832962; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5sibOzal2cjA6Ge5K6zlg372+TVE6BT3ugd971gIbiU=;
        b=QHJPHaZrw0tzAGIOCOPmTFBtdvQVi39utoSwf6dwm1GgE3xwys/cqXMFsdB+KereEr
         fhxGZimxmXmBhZlb6RXOnqHO52a4BZe1jsc8oV1+dIq12btDeEgyUbZ1HSyU5DyYo30X
         UKnEsRlZLPrZCdDn6YCjAQ3dWbM3vnCDiU1Bsb+pVKJHDTOeayWfngYRKcdTKQIok9vA
         MN6QxRIwmWZmuEDAkgJZvmAvYXeDwrpicw8rDJ36XSHttJJnqZ0Kgg1spCrql2pBY2lV
         qcujL+7CZwJu7KYJaJWz6viy7BDr2G6zLrFmLMHN2RhkvOlRCv0e6xfhdCOF/dvptimZ
         rkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228162; x=1775832962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5sibOzal2cjA6Ge5K6zlg372+TVE6BT3ugd971gIbiU=;
        b=DCChF8sOh5C+1N+g+OPmEypmnZlAWhVXM1E2jPYyapF6MCisTgHlQPGhDb57xR0lyq
         DvSRYK189ETuQU3SaosKxZlIboGWtCd7cXvNPTAUXfGcQXZ+jKxtwtjBZfMyugPfKg8o
         BVqSxBRBZM/YEF4vt3ivGsJyjKA/+UU607Yr5S8B/bc9Sl7/uOhjmUFTxL+8eVKbNENe
         maHrAINujGyqb6Vj1pvz/zMU8X9POeYhcxkPiomTTaImfe9P4xLKO82bNvoqerKlJxMj
         ICdnbGF9YGxPjUyowcRwggfolZjlrgDkUBuYsRREPqwNPNcV7/m9GIv7QK+2udDlUL14
         85zw==
X-Forwarded-Encrypted: i=1; AJvYcCXpINQLRNC+IpUxKarNMWlVO1p+AsX+6CHL82qD18SmAbBOuggMaMvLevKfXnA8eYSlJHLhS9KdpPI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLCbzM36npIqWu1hu5tZ2K2Tk9e8qThXS0c+0va+ZCUChmYjR1
	tv/GeeO/dcwLbKibZpmCj/nzv0nIdKv/05zmiE57ctBM/062sl/Y0MhK2q40BzfmnQ==
X-Gm-Gg: ATEYQzwHm7evRajHQ7Cf1BKRZ/Np0nlAF/tjyuse17mJcfZUz2BZkxeWqK2D5vgxt7F
	g9mu85YoY3kye1tALRqX5XfzpKSnsMhOBJXiV9eQXNFXkmYoRalJChJ0Q8z2xJTvCVb2RdizbRU
	k1wnmLtFKTHypDI4hSfYkWBPQL2qZJn/7t7nTOHvEuI1T7wzyFF02p0olz8zIsPfwUQJ5qwP3by
	NfN6GVYEICoMeU5TeRcQ0GVoWSIHPz0oPYJOo3bWKLcUE88DyhGBbxNLrHVRyU6zA6DLZiOYAsB
	ITpQ3ZKHBC04PryXt8xTHcIKw8G8BJFT+9TuKiMNZLkQOZNAWMrOEHjtXyJDqb3eZaABRqcXUPp
	Ce82c+g0PAfF5aHCjziP6PCkctth6YYHKEw/1/DrO+cj2BxxqKKeyhsKq3Wkz6C/Sd5RISe52hS
	CAtY+6nAQsve7d5KWpYy+KyUxi
X-Received: by 2002:a05:620a:4050:b0:8cf:c4d7:dfa with SMTP id af79cd13be357-8d4195744aemr471131385a.16.1775228161858;
        Fri, 03 Apr 2026 07:56:01 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::5a82])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a5879c98sm456752185a.11.2026.04.03.07.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:56:01 -0700 (PDT)
Date: Fri, 3 Apr 2026 10:55:58 -0400
From: "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"oneukum@suse.com" <oneukum@suse.com>,
	"niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Message-ID: <f3897bb1-fd9e-4321-bc62-31ae8329706b@rowland.harvard.edu>
References: <20260326232400.zkplsxflhykhayyb@synopsys.com>
 <2604e951-01e8-44d0-a11e-be63b0849c23@linux.intel.com>
 <9e62ef5a-5b31-4fca-891b-d028f5bbfc05@rowland.harvard.edu>
 <54121929-d775-45a0-b31d-09b783aada5d@linux.intel.com>
 <86876c62-01d2-45da-81f3-7d4499ffa0ad@rowland.harvard.edu>
 <50e61cf7-cce9-45b4-884e-ac65f5e771d7@linux.intel.com>
 <07351d72-5cdb-45e8-90af-311a0dc49718@rowland.harvard.edu>
 <20260403015950.lx4n4zdqki37dy27@synopsys.com>
 <28a00143-85fa-4043-93a0-c2b687ff1bcd@rowland.harvard.edu>
 <20260403105145.7e74a410.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403105145.7e74a410.michal.pecio@gmail.com>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35945-lists,linux-usb=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
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
X-Rspamd-Queue-Id: 64E3A3957AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 10:51:45AM +0200, Michal Pecio wrote:
> On Thu, 2 Apr 2026 22:42:39 -0400, stern@rowland.harvard.edu wrote:
> > Every status other than 0 should mean that the endpoint's queue is 
> > halted.  But not all statuses require a clear-halt or reset-endpoint
> > to recover.  For instance, a short transfer when the URB_SHORT_NOT_OK
> > flag is set.
> 
> This doesn't work in xhci-hcd and I'm not sure if it can. I don't recall
> any way to make endpoints halt on short transfer at all.
> 
> The driver does exactly two things with this flag:
> 1. Isochronus frames get EREMOTEIO status when it's detected, although
>    ISTR that URB_SHORT_NOT_OK isn't defined for isochronous URBs.
> 2. All others log a dbg() message. Supposedly, core is responsible for
>    updating urb->status then.

Truly?  What happens if usb-storage is doing a large bulk-IN transfer 
comprising multiple data URBs (with URB_SHORT_NOT_OK set in all but the 
last one), and the device indicates an early end-of-data by sending a 
short packet in the middle?  Will xhci-hcd store the information in the 
following bulk-IN status transaction to the transfer buffer for the next 
URB in the queue of data URBs?

(That's a misleading question.  The BOT class specification requires the 
device to stall the bulk-IN endpoint following a short data transfer, so 
this scenario wouldn't arise -- although not all devices follow the spec 
in this regard.  And it might arise in other protocols.  Regardless, 
it's hard for me to believe there's no way to tell an xHCI controller to 
stop the endpoint on a short transfer.  EHCI, OHCI, and UHCI all have 
ways to do it.)

> > > * The USB core will not attempt to unlink pending URBs due to halted
> > >   condition
> > > * The HCD is responsible for completing or canceling queued URBs
> > >   when the halted flag is set. Cancelled and newly submitted URBs
> > > will be returned with -EPIPE as long as the halted flag is set  
> > 
> > Why make the HCD responsible for draining the queue?  It's like
> > setting the halted flag; one central place is simpler and less
> > error-prone than lots of separate places.
> 
> Is emptying the queue really a good idea at all? It obviously breaks
> lazy drivers which just ignore errors and continue with the URBs they
> have already submitted. Removing the URBs only adds more data loss.

We have to decide on a single approach that can work for everybody.  If 
it means that some class drivers will have to be changed, so be it.

A lazy driver that just ignores errors will currently not work very well 
if at all following an error on an xHCI host controller.  But yes, it 
will work with a USB-2 controller.

If we want to minimize the changes needed in class drivers then we will 
have to make the core and HCDs recover automatically from transaction 
errors.  Non-lazy class drivers still have a chance to do their own 
recovery when the completion handler for the bad URB runs.  To make 
their lives easier, we could add a usb_purge_endpoint_queue() routine to 
the core; this seems a lot safer than summarily unlinking all the URBs 
all the time.

Is that what we should do?

> > For newly submitted URBs, should the submission fail with -EPIPE, or 
> > should the submission succeed and then the URB complete with -EPIPE?  
> > The first is simpler, but drivers probably aren't prepared for it
> 
> Are they truly expecting the alternative? I bet most of them would
> usb_clear_halt() for each received EPIPE, or not at all.

They might do usb_clear_halt() if the completed URB had -EPIPE status.  
But they won't do it when usb_submit_urb() returns -EPIPE (or any other 
error, for that matter).

> If completion unlinks remaining URBs before returning, this question
> doesn't exist (if we fix restarting before completion). If it doesn't
> unlink them, who even knows what the driver wants?

Good point.

> For example, some drivers resubmit the URB while handling EPROTO and
> don't unlink anything. To me, it says "screw data loss and continue".
> 
> It admittedly doesn't work on SuperSpeed anymore, but not all drivers
> need to worry about SuperSpeed. Including some old and lazy ones.

Think of it this way: If any URBs remain in the queue when the 
completion handler returns, we can assume the class driver doesn't want 
them to be unlinked.  When that happens, the best thing the core/HCD can 
do is issue a clear-halt and then restart the endpoint, so the queued 
URBs will run.  Except for the -EPIPE case, where the device halted its 
side of the endpoint and sent a STALL packet -- it's reasonable to 
require class drivers to handle that case themselves.

On the other hand, if the queue is empty when the completion handler 
returns (or if all the URBs still in the queue have already been 
unlinked but not yet given back), is there any harm in the core issuing 
a clear-halt and restarting the endpoint (with the same exception as 
above)?  This doesn't allow the class driver to do any further error 
recovery of its own, but when you get down to it, what else is there for 
it to do?

Also, this way we don't have to reject any URBs submitted while endpoint 
is stopped.  They simply get added to the end of the queue, so they will 
run when the endpoint is restarted.

Alan Stern


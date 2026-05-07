Return-Path: <linux-usb+bounces-37097-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GvlAwHL/GmPTwAAu9opvQ
	(envelope-from <linux-usb+bounces-37097-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 19:25:21 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FE64ECD7F
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 19:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 574453048175
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 17:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB9F2E1F02;
	Thu,  7 May 2026 17:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="H7NmzCEr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB92C4508E5
	for <linux-usb@vger.kernel.org>; Thu,  7 May 2026 17:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778174686; cv=none; b=Rxja/P5CMBhK5A4vEBh+r3+9+4+Z3wuahcae78wRkwDW7QAYFL4zZYBvK8HMjw1c7hKM4dLHMjnpsQimggFn8LylAise3wZM5k1MxR1EEngDbBqZjzzUQV1gBuV99+IleOjG2pksIrwUn9ft6kvtcbrfCujLi8dQk6ap4pQV92w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778174686; c=relaxed/simple;
	bh=XwubqFIZNlFXEJH8m0Jcl0x1o23B1H7+XQTwrGKOrec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=haw4P64VWqOaIz7m6u0b/25WRLPFWZxLqijOIJmvwNeXCcyaB0RumPFDEc+GU9f0vduRqmej5eqlYtnXQgN42Ig2m7XeaLCEsrFp20zrVQ7ZCa4MghHvFgc04Hzj1/tCfEyy3RPqr+N/LNrt7GzYC4KLLF9m788MXUULViq5kqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=H7NmzCEr; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-62f4c4e6694so701111137.3
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2026 10:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1778174683; x=1778779483; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AJpvlgY9+GG81Z09nZa3p3caC80kcYD48JORf0b1wGM=;
        b=H7NmzCEr3ph8Z9EGyanJjaqtACIBGoiRVNfefgseC7fJI5N4aUoaXwU9JIMwilPE3v
         HMMI6QcYNYh7eqJ7OS2wKj9WAyDonL40oJD1a3Qyvtd2dvoxye7DH8jujTE4XsChMeFf
         oLidRlpgEClf8WIwxHWO/lwqhgvC6FunGVByZuactvHIRLfdtqvv77SlPBkAKgAQET05
         qHyqekNH1gBrhiON5Kw0Qq4VhILZXLF99TeZsoSRbdxu69r10EIZGq7wN4cjZ+lqHB3z
         QZVQKPrAm6/jgMdqb9a3nZkFZ8Ni3BNSdd26WQ//RkNvZrV4c+LYf7STWHE1g13vVPC2
         +XBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778174683; x=1778779483;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AJpvlgY9+GG81Z09nZa3p3caC80kcYD48JORf0b1wGM=;
        b=bprhy4dY13j0/72xMxnHd238e1as32XbghuZswxAMcSxsBrggGhMwdEiRarurhMrxJ
         8vEeP5cb9S67sICfv4Y0JapYV+LGiwAKlMB5SpCI3rtmyN/gZ+O5N0G/jqXlmIbz+faN
         VPp6lzKlBq8xifSe4imfIbnQmZKNIjBS46jpFpYkrhN9AHxrKq9IipUs2j9Hce2zrbDa
         ExUhkZb7Py/ZdQMFpppMgLYlbA/H1heoNqB0Y7Cxs3khJ+gd00jtQD6yQhH7Xr8MDUVN
         3cN1Pjx92qZJ+3qUB9YSsEcnjvZIP5FZ+X7YgF3Yf4w923fCIixYRM97geqsqT7QyM2M
         dPRg==
X-Gm-Message-State: AOJu0Yy7WUhp/ITnZYosTqt5PyOoNL71KV5EMVtCz+r9Oq+r7YqcW5/h
	ExNsrJnhNsFlNEADYvz3L/fwJ2aPmhr/hEJhThdZwKk7/gwGka+KeTuN461oauFWWg==
X-Gm-Gg: AeBDietI9/jAbHNZNWdEukOMl+q+aKFqENfYYJsLmbfrd6YnOnbMJhR0Yn6qflOgyHP
	3z1c4jcgVsxZ5OyQr8vPGQ5YtyKl7vglOGHA0d5g0NWHAZtXf3L/CMqlbCjjXSSEUmlYcOjZ/rr
	iDAw2H2EiCq8DtAYik9Q/yANZd/gC3mzCq6Ihn4qVwPmMzeQMwt197qqoPgt4/Hj8zbNbuz0ePo
	IBec2r1RcMa7gaGpYe4bfpFs1FGzXwoadvLhls5wi5nF4sqogtTL7UsjQCF7y/NTV08xH+drIHv
	IL+fW7nkQPA46qnsTJYKHTVjEC/eXlBQFfn4DvnM/XN36T1iTwoUnEp+Cyt+kizI4NbsNQkSDnD
	t3Bgspj4LAd8EB9NMPWL1fR8QeqFBrcpXDyT79un7sEP+ftcfzZ8+SJMqJDzIr5gUw+Pyfb2/cS
	D6dRCZL2RkaSxW6AiBxHCKa5L/oS1h0jzhZzZUu/qIXi/labEQ1oACcqIQmF2rvPmcI0o=
X-Received: by 2002:a05:6102:5045:b0:618:442a:9e76 with SMTP id ada2fe7eead31-630f8ed8eebmr5477831137.10.1778174683472;
        Thu, 07 May 2026 10:24:43 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:349c:f507:d5eb:5d9e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b5391e34dasm235194116d6.14.2026.05.07.10.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 10:24:42 -0700 (PDT)
Date: Thu, 7 May 2026 13:24:40 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Dylan Robinson <dylan_robinson@motu.com>
Cc: linux-usb@vger.kernel.org, mathias.nyman@intel.com
Subject: Re: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame
 and always assumes URB_ISO_ASAP is set
Message-ID: <87d93b07-be3e-4c36-a6cb-97190560f648@rowland.harvard.edu>
References: <bug-220748-208809@https.bugzilla.kernel.org/>
 <bug-220748-208809-eL7PrzeMxr@https.bugzilla.kernel.org/>
 <fe08eabc-4f92-43fd-89d7-5e9d0e35c979@rowland.harvard.edu>
 <CA+Df+jdtQrYye85d7uZyT3jirsztKhf7qQes3LvOAPa+9qxSOw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+Df+jdtQrYye85d7uZyT3jirsztKhf7qQes3LvOAPa+9qxSOw@mail.gmail.com>
X-Rspamd-Queue-Id: 64FE64ECD7F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-37097-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 12:17:00PM -0400, Dylan Robinson wrote:
> On Wed, May 6, 2026 at 10:39 PM Alan Stern wrote:
> > For one thing, that would be very impractical, as every driver using
> > isochronous transfers would then have to be modified.
> 
> Maybe adding a new flag would make more sense then.
> 
> I was confused because the documentation regarding URB_ISO_ASAP
> describes this behavior.
> 
> - For ISO there are two startup behaviors: Specified start_frame or ASAP.
> - For ASAP set ``URB_ISO_ASAP`` in transfer_flags.
> 
> However, it looks like URB_ISO_ASAP actually means something
> different: that the URB can be delayed. Is that correct?

Sort of; a more accurate description would be that the URB is scheduled 
for the next available unexpired time slot (as opposed to the next time 
slot, regardless of whether it has expired or not).

Also, there is no "specified start_frame" behavior.  The start_frame 
field is output only.  Some of the documentation is out of date.  The 
most up-to-date information about isochronous scheduling is in the 
kerneldoc comments for usb_submit_urb() and usb_unlink_urb() in 
drivers/usb/core/urb.c.

> > For another, what's the point?
> 
> The point would be to allow the driver to start a stream on a
> particular frame relative to another stream, ensuring deterministic
> latency between the two.

I don't believe that's going to be possible.  Or at least, not possible 
until someone adds an API for getting an isochronous stream's current 
schedule information.  Until/unless that happens, the only way to know 
what frames or microframes the stream will use is to submit an URB and 
look at the start_frame and interval fields after it completes.

If you take that approach, submitting a few milliseconds worth of 
innocuous data at the start (or ignoring it in the case of an input 
stream), you should be able then to synchronize the data for your new 
stream with the data in another one with little trouble.  You won't be 
able to change how they are scheduled, but you will know exactly how the 
two streams' schedules are related.

> > In an ongoing stream, all this would
> > allow the driver to do would be to break the continuity of the stream.
> 
> For an ongoing stream I would expect that submitting a start_frame
> that is discontinuous and in the past would result in either a
> submission failure or immediate completion with an error status. Such
> an error would provide useful feedback to the driver because its
> occurrence would mean the stream is no longer synchronized as the
> driver expects.
> 
> > At the start of a fresh stream, the driver could easily end up
> > requesting the HCD to put the first transaction in a (micro)frame that
> > the endpoint isn't scheduled to use or is beyond the end of the HCD's
> > scheduling window.
> 
> If the driver requests a specific start frame, it should be the
> driver's responsibility to ensure it is a valid frame within the valid
> scheduling window.

Not possible, because the driver doesn't know the scheduling window 
or other parameters supported by the host controller driver.

>  If the requested start frame is invalid or outside
> the host controller driver's valid scheduling window, the request
> should fail. This would be more helpful than silently fixing it upon
> submission.

Not if the driver doesn't know what the window is.

> > >  In looking into porting our
> > > drivers to Linux, we've found the current behavior challenging to accommodate.
> > In what way?  What is it you want to do that you find challenging?
> 
> In order to offer predictable round trip latency though the host, we
> have to be able to correlate the frame time of transfers on the IN
> pipe to transfers on the OUT pipe. Therefore, our drivers need to
> determine the frame in which a transfer occurs.
> 
> Currently, with non-CFC host controllers, there is no way to determine
> which frame a transfer occurs in. This is because without CFC, the
> start_frame returned in the URB is only approximate.

Is this a deficiency of xhci-hcd, or of some types of xHCI hardware?  
Other kinds of host controllers don't have these problems.

> > And thereby forcing every URB to contain an integral number of frames'
> > worth of transactions, at the risk of breaking the stream's continuity?
> 
> AFAIK, xHCI doesn't allow scheduling transfers on arbitrary microframe
> indexes, only on frame boundaries. URBs could still contain a
> non-integral number of frames by putting the same start_frame in
> multiple URBs (just like the TDs used by the hardware). Alternatively,
> the initial frame-aligned URB could have a specific start_frame and
> the subsequent ones could be submitted as start immediately after.

xhci-hcd is not the only host controller driver in the Linux USB stack.  
What you're talking about would require changes to all of them (not to 
mention the changes needed in the class drivers).

> Ultimately, we care about the ability to start a stream on a
> particular frame and maintain its continuity after starting.
> 
> Currently, there is no straightforward way to inform the xhci driver
> whether a URB represents a stream start or continuation. This makes it
> difficult to detect missed service intervals or other scheduling
> discontinuities.

Informing xhci-hcd about this shouldn't be necessary; it should already 
know.  ehci-hcd does, for example.  In short, if the submission occurs 
before the last scheduled URB in a stream has completed, it is a 
continuation.  Otherwise it's a start.

What might be more difficult is distinguishing between a start and a 
continuation after a gap.  The boundary between those two is pretty 
subjective.  We deal with this by ignoring the possibility; it's always 
treated as a new start.

Alan Stern


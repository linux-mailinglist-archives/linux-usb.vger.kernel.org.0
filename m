Return-Path: <linux-usb+bounces-37114-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBxkGEVS/WmKagAAu9opvQ
	(envelope-from <linux-usb+bounces-37114-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 05:02:29 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DB04F0F7C
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 05:02:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 916BC3017C22
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2026 03:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D2329C33F;
	Fri,  8 May 2026 03:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="MYhcYrs/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95ADD248896
	for <linux-usb@vger.kernel.org>; Fri,  8 May 2026 03:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778209345; cv=none; b=HqXAaX2iL+Bg1rXbMuWrfleNUC8uZBotEM7jLdNwahgz1hsNX0IDQe8R6iyMnq2M/6h6Htc02FRJYlkgM86PO7T9c89zFepigHwDWVjNAGTbYzmNh9rtpiff3MaJYKQVHJorq7We6DORmOZ3I+RXIF/0A6BarCARXfE4NEU+BXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778209345; c=relaxed/simple;
	bh=NlUiKfGPwCMdoNm9BGunRuCcRVUKmRTbm2yCd/dK8D4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WyDpP3addj80gRBvfBIQ7jxFWrD2CkHwj5TyC8DYGF4tdFltAdkN7yJPuFJnCRvVddIeGLkOkMny+EN1a9eNi8Igdu7AK95SGqdoskJcsughRStweJr8hfy2YldSlP6Vx6X5wDWU4PsDBSAqjG2A1D+YJuL5j108lpNPWSKV/A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=MYhcYrs/; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8f0a87e23daso163423285a.1
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2026 20:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1778209342; x=1778814142; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QMh4xBXA3C/oIgogFaZWmW5oZLugsgjcPzBo3G4JBWY=;
        b=MYhcYrs/IFzH+C/NJ8MrMZIXTT1prC2QepzENQ3PS+JzYjl9DjTvuQ0sprp1+5Tlb8
         SbJ4FnRBginY1cbhClIdiQIXWh7UVd76S+UTMiYz+CJOvGgdFW1QKGjL49td+KGiBHTE
         eXee42g0NNSl5UruF1ClP5nktiUBv9Iv26GksagIWmZWGaLvw6Ncckx9+doBWwwoTNoS
         KBCPDpgjFg04UoqYij6GwH62UZ1xqcz8kk1SDsUoE0xurHrEOvAlpZjoOoUPnNpQlUPP
         +nxThDdWeNs4v58C+vS/etYmSWgT5mKKSkj1qaRVkpvQMvXjKWNRcPiknY5SuGpoNPtK
         lu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778209342; x=1778814142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QMh4xBXA3C/oIgogFaZWmW5oZLugsgjcPzBo3G4JBWY=;
        b=a30mCN34Oa0RUFx6Yp66bRyrDw4C7QkSZ5b0uBGdC+0EjWWjhVsjvhrX6rxHMeWRt6
         awEmpD1k+m1hQVvTotmy8Lt98OwdU0d5RvACOmQttjC7M7ruEvkzHP5d/zSeD9w5+TpG
         OgqmPmYK6rQNAOx/MbeNt6PHhXwaRTIUbeUeM6k1WGYN7XkeFgZlnVO337Jl17JNoGPH
         ITFjZFqAQzT1YzMf16toJqNf6HH/ao4MlGDYrdDjA40jQp/9x6fxNgd4ONBHa0eeFv8Q
         JYNylAItmi3ZAOAofaez33EvjFKzJpc5tz/yhw54SoVspO+Ctu3H+j94FxSgUdBOP4ox
         q7bw==
X-Gm-Message-State: AOJu0Yz+EMgszTiam9n3EI0EZr6t1fZv1o8Z0Kp7fjYyptH51whMUyT/
	0WuMwx1ZEboITyWZtVmbpEFjgtqH3RUv78TnvG29Q2MX4rWqC2W/U9OyW1KW4hK48g==
X-Gm-Gg: AeBDievcycuv+atQbw7eRaNl/1o4ecZuesQ15CFqDPVnt/xTeDN//hEXRo4xN6N4y4r
	TkDIAl1TVnHwnnU5DJli183av0iHlEJohTacKw5RDLJEIPwhdHxov87iV4Wf6+AHBmavpLgk5Hq
	FWHCH83XKoJ7POfeLoR6auCF1Or8LCawVXCuytUCyqXEIhf4uVxzNVujs2L5sYUDvbhoG19DIG1
	bmB8+rqI4Ze+pFIoCaQbAaOS/4hNFgtEFcTwsLbCbGkWY8guA1DOhJFX6NGxJXbUeOVUX+ZRsRJ
	3x3ZuSCTysMcybj2CbLQPhjh2ZjC3/Hi3XJ1WiJbACHXWBMXmU/nSxwIzG1u3P9ipx/vbNCAglO
	29StIJQuOwgFDq8TfbychkuFGci44clGh9GKCKHiTNiUcnfzr70bk+gei/Jen1F3RLDbIWeETRi
	eS6Etl1z8vTO8zgVD9eCmLy1AO
X-Received: by 2002:a05:620a:2684:b0:8ee:630e:350a with SMTP id af79cd13be357-904d72c239fmr1577450685a.58.1778209342435;
        Thu, 07 May 2026 20:02:22 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::a0bd])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b966f5f1sm70391285a.8.2026.05.07.20.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 20:02:21 -0700 (PDT)
Date: Thu, 7 May 2026 23:02:19 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Dylan Robinson <dylan_robinson@motu.com>
Cc: linux-usb@vger.kernel.org, mathias.nyman@intel.com
Subject: Re: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame
 and always assumes URB_ISO_ASAP is set
Message-ID: <a756038c-270b-455e-9f53-51b1ad6a31d0@rowland.harvard.edu>
References: <bug-220748-208809@https.bugzilla.kernel.org/>
 <bug-220748-208809-eL7PrzeMxr@https.bugzilla.kernel.org/>
 <fe08eabc-4f92-43fd-89d7-5e9d0e35c979@rowland.harvard.edu>
 <CA+Df+jdtQrYye85d7uZyT3jirsztKhf7qQes3LvOAPa+9qxSOw@mail.gmail.com>
 <87d93b07-be3e-4c36-a6cb-97190560f648@rowland.harvard.edu>
 <CA+Df+jfP-idvQqNrGo7Tc7+03ruh6kBa=MOSXE1mwXL2VqLNrw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+Df+jfP-idvQqNrGo7Tc7+03ruh6kBa=MOSXE1mwXL2VqLNrw@mail.gmail.com>
X-Rspamd-Queue-Id: B1DB04F0F7C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37114-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 05:16:31PM -0400, Dylan Robinson wrote:
> > > The point would be to allow the driver to start a stream on a
> > > particular frame relative to another stream, ensuring deterministic
> > > latency between the two.
> >
> > I don't believe that's going to be possible.  Or at least, not possible
> > until someone adds an API for getting an isochronous stream's current
> > schedule information.  Until/unless that happens, the only way to know
> > what frames or microframes the stream will use is to submit an URB and
> > look at the start_frame and interval fields after it completes.
> 
> Adding "specified start_frame" behavior is exactly what I am
> proposing. If it existed, the same driver submitting URBs for both
> endpoints could track scheduling information internally, no additional
> API needed. The device's endpoint descriptor determines the interval.
> Is there additional scheduling information the HCD has that the driver
> cannot observe?

There certainly is!

Different HCDs handle periodic transfer scheduling in different ways.  
In some cases the bandwidth (and corresponding (u)frames) may be 
reserved when an alternate setting is installed; in others it doesn't 
happen until the first URB of the new stream is submitted (in which 
case the interval may be taken from the URB instead of from the 
endpoint descriptor).

Either way, the HCD has to decide how to schedule the isochronous stream 
based on the constraints of how much bandwidth is already dedicated to 
other devices and endpoints, and what (u)frames are already in use.  Of 
course drivers have no way to know this, or to handle it if they did.

In addition, when the scheduling decision has been made, the HCD knows 
not only the interval that has been allocated to the stream but also its 
phase.  That is, which (u)frames it will use, in cases where the 
interval is larger than one (u)frame.  This phase information is not 
provided to the class driver other than implicitly through the 
start_frame values of completed URBs.

In fact, IIRC the USB spec doesn't require isochronous transfers to 
occur at uniformly spaced times.  It only requires that there be one 
transfer somewhere within each interval.

> FWIW, this is what our drivers for Windows and macOS do and they do
> not require any such API. They just read the current frame and
> schedule streams to start on a desirable future frame.

Let's say the interval is 8 frames, and the driver requests to start in 
frame 71.  If that isn't one of the frames in the allocated schedule, 
presumably the URB submission will fail.  What does the driver do then?  
Try again with 72, then 73, 74, and so on, until it finds a value that 
works?  Make random choices?

What if the HCD only supports scheduling up to 256 ms in the future, but 
the driver asks for a start frame that is 400 ms in the future?

What if the periodic schedule is already full and there is no bandwidth 
remaining to schedule the new stream?  How will the driver find out?  By 
getting a different error code from the URB submission?

> > If you take that approach, submitting a few milliseconds worth of
> > innocuous data at the start (or ignoring it in the case of an input
> > stream), you should be able then to synchronize the data for your new
> > stream with the data in another one with little trouble.  You won't be
> > able to change how they are scheduled, but you will know exactly how the
> > two streams' schedules are related.
> 
> I have tried this. It can work if the frame information returned after
> submission is accurate. That said, considering endpoint feedback and
> synchronization realities, an innocuous data transmission may not
> always be available.

All right.  Something else will be needed for such situations.  Right 
now I don't know what the requirements are.

> If a host controller cannot accommodate a requested start_frame, we
> would consider that host controller incompatible with our device. If
> we wanted to try working anyway, we could always fall back to
> non-specified scheduling.

In view of my remarks above, doesn't this amount to saying that you 
consider all host controllers incompatible with your device?

> I don't think it matters if the driver knows what the window is,
> because ultimately, the host controller can either support the
> requested start_frame or not. All the driver needs to know is whether
> its submission worked.

See above.

> > > Currently, with non-CFC host controllers, there is no way to determine
> > > which frame a transfer occurs in. This is because without CFC, the
> > > start_frame returned in the URB is only approximate.
> >
> > Is this a deficiency of xhci-hcd, or of some types of xHCI hardware?
> > Other kinds of host controllers don't have these problems.
> 
> I believe this is an xhci-hcd deficiency. The xhci-hcd computes a
> start frame close to the IST, but only uses it if the controller
> supports CFC and URB_ISO_ASAP is not set, otherwise it uses SIA. All
> xHCI revisions support specifying a start_frame in the first TD, but
> controllers without CFC require SIA = '1' for subsequent TDs.

I'm not conversant with all the intricate details of xHCI or the 
differences between various versions, so I'll take your word for it.

> I understand this would touch more than xhci-hcd, and I'm not
> proposing every HCD implement it. The minimal change would be for each
> HCD to advertise whether it supports "specified start_frame," allowing
> drivers to query that capability.

Then what will you do if your device lies behind a host controller that 
doesn't support it?  Fall back to unspecified scheduling?  If that is 
acceptable for such situations, why can't you use the same strategy with 
xhci-hcd?

> > > Currently, there is no straightforward way to inform the xhci driver
> > > whether a URB represents a stream start or continuation. This makes it
> > > difficult to detect missed service intervals or other scheduling
> > > discontinuities.
> >
> > Informing xhci-hcd about this shouldn't be necessary; it should already
> > know.  ehci-hcd does, for example.  In short, if the submission occurs
> > before the last scheduled URB in a stream has completed, it is a
> > continuation.  Otherwise it's a start.
> 
> What ultimately matters is the continuity of the stream on the wire.
> Submitting an URB before the completion of a previous one does not
> guarantee it was submitted in time to prevent a discontinuity on the
> wire, which we have observed.

In fact, _nothing_ guarantees that URBs will be submitted in time to 
prevent a gap in the schedule (except perhaps on some RT systems).  The 
CPU can get overcommitted at any time, and drivers have to be prepared 
to handle unpredictable delays.

> > What might be more difficult is distinguishing between a start and a
> > continuation after a gap.  The boundary between those two is pretty
> > subjective.  We deal with this by ignoring the possibility; it's always
> > treated as a new start.
> 
> Are you saying it's difficult to distinguish if the gap was intentional?

No, I'm saying that after a gap has occurred it's difficult to tell 
whether the submitter of the next URB wants it to continue using the 
same schedule as before and starting from the next upcoming time slot, 
or to continue using the same schedule as before with some of the URB's 
packets assigned to the expired time slots (so they never get sent), or 
to start using a completely new schedule.

The current intention is to make this determination based on whether the 
next URB is submitted before the last of the previous URBs completes and 
on whether the next URB has the ISO_ASAP flag set.

> I was talking about having a way for a driver submitting URBs to tell
> the host controller driver whether they are intended to be continuous,
> so that an error can be observed if the submitter's indication
> disagrees with the stream's current state.

Aren't they almost always intended to be continuous?  Particularly if 
the new URB is submitted by an old URB's completion handler?  About the 
only unambiguous exception I can think of is the first URB submitted 
after a Set-Interface request, where there's nothing for it to be 
continuous with.

It's always possible to observe these errors after the fact (assuming 
the start_frame values are reliable).  I'm not sure what value there is 
in observing them when the URB is submitted, however.  What would the 
driver do differently in these two cases?

Alan Stern


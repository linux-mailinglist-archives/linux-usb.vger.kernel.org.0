Return-Path: <linux-usb+bounces-36423-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDptH2zi6GkHRQIAu9opvQ
	(envelope-from <linux-usb+bounces-36423-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 16:59:56 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 232CF447A09
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 16:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0B489302E997
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 14:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A55332ED3;
	Wed, 22 Apr 2026 14:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="XarR3Iu5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166EA31B838
	for <linux-usb@vger.kernel.org>; Wed, 22 Apr 2026 14:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776869878; cv=none; b=j1RMUjT/G+RVYeED+heCqgeyWMt5AWqNi+iDcV3RvUB+pxDwBOEQsjZuO665nQ68GkV+/m50LiGcC/guY5zvqoDz9ujuStMpGPn2sYhZilWn88rGXqBFZ7opibAnAd3FuwI0IxIKYjO/fRXQX7yr1az8DoB+bPsWCJCJbaN8Ej0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776869878; c=relaxed/simple;
	bh=fSxzGhe7oLEkEmWP/pf1yEko3r90dJpufKsE/Wed1fY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GhsHFtIU07m4rXOh+vMnfWdPVKpnOfxUWnd5OQaFKHWZvcr1VJzK5leaKZKUHFndW/7hdeD0JJIxgcy4ezxpk7Pk2UM3uWYzQ+qqurKzsJWES3v5/MWb+82sGRo9//tlvC+H0WjE/dR/pgwwZzck9IZgkbMTh3fjs52V+c6Puhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=XarR3Iu5; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8ee9ec26edaso194364185a.2
        for <linux-usb@vger.kernel.org>; Wed, 22 Apr 2026 07:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1776869876; x=1777474676; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0E/rEgtlFKkYskJl6iotGcMkhANiYvV9njgV+7bjgFc=;
        b=XarR3Iu5i1gcYdi/07PLXMx3h39t7EbSLqN0A9EccJ7cPGjqlQpaZ0I55eNm14zvT8
         6mDq6zCPTzvCotCJexP8GJOLgC5Rn/FXUckzopJxyHQff5BjjpfXWXMNx1d4GaRieOQu
         IlbAdTA8CCHDOEf7+dP5S7SmZebGFBM6bYeXOq/mBvEIw06IP3haLmVkP4ycEu0BCGAY
         Hk9zmTEma7PbQQ3RdzrYFiQgKKLzI5yKd382ggmHaAsFmX6gbYA2I6KqllYl7CQzINoO
         9VsZPPxJ1TL1LRUGC7c6Dzz7gnN/BDYbXyhHqCeZezUSDkDJmW5nUxHdTsBu+6FtGAex
         mARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776869876; x=1777474676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0E/rEgtlFKkYskJl6iotGcMkhANiYvV9njgV+7bjgFc=;
        b=XEljSRJTIKlI3CjoVLzyqr1RZSEwHcPYpNShsawPP0clJPCYwVE6FO28CRk7HgM9RR
         YXXET9SHHg8UGYBIt2gHfgyzQm2FUFVO2jAhwGWogMB4vWM0ufqI11KCAO/KfQr2VYf3
         wa0+je3CmDODBMtD46EH3ri73+0/CaFT+snY1E+BuFKLzQkBaJ6G+t6QHX3OxioenKL4
         LGohzigMM2gxr5HLLyqSX5zjy4072srVOW1ioSIFMoU5HE/pexu/GZ4EBOr2B9X5EIfs
         Aa8GvRf4UovbaBT+Va8/fNZrelAzCtAO5eUS30JZ8LAasdPT7UT5N/fpb0BG/UAsavC9
         Zuxg==
X-Forwarded-Encrypted: i=1; AFNElJ/3XRp33dK+XtllVhAANvpUso0tzHxJyGH6NniNfdVwysKb14mk0r9Y2bFYQ3vl6+B6sFV5sza3JKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoJZCeoGbGLWMyWIZfG/F2IVvfG13ntUcgJqUTMPPD0DQ4K6dT
	AhGF7sIdokGZjVC9/VTICcI8IlZCz5cA3VDuHn2lD0HduwEOJKOnP6DMwxJnrT1ArA==
X-Gm-Gg: AeBDies8X0fVVKLuOYGUnfIibDqGcX+BY6HPKYZAWHN+FHq6NPGk/lPTaoYf/8iCuOc
	P26vJGBab/oU2K6oS3e6SptrOZ+T9gTcX0NgNCfvEBOYbPkey9rg2cdk+i1oj9GYcZOmXDZJS2r
	D2Q+P8z+SNZOwfTiVOSUvGyuqEftJaM7B36P9HWGfjlh1Kmzunm8Mcg8c6eUH4BS/WP31xZA5hA
	KDwpKruo/bg3FGMYFpe60N3QNb+ITQOnTLYarusjncqtuloGhfmLugM3BrO8dIBYdx88nUnCPK9
	n7QE5mAymttG++vUcSu5MyzhkqbZzf8FBj3h01izddrNrhz3GzGRCcVghiAsIp7hHV7AoJ0rKa3
	KCJ5pe3Hsh2bTPNzr+mVS/NLRlZA1q9smHh6oPSUbUOLFdlQRljMdLY65ePNgzhTlSltAsZq8YS
	Zr+e78FtgwIgHiw2+/Jh/OJSaSsPzdizxvh4lkSmlngs0TtS2GGFu1
X-Received: by 2002:a05:620a:711b:b0:8cf:c513:349c with SMTP id af79cd13be357-8e78f058399mr2938390585a.9.1776869875674;
        Wed, 22 Apr 2026 07:57:55 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d93c3083sm1299124185a.35.2026.04.22.07.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 07:57:55 -0700 (PDT)
Date: Wed, 22 Apr 2026 10:57:52 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"oneukum@suse.com" <oneukum@suse.com>,
	"niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Message-ID: <6a631ccd-736b-41e7-94d3-1ada47c6341c@rowland.harvard.edu>
References: <20260404204133.3mcizeeokw3ln5r4@synopsys.com>
 <243af5f2-3925-4960-be7b-8d0c273ae629@rowland.harvard.edu>
 <20260404221533.woepax7jxwefy3fq@synopsys.com>
 <20260404222818.t5y52gnd2gvalvp5@synopsys.com>
 <b4e2edd9-2616-4cfe-90a5-438fb6625706@rowland.harvard.edu>
 <20260405030954.32jbg3fphi5xdla3@synopsys.com>
 <74ac9ea2-34d1-4999-9048-c03a0f978b5d@rowland.harvard.edu>
 <65682e07-e18c-4674-bfa7-2cc27abb5ede@linux.intel.com>
 <54fd265d-4ae8-4573-b618-587af98176c9@rowland.harvard.edu>
 <20260422073054.0bd482ba.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422073054.0bd482ba.michal.pecio@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36423-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]
X-Rspamd-Queue-Id: 232CF447A09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 07:30:54AM +0200, Michal Pecio wrote:
> On Tue, 21 Apr 2026 22:11:41 -0400, Alan Stern wrote:
> > Can you confirm that it's also possible for xhci-hcd to prevent
> > control endpoints from restarting when a transaction error (-EPROTO)
> > occurs?  Up until usb_reset_endpoint() or a new callback?
> 
> Doable. They halt like any other and it's SW's choice how to restart.
> 
> BTW, what about EOVERFLOW? It's treated similarly by xhci-hcd.

That also counts as a transaction error.  So do EILSEQ, ETIME, ECOMM, 
and ENOSR (even if xhci-hcd never generates them).

> > I've been thinking about how to implement all this, and some issues
> > have to be solved.  In particular, suppose we have sent a Clear-Halt
> > request for an endpoint that has gotten an error, and either the
> > request times out or the device replies with a stall.
> 
> (... or the TT replies with STALL due to downstream bus EPROTO).
> 
> > My feeling is that either of these events would mean that the device
> > is so far out of whack that the only thing to do is try resetting it.
> > Any proposals for something a little less drastic?
> 
> Let's look at possible causes:
> 
> 1. disconnected device
> Doesn't matter what happens.
> 
> 2. completely brain dead host controller
> Ditto. Just be sure not to lock up so xhci-hcd can be reloaded.
> 
> 3. temporary EMI or low link quality
> This should clear itself after a few retries.

In this case we would get an error, not a timeout or stall.  Unless the 
problem is on the downstream side of a TT, in which case we would get a 
stall.  (Oddly, this case seems to be missing from the state diagrams of 
Figures 11-55 and 11-59 in the USB 2.0 spec.)

I guess to be safe, we should treat stall the same as an error.

> 4. broken D+/D- wire in a LS/FS cable
> Issues can last arbitrarily long and yet still clear.
> Least disruptive solution: wait forever with sporadic retries.
> Acceptable alternative: request user attention, i.e. disconnect.
> 
> Note: we would disconnect instantly if the opposite wire broke.

Same as above, except for the "temporary" part.

> 5. crashed device firmware
> In this case a reset seems more productive than retrying forever.
> 
> A compromise betwen 4 and 5 could be to retry for some time, then
> reset a few times, then disconnect.

My plan is to retry up until about 1 second and then do a reset.  If the 
reset fails, the device is logically disconnected.

> 6. device doesn't support clear-halt, stalls or does something odd
> 
> Nightmare fuel.

Devices are required to support clear-halt for bulk and interrupt 
endpoints.  And the only reason for stalling a clear-halt request, as 
far as I know, is if the request is invalid in some way (such as 
specifying an endpoint that doesn't exist).

Either way, I can't think of anything else to do besides retries and 
then reset.

> > Also, it seems reasonable to devote only a single thread to endpoint 
> > error recovery.  Another possibility would be to have one thread for 
> > each device having problems, but I think the likelihood of this 
> > happening to multiple devices at once is pretty small unless the
> > problem affects a hub upstream from all of them -- in which case
> > having multiple threads wouldn't really help much.  Other opinions?
> 
> Well, another option is asynchronous URBs and "callback hell". For
> instance, besides hcd methods, all xhci-hcd endpoint management is
> asynchronous, tracks current state with bit flags and defers actions
> blocked by flags until the flags are cleared. This includes waiting
> for Reset Endpoint commands, TT clearing, ongoing unlinks, etc.
> 
> One practical complication is that hcd->endpoint_reset() may sleep.
> But it will only extremely rarely take 5 seconds and time out.

Even so, that means the recovery has to be done by a thread.

Alan Stern


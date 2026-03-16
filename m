Return-Path: <linux-usb+bounces-34891-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEpzNNs/uGnSawEAu9opvQ
	(envelope-from <linux-usb+bounces-34891-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 18:37:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA75429E61A
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 18:37:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1C17E3018215
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 17:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9675C330D25;
	Mon, 16 Mar 2026 17:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="kwhNwgEV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99F113B5B3
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 17:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773682400; cv=none; b=Jh8LWQyHbEWEpyZrkSDjZ4Fu8ILSjRyBtaGpkb97QinComwCVOU1UiAJ6biLR2j2ySVkFLyUSWeNgNqB5nzuX1tw49fumEUEzy4HShn6bHZb5xehLtAHN7zNaSmxptRwNfuxNwlufTcdMB/MaJlPQK+i6Z2AQ04RbKRUbBttbZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773682400; c=relaxed/simple;
	bh=3AQQRFXR6PJzElWym2svjDNAUTpWGUvaT993tBsmS38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJ2d8EwoAHjqICytbv0DrzZNCyRc59o4IGR/2GK6DmrTW4FYioauODbyHElw12T3w5E6K+XjJzFqLnwFwRwvLI2LEdicsoCa/HeATIyc/2NgI02d8II3ScIx67qx82wMcECFCv4Qzz3jJopV3+tFaZO2iPF2CUDQMH6gbc1Y6Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=kwhNwgEV; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8cb20bcff5aso487729085a.3
        for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 10:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773682398; x=1774287198; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=13Bw5i/rQRPicG+Ee2XgD6f3k4QfwXOpTQqvT//swZY=;
        b=kwhNwgEVphQoBOKHvLVzgBB1+JU7vaBPIioPc8JwJKPkHIC/RwcI0hS4arReWILfX+
         QCbcmMGXtyxYD+cgK3m2YqoSPrXVRV2RNsLcHLb11h/dtFfnHh7qvXtoLyBYJ2T2n4Fo
         HtqzTPs0sOYJAbW/2I5tpqr6KgxMB1gy7uZFOHOr8aeCKKsooMopmz8gFzswDeZ4kJ24
         9oNcJa2gRsmsn5ImOS1tq2kOS/VsmuxL+YWzIQYys4RSMx7vdAAUt2N07fbyXVcTuIqr
         Suha4XAuFcEO43wbB8WoukOArqXRW8fXYPT4xkrcdqy62TYAV7Jw46h7kgdDbGyhaf+o
         kk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773682398; x=1774287198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=13Bw5i/rQRPicG+Ee2XgD6f3k4QfwXOpTQqvT//swZY=;
        b=k5KMAn+rwUUDbuHe2UPm4N31RLE74TVt4ZDqivrfOtqw9s5OEt4csYAP4FvgW2wk9s
         2106pvF7i9CytymGhEcct2O1qp9fYQ/0ry308Y+6F0QQv8AyyUnTzHwzAJ1B2xY5psF5
         rpgyCHL6H7e1/kZmMnKSo+WhkFvLz1yOdlmYjIp3mY5DUUHDPgmDvahjE67rFuGrSbpP
         DhrJZ2XrGSjURsqxgokeREScH7KEShJnCwYEIpkOYNyB6qmwtP0NAdf+tm/BoY+/Ehmc
         sKXF2iaFvZsDD+Pr4hw/epfa7uM97DkS/Z9FevOuKg5zs3WbbYxfuN5HGLBenCISTJhF
         u2vQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV/8ybyatVOT3eUbYwbs0V5+W4g7xmE89HdGyK/TX3dHNteSAlvky5KSP0UkpVCkWrQC9wUTpUFvo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjLFLex9jsd9h2HcqdkOL+tO4II/2JJlsSpzvs74BQz2x3YTj6
	cggKbnqy1CiYgOc0EnEDqP5rM7Zgs/TCOiVlMkV7dyCa0+z6wcfiDHQaY4LdSZGfN+LIO1M9bqJ
	riaw=
X-Gm-Gg: ATEYQzy4vvAeWlykrDGdZmM3y1J5eK2tKmoZm5NVajYGC/YwcG5YPU4qECEtv4ryyTN
	9Wk6j9fNwdSQrk1RBxaY73bVTkvkFhDolGLLIsv8Z7yDX4mVu7As3e20QYBMUKfdoV67Ao91nKZ
	ab1ALLiosh/xFt7sEQ0zUcaP5yEluj8Nya1vDF2uu6VAiRwy+PeoGeD89d5Nyz4h5if+FaAhr9/
	zRzGdgRkfmGjb7arH4nIXwJKCrRiDI4wzckrkhF+BACZVeYPtb+E2G2YVb+uouesmld6Kwmen/A
	ZsTJU6xDUpSjSLOVdF+SXCqeI+5MT4HK1T1p+s64tK+YDj3GkSnUKWGfSsoPfPpHg0D0A6WbxhS
	GyzXbBgCGbgJd4uebrW1rav/KhQqYOvJ/W+h4mO5NQ3wa9bjbLuvdBZWZ3C99+UN5FibVmMGwUO
	W4iY63zp63erL9yhAFs8noAxsU8B7rwBqB8maaWnVE5fwzXObmhPEGPmNsf3xEIEUSUi2tt9dTl
	gxqTSc7tjbBBcOjTgLz
X-Received: by 2002:a05:620a:44d5:b0:8c7:17f3:e98b with SMTP id af79cd13be357-8cdb5a1c665mr1876457785a.15.1773682397678;
        Mon, 16 Mar 2026 10:33:17 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-29.harvard-secure.wrls.harvard.edu. [65.112.8.29])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda216b7fasm1264120585a.47.2026.03.16.10.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 10:33:17 -0700 (PDT)
Date: Mon, 16 Mar 2026 13:33:14 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	USB list <linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Message-ID: <4f8b9942-307b-4c31-86f3-1b7b20b34a16@rowland.harvard.edu>
References: <4f85311c-bdfe-46a4-a310-4a74a3c56b3e@rowland.harvard.edu>
 <64dc9c5d-d662-41e3-898f-71587b940a2c@suse.com>
 <20260313085354.71a6dbf1.michal.pecio@gmail.com>
 <12567c7d-0a17-46a0-8acf-3158c2d9011a@suse.com>
 <9da0ac4f-12bf-4270-af6f-e08b5a89611b@rowland.harvard.edu>
 <20260313224528.dp6utjqzbdguwlbf@synopsys.com>
 <a6934c14-aeb5-40d0-865c-14199943e2a2@rowland.harvard.edu>
 <3028610a-f05a-4bc8-9037-cca152e46c52@suse.com>
 <437037d6-3fe1-4f81-b74a-21bea00725e0@rowland.harvard.edu>
 <0b45d0e4-53f8-4960-b41c-63639b496dac@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b45d0e4-53f8-4960-b41c-63639b496dac@suse.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[synopsys.com,gmail.com,mork.no,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TAGGED_FROM(0.00)[bounces-34891-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: CA75429E61A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 03:47:49PM +0100, Oliver Neukum wrote:
> On 16.03.26 15:02, Alan Stern wrote:
> > On Mon, Mar 16, 2026 at 01:58:34PM +0100, Oliver Neukum wrote:
> > > On 14.03.26 03:39, Alan Stern wrote:
> 
> > > Yes. That raises the question how much can be centralized.
> > > > And of course, isochronous transfers are never retried, by definition.
> > > 
> > > Do we still need to clear a halt?
> > 
> > Isochronous endpoints do not halt, and isochronous transfers are never
> > retried.  And although the spec doesn't seem to say this explicitly, I
> > believe isochronous endpoints do not pay any attention to the HALT
> > feature setting (which can be changed by a Set-Feature or Clear-Feature
> > request).
> 
> That then raises the question how we resync.

That's handled at the class level.  In the simplest approach there is no 
resync.  The host just keeps trying to send or receive isochronous 
packets at the previously scheduled intervals, and some data is lost.  
Consider an audio or video stream, for example.

> > > That would suggest implementing an equivalent of usb_queue_reset_device()
> > > for clearing halts.
> > 
> > My thought exactly.
> 
> Good. It would need to take a callback as an argument and in principle
> you could have this for multiple endpoints. Any ideas for the API?

It's more complicated than just clearing halts.  What if the driver has 
queued a bunch of URBs?  They all have to be unlinked first.

Then after the halt has been cleared, the driver has to resubmit the URB 
where the error occurred (keeping in mind that some initial part of it 
may have been sent/received already).  Maybe also submit the other URBs 
that were in the unlinked queue.

There has to be a retry counter or timer because the driver should give 
up after some length of time.  When that happens, should we try to reset 
the device?

It's a mess.  Implementing it in usbhid was justified because that's 
such an important driver in such widespread use.  I'm not at all sure 
how it can be generalized for all sorts of other drivers.

> > > > Also, just to make things more difficult, these errors are reported in
> > > > atomic context but the recovery procedure has to happen in process
> > > > context.  Which means there has to be a way to cancel the recovery
> > > > procedure if it's in progress when the driver is unbound.
> > > 
> > > Well, no. Not exactly. If it is necessary to clear a halt before
> > > you can communicate with the device again, we cannot reprobe
> > > the device before the error is handled. It wouldn't work.
> > > We need to wait for error handling to complete if the driver
> > > is unbound.
> > 
> > Good point.  So not quite the same behavior as usb_queue_reset_device().
> 
> Actually you make me wonder whether the semantics for
> usb_queue_reset_device() is good.

That's a separate matter.  However, a driver that is clever enough to 
call usb_queue_reset_device() should also be clever enough to call 
usb_reset_device() from within its probe routine, if needed.

Alan Stern


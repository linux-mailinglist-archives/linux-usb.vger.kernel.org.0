Return-Path: <linux-usb+bounces-36310-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEzSINWb42mCJAEAu9opvQ
	(envelope-from <linux-usb+bounces-36310-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 16:57:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7F1421649
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 16:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A4B6302BE9E
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 14:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56CEE395DB4;
	Sat, 18 Apr 2026 14:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ECTGDBmt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5753633F8C6
	for <linux-usb@vger.kernel.org>; Sat, 18 Apr 2026 14:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776524220; cv=none; b=H3LHPb6jGeSJP9DIuEmxQvbcvmdNHJFIofOBqkMWixemnLr8krSWBEZi8JIYaaKM8uExvSzK8YOWMW1rY/CwNLuYV2a4pE5IZUSXyOmYRPWnoSkNgnTebibuxmCGfTeHdc/3J0WWeYYSdu5mG6jbcoMK+bDXgzreMjvsxGaK+IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776524220; c=relaxed/simple;
	bh=GoSBbEcCO3UjQvd7U82+jFRIp8C9uD1R0WHOOYXmWvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S355g0UG54aDC4Ek8k6SAdWzWaczlN40jfQuI67UbwAHbemZsrtSXKn3zOxUxhb8RPPbGcaq3Hjfo600Dp47qbGpzxHp62N/Fx3xr2FKezM+XaOdfOBFB7b6zL8U6jP5CbyIAD4hT56Id9vjCyTwz4h6uTFVam/IVDCIozR9cfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ECTGDBmt; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8acb7f2586bso19547486d6.1
        for <linux-usb@vger.kernel.org>; Sat, 18 Apr 2026 07:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1776524218; x=1777129018; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9ozgYvTPNEDJCi2kNheNemEWvMX1/xmXDUXCuDENTok=;
        b=ECTGDBmtM2cNOQaGEDGCaOSaOpe19VXfryBYhZsEEfJkYBrXG868T1Alk3usbqT5lP
         ZRwsb2m7FBvnfoPOwb5YuTR7Yr69J3CH7CJkOLMG9UU9pxvr6AWY22C13uCm1Pl/cApy
         AJ68M5zDIZfnMOlE1Y9D81XkqzKl2HUWyHSfHMUENeBn4jmbW0pbJYXSMIGAcpihbggI
         v4SlyCM0L/DkCH4F8+g/f/qaSLCrbImUQ0oWfHAUJUjaFC5INv2oagK9odFh7NGYC5AM
         guzUuDTgQGdBrCMyJZPY8+JSVInZzJZqChHGBdjD5SVvve94SVgN8ecmA4/w+U+uLiBw
         aAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776524218; x=1777129018;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ozgYvTPNEDJCi2kNheNemEWvMX1/xmXDUXCuDENTok=;
        b=SdZ46WIyjAfqI3wn5ipYFtpxYx+y8vJSkuONrM1KhhhgEJ3oa5Mm7hmOb2aOhJrzCq
         36WJEizs3d9drfU7cj1+VmSx8NDmcPCPnLdNlDlKg1jJCUbIYh+GqkJHtGLUG2BoG4F6
         h8WCyC6NCo2hX1jyQPRRxW5cauUPRN4C5xdgJ0Ki002Rl1CoYUoh2oQN7jLhc2kLraMO
         a2mx+KosFTZHv0L/mYmmMfquQ7Z8Pxi3PxTBEBJWz+eQiQ8z2I4k4aAp4r4bsvjciOzn
         5fion1q6anSJ6sMxBAHlmKyAgGqzTguuitvay4DX5ce8MJMeg6jzlS/La1ZytvcPl2Gu
         nQCA==
X-Forwarded-Encrypted: i=1; AFNElJ8W4gA53sEGnFk9bhE68fgsVhDaxGTgJ+zieVXudtfGWTiN55lSjLVw8izqPqSL/8I1w/bw4zTJGkw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8ePf4zo96Ln6LEvpPpfJhUo666gBrDDTi5UKpD/d4hZmNOpfv
	fxYWgiiR24JTJt+KekRNLcxwOnuq/ggknACiug9vA6aY89ZPg9M1hJOqEEOnzgbJ7Nyj/oi0Y7w
	8+VDe1g==
X-Gm-Gg: AeBDieujdwpo3ug+0c2KDiPaFU0VNk727w8pc3Nd09uqQwyvDx9ui6vdxfFEs6W9Kwr
	sboOq6vkmdunT/5CbxyHElDlsdgW7hvUTD/rbHnj0Iq/7EjahX+GgjPG1jxvKpyVdYI6EIVrl0X
	EoR56JTe9xoQkp5t68lR1TWHYUtxNPbOE9b8b/vHux0js+wWdx9oLCdja+75p8hYigT01OPWUc3
	+AFPuYLIM3ZMk19it8rb4X+9dUhzglbE7XIm1WtWtRzsmWEcsOAhhmq86VtaXEbJRdeBBnyab8a
	kPurALuZlbTW0YUO1+mWFL94LZt7WdxSBUhsYKwJhZCSxb0Qr0Vwb1lXgeQ/J1ObxZbxMWLkoW+
	XM0brkPGn8JhskJUYOoIPUA6TA2AiZTA0x0Xhlm8ofjV1CjkIHCiT04gWWzHkRJ9g1hq/Uc1HfE
	IjauxQcjp864ihlvGKavfzG2fixyT3Psl7+do=
X-Received: by 2002:a05:6214:4019:b0:89c:da2b:4903 with SMTP id 6a1803df08f44-8b02822c9cfmr112479536d6.46.1776524218003;
        Sat, 18 Apr 2026 07:56:58 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::5a82])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae5eaf1sm35473296d6.30.2026.04.18.07.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 07:56:57 -0700 (PDT)
Date: Sat, 18 Apr 2026 10:56:54 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"oneukum@suse.com" <oneukum@suse.com>,
	"niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Message-ID: <b72854a7-d6f9-4879-a571-affd76d8c597@rowland.harvard.edu>
References: <20260404221533.woepax7jxwefy3fq@synopsys.com>
 <20260404222818.t5y52gnd2gvalvp5@synopsys.com>
 <b4e2edd9-2616-4cfe-90a5-438fb6625706@rowland.harvard.edu>
 <20260405030954.32jbg3fphi5xdla3@synopsys.com>
 <74ac9ea2-34d1-4999-9048-c03a0f978b5d@rowland.harvard.edu>
 <65682e07-e18c-4674-bfa7-2cc27abb5ede@linux.intel.com>
 <4a484a89-f52a-48c2-af43-c0029878ddaf@rowland.harvard.edu>
 <20260417234846.41a24089.michal.pecio@gmail.com>
 <e89a6683-4570-4ca6-95ea-0e9932614974@rowland.harvard.edu>
 <20260418112146.3ae60b58.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418112146.3ae60b58.michal.pecio@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36310-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]
X-Rspamd-Queue-Id: DD7F1421649
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 18, 2026 at 11:21:46AM +0200, Michal Pecio wrote:
> On Fri, 17 Apr 2026 22:34:58 -0400, Alan Stern wrote:
> > Okay, good, we'll require all HCDs to reset control endpoints 
> > automatically after every error and stall.
> 
> Are they not doing it?

As far as I know, they are.  But it's not currently a requirement.  In 
fact, I don't know of any place in the source code where all the special 
requirements for HCDs are listed.  Probably the best locations are the 
kerneldoc for usb_submit_urb() and usb_unlink_urb().

> Say that something like lsusb encounters protocol stall while another
> URB from the class driver is pending, will the other URB time out just
> because host endpoint halted on an earlier one?

Even if that were true now (although I don't think it is), it won't be 
true once this new mechanism is added.

However, I did change my mind about one thing.  It would be a good idea 
for a control endpoint's queue to stop when a transaction error (not a 
stall) occurs, until usb_endpoint_reset() is called.  Or maybe 
usb_restart_endpoint(), a new callback that I will add.  (It's needed 
for HCDs that stop the queue when there's a short packet and 
URB_SHORT_NOT_OK is set; in this situation the endpoint doesn't need to 
be reset, because the host side is still in sync with the device side.  
The queue merely has to be restarted.)

This will allow the core's centralized backoff-and-retry approach to 
prevent ep0 resubmissions and failures from getting into a tight loop 
when a device disconnects.

> > > Currently, by the time the URB is given back, its endpoint is
> > > already in a "stopped but runnable" state and its sequence state is
> > > zeroed. And it may have already been restarted if there are more
> > > pending URBs.  
> > 
> > Ah, I was going to ask about that.  This will be different from the
> > way bulk and interrupt endpoints will behave, but I think it is
> > acceptable. Control endpoints aren't used for anything that requires
> > high throughput; if a driver wants an error to prevent later
> > transfers from starting right away then it can simply avoid
> > submitting those later transfers until the earlier ones have
> > completed.

So this would have to be changed.  It will be okay for the control 
endpoint to be in a "stopped but runnable" state, but not okay for it to 
be restarted.  Not until the core explicitly restarts it.

> Or it could unlink if the async giveback race is fixed with a new
> callback separate from endpoint_reset(), but IDK if any demand exists.
> 
> Same thing with "chain unlinking" - unlink one URB and expect others
> not to execute so that unlink completion can unlink them later. Looks
> odd, but it's guaranteed by kerneldocs. And currently broken.

I'm not sure what async giveback race you're talking about.  In any 
case, the proper way to unlink a sequence of URBs is in reverse order of 
submission.  That way there is no possibility for the HCD to skip some 
URBs and then execute the later ones before they can be unlinked.  This 
is how usb_flush_endpoint() will work.

And I intend to change the kerneldoc.

> > > > Recovery from a transaction error on a bulk or interrupt endpoint 
> > > > involves sending a Clear-Halt request to the device.  But if the
> > > > error was caused by some sort of transient interference that
> > > > hasn't ended yet, the Clear-Halt might itself fail with the same
> > > > error. To handle this, we should retry the Clear-Halt at
> > > > increasing time intervals. At what point should the core give up?
> > > 
> > > Good question, I don't know. One thing I noticed is that Windows
> > > does tend to lose patience with completely unresponsive devices and
> > > kicks them out, but I don't know the exact criteria.  
> > 
> > Two reasonable possibilities are 250 ms (because that's about how
> > long an intermediate hub might take to notify the core about a
> > disconnect) or 5 seconds (the normal timeout for control transfers).
> > Of course, 5 seconds is an awfully long time to wait for a mouse or
> > keyboard to recover, so maybe something in between would be best.
> 
> What happens after giving up? If control requests don't work, most
> likely nothing works anyway. Reset may work, or not if it's bad cable.

As I see it, there are two possibilities: (1) Try doing a reset.  (2) Do 
nothing at all, leaving the device in a non-working state until the user 
unplugs it.

Remember that the vast majority of transaction errors that will occur 
will be the result of a device being unplugged while it is in use.  What 
we do in this case doesn't matter much.

> Retrying too long may cause class drivers to time out on pending URBs,
> not sure if it matters. Drivers may have no way to distinguish this
> from any other timeout, not sure if this matters either.

I suspect it doesn't.

> > I will set things up so that an extraneous clear-halt (such as one 
> > submitted by the driver) will prevent the core from doing its own.
> > This leaves the possibility of the core clearing the halt and
> > restarting the endpoint and then the driver doing it again, while the
> > endpoint is running and the queue is nonempty.  Hopefully drivers
> > avoid doing this.
> 
> Yes, that's just dodgy, what would such driver even expect to happen?
> An URB may be in progress and then what? On xHCI we would need to throw
> out this URB, so it simply isn't supported.
> 
> > But if it helps, I could print a warning if usb_clear_halt() is
> > called for an endpoint that isn't stopped and has a nonempty queue.
> 
> Not sure what core considers a "stopped" endpoint. FYI, xhci-hcd
> logs dev_err() when reset is attempted while URBs are running.

Similar things can be done in the other HCDs.  Good enough.

> > > A related issue is clearing TT buffers. AFAIK this has no retries,
> > > it fails silently and leaves the endpoint potentially broken, and
> > > it is waited for to complete in case of usb_set_interface().  
> > 
> > Is there anything we can do besides calling usb_clear_halt() and 
> > usb_reset_endpoint()?  If not, and data loss is unavoidable, then so
> > be it.
> 
> If this "clear-halt by usbcore" materializes and survives confrotation
> with the real world, it could make sense to look into combining TT
> clearing with it. It's a similar thing, but tracked separately now.

That hadn't occurred to me, but sure.

> One thing that could reduce data loss is never giving up on those
> control requests, or resetting/disconnecting the device if giving up.
> It's a general problem that control requests can fail and nobody has
> much idea what to do then. Some drivers ignore errors. If the device
> returns to operation, it may end up running in an unknown state.
> 
> This is apparently rare enough that nobody complains, though on
> low- and full-speed it's relatively easy to produce artificially with
> a particularly defective cable.

Yes.  It seems that there isn't much the kernel can do; user 
intervention will be needed.

And come to think of it, usb_reset_and_verify_device() does a logical 
disconnect if the reset fails.  So if (1) above doesn't work, there's 
nothing left to do.  In any case, we can settle this issue later on.

Alan Stern


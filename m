Return-Path: <linux-usb+bounces-35091-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBeWEQBYu2m5iwIAu9opvQ
	(envelope-from <linux-usb+bounces-35091-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 02:57:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C72B2C4A42
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 02:57:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE40B3029257
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 01:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4DB9E54B;
	Thu, 19 Mar 2026 01:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="euoHWrNz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5023876A9
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 01:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773885395; cv=none; b=uU6+8M48ZFEN/GHhp1daLuV3pJpI/CDPG4eMzywkmUmlm2wZU7uxJt4DPnFyv46Bt0LtlE5azwvDT5ovr7rB+ylmMx5GUUgh0C/tEmoJ2xK7YnqPKDUamUiozcZAkOlSt4YjpMOWGHfNnNCzxGM7v1/FjpR9ETKG5/KawnMOgy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773885395; c=relaxed/simple;
	bh=Mnt9Sg80+993vnw69vZRFSo+25KQDKSKbxTTUnaSSmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YH6Qmh7L31BtHVNDwTd5KrC46CCd1/apFHa9CI2RMm0yLMLBfle+kozfw8mx517fXod4oPPxz9Uv7sTZq3c8ItxC63VkdNwETPI1I+RwCq1R3H/v6j4KJQXRvIAsOndMWfzY9p1MNXWxEJwZ1kOp1uV4TqfjfSzno3z5mjJObPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=euoHWrNz; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-509061dab77so4308721cf.2
        for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 18:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773885391; x=1774490191; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=znYbT9ZXt6G+DpGhjFG27tahWUoYy4cTHoJeNLSTysQ=;
        b=euoHWrNz+sd5g2QFK82v8YJfms7a/YNxfS/FrkpGRCvO9xl1aTWldqpwv2Hq2Dj1pC
         V8mDm/6j0gzHJhypBoMWxwCKUSj09iOQsDHfpNFMf84K3KYv0/+IE+JYTtnCmgKVYUKI
         PBabGyPYwGiuIhuR5csXlNCdvrQQglOFIFrwsUkxx1nWNJkJCo9lF1A5aEX4kDwzW46F
         XrnDpQ3tN7595JaO8iKZ8OmeuyURqi+s3BzmS9CugWPc9WNwufOc88zKgBZHCw6uSWhH
         9Wf0zbnvTbpOjYxQbkgJQGkNBKUx1g23qDDw025YBBhMEbroJmzafTvQdXPzJ6OrCXne
         BpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773885391; x=1774490191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=znYbT9ZXt6G+DpGhjFG27tahWUoYy4cTHoJeNLSTysQ=;
        b=TCbrJ8dQVOS4bmVX77Q3khr7u//K1Z6sziswWPZX8acbK6Yd96S+Trk4JXVCi8XTL/
         4VRAUDZw2b6Cspo4emBypfwaWh6PlKbA7mQUL9BCyulnObFvVYGDiyIQBO8ni3FkVfVV
         fBkfJ7lcSd0mAFeLiK2HVBm805LWEAERuNBbkkRNc2CoVTJu4szFomgqiIThZz0y8ikM
         qy8+I7wbmwLjrnmQ50dhRm4fWKZ4/y0dwnPDCzD2j6Im7ssJLfvtSS1IZqGeilPHn8IB
         Do+Xz4VWjuGRyIem4kKrmkreOAqcsw9UXwTCErg+GRpYLvMlhdGf7JNRpFKif+xg1qav
         LQWw==
X-Forwarded-Encrypted: i=1; AJvYcCXbJfhkcvxFbKbjwlr1BSKpjOucUQIkB1E0JOezL5/l5FOScgaj6gNTfHHDByUCeZKxTE6tC0NwfV8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh0KO09M1NLtxBdCBv5RINbgJZPkiyPNGcHSC+gHMI2mwiKgKI
	vUxX5bnUiLFUFxWbNe2FUGPjkMcl7UryYh+nL29OqB1i0KmLDzB4lxnu4lqqO6SXWETdQSv5Yh6
	pVCk=
X-Gm-Gg: ATEYQzwsZXdRHFxFZ6nnfPYSfumM066FphiC1au01UqIY+slmc1NLj4FSCJtHVm2Mpd
	o5xoLW4mL5XTgI5nZIsqHDRub1KF5CJ+bkaIJS2rNUO+8xry/uUhCVeD1/nQyYslCC2jn2QjM9m
	c3UcsPPWteFi/K2GMinCYvqPQMUfefqnKGnNv2b1youzOmz5gsMmG3zIuQh+rB7C6KpwuR6cFB0
	lLMFZuSztpok6pe+lEFOLGLATQjy/aJSovRvugSMX4ugZ6EWgCipiN/1OqT9AZ5DxcVDJ7cSWQZ
	XuF+PII7l6AcJs3FRRmOakAMu29zJPf2CuW9wM2FxKWUTEVjvDTmIToGZAfMOzMOwtMkbeU2rvO
	P9FW0NIcURb/DxYaanEWDhiXuIVTgZ9GwfOE/+lK1ExUNoRlGJXY/l9QDabQGDUgD2VG8BtveB7
	4pZd57t7bHWGZbd1na5IkwpxCk
X-Received: by 2002:a05:622a:120e:b0:509:1cf9:ea0f with SMTP id d75a77b69052e-50b148fc2e0mr75502901cf.65.1773885391214;
        Wed, 18 Mar 2026 18:56:31 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b134ac6cdsm34248841cf.9.2026.03.18.18.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 18:56:30 -0700 (PDT)
Date: Wed, 18 Mar 2026 21:56:27 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Oliver Neukum <oneukum@suse.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	USB list <linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Message-ID: <4a35e3dc-620a-4596-9bf3-783865f29e8f@rowland.harvard.edu>
References: <437037d6-3fe1-4f81-b74a-21bea00725e0@rowland.harvard.edu>
 <0b45d0e4-53f8-4960-b41c-63639b496dac@suse.com>
 <4f8b9942-307b-4c31-86f3-1b7b20b34a16@rowland.harvard.edu>
 <d1674f98-cbbf-4a16-8c76-996a0494d931@suse.com>
 <abcd2076-c2d4-403d-8ab8-af747b335075@rowland.harvard.edu>
 <87a692e2-559a-4765-8321-a422751d3589@suse.com>
 <4ada5d68-56f1-41b7-82d9-463901c927db@rowland.harvard.edu>
 <8a14fe29-0d92-4ce5-a7e2-2c084c710727@suse.com>
 <b0217cdc-f263-418c-b8b5-584520d0b1db@rowland.harvard.edu>
 <20260318223851.1f6d07d7.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318223851.1f6d07d7.michal.pecio@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35091-lists,linux-usb=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9C72B2C4A42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 10:38:51PM +0100, Michal Pecio wrote:
> On Wed, 18 Mar 2026 13:46:26 -0400, Alan Stern wrote:
> > On Wed, Mar 18, 2026 at 10:54:20AM +0100, Oliver Neukum wrote:
> > > On 17.03.26 19:03, Alan Stern wrote:
> > > > You know, with a USB-2 host controller, transaction errors don't
> > > > make an endpoint unusable, and clear-halt isn't necessary.
> 
> Depends on what you mean by "usable". If you get EPROTO reading from
> a Transaction Translator and the TT discards the packet (because of
> timeout on Int or by explicit SW request on Bulk) then not only is the
> particular packet lost because the device got its ACK and moved on, but
> I suspect the next packet will be dropped too due to toggle mismatch.

(Is it the TT that keeps track of the toggle state, or the host 
controller?  I don't remember and I'm too lazy to look up the answer.)

By "unusable", I meant that no more data could be transmitted through 
that endpoint until some sort of recovery action had been carried out 
(such as clear-halt, set-config, or device reset).

Yes, data loss is sometimes inevitable, and we shouldn't worry too much 
about things we can't prevent.

> Granted, EPROTO outside of disconnections is apparently rare enough
> that a horde of users demanging this to be fixed hasn't materialized.

The major example showed up just a few weeks ago.  It was an old system 
where some component (the PCI bus?) apparently could become saturated at 
high load, leading to communication failures because the host controller 
couldn't access the data needed to keep up with its scheduled work.

> I found simple ways to produce recoverable EPROTO at low/full speed,
> but no such luck with higher speeds so far. It would be helpful.
> 
> > > > I wonder if xhci-hcd couldn't be adjusted to behave the same way
> > > > (issuing its own clear-halt internally, if that is needed). That
> > > > would make things simpler.
> > > 
> > > It could be. But do you want a HCD to generate requests to endpoint
> > > 0 on its own without coordination with usbcore or drivers bound to
> > > interfaces of the device?
> 
> I believe the intent is to maintain the illusion that drivers can just
> resubmit the failed URB and have that become a proper retry.
> 
> It likely could be done, but it's still not the same thing as old HCDs
> are doing because it opens the possibility of double delivery, while
> closing the possibility of further packet loss speculated about above.
> 
> Question is if this illusion is worth fighting for, when
> 1. it hasn't been 100% reliable since at least USB 2.0 and TTs
> 2. USB-IF keeps creating problems for software trying to be like that
> 3. xhci-hcd has been this mess for 15 years without loud complaints
> 
> What should an HCD do if such request fails? Just refuse URBs?

Do nothing.  Log an error message, continue on, and hope for best,

I'm not sure what sort of transfers will really want to go through the 
retry procedure.  With usbhid, we're talking about a stream of interrupt 
URBs.  If some data gets lost it's not a good thing, but the user can 
probably handle it -- provided the data stream manages to pick up more 
or less where it left off (and the shorter the recovery delay, the 
better).

For other types of transfers (i.e., not data streams), I do not have a 
clear idea of what requirements drivers will have.

> > Michal should be the person to answer these questions.  I guess that
> > a clear-halt is necessary for synchronizing an xHCI host controller
> > with the device's endpoint after an error, but I don't really know.
> > Maybe it's necessary only for USB-3 devices?
> 
> Strictly, it's the opposite - synchronize the device with the host
> having already zeroed its toggle or SuperSpeed sequence number.
> 
> Such toggle mismatch at USB2 speeds results in loss of next packet.

Just to be clear, are you saying there's no way for an xHC to restart a 
(host-side) halted non-SuperSpeed endpoint without setting the toggle 
back to 0?

> AFAIU, SuperSpeed sequence mismatch is covered by USB3 8.11, which says
> "discard with no response", so maybe we would keep getting EPROTO due
> to timeouts while wrong number is being retried, but not sure.
> 
> Resetting host sequence state is not mandatory, but the alternative is
> intended for retrying the same URB, not another identical one. That
> would be an edge case possibly exercised by no SW other than Linux.

It does seem like the USB-IF has not given much thought to this problem.

Alan Stern


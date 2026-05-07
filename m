Return-Path: <linux-usb+bounces-37109-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8I2XCCcK/WmdWwAAu9opvQ
	(envelope-from <linux-usb+bounces-37109-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 23:54:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 762354EF7FC
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 23:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2038303A13E
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 21:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF6D34A794;
	Thu,  7 May 2026 21:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIB4AaHK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511792F8EBD
	for <linux-usb@vger.kernel.org>; Thu,  7 May 2026 21:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778190880; cv=none; b=HICL3fk1nYG0mDoeMpvabva0TsbofL38P5GBVSoNyUun87unAqCr6+cx0ups8mwbSGHvGHjJ1Y2iao8opn8fJjzX5/2tsUQtA6IrW/7i018qtR2lFEPfO/n9MCPHxcZTnZRfeY8XcLBC7U5/GgXZYcoGU1h8eJYTEDS1DK1HRoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778190880; c=relaxed/simple;
	bh=jK61mHBn7S+AWqFrMG32HuSdTyw0gMLsKFNAoT5mEqk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rsuJFwkFpq46x0X2g6PkgOrdfRibI/bi1v1i1g5pdZm0f3GrhJFmkYppTZURiLACD+HNIpCDaJU0lneYOYB/T9i8PHcJdfK46vieBMhKeUUegV/E/sg7lMOwz+xt5Fzrz8GlvBNyY9AnKqjnD3yBlsdzXuCFzYnrEfeQJGIZlCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIB4AaHK; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so990988f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2026 14:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778190878; x=1778795678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jK61mHBn7S+AWqFrMG32HuSdTyw0gMLsKFNAoT5mEqk=;
        b=jIB4AaHK+vX0a1Wy2jl85QD6cK9QIPXQwZ/FAqyrD2M4zvoi6hLrh3upqbEYmf8ejB
         cVIBBv+lj6Wuogw6+sgl7sIXfc6kawdTYfZeYFQPalMZPHGFNcuxQ1OaaL0A/VRkLmi/
         uwG+jwlTKdnkqNQZs0n5nemU92T3zVzIuVkn/7/G0Qd4VEMEiPBUv6l1dQZPdoBvcvYr
         HlyIuYAOMPJImaGExyK+w7u3C/X4UDwMqQDE5iYk9y2YMSqSg9SK0dOp7datB2s0M09G
         ggFab+kuFXl4HO9rmDRJicVsAo0bPEf+f1/ZuVYxRTtGniW7DUPmJvWVtsNb+5ftmWWR
         Zr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778190878; x=1778795678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jK61mHBn7S+AWqFrMG32HuSdTyw0gMLsKFNAoT5mEqk=;
        b=Ht7cm0FXTjXEOPdFCV122gmkEdxt2hE0dlC+6ocvc9zKuID38T9gGcGrvNjXoTUZOP
         xnE4pto1xMfSp34vBmx4cSxXVusa6EDYhrIa5wGsJzRNvpwtRiTueqxaJeZ+zhOXcAV+
         zdG6qaQm7H6jdxkJJRev5/EYQex3CS6DXD0iLGz4CJEbJdPaoCUkWOEEO5HV4V8iz0WQ
         f8lTWR9MlZbMoNBBkF/R0TpwwWYhNbsd7R7fWVU7kAJ/AB+6lY50Od0utvRLY38wmuBE
         JhcSi9Vt6VF5ucFlnRisxxe646Xoy3SXXXRYEMXCTLmc5pSWXBEgqrsSQnM/CK5xVW4p
         ChUQ==
X-Forwarded-Encrypted: i=1; AFNElJ8BBMPFSkPLt/lH1XgnuHPq2Xr7jk9+jeUAF5EPzDkeU1V4QTck1hiKoiQp7VsGtyO78jFvDWjbqew=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWQQFsXs1LohQYKuZ5LP1mb06t8U1RwSk8UXu0M4D36xnbobZ/
	Lg6nQlhLs1z+O0VBwxgyZYHAI/SNy+5f59DmLzXGO+Xht0ditq3igQLhX6Mqzw==
X-Gm-Gg: Acq92OGGEtLCCXfRlCw4GU+/bmQ8XW+6AN4iZtUx75MOSFa8tdhOtTR1yleQnw9wP3T
	ORmNfX66MseXFq28PcifZ6kPltzAuVdZxXTMTlv0syYBWIV5ugEgwp47/zthwExJ9SVtAE0BR1D
	RH7i5BjRg20AVKGbWDvr22yF9q0DKoHW5NC9yaSL7ol+PBPCFttmJvcSKvMtEt8iyHpa8pX32ha
	cqSjy36nPVKQFubjs6rjlhnQrb3WGXN59bUSEQgSdrbDJTxy8xXZHjqsfTIuCHCXH8FpxgCBZIk
	76NpFtq1XTIzT8FuDTMhBM4MZMyF+LRMgmv8iHRKlhb2tojxwN5CwU1aVXwe5RJn0RwnyALlUfo
	+0NDgRWULEjadbDOHKoDlsqaHihW0jlFRpSOaIP8is669lHOkDyI+odw+qvBJlEQsyyP6SGV5Nt
	Fxpip9TlPxPw7WDncOdcXDiFC5QX6/1Tsxkrk=
X-Received: by 2002:a05:6000:3107:b0:439:ccd7:cdb6 with SMTP id ffacd0b85a97d-4515b5242c7mr15428693f8f.14.1778190877273;
        Thu, 07 May 2026 14:54:37 -0700 (PDT)
Received: from foxbook (bgt227.neoplus.adsl.tpnet.pl. [83.28.83.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454128207cfsm2340747f8f.1.2026.05.07.14.54.36
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 07 May 2026 14:54:36 -0700 (PDT)
Date: Thu, 7 May 2026 23:54:32 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Dylan Robinson <dylan_robinson@motu.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
 mathias.nyman@intel.com
Subject: Re: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame
 and always assumes URB_ISO_ASAP is set
Message-ID: <20260507235432.71d28151.michal.pecio@gmail.com>
In-Reply-To: <CA+Df+jdtQrYye85d7uZyT3jirsztKhf7qQes3LvOAPa+9qxSOw@mail.gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 762354EF7FC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37109-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, 7 May 2026 12:17:00 -0400, Dylan Robinson wrote:
> On Wed, May 6, 2026 at 10:39=E2=80=AFPM Alan Stern wrote:
> > For one thing, that would be very impractical, as every driver using
> > isochronous transfers would then have to be modified. =20
>=20
> Maybe adding a new flag would make more sense then.

It would surely need to be optional on per-URB basis, to avoid updating
all drivers and to enable sub-1ms URBs without gaps on HW like xHCI,
where we can't request starting frame with microframe granularity.

I suppose Windows/OSX have to be doing it this way too?

> I was confused because the documentation regarding URB_ISO_ASAP
> describes this behavior.
>=20
> - For ISO there are two startup behaviors: Specified start_frame or ASAP.
> - For ASAP set ``URB_ISO_ASAP`` in transfer_flags.
>=20
> However, it looks like URB_ISO_ASAP actually means something
> different: that the URB can be delayed. Is that correct?

Yes, there are many errors in Documentation/driver-api/usb. I thought
about fixing this when the bug was opened, but maybe it's better to
wait till the dust settles around xhci-hcd.

Alan pointed out that kerneldocs are more up to date, but there is
still a crucial error there: on ehci-hcd, an URB submitted too late
completes with -EXDEV instead of the submission failing with -EXDEV.
And it seems we should strive for the same in xhci-hcd, instead of
silently rescheduling such URBs to run later.

> For an ongoing stream I would expect that submitting a start_frame
> that is discontinuous and in the past would result in either a
> submission failure or immediate completion with an error status. Such
> an error would provide useful feedback to the driver because its
> occurrence would mean the stream is no longer synchronized as the
> driver expects.

The idea is that in absence of bugs (which xhci-hcd has plenty), the
stream is always synchronized as long as all URBs are completing
successfully and resubmitting before returning from their complete()
callback. Drivers don't need to "start_frame++" for this to work.

If an IRQ delay causes resubmission to be late, some or all "frames"
of the URB will complete with EXDEV.

Also, I believe such completion should occur in submission order, i.e.
only after all URBs submitted earlier have completed in some manner.

> If the driver requests a specific start frame, it should be the
> driver's responsibility to ensure it is a valid frame within the valid
> scheduling window. If the requested start frame is invalid or outside
> the host controller driver's valid scheduling window, the request
> should fail. This would be more helpful than silently fixing it upon
> submission.

There would need to be some convention how to deal with bInterval > 1.
Such endpoint doesn't use every (micro)frame and can't be scheduled
into any arbitrary one.

In such cases, xHCI spec only permits the first frame of every ESIT to
be specified, but the actual transfer will take place anywhere within
the ESIT, and we don't know when. See 4.11.2.5.

Drivers would need to be aware of such low level details.

> Currently, with non-CFC host controllers, there is no way to determine
> which frame a transfer occurs in. This is because without CFC, the
> start_frame returned in the URB is only approximate.

That's partly a bug.

Filling start_frame is only implemented for CFC HCs. On non-CFC we
could still set start_frame accurately on the first URB and later
increment it blindly. What we cannot do is ensure that the HW will
stay in sync after Missed Service. All bets are off after EXDEV.

On non-CFC we would also be forced to ignore any driver-specified
start_frame except at the beginning of a new stream.

> Currently, there is no straightforward way to inform the xhci driver
> whether a URB represents a stream start or continuation. This makes it
> difficult to detect missed service intervals or other scheduling
> discontinuities.

It's supposed to be implied that submission from a complete() callback
is a continuation. I believe one of the submitted patches fixes that.

Regards,
Michal


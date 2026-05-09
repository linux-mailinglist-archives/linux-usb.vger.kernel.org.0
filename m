Return-Path: <linux-usb+bounces-37181-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Vr0+Jh0W/2mr2AAAu9opvQ
	(envelope-from <linux-usb+bounces-37181-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 09 May 2026 13:10:21 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBDE4FF73B
	for <lists+linux-usb@lfdr.de>; Sat, 09 May 2026 13:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECE8E300F5F3
	for <lists+linux-usb@lfdr.de>; Sat,  9 May 2026 11:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17DBF35CBD6;
	Sat,  9 May 2026 11:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fC9nC6QO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD7B229B38
	for <linux-usb@vger.kernel.org>; Sat,  9 May 2026 11:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778325016; cv=none; b=LWb4ozg51gCC1csSogrUDGekUww2goOfHkM1SGS7C3TgNlTZYyzilUJe/rPgaEtpFrd4eb2mbysfDK6cLTzTDWIL/TOcVQIV2T9y+UJBtBpFl2MfFVw3FJ47hvWAf/QVxHYblzjjDDPx5XJpqqRWv1UsGxeF/TvEZQL5Obq+P0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778325016; c=relaxed/simple;
	bh=wsF0OspPiJMWbdWCJSFbR3inI9ojHIfmvCt2AGdOZ0U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V/DFuARMaAhHnQ+aXia7gfqzCk1tMHXNmjNyY2tj5xVBYIWxr5vul7gy4q+rya4k4jW/oMm3FKZozjpDWmyAH4QHtEFRTT73SCrvPVJ6QgLtGvT3VniJKOjFDxs3OihJWpSXLhitGA4qf5Vj4Z5FAb3qf8p5yHdTzB7n4kI8dsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fC9nC6QO; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a8704dc3a8so2854883e87.3
        for <linux-usb@vger.kernel.org>; Sat, 09 May 2026 04:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778325013; x=1778929813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pk16o4hJSfjjDxrgsEThR5b0ZSeUh14qacwpphIbVl8=;
        b=fC9nC6QOX/k1K+bv8BijMfuZS+QL2iUuQAsyeW2HPTx6q09Kf9U8FPMI28Gbb55Rml
         iF1qt25t4n2sfBi0s6PIxCdB1TnVTHVw4HWUurB1nfth7b6TH4eE6wYE81UQtezsj19d
         XauV0BGy0sIDenRkEQ1IS3FzrOxdlFmIU4XUW+EDB4XrsfKv1QgLWt4Krpi3Zoy234AU
         p6qo4yk1qDYKyT+QPBNN0sq5a2787oszSbnPJ3oVXSes5sVJUWD7eapTFXXEZ2anqJyK
         qzBjIxcmg3bjqqUX/cfi18UMj9+lLMMFiGdBpRtTc1x/8sfkUG2hGDPJ03NP/eIz50aN
         7OOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778325013; x=1778929813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pk16o4hJSfjjDxrgsEThR5b0ZSeUh14qacwpphIbVl8=;
        b=G/oAGPcFdAVBNSwroK01kzKWajRrYu0BRe5097uSAOQdW/GvMYVR5d/fmBLxdNxmXC
         xbZG2wF3sah0tyeyqJNnO1qUrBFR9W2q/+RXTn8AnWbjCrnZsXsUzl7194Ok+gwNQpPz
         tUY7Ak2YX7UWF70A3yKPGvEBZs+OHRt/aZkfUhW+eB1a427rsGz74DYtLyDbLsPoC+OU
         1gb6ujcr+wOuUepy8UwJ5TXLtH9m1UkJ3fn8bpVvbxKZUVe//y6bE2nHLoTbRa85XZUn
         44nLyx0MfhSQrq659qo7cDhUzKEA3StC1OnA67d6FMwcxpOchonL4W0KxsrgzV0eubne
         8kgA==
X-Forwarded-Encrypted: i=1; AFNElJ/MnuTL80bOQ6RqgMt4j2Mzbp3cZwvY/uEN4UAuALmJHNheF+2dFepqD8E2kiy0IIKxtCWGzUlTnOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFzzf9hxeRrw5prl9dHHsBr6hkLU1kDhSabyPpB9DR35e8Lakl
	XlRgTCcTb8qvWapkEaOYjQ+LXv7cn2Olb72OQHIkc3FKyKR5tjcqQiMrv6DNYQ==
X-Gm-Gg: Acq92OGf6meqkolp82THBvEmP0SM6/QVRWOQQ2Nt9fOXNCXkkXPy7/LbgBPCYLxEHNn
	t1u+mL6W1ixnWWqpFNFYTI8wqycXSCIKmigO4fphEPlRk4p/9s7V4iKpftlFbr0l6isDfsOyzbN
	ZGq6KF0TB4FKXO3LZcc1UkqVFKBcNqllw88COCo/y1uppvH66ry7uji0uc2lQvtojTD4DkLGira
	XoD7Hc+dph+HKw2ivPokYm1e6qmtGkjQMciyBq69DNlBtVdvbfl3tyKvx1vEVvFH0Ah3ii164Eh
	JA3L+PUNgoXDMQ3Pqu5ZkPU7dcW6rATAmZIT5x7g8dXMV3uDPpwSHGFqZ7TIcSWy0EaUdk+l2VH
	ucGUcvMQPu6lusQTlySrD7I+8ofxzDmAQeReq/q7hUJrPcojgST49B4s4MhsUuJsXO/u0GKe3eg
	eVVb9HPu580poDb3IayGOB7B8eQmOt98om2C8=
X-Received: by 2002:ac2:53b7:0:b0:5a8:87fc:2b34 with SMTP id 2adb3069b0e04-5a887fc2bb8mr4050488e87.32.1778325012490;
        Sat, 09 May 2026 04:10:12 -0700 (PDT)
Received: from foxbook (bgt227.neoplus.adsl.tpnet.pl. [83.28.83.227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956bd58sm1211896e87.84.2026.05.09.04.10.09
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 09 May 2026 04:10:11 -0700 (PDT)
Date: Sat, 9 May 2026 13:10:04 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Dylan Robinson <dylan_robinson@motu.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
 mathias.nyman@intel.com
Subject: Re: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame
 and always assumes URB_ISO_ASAP is set
Message-ID: <20260509131004.61ce52b9.michal.pecio@gmail.com>
In-Reply-To: <CA+Df+jfkQ1QXyh=oQrX2y2x8N2=ZRFWFai5QHiZ2FC-hQqEsmQ@mail.gmail.com>
References: <bug-220748-208809@https.bugzilla.kernel.org/>
	<bug-220748-208809-eL7PrzeMxr@https.bugzilla.kernel.org/>
	<fe08eabc-4f92-43fd-89d7-5e9d0e35c979@rowland.harvard.edu>
	<CA+Df+jdtQrYye85d7uZyT3jirsztKhf7qQes3LvOAPa+9qxSOw@mail.gmail.com>
	<20260507235432.71d28151.michal.pecio@gmail.com>
	<CA+Df+jfkQ1QXyh=oQrX2y2x8N2=ZRFWFai5QHiZ2FC-hQqEsmQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 0CBDE4FF73B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37181-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, 8 May 2026 17:39:20 -0400, Dylan Robinson wrote:
> On Thu, May 7, 2026 at 5:54=E2=80=AFPM Michal Pecio wrote:
> > It would surely need to be optional on per-URB basis, to avoid
> > updating all drivers and to enable sub-1ms URBs without gaps on HW
> > like xHCI, where we can't request starting frame with microframe
> > granularity.
> >
> > I suppose Windows/OSX have to be doing it this way too? =20
>=20
> Windows isochronous transfers behave similarly to the outdated
> documentation in Documentation/driver-api/usb.
>=20
> Setting USBD_START_ISO_TRANSFER_ASAP in the URB instructs the USB
> driver stack to schedule the transfer in the next appropriate frame.
> For the first URB on a pipe, transfers with this flag are scheduled as
> soon as possible. For subsequent URBs, the stack automatically tracks
> stream continuity.
>=20
> Otherwise, the UrbIsochronousTransfer.StartFrame member specifies the
> starting USB frame number for the transfer.
>=20
> Source:
> https://learn.microsoft.com/en-us/windows-hardware/drivers/usbcon/transfe=
r-data-to-isochronous-endpoints

Looks like Windows ASAP is similar to Linux non-ASAP behavior, except
that they consider new URBs to continue the stream for 1024 USB frames
after the last completed URB. In Linux that number is 0 instead, as
there is no way to indicate a new stream by other means.

Windows requires isoc URBs to be frame-aligned. Linux doesn't have this
limitation. I can run a high-speed UAC dongle with two 0.5ms URBs just
fine, though ALSA won't let me go shorter for some reason.=20

> The USBDriverKit API on macOS for submitting isochronous transfers is:
>=20
> virtual kern_return_t IsochIO(
>     IOMemoryDescriptor *dataBuffer,
>     IOMemoryDescriptor *frameList,
>     uint64_t firstFrameNumber,
>     OSAction *completion);
>=20
> firstFrameNumber: The starting frame number for the request. You can
> get the current frame number from the GetFrameNumber method of
> IOUSBHostDevice or IOUSBHostInterface. Specify 0 to begin the transfer
> on the next available frame (XHCI only).
>=20
> Source:
> https://developer.apple.com/documentation/usbdriverkit/iousbhostpipe/isoc=
hio

Not sure how Apple and MS deal with the "phase" issue, i.e. does a
bInterval=3D6 endpoint run in frames 0,4,8,... or 3,7,11,... and how
are drivers supposed to set firstFrameNumber then.

Looking at the MS article, I suspect they want drivers to pretend it's
always 0,4,8, which is what the xHCI spec requires too.

> > It's supposed to be implied that submission from a complete()
> > callback is a continuation. I believe one of the submitted patches
> > fixes that. =20
>=20
> Because our devices use the implicit feedback synchronization model,
> our drivers typically submit OUT transfers from the IN pipe's
> completion callbacks. Would those submissions also be considered
> continuations of the existing OUT stream, or is continuity only
> inferred when a URB is submitted from the completion handler
> associated with the same pipe?

I meant completion at the same endpoint because it's a common case,
but submission while any URBs are pending and not completed yet also
is supposed to continues the stream, regardless of who submits.

Or at least that's the intent stated by Alan and what it was before
"BH giveback". I think today there is a short window after completion
by HW and before complete() runs, where even ehci-hcd may fail to
detect that the last remaining URB is still "in flight". In this case
it's likely too late to avoid a gap on OUT, but the gap should produce
EXDEV completions rather than delay the next URB by a few uframes.

Perhaps this should be fixed for all HCDs. The alternative is to ask
drivers to make the IN completion give the OUT completion any required
information to resubmit, which increases latency and chance of EXDEV,
or they risk potential hard to detect gaps due to SW latency. (The gaps
could be detected by looking at frame_desc->start_frame, at least when
xhci-hcd is fixed to fill it properly on non-CFC chips).

Regards,
Michal


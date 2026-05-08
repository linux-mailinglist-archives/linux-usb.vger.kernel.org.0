Return-Path: <linux-usb+bounces-37147-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MK/vHOYV/mkTmwAAu9opvQ
	(envelope-from <linux-usb+bounces-37147-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 18:57:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5784F9A2B
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 18:57:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABB1F30677AB
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2026 16:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62CF240DFC4;
	Fri,  8 May 2026 16:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kw5FAJxx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540A840F8CC
	for <linux-usb@vger.kernel.org>; Fri,  8 May 2026 16:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778259385; cv=none; b=tw7OCr0MLdvUj4bvV6y1WwDlrNBoveFIZK/4KWiUm/xA8Gj5k4iBtXfDjRT7OBW9CnhthaC4poNppEzqPYnf0QsxK3N1tuJEjhFwxlCMPw4Jt73YApFJkQGH7Q8vjLD/oHYUaceURQAczNnMcYxh0LAUkYx8L0S/TXQJbmHnLzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778259385; c=relaxed/simple;
	bh=xAPysj9jqBxnNH9ah7LQXapnO4WlMNmkFCZEkS3PQ8g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lgJMhSgO2204o6pA/UnwsB5Va5WSyIfWPttIZhvpx0yQ3F/4rXeNParKd4Jzhq5z3HtCmYhgtw0usJtnh8n+LkEe46UtYQEtG3NIipNonM+4HcW/vIp2nb8o1Ck8LySAR6vHZm95naTMuzbIzdCKCmlhFU+CwpIXNTrvCEuf9To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kw5FAJxx; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so1826198f8f.0
        for <linux-usb@vger.kernel.org>; Fri, 08 May 2026 09:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778259382; x=1778864182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNzAhALF+27Ww+LeezAsS+tgg1krlWNQ1vu17boWQ+w=;
        b=kw5FAJxxTrc/ZN+oumytsllYqCuKDzp0cr7/74A5hSIjqne1WPpfUFJ7/CQbX35Shs
         w9s1La+dtB5pjlmGAFS+LCpbtRjoq26Ku3yhHWii1dzIl7DDNwzZFa714B6lpUr81ebU
         O3tp4Gk2iPjJVn3OCYsBXoS4aB09+X/vG9+Vt6dgInzskQZ3Fm+5VJc5uCWLBiyILO0u
         /l+wPDMBcDAKGnKvuAgqYtqFMeWjh2gfmb4FODClPod6aqEEazJQGrPbQE3EAfgMzOKE
         7U+ZZUI6Bn6jQ6Pil+DtlttiVqtoHnGpW5lbd3Ysfs5TLNzDmPgp2wbC2WriYsQ2sE9d
         2wJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778259382; x=1778864182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PNzAhALF+27Ww+LeezAsS+tgg1krlWNQ1vu17boWQ+w=;
        b=iyilnlmCUCih2xabXGXF/gs8uTZTEtbMfIduaN1M/iieZEVGh4wn3TZSZfpF6GyvPX
         +fdQVhUImp6K04VaZ3bAl3qR/ICZ4AvmjCatAiXaT7rmCvgawdtNn9FzthfUYnaqWj91
         lyKt1PF3zMgO/Nx2sVWKb63lHN7yg6SCtgiH9q60P3+eoJM9DS89nmTCyEXipCzdNM19
         eZPlNmZeYkNx6wAWOj7OIwmtAUasXRXtGN4CKVto8wkk6ImNQYq0dG+UBL2hX3lo82AA
         dZbvTVfOFk0h1hQ7xdyau+SPGJTDCqK4c5gnGUV5xjIx/ht8N2UF6Xt8wLMgFNI+b/P5
         8eVg==
X-Forwarded-Encrypted: i=1; AFNElJ8N9fR5/MH+gl1xcD16Yw8Mhz3hxW/UVUJ71AWex5+XKnN+eGqprgxkHCoSk1tOD8UphPNW+UKravg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfrkTwhyaPl7yLknjDvSQRaEMhiqIwglqGCS7qMR9M2Jdf6AN0
	x2ymgh49E0a79gelprb0p36HQhjZbJyOaq5L8zNrKnfT/TFr4Y3CpyxP
X-Gm-Gg: Acq92OHTJT+LRgd0sfvmgjq1chS8+WXObrqAnDg/511nSh8VTEt/U04poIYwxI0dxV0
	KQfcMpSj7aXcQxq4mMXY2u+vShSSIE5d7wo4MXQPjn6htkARTBzXhpGcp63cgIXEp0Lu/az++Qt
	t5NuJDbYkNkDqS34pAfAL+winiUfHJK2SFGmzed2hXuxnAo6hbopb+QqPzZCfy7PktKsMHRmHms
	wvnQ6a4k+o7sbQ2dEnwhcqfB0xHhEU5VaiYLCL4CLDJrLJvZgxnq5Shb7ADBQigLLhC8QF3DilO
	Pt8MVf2jku8Az0QvywLKdqgrV1Ub3VfEWINd2BMrMpU5/mKPk6s/EMc/BTLSF9xFGXr7vEK72se
	OpY6X3HvgpghLjv/SNsxdP9LggKawG5BOiePWkrqgqf6qM0Svn8o+IILyIjXpx9AUbAg3KHJH9f
	xko+vGkJxbpp2ridDNlZlREMD4OfWjm5q861E=
X-Received: by 2002:a05:6000:61e:b0:43d:7e6f:3816 with SMTP id ffacd0b85a97d-4515d9a05b5mr20486633f8f.40.1778259381497;
        Fri, 08 May 2026 09:56:21 -0700 (PDT)
Received: from foxbook (bgt227.neoplus.adsl.tpnet.pl. [83.28.83.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6c221sm5430819f8f.13.2026.05.08.09.56.20
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 08 May 2026 09:56:21 -0700 (PDT)
Date: Fri, 8 May 2026 18:56:17 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Nicola Lunghi <nick83ola@gmail.com>
Cc: mathias.nyman@intel.com, niklas.neronin@linux.intel.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: xhci: fix isoc silent reschedule creating
 stream gap on CFC controllers
Message-ID: <20260508185617.6bf8a6eb.michal.pecio@gmail.com>
In-Reply-To: <20260504233143.10242-3-nick83ola@gmail.com>
References: <20260504233143.10242-2-nick83ola@gmail.com>
	<20260504233143.10242-3-nick83ola@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: BC5784F9A2B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37147-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue,  5 May 2026 01:31:43 +0200, Nicola Lunghi wrote:
> xhci_get_isoc_frame_id() silently rescheduled the first TRB to
> start_frame_id+1 when the requested start frame was out of the valid
> scheduling window or landed exactly on its boundary. This creates an
> explicit one-frame hole in the isochronous stream.
>=20
> Most USB audio devices tolerate a brief gap with a small glitch and
> recover automatically. However, some devices assume that once
> isochronous packets start streaming they flow continuously until the
> stream is explicitly stopped. Any gap causes the device firmware to
> permanently lose channel synchronization =E2=80=94 subsequent packets are
> routed to the wrong output channels until the device is reset.

That's not the only problem, we are basically violating documented
usb_submit_urb() behavior, as Alan points out in Bugzilla.
=20
> This was observed with the MOTU 1248 (USB ID 0x07fd:0x0005), where
> after a gap the 24-channel output stream shifts by a fixed number of
> channels, mapping audio intended for ch1/ch2 onto ch7/ch8 or other
> channel pairs depending on timing.
>=20
> Return -EINVAL instead so the caller falls back to TRB_SIA (Schedule
> Immediately After)

That's not what this acronym really means.

> which lets the hardware place the TRB right after the previous one
> without introducing a frame-aligned gap.

IIRC, the meaning of "Start Isoch ASAP" is like Linux URB_ISO_ASAP:
"as soon as possible *and not earlier* than possible".

To guarantee no gaps, we should use SIA=3D0 and incremental Frame IDs
on chips with CFC (without CFC it's a lost cause).

The reason using SIA=3D1 helped you is because in reality:
- the start_frame_id calculated here is pessimistic
- I found that the IST reported by HCs is usually pessimistic too

Therefore, even if this function believes that it's too late to execute
some transfer (and currently tries to reschedule it for later), the HC
may actually still execute it immediately without gaps if SIA=3D1.

But the right thing to do is SIA=3D0 and correctly specified Frame ID.
Setting SIA=3D1 opens the possibility of rescheduling for later (in HW)
when it *really* is too late. And we don't want that, we want late
submissions to result in Missed Service Error and EXDEV completion.

Note that the comment in this function is bogus too. In reality:

Software *shall* not schedule past end_frame_id.
Software *should* not schedule before start_frame_id.

The former is a requirement, the latter a recommendation. And a valid
one, if we want the URB to execute. But here, we want it to fail :)

Also, I'm not sure if ignoring submissions far into the future and
turning them into SIA=3D1 is the right action. If a driver submits an
untinterrupted stream (without URB_ISO_ASAP) going 895ms into the
future, we should probably stop this madness and error out (TBD).

> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D220748
> Assisted-by: Claude:claude-sonnet-4-6 sparse checkpatch
> Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
> ---
>  drivers/usb/host/xhci-ring.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/usb/host/xhci-ring.c
> b/drivers/usb/host/xhci-ring.c index e47e644b296e..03e47db82092 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -4030,15 +4030,21 @@ static int xhci_get_isoc_frame_id(struct
> xhci_hcd *xhci, ret =3D -EINVAL;
>  	}
> =20
> +	/*
> +	 * If the first TRB's start frame is out of the scheduling window or
> +	 * lands exactly on its boundary, fall back to SIA (Schedule Immediately
> +	 * After) rather than forcing start_frame_id+1. A forced +1 creates an
> +	 * explicit one-frame hole that audio devices with strict continuity
> +	 * requirements cannot recover from. The caller handles -EINVAL by
> +	 * leaving sia_frame_id as TRB_SIA.
> +	 */
>  	if (index =3D=3D 0) {
>  		if (ret =3D=3D -EINVAL || start_frame =3D=3D start_frame_id)
> {
> -			start_frame =3D start_frame_id + 1;
> -			if (urb->dev->speed =3D=3D USB_SPEED_LOW ||
> -					urb->dev->speed =3D=3D USB_SPEED_FULL)
> -				urb->start_frame =3D start_frame;
> -			else
> -				urb->start_frame =3D start_frame << 3;
> -			ret =3D 0;
> +			xhci_dbg(xhci, "isoc: start frame %d %s window [%d, %d], using SIA\n",
> +				 start_frame,
> +				 ret =3D=3D -EINVAL ? "behind" : "at boundary of",
> +				 start_frame_id, end_frame_id);

I'm not very fond of debug prints which can show every microframe.

Even better than a "debuggable" code is one which is right, well tested
and known to work without worries.

> +			return -EINVAL;
>  		}
>  	}
> =20
> --=20
> 2.51.0
>=20


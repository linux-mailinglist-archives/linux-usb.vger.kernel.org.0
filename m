Return-Path: <linux-usb+bounces-37188-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GjWlBJOW/2mE8AAAu9opvQ
	(envelope-from <linux-usb+bounces-37188-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 09 May 2026 22:18:27 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 575A3501533
	for <lists+linux-usb@lfdr.de>; Sat, 09 May 2026 22:18:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FFF13013D45
	for <lists+linux-usb@lfdr.de>; Sat,  9 May 2026 20:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF7F383C70;
	Sat,  9 May 2026 20:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b="AU5yjRO7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEF3128816
	for <linux-usb@vger.kernel.org>; Sat,  9 May 2026 20:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778357901; cv=pass; b=R4nhDubMrIS4hNfU8H6FiLOu/WHjSYPf4JmiLw+qYyxo37IAroVwNhQH/vsKvnmq9Kc4PLwBUI5Pjg+xi10pd8bJlSF/l/Sz5GfZNp43JgEItY68NdgAdu2dN/Vg6OMsZLJSq2C747qOcsRE3W25je6vpKeFc6c29kP6Elren5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778357901; c=relaxed/simple;
	bh=akz0ziAVbijP8n/3vgM34TqnMKGPHhilZwK2b4Q9NhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C6nrBXdmPRmHaxuX53NMZP/87ZUNR1s0c9EficCuGkgNj581qFG9h5nkUSmREUmzBqVsscXZ3ae2UAsUc3Ae1aBiNfEu/p8R/orAtIP4Il8vz2AzEpNvirpJmm1MV5dKtb+orBkdAG8Rzc49tvDy2k5JkIYSQDo23zw4ToWHsF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com; spf=pass smtp.mailfrom=motu.com; dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b=AU5yjRO7; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motu.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-67cd93d8affso3781631a12.2
        for <linux-usb@vger.kernel.org>; Sat, 09 May 2026 13:18:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778357898; cv=none;
        d=google.com; s=arc-20240605;
        b=Ne0Ntxq4mwPGnKYMfIN/IT4mEFHNYGFZCWkMTadJtdOsTOHNUIpGoBQGyvB+cFcsj6
         2Eefoy6P9e1c5ZrtgyMlxFBjblBYqklLr9m1cTUIQJAV7J2jr8E131X/8Zz7qWhvGnM5
         v7lY//pk3Ik+4zhxz0UPYZtKklcQnPre4wX5uv54nocGf+XKGMvt8PBGQioPDOqfpULh
         4uPOWXIf5Avb07ChaVxg0N2R/vD4sCoriu/FViMzR/hiqjQRuNp//IPb4Cbn1vmNcfnW
         kaRhdpm7yEXi8vxryzlvgKnOEOq31PN39G56RfTfRE8a4C3S9Vbx7HvtFqJRkJnfpfYJ
         7grQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PUG/XYvVZ0DcbUvDHTvYPWWZi+szeEcGZ5hMOKvLzN0=;
        fh=THgteF5ZcFUkxK9gNKwOX6fRLgzz5MoHAk6gKSRF15k=;
        b=Oci52F38gBJo649h9vsiwf0qwo6VtLZI/4iCNGWjlHYXRWxGGVOXoacGWrO1gXUWsJ
         Y96JQug7fIdDfycnJH4oyuTyliq0dwgT/d4YpEF1YsBfBgUFSU3+El//9SjvKcv7J2Jn
         bVXac/d0NNA64OyDieMw+KJ7SQ1hD0A8pYJ8Q1ScqGTDh/FfIslnITJz67d8///FjatX
         UpwYg/m3m/uQXlqqo+J65kZDsw1lPWBYbpdNNfOp/4jBulDGwtxUvZD0CCBoYhc9SBkh
         Ty1DH8iX1PL3GcOFX0y2lnhZekz1NuDHqxydScyxvSaXlF5Iu5gerZfpIZOUmbVmOK3I
         bRoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=motu.com; s=google; t=1778357898; x=1778962698; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PUG/XYvVZ0DcbUvDHTvYPWWZi+szeEcGZ5hMOKvLzN0=;
        b=AU5yjRO7GffJC1MlvwqSENPjaFookHRDTfR+eGDw97PILa6rFQoR750UsVG7nc8zH1
         jyy3xvOqhWhIs6Aqm4d4uizWPaeQSoBfkp39FD6POu/QPSHXXuynSfheJOgchG/uOyV4
         Q8MfWJP1rSUeUOQ/Xh1JDo39f1Ex5r4Wn0zFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778357898; x=1778962698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PUG/XYvVZ0DcbUvDHTvYPWWZi+szeEcGZ5hMOKvLzN0=;
        b=L678wh214ewDRW/t0T2hIUbTL0p0o1uGNYnHVxCEVAlSy4xDF35/R54cRxzTsA4KJl
         i/CkwOJjrNmb8HlYczxlv1oLUutJyP9ou9lNtXLZowfpW1jcn4jppWhPMbxEdHh5DPqR
         SrXrr/BHWf1fQSRg0Y7uo6j9naYVkSqPLTazDaBr1D8XLPThssLhxDZ4fN22f47CvuYF
         vAtgLZwE0ABKYpD01XPnL8az0qo/qKvwOXjQzZMOb7zL5Okjzyrxyu3thDyA+HteFTiB
         Df5n+Vd8eX1Wil5XJnTcKPiHiWTinGc0Lqt/mCuhOWqn/tE+DNoLw/0idYO7sWBvAWJT
         dRNQ==
X-Forwarded-Encrypted: i=1; AFNElJ8qT1Vt5Kyy/5r0tqJOOtLpzpwXwWE0Lm+3mv68/20LI6pUcb2iCfimtyKq/scLV3pwJV1tOfcmb2g=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywto7sxz23KRlijseOOzeFfRiHIXTBSs71B7vE2/P4voEBLmtHX
	4TL7XEnT+378vLDZtvxeiY77z3w//Ka3nFegw41t5OKowujlkEY541ATl2F40g1OumGUEdTO4BS
	NRFtGJSdFCj/DuZ6KUg/OWa07D7wzZBGYlhc//qBUuQ==
X-Gm-Gg: Acq92OEKeE8BEYXO69kUDRJr1jFUu30l5NrVvV/5YozPQ/eRxksOaRgETo0rFeForyc
	G7EuBIDPD/NIbIiOcrtxOUPOJrG6lqdtBxQpyDixQD3TCZHpvr2vZWU64IXO3y+G8uh7txmHt4F
	7w8Cn9K0f1QE5mtZn//3tyaIHuIHOHpeQBk4B1hiiDB3q8/QHO5XnvQWGMp6xrbg5aDCEC2Lycc
	IK5Cm0kGEvrrQ0akGoa9SIhzGSwtaGJmz+BHflOaAgB/Z3oHkX36P4Ua4lt6/Wik8eJ2kmmfdZP
	T/RlOrs=
X-Received: by 2002:a05:6402:324e:b0:670:8b30:a897 with SMTP id
 4fb4d7f45d1cf-67d638a6f1amr7197930a12.1.1778357897974; Sat, 09 May 2026
 13:18:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bug-220748-208809@https.bugzilla.kernel.org/> <bug-220748-208809-eL7PrzeMxr@https.bugzilla.kernel.org/>
 <fe08eabc-4f92-43fd-89d7-5e9d0e35c979@rowland.harvard.edu>
 <CA+Df+jdtQrYye85d7uZyT3jirsztKhf7qQes3LvOAPa+9qxSOw@mail.gmail.com>
 <20260507235432.71d28151.michal.pecio@gmail.com> <CA+Df+jfkQ1QXyh=oQrX2y2x8N2=ZRFWFai5QHiZ2FC-hQqEsmQ@mail.gmail.com>
 <20260509131004.61ce52b9.michal.pecio@gmail.com>
In-Reply-To: <20260509131004.61ce52b9.michal.pecio@gmail.com>
From: Dylan Robinson <dylan_robinson@motu.com>
Date: Sat, 9 May 2026 16:18:04 -0400
X-Gm-Features: AVHnY4KqO9B7unChebsbeerIpCMtHTD68Ld_tbWEfewGEKmcP-rpBTaNX-PgDnc
Message-ID: <CA+Df+jf=e8hFw6v=wMX6iCAt5ModXRGnYta+2pJAgkf0zUgghQ@mail.gmail.com>
Subject: Re: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame
 and always assumes URB_ISO_ASAP is set
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, 
	mathias.nyman@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 575A3501533
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[motu.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[motu.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37188-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dylan_robinson@motu.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[motu.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Action: no action

On Sat, May 9, 2026 at 7:10=E2=80=AFAM Michal Pecio wrote:
> Windows requires isoc URBs to be frame-aligned. Linux doesn't have this
> limitation. I can run a high-speed UAC dongle with two 0.5ms URBs just
> fine, though ALSA won't let me go shorter for some reason.

This appears to be true. After reading the documentation, it was not
clear to me whether it might be possible to do something similar on
Windows by submitting two URBs with the same StartFrame value, each
describing four microframes.

So, I tried an experiment against a bInterval =3D 1 high-speed device,
and any submission describing less than a full frame's worth of
transfers was not scheduled and was immediately completed with
USBD_STATUS_BUFFER_UNDERRUN.

> Not sure how Apple and MS deal with the "phase" issue, i.e. does a
> bInterval=3D6 endpoint run in frames 0,4,8,... or 3,7,11,... and how
> are drivers supposed to set firstFrameNumber then.
>
> Looking at the MS article, I suspect they want drivers to pretend it's
> always 0,4,8, which is what the xHCI spec requires too.

The Windows documentation suggests that high-speed isochronous
endpoint descriptors are only supported up to bInterval =3D 4.

Source: https://learn.microsoft.com/en-us/windows-hardware/drivers/ddi/usbs=
pec/ns-usbspec-_usb_endpoint_descriptor

It also may be the case that Microsoft only supports bInterval =3D 1 for
full-speed isochronous endpoints. That descriptor documentation
suggests that other values are valid, but the isochronous transfer
article includes the following comment in the example code:

// Microsoft USB stack only supports bInterval value of 1 for
// full-speed isochronous endpoints.

Source: https://learn.microsoft.com/en-us/windows-hardware/drivers/usbcon/t=
ransfer-data-to-isochronous-endpoints

For Apple, I have not been able to find documentation describing how
start frame alignment is handled for isochronous endpoints with
polling intervals greater than 1 ms.

I noticed you weren't CC'd on my last e-mail exchange with Alan.

On Fri, May 8, 2026 at 9:25=E2=80=AFPM Alan Stern wrote:
> On Fri, May 08, 2026 at 01:20:04PM -0400, Dylan Robinson wrote:
> > Perhaps, rather than treating this as a "specified start frame", it
> > would be better to think of it as a "specified start service
> > interval".
> >
> > If a driver requests a start frame that is not specifically available
> > within the periodic schedule, it seems reasonable for the HCD to place
> > the transfer at another valid position within that same service
> > interval. The actual start frame used could then still be reported
> > back through the completed URB, which can be inspected by the driver
> > if it needs to know the precise scheduling decision.
> >
> > For endpoints with larger polling intervals, this "nearest valid start
> > frame" approach seems appropriate, since the device cannot expect
> > timing granularity finer than its polling interval anyway.
>
> That makes sense, and it should be doable.  At least for ehci-hcd, and
> likely for xhci-hcd as well.

I wonder what you think about adopting this approach for Linux.

Alternatively, the requested start frame could be interpreted as a
"not-before" constraint (i.e. the HCD would be allowed to schedule it
on the first valid frame that is equal to or greater than the
requested value).

Another option would be to require that the submitted start frame be
aligned to the polling interval, but that seems unnecessarily
restrictive.

Dylan


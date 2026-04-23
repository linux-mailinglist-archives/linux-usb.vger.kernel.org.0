Return-Path: <linux-usb+bounces-36431-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AF2fF7rh6WmTmQIAu9opvQ
	(envelope-from <linux-usb+bounces-36431-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 11:09:14 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD2A44F0CF
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 11:09:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA643301701E
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 09:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E903B3E1D15;
	Thu, 23 Apr 2026 09:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kx/imfTn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044073DE43B
	for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 09:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776935128; cv=none; b=sH3fiOUaGkRvMuZTIOelERXR0SmnU6N2nhmtk5FEzLcWQQNEnadqu9didPFfHyyhewWM+Ofz4UQVfgBH0HK3SK/EzOQbG0/bSwx329sEZ/3qwj/48hjnl9Dt1nVVPr9MNJGIC4HmV7hc55cCnDAWZ0CQVXOUQa5t1cN7eQRlqhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776935128; c=relaxed/simple;
	bh=zDTYHA7Jg+uWss2uJzGCIWYvo7aCCeZJjf30goaZUQw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LymdPEN0AzzzvGs0jnu+9W0x6yq5hcpXbh8923pkIMQj5FHcXTfL+wxTgf+FjLAb25lsOiW21X49Ho/SjquPk+cxJiAUuwY4l+WNAYbSRpQf0YzOklunDQTYyimQ3J2KfFjzeo71yWL6cou2Pg7gPCa0DjYThKdqfBKvIw+r5Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kx/imfTn; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a3af1b7549so8046858e87.1
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 02:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776935123; x=1777539923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OA7KitPjq5Rn+RB7tfnE+GxaVxQEuMGN2xAlmWqoLbA=;
        b=kx/imfTn00YGo6UlnhHYaH6AQhdbm+ud4wrxceiiGOs7MrPsm17RryJ3OMUdhG1XGA
         IqaRlCyReAKp8S7xNrqfqJe7MmvCbTO/FroeQNLycFQXBasRzF9cmJZBfyP8YIBocvmh
         ag6pCoO71ov8+eFqlCXHDeYjiw8Dekj0+JRLhnbWMI6jglNn+p4b+BiSFM/4Dl2PlSVA
         LtpYSM9I3kmGYLL2UjBx91Mrzv3Rwc38WAZZmH95Qp8gI/paMpib0823NTfWcQ1tRp3f
         6U7Uny913FUIQUdp/F9Lni/MeSH9G5W4+bjj8n61HlV06x1v4JBylwJJow1o9SH0HfGl
         bDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776935123; x=1777539923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OA7KitPjq5Rn+RB7tfnE+GxaVxQEuMGN2xAlmWqoLbA=;
        b=Txv8555kzjsVSij3eNhoiFOev+PlDd1VoF6Js9qk4JK7B+cUmHkg+m0enWOpUwCaiL
         PTrNjWWqTe4m1jBXJve8a/hzpGvQeqcpG/4W1j+kWo5oxGEFPiHQQQyakYu3lXVmLXSt
         kVV72LFihGToGJ4Xy8cWnPXo9tBjGuFWjYW2o3Sn9aR6jKAhuhqbkZJvf1rrk6mUscvk
         nhFlllI1VzCRQAx7ueBVi1f0dGHwTl3TLAyOo4hNHT2iNXKe8V3Sm2bnW0w1Oo2bV9nO
         dq+QVT2rzdlTcfOd9b0Y/PzqWjDEL9SyooMbLkiTqfjZpir69FYE8+8IcrIqwPOxWSxl
         Wk9g==
X-Forwarded-Encrypted: i=1; AFNElJ+YTwiFtfRxhEfPc60ozjhhh383VMO9oVFCejGGL9HW9CdZg0f/zK6qhtZq0xKweROm2YfoahtVECo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQWCq6mmscwT5yXYJHkZ9f6UBWkinUQuIn1H4U733uSH3k3xO+
	t/kSP4tKyCMynlZ8jCzxI/Xg1Bf/y+GE7dSIq6Afz0qMJcqpBFoyaIJa
X-Gm-Gg: AeBDiespuTboAIIexajX1rtZb5ayBeH444dBFtn07fjoWE0pFcb+NiCzSGQ2/C836ST
	zFqTi+F77DBLn8m+252QphgIjZSryZdtWSr1LqbBWFfukz1H7hMoQls0+3fJOsDzne9ktPZrObS
	h7dhiJ3gkQJw94E9SuXcJONWk9E7DjGm34+M0yoThxWCr7am0ALj+l7+BAEoNQaDA5Xy2Bey7/G
	MF3oklbeYz+fquN3WSb1qO5L0VwGXt7Kj/nFHN9XkGS07Y0dL9uOA/lJvvHS9STm4ktCIRyP3Hw
	FvsYyiMnDWOGpRRX2h4C1gyN4dxxFjHoF/iDf8EfovQyg9IRELqHjv8rgGovLTAlTv5Ue7B7jr4
	XgzPmAPQiAW8lsvDJ/Yn3j6TYpzDCsgefnTV7E/BnVg484T93CB0y5jBTrHy16XL6PANq5VfAu/
	tkZj3xphxj9isCHi9i+aLh/piL9OWXtoNACbGfhLtpbKA=
X-Received: by 2002:a05:6512:108d:b0:5a3:ffc0:7882 with SMTP id 2adb3069b0e04-5a4172fc0b6mr8325613e87.45.1776935122285;
        Thu, 23 Apr 2026 02:05:22 -0700 (PDT)
Received: from foxbook (bfh75.neoplus.adsl.tpnet.pl. [83.28.45.75])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad12asm5125259e87.1.2026.04.23.02.05.21
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 23 Apr 2026 02:05:21 -0700 (PDT)
Date: Thu, 23 Apr 2026 11:05:17 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: "Xuetao (kirin)" <xuetao09@huawei.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Alan Stern
 <stern@rowland.harvard.edu>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <caiyadong@huawei.com>, <stable@kernel.org>
Subject: Re: [PATCH] usb: core: Fix bandwidth for devices with invalid
 wBytesPerInterval
Message-ID: <20260423110517.664745da.michal.pecio@gmail.com>
In-Reply-To: <00ad170a-2546-4d7a-8f8b-af6d46e09a73@huawei.com>
References: <20260402021400.28853-1-xuetao09@huawei.com>
	<2026040241-purveyor-bakery-a9f1@gregkh>
	<c463f9ed-22ed-4ee6-b4fa-2933770e9c4c@huawei.com>
	<74f1bb0d-24c3-44be-9583-0585863cdae3@rowland.harvard.edu>
	<2026040221-reclusive-garland-6281@gregkh>
	<c2d89ac0-1d5c-45b8-ab68-53214546a7ae@huawei.com>
	<00ad170a-2546-4d7a-8f8b-af6d46e09a73@huawei.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36431-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1AD2A44F0CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 22 Apr 2026 21:26:23 +0800, Xuetao (kirin) wrote:
> By adding debug and capturing USB protocol analyzer traces, I have=20
> identified the pattern of this issue:
>=20
> 1. Why doesn't the Realtek USB 3.0 network adapter have this problem?
>=20
> Realtek has two different types of interrupt endpoints:
> (1) wMaxPacketSize =3D 0x10, bMaxBurst =3D 0, wBytesPerInterval =3D 0x8
> (2) wMaxPacketSize =3D 0x2, bMaxBurst =3D 0, wBytesPerInterval =3D 0x2
>=20
> The Realtek network adapter uses the r8152.c driver. In
> rtl8152_open() -> usb_submit_urb(tp->intr_urb, GFP_KERNEL), the
> length of tp->intr_urb is fixed at 0x2.
> The Realtek USB 3.0 network adapter uses the endpoint with=20
> wBytesPerInterval =3D 0x2 for network status queries. Since=20
> wBytesPerInterval =3D wMaxPacketSize =C3=97 (bMaxBurst + 1) =3D 2, there =
is no=20
> problem.

... until it's switched to its CDC configuration with a kernel patch,
then there is a problem. That CDC endpoint sends more than 8 bytes.

CDC is used as fallback on chip revs not yet supported by r8152 and
we aren't sure if future chips will fix their descriptors.

> 2. The ASIX AX88179 USB 3.0 network adapter exhibits two different
> symptoms:
>=20
> ASIX AX88179 has two different interrupt endpoint descriptors:
> (1) wMaxPacketSize =3D 0x10, bMaxBurst =3D 0, wBytesPerInterval =3D 0x0
> (2) wMaxPacketSize =3D 0x10, bMaxBurst =3D 0, wBytesPerInterval =3D 0x8
>=20
> The ASIX AX88179 network adapter uses the ax88179_178a.c driver. In=20
> usbnet_open() -> usbnet_status_start() ->
> usb_submit_urb(dev->interrupt, mem_flags), the length of
> dev->interrupt is 0x10.
>=20
> (1) When wBytesPerInterval =3D 0x8: When the software submits the INT
> URB, the host controller can normally send an INT IN request. If the
> device returns data length =E2=89=A4 8 bytes, the host and device interact
> normally, and the network works.
> However, if the network adapter responds within one interval with a=20
> packet carrying 16 bytes of data, a specific host controller reports
> a babble error, causing network failure.
>=20
> (2) When wBytesPerInterval =3D 0x0: The host controller does not
> reserve any bandwidth for the device. When the software submits the
> INT URB, a specific host controller does not issue an INT IN request
> to the device, nor does it report an error to the software.

I think it's a HW bug because USB specs allow zero-length interrupt
transfers, though an inconsequential one if no device uses them.

These patches will work around it, because zero wMaxPacketSize is
disallowed by USB3 spec (though not by earlier ones) so wBPI will
always increase to at least 1.

> Verification results:
>=20
> Patch 1:
> In usb_parse_ss_endpoint_companion(), if the interrupt endpoint's=20
> wBytesPerInterval is 0, set wBytesPerInterval to wMaxPacketSize =C3=97=20
> (bMaxBurst + 1).
>=20
> Result 1:
> This resolves the issue for ASIX AX88179 adapters with
> wBytesPerInterval =3D 0. However, for the scenario where
> wBytesPerInterval =3D 0x8, wMaxPacketSize =3D 0x10, and the device
> returns a 16-byte data payload, a babble error still occurs.

And it will be same thing for RTL8153 CDC. This is too strict.

> Patch 2:
> In xhci_get_max_esit_payload(), when udev->speed >=3D USB_SPEED_SUPER,
> for interrupt endpoints return the maximum value between=20
> ep->ss_ep_comp.wBytesPerInterval and (max_burst + 1) =C3=97 max_packet.
>=20
> Result 2:
> This resolves both scenarios described above. The only downside is
> that this modification may cause the host to waste a small amount of
> bandwidth.

I wrote a small patch which adds very similar logic to
usb_parse_ss_endpoint_companion(). This has two benefits:

1. Backportability - ESIT payload code has been refactored recently.
2. We can easily log when the tweak is performed, once per device.
   Maybe some HW vendors will notice and clean up their act.

Regards,
Michal


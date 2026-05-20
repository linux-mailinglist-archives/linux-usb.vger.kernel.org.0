Return-Path: <linux-usb+bounces-37803-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBO7N1PoDWrM4gUAu9opvQ
	(envelope-from <linux-usb+bounces-37803-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 18:58:59 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFA1592BE8
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 18:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BF4735984CD
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 16:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41C6332ECB;
	Wed, 20 May 2026 16:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X/usQ1Qw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AF133A9CF
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 16:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779292883; cv=none; b=BS/6eFQmAFiGqBYoVYe1h/Ya1AIVJNLtuQwaTHiikJjgWjej1PTc+Olb4RNvZeS63YXKowMsQLbSQy9AoEGHYE8x84Z0QM//+G+aPrnIxhNPoLtae7mdq5PqKpvJqt896bgfq53Y2Hqdc5gDaCDXMR6AoDiVOVAnLPBqth6WaCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779292883; c=relaxed/simple;
	bh=Qyg/N0RPWRdjh49dRdZFz6LZc2ehONUDsrWnJo4MvBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D2DEzCSCMWAJvQH3Wpr1o/Xqm1+eQwj58SIEQWBl7aa7KFp4TCHdVZrqsV0ragA1t1hwu+lksxay0L4L7G6+gaAnYEcbNsWUsH4ZQgbkCImfN0axI/KKykdoZh7dD3ddRmmfX34lua9j6MiiqpPYOLUAlER0pKS5N9/XjOOCvVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X/usQ1Qw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE6BB1F00899
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 16:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779292881;
	bh=Qyg/N0RPWRdjh49dRdZFz6LZc2ehONUDsrWnJo4MvBA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=X/usQ1QwCSwG8o7OoxDK5LlZCyymqvRBUw8VjlJEpylcAPKlZoQfiVF/O/h2zPIGs
	 81394m/ZfWr/Q4J/Mckik9lffmjvezKZSSTV13Y5ku+1oojI0BrlX4qiRKcsTOqyAi
	 jm2K5SNkl582Ua8XlCTjdEjJHrq14kKlmo+M1+Jg/4PXBM/eoutf1TpHIJEfGVSvP5
	 xJ5BgDhwVVGW+Wy8Hj6YGEnP0Im6y6spd+XOU/zoaiWcm9S6aZiGTrYZaxAwOQ2HqB
	 7C5A6/UaBuQI+L4YwWae5GXBJopsbclqgjNJA5pslY7juhn7ldrephedFNMRwwGcQm
	 5RkqtAalGKwsA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38e7c3a2deaso47405931fa.2
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 09:01:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+F/0A1WQHkRyAnFZUbIwA1oTkgqeZ90+GYSNq/YYvfJA++xJ9EBSMENiLOISPS6Nw5Cwq15rwOdpE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWU52yW8hwgigFfJ71GCPJG0CuLd9EZsHKKPkXuthvOPbjwXvk
	gyxzkHtSWQhtZbSG1Poc5+66CazmHY70pUzS4I/LzCc0HzgxxkO5lFvMMaaiUIWI6gva4cqh3Zu
	PD7cg2XtdgzinIpXKaNlDwUVwhuGnCrKSi0MLRbLO/Q==
X-Received: by 2002:a2e:be8b:0:b0:394:1b05:4554 with SMTP id
 38308e7fff4ca-395619eff61mr78938081fa.4.1779292880531; Wed, 20 May 2026
 09:01:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515090149.3169406-1-wenst@chromium.org>
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 20 May 2026 18:01:08 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
X-Gm-Features: AVHnY4JiBPEmzMVtIpn3-9v_DqTGvSLjQ-NfRiMDk-zVR0iQCEFF2AVZFIteHmE
Message-ID: <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] arm64: mediatek: Add M.2 E-key slot on Chromebooks
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37803-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,chromium.org:email,x:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 3AFA1592BE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 15, 2026 at 11:02=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> Hi everyone,
>
> This series is my attempt at enabling power sequencing for USB to support
> the USB connection on M.2 E-key slots. M.2 E-key was enabled in v7.1-rc1
> with just PCIe and UART supported [1].
>
> Most of the series is based on next-20260508, while the DT changes also
> depend on some other DT cleanup patches I sent [2][3].
>
>
> Patch 1 reworks the power sequencing framework to allow matching against
> different USB ports. The consumer API gains an "index" parameter (which
> is the USB port number on the hub), while the provider API is reworked
> to pass the index to the matching function of the providing driver.
>

Sigh... I would really prefer to avoid going in this direction. IMO
it's not very clear what this index actually refers to in generic
terms, given that pwrseq is flexible on purpose and there's no
specific, well-defined DT property which could have an "index".

> Patch 2 implements the index matching in the pcie-m2 driver. Matching
> only happens when a valid (>=3D 0) index is given.
>
> Patch 3 reworks the power sequencing targets for the E-key connector in
> the pcie-m2 driver to add targets for USB and SDIO. The former is used
> later on in this series.
>
> Patch 4 reworks the USB hub driver to return the actual error code from
> hub_configure() in hub_probe(). This is needed in the next patch to
> correctly return -EPROBE_DEFER.
>
> Patch 5 lets the USB hub driver look for power sequencers for each port.
> Currently this only works for M.2 E-key connections, but it could be
> extended to cover other cases. It should also make port reset via turning
> off the port VBUS work, even when VBUS is not directly controlled by the
> hub.
>
> I expect some discussion on this patch, because a) it adds some
> OF-specific code into an otherwise generic (core) driver, and
> b) it doesn't yet handle USB 2.0 / 3.x shared ports; it ends up powering
> on the port twice, which negates the port reset part.
>

I understand that you do this because the port device has no OF node
assigned. If we wanted to call pwrseq_get() for the port device, is
there really no other way to associate it with the correct pwrseq
provider?

Does the child index in hub_configure() relate to the port index as
defined by the unit address of the port DT node? I'm talking about the
X in port@X?

> Patch 6 reverts an incorrectly modeled OF graph connection for the
> MediaTek XHCI controller.
>
> Patch 7 then adds a proper representation.
>
> Patches 8 through 12 enable the M.2 E-key slots (used for WiFi/BT) and
> USB type-A connectors found on MediaTek-based Chromebooks. These are
> provided in this series for reference. The USB type-A connector changes,
> while not directly related, have overlapping context, and was easier to
> include. They were also used to test some extra local changes I tried
> to convert the USB A connector from an onboard USB device to a power
> sequencing provider.
>
>
> As this series changes existing power sequencing API, and also uses the
> changed API in subsequent patches, I think the best way to merge this
> is for Bartosz to take the power sequencing patches and provide an
> immutable tag for Greg to merge and then merge the USB patches.
>
> The DT patches can go through the soc tree once all the driver and DT
> binding changes are merged.
>
>
> Thanks
> ChenYu
>
> P.S. I'll be at Embedded Recipes if anyone wants to discuss details.
>

I'll be there too! Or should i say "here"? I live here after all. :) Let's =
talk!

Bart


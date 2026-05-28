Return-Path: <linux-usb+bounces-38129-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDPKDDcBGGrUYwgAu9opvQ
	(envelope-from <linux-usb+bounces-38129-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 10:47:51 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C925EEE9E
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 10:47:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FC6E30D94A3
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 08:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0303806D7;
	Thu, 28 May 2026 08:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cXGfUXPo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDED37187B
	for <linux-usb@vger.kernel.org>; Thu, 28 May 2026 08:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779957607; cv=pass; b=kFnEpYR4XLDtYfmoIf6SHX+QkAQaT8hegX9OjpJowj6Cl0zN+iCpvZcbf+y2QeC0XWok98TgY+F/tFQFQpPxA0pA7Adw7o2U2iZoyODZ49PPbZj//NWLnhYEUksc/8kSfNZDt6VBTjqsbDZRKpfiv3A1DUxbtExkNF2DDlFTs/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779957607; c=relaxed/simple;
	bh=bMVYCHW2rA/kKGjqYMY6NUZrWJ1hytGHa1uCrkcH62k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZA3YbBb6i3xttIKNWa7hvbNfrfSjm4bfv6LvMg+KG6PFbym1BbBEjH+I+uyld6kTeO+lErv5RjVWuXfaekDxpCxoNVvTCiuNBG89cdKD5wmkUR9gFTkEd8MEaAiz84elQg1SSbOP81vd69c0KlbIxP0jFSleTPflkX8mFj9E9XA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cXGfUXPo; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a40b2bc96dso7297209e87.3
        for <linux-usb@vger.kernel.org>; Thu, 28 May 2026 01:40:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779957604; cv=none;
        d=google.com; s=arc-20240605;
        b=K/PT8k5r7ancfd1xlLV12BwMzWS4KG/OVoYjb36e5+VLp6YS1VBuWGOS4uaIAhNtvm
         Ufb8ggJt1LdgKntLu7dDBw0n7XXHLohOv/1yBt42c+1TO48jeSW/axqcHfOH2FrN0cb8
         ZcKlfDOyoDI8ZT7+vhH+QbZm/cx8SBCUBZJyXQQHsaitvPGliQoBrufKdO8y3V+Tcy2Y
         WNP6jdldQPZHjEMpdVCoD5rEQBt5oql2T/+6/JIQyK8HfoTONtsEIoOJWd0IVcx+/1N7
         6RZZvKIt+vmgyT8j2yKomTRf5dFZeyWU6ZUf8Wc1bgR2afiAkkNsAWfVnR39OkjrN4qp
         wccw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I3ozGp08XBKPc3Oc1CPTjccxZqkmofz+VaCJR4hZhDE=;
        fh=pG+gzIt3WEfUEC+5P/I/i7M8A2cpnYogoVyJFwlQwjk=;
        b=cuQ/9Ts9EPsXY/ReG+b8ceTxiSrquLF4QihRIs63mXlxXvSkGG6H8Dq5Br2/rbdszp
         cFB18TqHfFeQ3UJH0vJ9hEKOKrYmUzzQEPVCciunwSGlm1JQEcRDkgRxR7r0o4bflw4k
         JtJpVnj57hO+0WC+Cc+rdl/i8AnC9EbtgnBhcxWZPROzlpDKAT5UC3pOZMBF314nFXZ8
         p34qKJaW2MmLG+waJBbFNQadryvljYwFxvEls6vnx9+TKY7GjZd9r5xnAo8Iq5BXVLQX
         NI0xnbza55egaP63aLIwOPtdsTOEBUCzuFC3yWh8I64mca+IYKJxp480TuTs3qQGBKk9
         F/yg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779957604; x=1780562404; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3ozGp08XBKPc3Oc1CPTjccxZqkmofz+VaCJR4hZhDE=;
        b=cXGfUXPor2b1Nakp3P0r8YwatpnWa5ja4K3M7lsC9HsERO15z7WxUBx5Tl63C3srvd
         8HUB3N66ZWmcqB/PENV3t4Oq/7gXoxnmeh5XuomDFMRcaBf8A7qUCuISyS2w3VmIidCS
         9tB9VkPhpYvwAyC6eS40t+Cz6X0BEaNsYSqOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779957604; x=1780562404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I3ozGp08XBKPc3Oc1CPTjccxZqkmofz+VaCJR4hZhDE=;
        b=Rr6kJVOpYQCFHDQNImcPMiKimZ+qM7e9wxP54DODQUx8UbjDRbCxB3RDn9e5JAHcJl
         m68KHz+WgafEgHLC+/c0ZLKOw2gdd1JG4+0mz3lK8daWxWcSKZtNg6maUVm86A2llafQ
         N8g2TjxPOxGIBvIuYXFKp5zjcxGEnrf0eDbM0L6q/DExbQ8stGy6xZzpImpz72pD7cOT
         JCvYQjckuHP84MhFljO+pQFCmgfHAMhLhXxDAsnvy9y3aI3vuxxcKCmS/alG9SVcrDp2
         DDNNEe3Rckj5UNin+PIoqE9BsyXBrgtOuk0g+Kke+pC4bpf6AkjH7lrH7M+BKB2dZtu0
         YFrg==
X-Forwarded-Encrypted: i=1; AFNElJ/AVooVauTzB2n7cpEblZW8Z1uPdbm9b7Ty8y04nFDYpNS4hlx0REt6Mus/3hDeFRuOhtJwnYPjV/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDIywTOnO57lI5G7PMqfbi4rUeCmZ05Tq7xRsV6GMHMWibiz4J
	r5cz0lorsIEqWj7iQYD7+z606bOO5NUZxXz/26sGb05A3oCRFL7HUc1S+/xm/fexlBcaMvRHzJb
	DzLBIeu5Bts5j3oLYLmnVnzOans4UuPmxvbvFbWtE
X-Gm-Gg: Acq92OFBRHl4/6h8CpX1ZloJ/P+3oFryaop146cKuusWMEQrMfT2wvvlf5+1FOGeJLo
	N7lTp7tXIinMlCMBALoGpVYGg3DGC7Bi6aXM9XPkiy1K9jh60uC8zGpEAUICWpyIas/UQ+yDVVF
	RzkXtmuqMqLaxkRQpsOQh/Yo0ZBqrU6ysJiUT6eENFWpgLBHVjOb8DYzQkutlJx7UcZdZY14rkH
	HzNeFy+xMQze5Qzd80fZIKovf8GT32HQZTowKkkf09oeFFQ0YbViMxSwUjmCO8mImk5UCImhvs7
	7mfHzGSbJz7ak4gL7WwQa69mTlaX
X-Received: by 2002:a05:6512:3ca9:b0:5a8:afc8:c37 with SMTP id
 2adb3069b0e04-5aa32369fccmr7817435e87.4.1779957603539; Thu, 28 May 2026
 01:40:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515090149.3169406-1-wenst@chromium.org> <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
 <CAGXv+5HC3dqgcE3KnKzakHHWFHB6m_X42orOkNUvZvp=SL_O8g@mail.gmail.com>
 <CAMRc=Med-_0GSYzoFBRiwFzBCK0DZqJD8_SEBxi+zwR20GS-HA@mail.gmail.com>
 <CAGXv+5GbW0bx3nKdZt2+tHuHyQ-J-1-Z79nMzHAwjmEPGKT02A@mail.gmail.com>
 <2026052710-flagship-unsmooth-ce82@gregkh> <CAMRc=Me=ujnscSOKhHDLz+ccMDyLyCfZnpqobF2BJ4YowgXB5A@mail.gmail.com>
In-Reply-To: <CAMRc=Me=ujnscSOKhHDLz+ccMDyLyCfZnpqobF2BJ4YowgXB5A@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 28 May 2026 10:39:52 +0200
X-Gm-Features: AVHnY4ImlKiDtiu3PtJAJE_NOkB4Apdo_R0OjsOkU3xKzZOWZm2qt_u0g9B3V2M
Message-ID: <CAGXv+5HKxhfZuAHTZECsVFp4S9yTN2rXW_Nps2TcoV=r9KgfEQ@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] arm64: mediatek: Add M.2 E-key slot on Chromebooks
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38129-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A0C925EEE9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 10:36=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>
> On Wed, 27 May 2026 19:41:30 +0200, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> said:
> > On Wed, May 27, 2026 at 06:21:00PM +0200, Chen-Yu Tsai wrote:
>
> ...
>
> >>
> >> However this seems to completely decouple the power sequencing from th=
e
> >> USB core. Take the USB A connector for example, it was recently added =
to
> >> the onboard USB devices driver. However the connector has a device nod=
e
> >> that is not a child node of any USB host controller or hub; it is conn=
ected
> >> through OF graph. At the same time, since it typically sits at the top
> >> level of the device tree, a platform device is directly created and th=
e
> >> driver subsequently binds to that device. This is totally different fr=
om
> >> how the hub and other directly connected onboard USB devices work. In
> >> the onboard device case, the device node is a child node of the USB hu=
b
> >> or controller, and the corresponding platform device only gets created
> >> when the USB hub driver probes, thereby sort of tying it into the USB
> >> device topology.
> >
> > Hm, did we mess this up?  If so, we can always change it if you think
> > this should be done differently.
> >
> > Hubs should be dealing with the power issues for their ports, so maybe
> > rethinking this might be wise.  I'm just loath to add hardware-specific
> > hacks to the hub common code for obvious reasons.  Anything we can do t=
o
> > pull it out to a separate driver is best so it doesn't affect the 99% o=
f
> > the users that don't have that crazy hardware :)
> >
>
> IIUC what we discussed with Chen-Yu yesterday, the only thing that needs =
to be
> done in the USB hub driver is attaching the port firmware nodes (if prese=
nt) to
> the port devices we instantiate. The rest can be handled elsewhere.
>
> Chen-Yu: correct me if I'm wrong.

The above, plus adding pwrseq_get(), pwrseq_power_on(), pwrseq_power_off()
calls to the appropriate places in the hub driver.


ChenYu


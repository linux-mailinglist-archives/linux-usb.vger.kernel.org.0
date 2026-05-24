Return-Path: <linux-usb+bounces-37981-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCO6AaOxEmq/2wYAu9opvQ
	(envelope-from <linux-usb+bounces-37981-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 10:06:59 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 608265C1A7E
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 10:06:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50C7F3012273
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 08:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92790349CCE;
	Sun, 24 May 2026 08:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HCF50kvM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5253B23AE9B
	for <linux-usb@vger.kernel.org>; Sun, 24 May 2026 08:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779610001; cv=pass; b=EK9lRm6u0oe3WE/hIue2EjO59xImsuIM8H/pcKC33jcUeKqoUWIUYy5Sxp+8Nb6tCtolnNOyZ1d7b9VOlWITNEhZ08yUqXnio+ThfnbCKHYRbrp1jJczpdL6tupbf7coT1+wNdU0pja6FFR50uJ3Ex/uQPbvyVQuYToZKDUKZio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779610001; c=relaxed/simple;
	bh=4WMpRmGDV6X/z1OH5zMJ111/X3tKN2AtCzBErEW3G/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p1RPRzL3X0Z+0ped5VY5XQp5dogsTC1f2Z5Qh0WywRKcd/HBNrjU7VcAMdu8nc65dG9qUsTKGSWNpZAldp10mVogv7XvkRU3DX4sqtRF8ycarfwE2+nwwz/+2imk5RLuvTCP46tdlXum6HlATKXWtnb1Tc0V+opDbdZ9tDMNd+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HCF50kvM; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a88db610ccso8831437e87.2
        for <linux-usb@vger.kernel.org>; Sun, 24 May 2026 01:06:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779609997; cv=none;
        d=google.com; s=arc-20240605;
        b=fpDWTmHc6fzYC6bm+5OgV21XXNz+lvMFK+mMtzyMP97CZsTW0j49hi3U/akEC2aRPQ
         XtxFuOY/M57/Co3EAoKiMikrJ+deKaNoijjPuFEexcrzgE3WXGC0589W6P2tUr6V3Vz4
         XdpdPxaemxg7qZHlUQmWJtshKINF5TOfNyIGSGWW/VI3u+ZuskIBcn+1h6CWrgItDOue
         VLjEByLyk0Ub56XKAVzIpvrzGdUSOZAsoW/cGsslb/9HTo7Oqsprs6fuSQ3CNuWh8gce
         JRFnQqKmsgywfvs7nh3nkFw0Co+JBF682l6skScYO9rj3e8Tk9UrnWqWLC120ZKy3g6t
         lpbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4WMpRmGDV6X/z1OH5zMJ111/X3tKN2AtCzBErEW3G/E=;
        fh=d4Q2wz3DNIrEkndy7sIBqBoUG0OydNswylNSxnJpakU=;
        b=HPhnxwTnYmMwY8SwIgwXYY3F260SUd+R4q4dcvwp6SwK1QZ6PuCUmwN5D8n5Kbt4zM
         LtNdr3dwr19mOMpARjCUzWrz90Ee0B7pdW4xt3DXiwOo6nNT5dqznB27bXe/MGy+WLUC
         asB+9v55JLetIMNaaMkLNp+KUY3XEIVlUcQk5JYq3Yj3IGvDgfbXcAbKOW51+Vqr9bkM
         jWQ3HVP/YiXM5kjCVWa9Y0/R1kfxpA4yLaW1l2ZIRZ0O2EGL8i4x2bAyVZnjubAXs95K
         wC4v3EzUc93arkWjSQd6h1k6l0lo7flUpTu653ErEgzvOLsf6wriZJWlgBodxWzQa58N
         XTwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779609997; x=1780214797; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WMpRmGDV6X/z1OH5zMJ111/X3tKN2AtCzBErEW3G/E=;
        b=HCF50kvMwRvyV6XJTP+4HauBdJ+E3X9+mYqzAHDfbAVErJ0oknBtGt2eG9+goD9yJo
         3QOD0ZMjWkrylDZztf34rcgw76ey5KQqYQcq9l14e70LLH1fpEz/3gj8lcYbe4wymUo4
         8IiucWp7tXP28mCk+v49wdgh+yz/BFHIN6wIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779609997; x=1780214797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4WMpRmGDV6X/z1OH5zMJ111/X3tKN2AtCzBErEW3G/E=;
        b=KjZY0smi/j8tzBnAZpRFYSz+pEqw7sEQ0DOIiIru0k012QmxULGwPn9v4qBdl5L7L5
         IHtFddxGbXsXuPaupel0Ta6bQVEZeo710t7YqD813O3Ikr6fL2b3EWtaOtN+0GjOBdQj
         8dAz1dSgCXzw43v3on9x0tDvbI4pX0DLp2fZ4Lciy5VtmwN79sHIyP1eNmgGuGiLrISv
         WtaPfSCaflgGiXjyMcRe50KxcVDJFd3eL0RpcG4VzPZOPdNepf/8AQ4eQYwSRM+f6dD7
         6iXaFWmEhry1NBhgsgYIidCtY/HbW8ELkP6RU/U0ZHBOFpbV2al0hfjWtIJNdyoOb3ko
         URbw==
X-Forwarded-Encrypted: i=1; AFNElJ88SMfcoG/qKjQULRdZmInry7HemmquAzyfBfisSyFBWGR88zLJ6BqO/7VXR5m6Xv6ihZmC50fx/+g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3uVjDIogHSa1Tq2qsBSJTbK3MHpjrXU0bJw1kCb+Rjg0w42/4
	cgrQ79yic77hjRqegXjxR60/Gz8QOGXFX4BXB00H4Kpj/HE5Ij5vIVwHVj32Nq/8sLB5pTcZHGw
	te4PJzllX+pLLBuofUIca4RThO3QRIkmHk1AZIsaH
X-Gm-Gg: Acq92OFE3BAFdFHSSIx6lNWot8EyV1dXjBQ6J+eOpcAMqn4Zkd+vezi5iGHdtN8KYCc
	Fqu64mEjb3B44I4duR8jIAJUKUOH33UIYn49BEMelieF0s170/Zl8hZ/FLkGhtuDeDs/73+W2nF
	LOILPoVFxxtAS4gRqbQjDnyraRz08w9pbf3qVUqj1roZCsxIzgonpySLPzVMiw9uYaalYQ/At5L
	zYgpM8UFLY1GY18QR4bkMXqdYmO337ig2N+N6j0fBdBDiBRE5/39cK9wDUJ3jVKaJlsDWcqekfH
	6aAPP1Rza5HRfDVZ
X-Received: by 2002:a05:6512:1548:b0:5a4:52e:5933 with SMTP id
 2adb3069b0e04-5aa3235c913mr2060405e87.5.1779609997332; Sun, 24 May 2026
 01:06:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515090149.3169406-1-wenst@chromium.org> <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
In-Reply-To: <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Sun, 24 May 2026 11:06:26 +0300
X-Gm-Features: AVHnY4KQQKvEna3YmFG3JiRUMuMCSWWGPOX7GZHTMr-aA0Q2R8PaQnONHyygdDE
Message-ID: <CAGXv+5HC3dqgcE3KnKzakHHWFHB6m_X42orOkNUvZvp=SL_O8g@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] arm64: mediatek: Add M.2 E-key slot on Chromebooks
To: Bartosz Golaszewski <brgl@kernel.org>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37981-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,chromium.org:email,chromium.org:dkim,x:email]
X-Rspamd-Queue-Id: 608265C1A7E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 7:01=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Fri, May 15, 2026 at 11:02=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org=
> wrote:
> >
> > Hi everyone,
> >
> > This series is my attempt at enabling power sequencing for USB to suppo=
rt
> > the USB connection on M.2 E-key slots. M.2 E-key was enabled in v7.1-rc=
1
> > with just PCIe and UART supported [1].
> >
> > Most of the series is based on next-20260508, while the DT changes also
> > depend on some other DT cleanup patches I sent [2][3].
> >
> >
> > Patch 1 reworks the power sequencing framework to allow matching agains=
t
> > different USB ports. The consumer API gains an "index" parameter (which
> > is the USB port number on the hub), while the provider API is reworked
> > to pass the index to the matching function of the providing driver.
> >
>
> Sigh... I would really prefer to avoid going in this direction. IMO
> it's not very clear what this index actually refers to in generic
> terms, given that pwrseq is flexible on purpose and there's no
> specific, well-defined DT property which could have an "index".
>
> > Patch 2 implements the index matching in the pcie-m2 driver. Matching
> > only happens when a valid (>=3D 0) index is given.
> >
> > Patch 3 reworks the power sequencing targets for the E-key connector in
> > the pcie-m2 driver to add targets for USB and SDIO. The former is used
> > later on in this series.
> >
> > Patch 4 reworks the USB hub driver to return the actual error code from
> > hub_configure() in hub_probe(). This is needed in the next patch to
> > correctly return -EPROBE_DEFER.
> >
> > Patch 5 lets the USB hub driver look for power sequencers for each port=
.
> > Currently this only works for M.2 E-key connections, but it could be
> > extended to cover other cases. It should also make port reset via turni=
ng
> > off the port VBUS work, even when VBUS is not directly controlled by th=
e
> > hub.
> >
> > I expect some discussion on this patch, because a) it adds some
> > OF-specific code into an otherwise generic (core) driver, and
> > b) it doesn't yet handle USB 2.0 / 3.x shared ports; it ends up powerin=
g
> > on the port twice, which negates the port reset part.
> >
>
> I understand that you do this because the port device has no OF node
> assigned. If we wanted to call pwrseq_get() for the port device, is
> there really no other way to associate it with the correct pwrseq
> provider?

I suppose we could tie the "port@X" node to the usb port device, but
AFAIK no other subsystem does this so we would be introducing a new
pattern.

In the M.2 pwrseq driver, we would have to match by port node instead
of its parent device node. We may end up with different behavior for
the USB target vs the other targets.

Also, the "port@X" nodes only exist for the OF graph connections to
connectors and/or muxes (this series doesn't deal with the latter).
For directly connected devices, there is a "device@X" child node
directly under the USB hub node. That node is what gets tied to the
the USB device.

> Does the child index in hub_configure() relate to the port index as
> defined by the unit address of the port DT node? I'm talking about the
> X in port@X?

Yes. The downstream port numbers start at 1. I believe 0 corresponds
to the upstream port.

> > Patch 6 reverts an incorrectly modeled OF graph connection for the
> > MediaTek XHCI controller.
> >
> > Patch 7 then adds a proper representation.
> >
> > Patches 8 through 12 enable the M.2 E-key slots (used for WiFi/BT) and
> > USB type-A connectors found on MediaTek-based Chromebooks. These are
> > provided in this series for reference. The USB type-A connector changes=
,
> > while not directly related, have overlapping context, and was easier to
> > include. They were also used to test some extra local changes I tried
> > to convert the USB A connector from an onboard USB device to a power
> > sequencing provider.
> >
> >
> > As this series changes existing power sequencing API, and also uses the
> > changed API in subsequent patches, I think the best way to merge this
> > is for Bartosz to take the power sequencing patches and provide an
> > immutable tag for Greg to merge and then merge the USB patches.
> >
> > The DT patches can go through the soc tree once all the driver and DT
> > binding changes are merged.
> >
> >
> > Thanks
> > ChenYu
> >
> > P.S. I'll be at Embedded Recipes if anyone wants to discuss details.
> >
>
> I'll be there too! Or should i say "here"? I live here after all. :) Let'=
s talk!

Sure!


Thanks
ChenYu


Return-Path: <linux-usb+bounces-38112-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBwiBxRhF2p+DAgAu9opvQ
	(envelope-from <linux-usb+bounces-38112-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 23:24:36 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 733395EA665
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 23:24:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B96583086FF8
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 21:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A1E3CAE7F;
	Wed, 27 May 2026 21:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NSPlKI7b"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CE33B47FA
	for <linux-usb@vger.kernel.org>; Wed, 27 May 2026 21:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779917057; cv=pass; b=NHtjahz7z97vXB6zWvdhI68BamHSKfJ8D5oHcIw09M2OEQG4yZ0VKA/ykNXhEDDCLEk9xIXmlWMQDXsPihT/mey/7CD0vE0gyQ7gQnnfoTrPL93TEGiz2SNYVxElE2MxIWVN59XfFhPMLj24+XbPLCXuFMU1faO35lDR3LaKGTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779917057; c=relaxed/simple;
	bh=c5Jc2Curx+hrKXgScOBcK42cc4R5Gw14VE5X6Khiqxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RjshTGes2K6zv1/V4/41h9MpCaSS28Af+Ji+JXkIlAbQeGK5XQ0ahwrLbVgSuajFPFIsmISoPn++VAV6I4mz9GBjHEA58kPrbNau0NJbfUpUI2RJrqLztC/rgj3EYLt76IsB8EN0yTzgRj8GsXsqnZ8SHHgJo8zH+vhaU9a1H6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NSPlKI7b; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a884815606so13277204e87.0
        for <linux-usb@vger.kernel.org>; Wed, 27 May 2026 14:24:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779917054; cv=none;
        d=google.com; s=arc-20240605;
        b=NJGBiZLTKs4jYHa3KNcMLUK9CNCp0xg2zKArR4ZPLi+yWSwGTZosin8D+D9umL5fx1
         A+3Ck+61TP7Zo5EKXcHOTwnIxZj3Fm2e8ye4Rgk8c6aGPVw/yqbOYS1YwL2BhuYyeBNc
         ZPQB5tC8CslxY6jQR6mSaZsxq78X9LTiBym2k1hNSAr+naZTO0aZBaiNG6YhBEyAmhC1
         nhHwiCTZYdC/nh1bZaU4mK3/dbZhUoSf+ZfIq4H5FM//H9iDkF0JVmm23RyRrBZYrXQy
         luIp/9lAHrHub9kAnS7bYXf4qrWQTBOKDjfPI3Vw1PgI/2E05tS2xNsD/nluv7sH0r53
         Jrsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UNa7dgr+T6R1ukhKHHLy6CJqrOmDsV/gnRDcoFC7IoM=;
        fh=Su1jjaYw2qeD/BMbIcM+bfCaX0yuwLwIEiuu2bUOcV8=;
        b=IezXbJjSyzaEqAzBaHnlTfY41Shi1h1j3eKjX4+KGtRfn4xD5pDiUDFJNzzdd+UVAV
         v3wYNCFlLPCg2yoHTOxGUglETwg5uPAwTy791mBd5+1tfjdn6bfYaD/s//og/Zh3wEYI
         cA5XWyw+vy0rrEpWDKTTIQTZbi7X/s7fPVSTRJqauewM/eojBk6cSfMFkAKJQng02Dzx
         1/55i75qMtVvX4sFlZXG4VZCCB0Bv5A5fOtPL77iWUaXvRAtRRbPf/vgGkBPwLarz1+L
         59RwKCYeUy84OLFKo4oR+Oa6B/SwWoLVIDmvJ+fYKaIINGU/PaTWr7TiRzopLlqaOJU0
         /Dyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779917054; x=1780521854; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNa7dgr+T6R1ukhKHHLy6CJqrOmDsV/gnRDcoFC7IoM=;
        b=NSPlKI7bCiybkA7NZQEXKfT95r2jQgQlFICBKaVjauyaCL2d72SRvEqwJc6AQcWHp0
         22pKsGgJ670pGIG4quBx3lRUCM5iiyPiADKLIKuuGjaZ0FElq/m1ZPaIU+D0hSR0VEAK
         p5fhex9bnEjkKf6QVnebXorrqnwOpyErVmGkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779917054; x=1780521854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UNa7dgr+T6R1ukhKHHLy6CJqrOmDsV/gnRDcoFC7IoM=;
        b=oWIQEIgutLUOv+a78WuxT6byuxdMKv0DkLuN0XehUK4fk4iMZ63v86nqfZntD6bWyG
         B2O8ojEDQwi3blqE0JoI40g/dFNR/6tkySrwHooCNqS+NeTPBk4gu5i+Yx2czP763+/i
         OHeYYCDzhxPDZXHlRbWNKqw8rPpJJA7sxgczJIcfEd6759iIfRgRigrdlVXPlsocuwV8
         1SbJ6cASDqqIfCmeirf75qQL3ALshy4vE+VBDkuiJE5nzd6sQEaQyknbH5LID6DfqZIZ
         n8+55OWyN+wS5xEqpeUAyglsZ0wARNIxnG5zBBwVFSmcHdh+lgjOJ/juSFbrQlP7CakT
         phIg==
X-Forwarded-Encrypted: i=1; AFNElJ9qadTXP3/ZrYbWlsBxkv6jlWX1UJebkfji2aN8fpm5yWLOa6FWSEv14UyKX3MkRK05nYLCnX3IdwM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT2b+MAMeqlGRup7YBRTnoQiPV5XrApQ43Fmn264AE+mlX8VH5
	KQ1t0Z9mOyVt9pjrZVJO9nuk0Urb0H5tvigJy0NjKPz9X38U4/4vaI3tk4FXqZW+c4+N9OTzub0
	1k99bgjpcvTSVscIUADbsczQJCeEvb9WtB6lEBbw+
X-Gm-Gg: Acq92OHzsVQ/iQRq6VueF+3GEl+dl3OAmZ6EuAAHfOF94Eo6zgNsvo/dcyQWzomCCHm
	zfOTLR5ngztvVcx1I0EJGsfFvOtt3bnihTJ4aPZO206xMft5oukayOm8NpfEtewmMI5tE6YhvZe
	gpM0fJXSqQ9hct8sUz4EX01h0mU4pGiMDEDTGGhsbjGULH80mTvgz0DN8fREziwxpXJpTWYBCum
	kqWap4syULl51Oxb2ALcV2U3Y6a8DYscfmBDJfl51DzRL1n/knEERE77dxzxMKZ0+MBUOnhioNs
	sT4us0q9Cz/Agam+lw==
X-Received: by 2002:ac2:4c50:0:b0:5a8:65ce:e83b with SMTP id
 2adb3069b0e04-5aa3238bcc6mr8479844e87.7.1779917054041; Wed, 27 May 2026
 14:24:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515090149.3169406-1-wenst@chromium.org> <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
 <CAGXv+5HC3dqgcE3KnKzakHHWFHB6m_X42orOkNUvZvp=SL_O8g@mail.gmail.com>
 <CAMRc=Med-_0GSYzoFBRiwFzBCK0DZqJD8_SEBxi+zwR20GS-HA@mail.gmail.com>
 <CAGXv+5GbW0bx3nKdZt2+tHuHyQ-J-1-Z79nMzHAwjmEPGKT02A@mail.gmail.com> <2026052710-flagship-unsmooth-ce82@gregkh>
In-Reply-To: <2026052710-flagship-unsmooth-ce82@gregkh>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 27 May 2026 23:24:02 +0200
X-Gm-Features: AVHnY4LeDHWwGMjgnhSmei9PL68DdRKYxFo5lLp-irYNZJy9WYHdf0RaNUwFV18
Message-ID: <CAGXv+5HdrKjFe=jZFYQzanmHOgCNOXRydLCvsM6o=DGhoO1HBA@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] arm64: mediatek: Add M.2 E-key slot on Chromebooks
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38112-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[x:email,chromium.org:email,chromium.org:dkim,linuxfoundation.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 733395EA665
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026 at 7:42=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, May 27, 2026 at 06:21:00PM +0200, Chen-Yu Tsai wrote:
> > On Tue, May 26, 2026 at 11:48=E2=80=AFAM Bartosz Golaszewski <brgl@kern=
el.org> wrote:
> > >
> > > On Sun, May 24, 2026 at 10:06=E2=80=AFAM Chen-Yu Tsai <wenst@chromium=
.org> wrote:
> > > >
> > > > > >
> > > > > > I expect some discussion on this patch, because a) it adds some
> > > > > > OF-specific code into an otherwise generic (core) driver, and
> > > > > > b) it doesn't yet handle USB 2.0 / 3.x shared ports; it ends up=
 powering
> > > > > > on the port twice, which negates the port reset part.
> > > > > >
> > > > >
> > > > > I understand that you do this because the port device has no OF n=
ode
> > > > > assigned. If we wanted to call pwrseq_get() for the port device, =
is
> > > > > there really no other way to associate it with the correct pwrseq
> > > > > provider?
> > > >
> > > > I suppose we could tie the "port@X" node to the usb port device, bu=
t
> > > > AFAIK no other subsystem does this so we would be introducing a new
> > > > pattern.
> > > >
> > > > In the M.2 pwrseq driver, we would have to match by port node inste=
ad
> > > > of its parent device node. We may end up with different behavior fo=
r
> > > > the USB target vs the other targets.
> > > >
> > >
> > > I imagine, we can check the bus type of the parent device to know if
> > > this is USB?
> >
> > The "bus type" type is probably not exported. However since the DT bind=
ing
> > explicitly says which port on the M.2 slot is for which connection type=
,
> > I think the matching can do a special case check for the USB port.
> > The next obstacle is that the target string is not given to the provide=
r
> > match function.
> >
> > > > Also, the "port@X" nodes only exist for the OF graph connections to
> > > > connectors and/or muxes (this series doesn't deal with the latter).
> > > > For directly connected devices, there is a "device@X" child node
> > > > directly under the USB hub node. That node is what gets tied to the
> > > > the USB device.
> > > >
> > >
> > > Is this a problem? I don't think I understand what you're saying here=
.
> >
> > It shouldn't be. I'm just saying there would be different behavior on
> > the USB side for connectors vs onboard devices (like hubs) device nodes=
.
> >
> > I talked to Greg earlier, and he said not to touch the hub driver; the
> > hub driver should only deal with features from the USB spec. The
> > "onboard USB devices" driver is what should be used. And this would
> > be a proper case of adding an auxiliary device to the M.2 slot driver.
> >
> > However this seems to completely decouple the power sequencing from the
> > USB core. Take the USB A connector for example, it was recently added t=
o
> > the onboard USB devices driver. However the connector has a device node
> > that is not a child node of any USB host controller or hub; it is conne=
cted
> > through OF graph. At the same time, since it typically sits at the top
> > level of the device tree, a platform device is directly created and the
> > driver subsequently binds to that device. This is totally different fro=
m
> > how the hub and other directly connected onboard USB devices work. In
> > the onboard device case, the device node is a child node of the USB hub
> > or controller, and the corresponding platform device only gets created
> > when the USB hub driver probes, thereby sort of tying it into the USB
> > device topology.
>
> Hm, did we mess this up?  If so, we can always change it if you think
> this should be done differently.
>
> Hubs should be dealing with the power issues for their ports, so maybe
> rethinking this might be wise.  I'm just loath to add hardware-specific
> hacks to the hub common code for obvious reasons.  Anything we can do to
> pull it out to a separate driver is best so it doesn't affect the 99% of
> the users that don't have that crazy hardware :)

I understand. The way I have it in this series is that besides having
the port powered up initially, usb_hub_set_port_power() port power
control also extends to the pwrseq target for the M.2 slot or USB A
connector, just like if VBUS was controlled by the hub itself.

M.2 slots might be somewhat rarer, but I think many embedded devices
have USB A ports with VBUS that are controlled via GPIO, not wired
to the USB hub's (if any) port VBUS control pin. This is also present
on Chromebooks.

I think wiring up pwrseq to the USB port and using it for VBUS control
on these USB A ports is an improvement over the recent addition of USB
A connectors to the onboard device driver, which just turns on VBUS.
It would make the power cycle loop in hub_port_connect() actually work
on these devices.

Is it code for stuff outside of the hub itself? Yes. Is it crazy hardware?
Maybe not.


Thanks
ChenYu


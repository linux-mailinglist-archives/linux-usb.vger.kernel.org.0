Return-Path: <linux-usb+bounces-37410-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIxKFH+5BGplNQIAu9opvQ
	(envelope-from <linux-usb+bounces-37410-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 19:48:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A611B5384BD
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 19:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8545C31E144D
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 17:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 281A84DC52D;
	Wed, 13 May 2026 17:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Myb2qtmm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130164DA559
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 17:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778693425; cv=pass; b=nsYmDwSheDhPZ+WQbBQSi6jUjWBjp15ph9cp4itYuzlyXfOBDcE+3SK9NFrUGsd77OEaumxj5qSKIMnEteiz5WxzddfGnALgaQMTxMT+Klfg+B7KmP421aRNiU1SKe2igVTnZK+ng0+jBlS0dwS0ZAHucseiiyKUPL3QsrLULS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778693425; c=relaxed/simple;
	bh=JPLT6FMeldEbFhJ09K/mL4agPV0DXAvQaThe6y1REcc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cPkb6Jp+d5nkCL1vfRLVFIbosJEg5+Jis99Bf1bHOjCm/u/M0Y+60w331GwLIBk06teNf8jvXQFwpTwVxra/fifU0fGkzp8blZENwuK5baJnSQwYVd++c+N3vuHqyWKpjWOkqrVqV5zhBghYgMOQdWkOjkMWUqgsIkk3RjLuqvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Myb2qtmm; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2f0ad52830cso10376530eec.1
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 10:30:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778693422; cv=none;
        d=google.com; s=arc-20240605;
        b=k3JSglEh1/U47hVaUi1zowJ30ARRX44NznHRdVLaAv4f7qZkxZ07+eEhaxmEipLoAj
         A/PUP4Nvbsn4SQO1l4cVvCZyqIEu6f8EiFdw+mdYczLbwJ2C6KMbfsBDpMKSl+ROBN3k
         qYDrm1eVJGCExMc1lpq8ak9osZKhNZ4ElG9F6u3+0mWQ+lHngM6J78Yxlh2uPNh+ikGC
         kc6YyJvO9CT1zeAQk2dSyREVOUX3Ib0czm7yXI+3jdyLVT+4GZ1UV4ZHg+V4pqOLjMG/
         n5MS8n+C1Dvwj4iL0gNRJssTZRch8FR1TjDtDF4GW6ki/hCu+qUowGzE5fbK7f+itdiG
         7ngg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YDUAur+XoWH6JFWlom4UBKGDg0H33xYVizwbBkMvANo=;
        fh=Rx8xaMbPV1meTeUCf2AE5m71Jd/MLQxOoOeMJuMpRRA=;
        b=MMbd9ieA1CfKJfVaokGBBMeootHxpAystrnbm4gitemk6cLYFnfx8UGm/aHEXyXSvc
         bjuoit1DVGXasfGZnFRVi6bc5fpxyxagoZqrbRXBvKC8ABAW0NDrFkOLHzY3YW7CAAZR
         Oiyq08ViVk3aJcPIShu540RDig7krCN9WPQjplGuWKXcNbMqFWHtX4hGeZ06Rm1p0a7s
         gy/ISGFFs8Q/mQUog+UInLKIRIIHcXUecl7urzQ1b1Y94Dy6l4qFm5ikhCuelSPCT96t
         aP16g9it2oYEfVyHsMdX8AgQOGv51URO9w8jLDzv4pCeTgw3X0z24i+573hC4yyS2/Oy
         LZcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778693422; x=1779298222; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YDUAur+XoWH6JFWlom4UBKGDg0H33xYVizwbBkMvANo=;
        b=Myb2qtmmEWFHOlXmcUwS8JtGLmsuI7inrmcQU+iPTH42mxnoa1ZxH9YLyLmmoPoVac
         pTB+UbXzRJ9vMcAYAcvh7XMp8mWMm+QAX6m2+HZKbXJk6pSNXB1rA5D5HpHpvI+XMj3Q
         /Ai7ZLztC6F9LvQUrKNwk11s+jjCqsWpuddo0O+K4vlBS0xLHZu1b4/I9yK8Aj6Hqey2
         94SKVCluyhtdUv0ezOIkw9yj+cGUpOrs9Zrp3Ut8bo05fMomAOF9qoBpaujprOYUMmtp
         gI+KIN9inWDtqC9bxQKllgKE0p7uf9EoUCakd48EApwwOBJCCplAWHdiRy/GNfgsk5wd
         7jyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778693422; x=1779298222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YDUAur+XoWH6JFWlom4UBKGDg0H33xYVizwbBkMvANo=;
        b=D4YV1QlRy25zaaO+pWYkw9UV8CECLwSwVG02/V6xFahaZtUY2i9WWRs2rT85oraUIu
         hNwbyDJI3hphBnOUjmAhFdfKlMwM7fWoz5nbG2rfUU3S4NUC9Hcut+y3leJryq93HTqu
         SDfDwQ/ItjLkuLApxfGjh+VEdXfwkqu7UcTjSCTkaQ6m0YAx7+iwgqyx/f7p1r8n1qcw
         T9pe8LIEEmMiZEGUddb34ZLwnuPq2yanjxgMq4h3ym+QuPmVgUVrnHY8+vkbBP/HzKdE
         c+y4iTwoki+kFQIaVINyE8yg1doHialpafdZCUpJzmX9auiJdS+ws3yuR90DfcAHOg/h
         ttfA==
X-Forwarded-Encrypted: i=1; AFNElJ8oVgnnSnX9QDG+5Y0f9c/IKXiyVxJaC3Ak7wlULZyBajiVFmZuQywzI0NEukgfKwc+KM0lR5CzH0M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEahxrgr/SEJPaqLKPPiyC7GJyMW9dOuazoWUYVTkkw/5GUcQw
	wHltjTUvlusS5T8GyNCwtZm7OkEe/ORj2fCGSQDpxJ0zxVsow/NBkLwitHfs9ZdXD9dhSu75AL7
	qKraLJnFWACeThtsbyMULxebZ8x0kyl4=
X-Gm-Gg: Acq92OHEO58tD8/rdGUabPI4rQ3iylYHF5YSWx4IK4fWtsEoqJJ2t+IralQUrar0TAI
	e3L8PuoywkeMBiS0JaeVQKIb2YQBV6Xu6KoI07x3w+Y1J8OvNJ2uWqDek3ZILwiu22zUVEiR7/L
	qUo6gUGnC/PVhUIITCxY8ugNRepI64iXKcX1IB0JDN304WGNiBIQ2txY0Yd0+jnasBxvLfsNZjt
	AeRflXjI/hHhKz532HhB2l9GQ6e671dc3Zhg0h2e8unQaTlzC4MfvK6Ehygjc3iYtb6f3VJeuML
	JyDNsAxzcieEDtEYMbE=
X-Received: by 2002:a05:693c:2b08:b0:2f3:c3d4:382f with SMTP id
 5a478bee46e88-301181aa331mr2513866eec.8.1778693422110; Wed, 13 May 2026
 10:30:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511135703.62470-1-clamor95@gmail.com> <20260511135703.62470-3-clamor95@gmail.com>
 <agJ/T8nBGWEoblmd@nchen-desktop> <CAPVz0n173syW9rXy7Qt_N=mChe6WBRLvjRDypcJEC50hPL4OMQ@mail.gmail.com>
 <agLb6mgP45jHjvNt@nchen-desktop>
In-Reply-To: <agLb6mgP45jHjvNt@nchen-desktop>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 13 May 2026 20:30:10 +0300
X-Gm-Features: AVHnY4LbEcLazP490SpFW2HazY7KluRMMma2mmpgzBcW68oL5O3KVQGdtgY1RmI
Message-ID: <CAPVz0n2yGALm1Z0j0j6_MaqAOZGL+a8EgCWYQpW0QN1YVf96EQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] usb: chipidea: tegra: Avoid controller/PHY init if
 bus is externally controlled
To: "Peter Chen (CIX)" <peter.chen@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: A611B5384BD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37410-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,netdev,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

=D0=B2=D1=82, 12 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 10:5=
1 Peter Chen (CIX) <peter.chen@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 26-05-12 09:13:40, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 12 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE =
04:16 Peter Chen (CIX) <peter.chen@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On 26-05-11 16:56:57, Svyatoslav Ryhel wrote:
> > > > If the USB controller and PHY are externally controlled, then the
> > > > registration of the controller and the PHY initialization should be
> > > > skipped, since these configurations must be done by the device that
> > > > controls the bus to work correctly.
> > > >
> > >
> > > I find you only control USB controller device add at PHY driver, most=
 of USB drivers
> > > has PHY control, for chipidea, it has PHY control at core.c, would pl=
ease try to
> > > adapt for it?
> > >
> >
> > Usually yes, but this is not the case for Tegra unfortunately. As you
> > can see Tegra specific section of Chipidea driver specifically
> > describes why it has to set PHY manually.
> >
> > /*
> >  * USB controller registers shouldn't be touched before PHY is
> >  * initialized, otherwise CPU will hang because clocks are gated.
> >  * PHY driver controls gating of internal USB clocks on Tegra.
> >  */
> >
> > So in order to provide correct work of USB when set by an external
> > device, both PHY and controller init/add must be skipped.
>
> You could call generic PHY APIs at ci_hdrc_tegra.c, after PHY init or pow=
er on,
> call controller initialization.
>

I was tinkering with Chipidea driver for Tegra a bit. If you meant to
use flag only to control usb controller device init and leave PHY to
be handled by controller, then yes, that is possible and that is
better approach.

> >
> > > Peter
> > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/usb/chipidea/ci_hdrc_tegra.c | 36 +++++++++++++++++-------=
----
> > > >  1 file changed, 22 insertions(+), 14 deletions(-)
> > > >
> > > > diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chi=
pidea/ci_hdrc_tegra.c
> > > > index 372788f0f970..593390a818d1 100644
> > > > --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> > > > +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> > > > @@ -32,6 +32,7 @@ struct tegra_usb {
> > > >       struct clk *clk;
> > > >
> > > >       bool needs_double_reset;
> > > > +     bool externally_controlled;
> > > >  };
> > > >
> > > >  struct tegra_usb_soc_info {
> > > > @@ -312,20 +313,25 @@ static int tegra_usb_probe(struct platform_de=
vice *pdev)
> > > >       if (device_property_present(&pdev->dev, "nvidia,needs-double-=
reset"))
> > > >               usb->needs_double_reset =3D true;
> > > >
> > > > +     if (device_property_present(&pdev->dev, "nvidia,external-cont=
rol"))
> > > > +             usb->externally_controlled =3D true;
> > > > +
> > > >       err =3D tegra_usb_reset_controller(&pdev->dev);
> > > >       if (err) {
> > > >               dev_err_probe(&pdev->dev, err, "failed to reset contr=
oller");
> > > >               goto fail_power_off;
> > > >       }
> > > >
> > > > -     /*
> > > > -      * USB controller registers shouldn't be touched before PHY i=
s
> > > > -      * initialized, otherwise CPU will hang because clocks are ga=
ted.
> > > > -      * PHY driver controls gating of internal USB clocks on Tegra=
.
> > > > -      */
> > > > -     err =3D usb_phy_init(usb->phy);
> > > > -     if (err)
> > > > -             goto fail_power_off;
> > > > +     if (!usb->externally_controlled) {
> > > > +             /*
> > > > +              * USB controller registers shouldn't be touched befo=
re PHY is
> > > > +              * initialized, otherwise CPU will hang because clock=
s are gated.
> > > > +              * PHY driver controls gating of internal USB clocks =
on Tegra.
> > > > +              */
> > > > +             err =3D usb_phy_init(usb->phy);
> > > > +             if (err)
> > > > +                     goto fail_power_off;
> > > > +     }
> > > >
> > > >       /* setup and register ChipIdea HDRC device */
> > > >       usb->soc =3D soc;
> > > > @@ -342,12 +348,14 @@ static int tegra_usb_probe(struct platform_de=
vice *pdev)
> > > >       if (of_usb_get_phy_mode(pdev->dev.of_node) =3D=3D USBPHY_INTE=
RFACE_MODE_ULPI)
> > > >               usb->data.flags &=3D ~CI_HDRC_SUPPORTS_RUNTIME_PM;
> > > >
> > > > -     usb->dev =3D ci_hdrc_add_device(&pdev->dev, pdev->resource,
> > > > -                                   pdev->num_resources, &usb->data=
);
> > > > -     if (IS_ERR(usb->dev)) {
> > > > -             err =3D dev_err_probe(&pdev->dev, PTR_ERR(usb->dev),
> > > > -                                 "failed to add HDRC device");
> > > > -             goto phy_shutdown;
> > > > +     if (!usb->externally_controlled) {
> > > > +             usb->dev =3D ci_hdrc_add_device(&pdev->dev, pdev->res=
ource,
> > > > +                                           pdev->num_resources, &u=
sb->data);
> > > > +             if (IS_ERR(usb->dev)) {
> > > > +                     err =3D dev_err_probe(&pdev->dev, PTR_ERR(usb=
->dev),
> > > > +                                         "failed to add HDRC devic=
e");
> > > > +                     goto phy_shutdown;
> > > > +             }
> > > >       }
> > > >
> > > >       return 0;
> > > > --
> > > > 2.51.0
> > > >
> > >
> > > --
> > >
> > > Best regards,
> > > Peter
>
> --
>
> Best regards,
> Peter


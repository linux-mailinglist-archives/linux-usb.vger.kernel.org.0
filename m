Return-Path: <linux-usb+bounces-37305-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJSfG4nyAmrpywEAu9opvQ
	(envelope-from <linux-usb+bounces-37305-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 11:27:37 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 788A251DA75
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 11:27:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A9B45306DCBF
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 09:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C873B777D;
	Tue, 12 May 2026 09:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSPEDZuu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09383AE6F7
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 09:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778577257; cv=pass; b=BP39jXqPgh+HZI6iZ72eRFjKfruEjMCWSI2Z9ah0LY9MatsinVsW/3ZJE0adsvFcofvbsuZVn0qVToAbtlaPBj2qFEKOTfEUKPJMR/VXvyUPpa0w/9P5Zd3op2txfcR85VsA/VD5Jik7ok2hflgMkWFOZOdQ439iy5YaqT0p2TI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778577257; c=relaxed/simple;
	bh=U5Mj/jS6IBak6dPGMQzKnxIz7rYyqJxSv4wWkZocyPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LrC2vUjC16Q+cL7DVkIUxXJ50pIQ0M+Ma4BwfC2j+5pCDx8G3P0nd10j3jVxrmzGdLmZ56iWYGmDNNDHGmIVygltX+N6Y/S+sHB3XqYFqcrzlRcDe+uWOu0kvM4/ZITKlLLdz2Pu/lhaUMmcWTFWYL+VoMy0WNl79TAt/PIGIoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSPEDZuu; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2ef38cf04f0so8049980eec.1
        for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 02:14:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778577255; cv=none;
        d=google.com; s=arc-20240605;
        b=O8S/oLnNhHmCgTvXPXdwSuRA57q/NDxIyyBuQgenfU4u7HSIX2yVhAONH4VaL7sZoZ
         KscCJ+xKGRfd9ngP1m36OE5NplWVxBrSJ39L6XiAJllR0vT63xih2OUY1F83Z+Q/mS61
         hI/m75hFudPhZGFyQKL9i29iosG8E7/COqEOgOqRJJ0SqXEUkoSRhuCrz+Y9KQGJHhZP
         77p+Z9bXIyZKAH/2z1By8Bgf9YMporLTMGky2WLVJ/qt9HJVElwNYTwYEqUJGcUvxEPb
         8092H3i8qNd8CTghI+JuZtf80uKwoWEvZ63wycK75sXkvL09lPnUczQ4UCrSsuuI49yx
         sVAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wLpXl5QYagjlZCBE/xNrRjwHqn2mCjrPyJN9NfCIzLY=;
        fh=tGH92tF54VE2i99bWPD6itraNb9uJ1plY/K1Lsyxhqw=;
        b=GY0jhtjp6lmA5P3j5PpUefKRjRfYnosZMtfTl4eckd0TNHcyBC8D7aQTNQ4A0Jn/HA
         pVMXKGVbwQn3FZy6vxmM7Q2XZpiNlDahkNjUdawKKGa3+d5S4GHz1A5YHGATkqvY84hp
         zqirLGNZa3ffUDNX7rIfgOc0RKGFye+9HbW4rg0gqdba3PbrAAbrfMPqPEjDhtsfkxLT
         Azfo4/aaBYhU7wrfCLBbrQH3OaOG+8V1DYHsdnX8tHged7icYIL7e2gQdQLkGz7PzG/d
         vfLBZ/cFCUefp5cbcvBjT68tHP3h35x1Ydz72bA7fyw1C+kzx/wM8z1xLXiQ8MqBQTV6
         RjSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778577255; x=1779182055; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLpXl5QYagjlZCBE/xNrRjwHqn2mCjrPyJN9NfCIzLY=;
        b=GSPEDZuuZ31Z+22dTEDRByST0/vCvq68t1D91nerRwYoArdfxg7W5/Mme1qiOlepi6
         FRLzMnKPG/Tt1+YCHHImv/D0RmhNeMBfJA+SPH2lm2AQx8od/5IOkc1WOOQSXCgCHnrg
         1W4k710vYtjIOut8/9X6vWP3IUF/jy6semioFVQLKlJFCtnqht/jwnhEojw1Uc0KO5qh
         9Faqalbmk2+j/2LIIS2sYCblIukJuzBWESC+v/pAVADwfvDL8XmurbTCugzhCXJfSa39
         AawmXB2O1sSVRGAPCtVNnFmiJL49ZELzH+vIfuxXTjdtp+wWLOLutDHoXOdJqJ8PaQsc
         dz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778577255; x=1779182055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wLpXl5QYagjlZCBE/xNrRjwHqn2mCjrPyJN9NfCIzLY=;
        b=sC9b4ltiScCjtwkzhOAEW8NlZyykppiCsiBpHQXhSsFTWc8VaAe3QjD/RINyx/Jli8
         Skb3D+p3qPJw2YelIE7XntLjnQqdqE/KocfPCdEeil2WIhVMl0Vf2vV7wm84uZFfXxsI
         bVCe+kwx8rPlvmm5Y1QG1Olks087kuHC+V41RXxZ/KCHZB5HW5Vt6oIa9N7wqLbpvNlL
         dAYZMt9c+9qnG/pS5J5mu02HgUbfCg610AKZaMDIbIG1gni6KO/hGmSPORA18BbVieMo
         YVwCjw0HJNAblRhkAYCztNSM3FB3drg+uP5HkCbf06YLO1jyLLZ+bIjCWlnH3ULV1CWD
         1DBw==
X-Forwarded-Encrypted: i=1; AFNElJ/TBXAtGk2UaHj8hFF+sm4Ch5pC9nkSaGt2+mcK4SdyiYipIKC5LT66/mnYj+4NSWjqejkng1Fos24=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1G6Gafa3QNNGA8KGNMSxSp7JOp0ymr+jG+xf8vRrstOLSsU6V
	eQAlMy0cHRD8RyPxQuGv083ryYBftyV1ng4hz8wWk3mc9WyIRqivYzkeYQTkGpDKe6Z7tENRTuF
	s7XMaUyqtVzRmgce3W00d0/i00tl3DZs=
X-Gm-Gg: Acq92OEFYCyu+Y0n1mY4mYLxiQi2udAEihjMf/Rg40FAAeRzRQw3um0nhRCHjg9RNZa
	FWTkwNHG+OfYgILOGwL2IE2W+/J+qZKCxIGgUqm86k0uM+d8x963/T3SRIeJc3qJb976d20yuMu
	RLg8+qtzTsLvU4y/tQEoepuojkkMjT45ON7kGoSFCldKdD1RIiy7VepoSITeopph7VaUoy+WBSg
	J3QhNzx8VryI7VupweDx/MV8WuoOMaTGJqN6iZBGukRBWXLUPki2l3cVe7Oh+ttOPAMzQZzwxJa
	/GNCJ+Ct
X-Received: by 2002:a05:7300:6da2:b0:2c5:50fe:c795 with SMTP id
 5a478bee46e88-2fb4bffa2c9mr6829180eec.29.1778577254951; Tue, 12 May 2026
 02:14:14 -0700 (PDT)
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
Date: Tue, 12 May 2026 12:14:03 +0300
X-Gm-Features: AVHnY4Ll14i93n_o4smARXMAmGSl_VWfrjFQ8sVQ8lXsJQoJqBmOJp3dhjRuJ_8
Message-ID: <CAPVz0n1Cgbik1_HvKO9i7ATr4OkS6yE_bwMw__yY_pNi0gQJNw@mail.gmail.com>
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
X-Rspamd-Queue-Id: 788A251DA75
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37305-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,netdev,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
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

And what it will give? Modem used in Tegra devices exposes its output
as USB device on an HSIC line. At the same time modem requires a
precise control when USB should be registered, to be able to register
and unregister it. This cannot be done by linking modem's phy to usb
controller, quite the opposite, controller must be linked to modem's
phy.

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


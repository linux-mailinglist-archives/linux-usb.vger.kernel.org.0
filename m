Return-Path: <linux-usb+bounces-37299-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGtuEFfFAmp7wQEAu9opvQ
	(envelope-from <linux-usb+bounces-37299-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 08:14:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6AB51ACB9
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 08:14:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 261AA3053A86
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 06:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD4874DA531;
	Tue, 12 May 2026 06:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6JVSg17"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215DF4C9564
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 06:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778566449; cv=pass; b=k62cMYiVrAMeaYG8Q0xD0cX5dORn0dMNOuucU8fRTftFmLlC3c77mnqQi0szfuX7zBFL9iZBZwU6jAiFhPC1uv0P3bdmFSdf0pgT3AFJU3ORQGXYpAXNRDemEbmjL/2t3GDYpbxbNN0RgejpIS4gdxrAa5BpREm3vlWbMPAbiHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778566449; c=relaxed/simple;
	bh=3ld4zdEky9JiorADEB2JzKLMGmxL8CZq09SENbVMLTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bhe9yUxuk/0gcWaA/wIThOpoq1kn/PpO7lbOdRoFoa6/IvLbVOXtBnpy36tZLN39rsvT7NhAAIEbGnWDe9jCyDkLO747l8YBp9b2Yg/dRLzKm8jEPjaxGJXlZ8dbFD940TeoF1GHsFwfERJ1JBh+7tyPYk10WPU1O3MlscwTJjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P6JVSg17; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2f0ad52830cso7500707eec.1
        for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 23:13:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778566432; cv=none;
        d=google.com; s=arc-20240605;
        b=dsjvC8xcIjbAzUUTzDcJ4VxOEGn1DZOjxtilhJ3k8Y0rgq43pJNoGkguk8l9p1v0wa
         SFEzjkfhku8pHJRdZ2H6Bk659zLt6Aha4+ZmhUyhknmGIDK2ZOKCrF9BLnPwQNeNSlv2
         E26zvSsNpMKWUZmJag5nOiK42BD1vIb+3RhftVef98PLn3WjvsnYBaJFZ3Xf+06KXerC
         YZJYuhaAHFVTN40oDxwbs+qIIdYDX7m/t3bKZq0jA7ggmstKsifivWSjWVnonhjmuJV0
         ijdz+D6GzSPXlp+/mkT6G+auCLG5G5BqD6WDgh976N5xZFPWBlQ62xOSrgHsqjgFS+FA
         +fZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yr8QRs98bsPiw0gF0kGFiK+9h78W1fGBBJoeOfjYUCc=;
        fh=tdFyji0Z/Bpa2EeQ7FwSXuKKKbFtfMv2J5VP1vvG/Qo=;
        b=Gj6API51cTwKRshsOPAQY3Ap9xRj3LBqg8Gufvahkt+vpD/UT5iFOVu6f4sdyyot2N
         6s7DuIcnUHO5vstL6PoDoBMkDePut50DFDiUkdfOFG5Nd+IdiU1/7LkPdNRurEAmfkSD
         Lropjdp/DS9EB6EWhkZh6cxj+RPQzy9MeNed2dgulSU6nlPgwCHpauTyUciQHbVt3ftQ
         TXxT5pNUlJ06R53XGMSIEbrzAWdHPBvLknDFUX6Sn5ilVHdm9ySz+326nY5l5nCadwI0
         mdJdKvhC1tbObhYqqyW1FaWAYwliiWO3+4FUuStTLQzMU66RGL5THKaiCviCz9LNca6N
         F66g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778566432; x=1779171232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yr8QRs98bsPiw0gF0kGFiK+9h78W1fGBBJoeOfjYUCc=;
        b=P6JVSg17mfG3AE++SHupyqKkJLaPPzom6Hym1yhnh9DOVxBji9AnJ3hls5QLmWd2TG
         ULq6zRBIkTtCCKHl/RGgKcP3NwzPXDUGKuv3j9xOZ8IVvN7cTQQtKwh1xBmkhS8Ip/dI
         gwUXG/gIKMWiY/1fAKKkeyuc5gMhyUcg18cf0fLz4gsWYuyey29l/rgRHUkaqPujaeyM
         aTmavwGzzsnO71xErdMSJdx5/+ZnQ5bp+9d/1ZzFEsd8MYd3HdaAOrZhEBJa7d0v7i7+
         vNVEUMU3/83mySnyyEUsL1VgvgozYrJEg2+UG0n2xUEJj733OO0F0x7ngpNZ12iyOWIL
         JZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778566432; x=1779171232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yr8QRs98bsPiw0gF0kGFiK+9h78W1fGBBJoeOfjYUCc=;
        b=oCH5ih1xCzES7QkgAOGRN9Vm0gBwAUAT2VLRhZmGFJk+4pK94v5ZUBTgajnBY8sQss
         UNURNwtNItwEg2Q0YrW19GCM39cK98lL4iR5HUvtJZr0UgjOjYwiavM0L1P6jYTQr+or
         h+6zlyklyICJFB7beSL6IzScv3rOqRxoE4aiRphNwUEo1mrFGyQ2O/1kQvm0nROymUU6
         Hzss0K1eXaHk32UerhdPLfpuMmTwNXWw1DyF/wDu5rB1MQP9Agu0W77S5FTXs74wA6TE
         Egvdl/aQQ4CTcfotx6D+Yut9eGprU8EwQNHJZLr2PcTZreLGwqPnEd7Jbxo2Lk75NuLy
         qy/g==
X-Forwarded-Encrypted: i=1; AFNElJ/wxKoV0n3BNttqQdHT+8ZOx418mQmjunz7uVDfO+YWbU9IISlpNYlViT3NiqfHZxTJvhg/ci7OqLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRJZVfeqtwyAlcCfU9RGqEkXek/O1MBjOk2bvfL2v3ltoCHXUl
	5CkryQRIwMn+JGyGDddMkkcuT5Wi8G1fAHgZARgYjTQGcN86UG4OCvceku9G96QXio5q6mPtjKz
	kFg97kILoIz2Bqh7ioFwnv/E7FDP7Clo=
X-Gm-Gg: Acq92OEwmByxNSRpUu+62MXuc/Bimg+MDBlXsyzWHZP4NOyhzzG9TEb/QEJhNGsXgiC
	EoV3W+KMhqM/i/c5JQpNlRZ2JurEd93I3UkUUK0RVXLQxOe9mDh9uKP/gUxHlz8GmTrY7gOvD4Z
	JfXdzcfi+qllMkw2o38emqf1NZoy4EcbfK9s630j4JxqHocWdKCD08CR/7e5Ot04qrnFX3CqFwZ
	9QkWN89BzeJo0J26/C5EwvxWvqhVUcR6EcYjxu5tO6CFY6XyQMBl3/lggyDSiC1SM012dwXeB9j
	AH7r7BKz
X-Received: by 2002:a05:7301:7213:b0:2e2:4979:ec7 with SMTP id
 5a478bee46e88-2fb4bff2949mr6162640eec.10.1778566431760; Mon, 11 May 2026
 23:13:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511135703.62470-1-clamor95@gmail.com> <20260511135703.62470-3-clamor95@gmail.com>
 <agJ/T8nBGWEoblmd@nchen-desktop>
In-Reply-To: <agJ/T8nBGWEoblmd@nchen-desktop>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 12 May 2026 09:13:40 +0300
X-Gm-Features: AVHnY4L1_bWZXCrp3MmGLMUWBEn-sMyg9m87GKXzm_vHqR-lTAFW3X_ZqIO7y3g
Message-ID: <CAPVz0n173syW9rXy7Qt_N=mChe6WBRLvjRDypcJEC50hPL4OMQ@mail.gmail.com>
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
X-Rspamd-Queue-Id: AF6AB51ACB9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37299-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,netdev,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

=D0=B2=D1=82, 12 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 04:1=
6 Peter Chen (CIX) <peter.chen@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 26-05-11 16:56:57, Svyatoslav Ryhel wrote:
> > If the USB controller and PHY are externally controlled, then the
> > registration of the controller and the PHY initialization should be
> > skipped, since these configurations must be done by the device that
> > controls the bus to work correctly.
> >
>
> I find you only control USB controller device add at PHY driver, most of =
USB drivers
> has PHY control, for chipidea, it has PHY control at core.c, would please=
 try to
> adapt for it?
>

Usually yes, but this is not the case for Tegra unfortunately. As you
can see Tegra specific section of Chipidea driver specifically
describes why it has to set PHY manually.

/*
 * USB controller registers shouldn't be touched before PHY is
 * initialized, otherwise CPU will hang because clocks are gated.
 * PHY driver controls gating of internal USB clocks on Tegra.
 */

So in order to provide correct work of USB when set by an external
device, both PHY and controller init/add must be skipped.

> Peter
>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/usb/chipidea/ci_hdrc_tegra.c | 36 +++++++++++++++++-----------
> >  1 file changed, 22 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipide=
a/ci_hdrc_tegra.c
> > index 372788f0f970..593390a818d1 100644
> > --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> > +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> > @@ -32,6 +32,7 @@ struct tegra_usb {
> >       struct clk *clk;
> >
> >       bool needs_double_reset;
> > +     bool externally_controlled;
> >  };
> >
> >  struct tegra_usb_soc_info {
> > @@ -312,20 +313,25 @@ static int tegra_usb_probe(struct platform_device=
 *pdev)
> >       if (device_property_present(&pdev->dev, "nvidia,needs-double-rese=
t"))
> >               usb->needs_double_reset =3D true;
> >
> > +     if (device_property_present(&pdev->dev, "nvidia,external-control"=
))
> > +             usb->externally_controlled =3D true;
> > +
> >       err =3D tegra_usb_reset_controller(&pdev->dev);
> >       if (err) {
> >               dev_err_probe(&pdev->dev, err, "failed to reset controlle=
r");
> >               goto fail_power_off;
> >       }
> >
> > -     /*
> > -      * USB controller registers shouldn't be touched before PHY is
> > -      * initialized, otherwise CPU will hang because clocks are gated.
> > -      * PHY driver controls gating of internal USB clocks on Tegra.
> > -      */
> > -     err =3D usb_phy_init(usb->phy);
> > -     if (err)
> > -             goto fail_power_off;
> > +     if (!usb->externally_controlled) {
> > +             /*
> > +              * USB controller registers shouldn't be touched before P=
HY is
> > +              * initialized, otherwise CPU will hang because clocks ar=
e gated.
> > +              * PHY driver controls gating of internal USB clocks on T=
egra.
> > +              */
> > +             err =3D usb_phy_init(usb->phy);
> > +             if (err)
> > +                     goto fail_power_off;
> > +     }
> >
> >       /* setup and register ChipIdea HDRC device */
> >       usb->soc =3D soc;
> > @@ -342,12 +348,14 @@ static int tegra_usb_probe(struct platform_device=
 *pdev)
> >       if (of_usb_get_phy_mode(pdev->dev.of_node) =3D=3D USBPHY_INTERFAC=
E_MODE_ULPI)
> >               usb->data.flags &=3D ~CI_HDRC_SUPPORTS_RUNTIME_PM;
> >
> > -     usb->dev =3D ci_hdrc_add_device(&pdev->dev, pdev->resource,
> > -                                   pdev->num_resources, &usb->data);
> > -     if (IS_ERR(usb->dev)) {
> > -             err =3D dev_err_probe(&pdev->dev, PTR_ERR(usb->dev),
> > -                                 "failed to add HDRC device");
> > -             goto phy_shutdown;
> > +     if (!usb->externally_controlled) {
> > +             usb->dev =3D ci_hdrc_add_device(&pdev->dev, pdev->resourc=
e,
> > +                                           pdev->num_resources, &usb->=
data);
> > +             if (IS_ERR(usb->dev)) {
> > +                     err =3D dev_err_probe(&pdev->dev, PTR_ERR(usb->de=
v),
> > +                                         "failed to add HDRC device");
> > +                     goto phy_shutdown;
> > +             }
> >       }
> >
> >       return 0;
> > --
> > 2.51.0
> >
>
> --
>
> Best regards,
> Peter


Return-Path: <linux-usb+bounces-33000-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDkpBkKVgGnL/gIAu9opvQ
	(envelope-from <linux-usb+bounces-33000-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 13:14:58 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 441C3CC408
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 13:14:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B4CA63004D13
	for <lists+linux-usb@lfdr.de>; Mon,  2 Feb 2026 12:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C272C3659E7;
	Mon,  2 Feb 2026 12:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISBRKwJZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23B42E543B
	for <linux-usb@vger.kernel.org>; Mon,  2 Feb 2026 12:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770034468; cv=pass; b=lHtr0dzehl/aJ6CnfUlvq3tn7KxzB2jxLH+FR3qoNE9FZyKg83MW5/J9wcILVgVlgKDXkLCPQH+5EC6LtMvVq7+LHPrDAbNVhL0NKo4uTzPYl4MJEwkkiouPSmuu9ZsGtUkUXth9PKgdwqV4xCXw22YEGTeVaTv/PorTjje0mZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770034468; c=relaxed/simple;
	bh=4vOMU3KJblqcvy4DJHgfLqxLPeHzwlcx9CR/HjnFSHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M3q9ORaS8nru1R1o0C0slInzmUpDqAa41SUrSTbJFZ6QrDOfqcxMG02NYN8OUW1VpXX7d2bc7zhqSE/zlgkdLRHzNThfDzhtdzF52+ekavugukwECSwMPseCih3moVfdCjc/AFOc8sAn2fp23Jissg/kmbxyZm78pXSRIk81bR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISBRKwJZ; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42fed090e5fso3498215f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 02 Feb 2026 04:14:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770034465; cv=none;
        d=google.com; s=arc-20240605;
        b=a7HHaakQRE0B7s7RQm2UkgNR6XTJHyzKw6vpYdo27oQtssXVx+sA88ycBKIR0BKhbf
         OUt0RN7pSoS8vTxhlV58tqQ9xW6Z+ZvgaPDs6BzDvyoF6HrFGS+fdOv3OwPyQ3zKs/8a
         sORwL72awRIEiF5UXfM861QHfuScMcNMMfcoftYl6zeDEslkkdvoLvshEVJXG2dp79Ql
         il1hRreWAtPX0e0ANPjCL1IRhZgaF9iYJrQOxX2OxurF+p/JIpNhMnddaqN4U98GEzbI
         X5b5kkAyHfgNlvhrjGEsFrht94KHW3BR0TW7ez6LOgI7bLbyyrKmB1bG115tQsFfrz7O
         83DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=56+fWCwV/1yCfXrVGr4I8X47r1cy6upQroC6izF7fa0=;
        fh=zdDdr9aEcVVs8RwuZgQMkJ0zreDrVWsZZvBaRGA74PQ=;
        b=JZ7p0J/ShuXYNR3UupQV0ngutx9wZh4mPyVlttQtAF8FrlQ4dFGfDSKG32e5pJArgY
         UX0lIm5WCzfyceqB3Wnt+sd1fpQKem4OC+/sRtVuW3dnfWisiHDP8W3CA+kA9a9bHurt
         7zuUdunW1yEYFbrkaH9F2tR/ChWrQOiFQ95WUdtApilkPuGWc4WQQv1O6K6Ipvk8ifTN
         56R8LEgKFhQPlif3hYZsqSqwBBxOfEgg0KtCTJI4snKucSpBPwVtHQGJ6RH3N4tk4WV0
         ZMIRN7zxkodimiiHJJrnPtS5V4n/jBFYJ6JIogA38L9mrVdg8upMnWeDZ2umi78JkkCf
         Yssw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770034465; x=1770639265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56+fWCwV/1yCfXrVGr4I8X47r1cy6upQroC6izF7fa0=;
        b=ISBRKwJZPrbbdraoAqnNd9CJnTw7EuEmbeLCLs10SoxJS8oY4HOXRa4mp9YF1p+k94
         bZyue2NWz5E7KYG+3K0dWVvJ03+q+DjMIp1JP7s+jmipI1umSpXBF/dH4hntbnwCbTjb
         YdyrySz5dsec03gvBXloifbsYY52gLM3nYpp2wGrUKszMqiUB+5C8+Ul9J13Iqk6Sva1
         KNPGNATZ+8Ofe/qm8Zowf0EwAgVtf0wL8tDPD9xTSnyRcFw+6EWqhCpCyrZubE2JYJfC
         PjWn9lwuqHqO5hRyh80thRyqIiEeUgVegj2DeiB3pqVq/OgJ01XbnJzocaeGjsVxdYoT
         X3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770034465; x=1770639265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=56+fWCwV/1yCfXrVGr4I8X47r1cy6upQroC6izF7fa0=;
        b=Br9F/5oikvmab7fjVgHLiJKEStFQV7WfZqvGDeqtcCuEpxWqwfowkkRSk7YoBeQniH
         KRF/E1F0zVV8CgLQI8BkcDnWM1T4hamG43ksQV8boWoUe4jt6SHHkF9PtxXUeRgqk2BA
         O6FrMxq7BnSiBuZ3bcsqTz4JTSeJPjfJ2uX9oZ0YBfcxKDhhkqqhbKYvBklzFwHm0pdF
         qzSf3ylr7TZ2r/dFOyUA7iyLaDAcSXjS+5iHDtLioN05Ovj/nlBpo+hSAd2hom9xK6ux
         GvVJNnfXaimns7us5wapy67xScaL/q8J6cGB4nATOUyAhtl1n6uIE+3yEVzhmPBKYcJs
         d98g==
X-Forwarded-Encrypted: i=1; AJvYcCV4nlsMTPtKzoUBfyW5lbYrRMsmi4hznnRO11yrKH+3bmDhUkE5lcCbv4r8kZLxtVMCDU6wjyG+wpw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNKB9KGOYn2xTSaoPWpqTsCjgtUWg9+6Uux9n45uOiIziD74v6
	TVIOhWuNL/i/r+S4oykZ2fhXLn3tyLwhGJcrrv++NUlkpUqy7PSPPWebelQ4Pdds7a4BX9LuJ+j
	DsEDMCS1lC1a15b7MkNvbRnPaDCk7OSU=
X-Gm-Gg: AZuq6aJCJ835ngcAG5lGfclUudujzO896M2s99r6GZ5g4AqdPpGxvq2bY4mkOTVR2U3
	MEaLvW1g+558yyUpDhflpPZyK9zpie+JuUO6a5lpBVwghUgyMkjQvYd7as3J2+7cVE51p5hMand
	/OSU3KzvuZbfCnE18Xn9nrU42ZTIVjcp4P6dYpz6Z59RZDcsld9QPcZ0lD2te4jci/4XvXnBFCz
	N9mL1tYhlJYIMRToPV94HKZ5ccb3DeeBTuLWqhJaZZMcxVoVJIFaodJ+TSngJMI1MaVlEmu
X-Received: by 2002:a05:6000:2385:b0:435:9ce0:f93c with SMTP id
 ffacd0b85a97d-435f3ad5b8emr17364591f8f.62.1770034465115; Mon, 02 Feb 2026
 04:14:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202080526.23487-1-clamor95@gmail.com> <20260202080526.23487-3-clamor95@gmail.com>
 <74268def-31fd-4015-8be6-faebd6676667@gmail.com>
In-Reply-To: <74268def-31fd-4015-8be6-faebd6676667@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 2 Feb 2026 14:14:13 +0200
X-Gm-Features: AZwV_Qhc04t50qV84MOPj_KuJjhvIvyYToXV4PJJJWcC5DH3b2UIXHdWJaS3HN0
Message-ID: <CAPVz0n0giLnk6caoZFHZS52XCfA_CN1BqKjSQQGnbHBdHGikiw@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] usb: phy: tegra: return error value from utmi_wait_register
To: Sergey Shtylyov <sergei.shtylyov@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33000-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,nvidia.com,gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 441C3CC408
X-Rspamd-Action: no action

=D0=BF=D0=BD, 2 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 14:05 Serge=
y Shtylyov <sergei.shtylyov@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 2/2/26 11:05 AM, Svyatoslav Ryhel wrote:
>
> > Return exact error value from utmi_wait_register during HSIC power on.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/usb/phy/phy-tegra-usb.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegr=
a-usb.c
> > index 3a7a74f01d1c..6173b240c3ea 100644
> > --- a/drivers/usb/phy/phy-tegra-usb.c
> > +++ b/drivers/usb/phy/phy-tegra-usb.c
> > @@ -891,6 +891,7 @@ static int uhsic_phy_power_on(struct tegra_usb_phy =
*phy)
> >       struct tegra_utmip_config *config =3D phy->config;
> >       void __iomem *base =3D phy->regs;
> >       u32 val;
> > +     int err =3D 0;
>
>    This initialization seems pointless -- the newly added variable gets o=
verwritten
> by you later...
>

So? let it better be initialized and rewritten then later on catch errors.

> [...]
> > @@ -984,12 +985,14 @@ static int uhsic_phy_power_on(struct tegra_usb_ph=
y *phy)
> >       val |=3D UHSIC_TX_RTUNE(phy->soc_config->uhsic_tx_rtune);
> >       tegra_hsic_writel(phy, UHSIC_PADS_CFG0, val);
> >
> > -     if (utmi_wait_register(base + USB_SUSP_CTRL, USB_PHY_CLK_VALID,
> > -                            USB_PHY_CLK_VALID))
> > +     err =3D utmi_wait_register(base + USB_SUSP_CTRL, USB_PHY_CLK_VALI=
D,
> > +                              USB_PHY_CLK_VALID);
> > +
> > +     if (err)
> >               dev_err(phy->u_phy.dev,
> >                       "Timeout waiting for PHY to stabilize on enable (=
HSIC)\n");
> >
> > -     return 0;
> > +     return err;
> >  }
> >
> >  static int uhsic_phy_power_off(struct tegra_usb_phy *phy)
>
> MBR, Sergey
>


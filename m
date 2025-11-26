Return-Path: <linux-usb+bounces-30939-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5695BC886F7
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 08:36:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AEAAE4E5363
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 07:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD022BE64A;
	Wed, 26 Nov 2025 07:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nFyvzeeW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91182296BB6
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 07:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764142584; cv=none; b=pgA8uost5VS0viZSirMMt9PDEAHgHN9UmLDTOKHjpiZuxDFQgxYHqF6ap61gtblG4S4KIBezTkZ1/Js0RlriD7WghZwd8u1gjLzs+BBpTONPNpfz9EH0eI5rErSA+MZlKunggtXk7tKI1Q/OV+SMl43HF3d8ofqMF+5DpPZoydM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764142584; c=relaxed/simple;
	bh=+NYZTcPMfQw8EVvM4OhMcZhhk3laGmdMxWTa5PItr74=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W4vJcprkIX/X3WMotETbjmthiHnMSGNSbo6j7u7nnMaHVJVAzX+JQ4xmEcY1HESyv/CQ6Gwvs4xQjbOF1URafZqSMshHGVznVEpenf7KDaDqh/UNrcWG73c7RNSNSBOlDzMnym3sK1LUlm0JeiO0xm4CVAMfHGQ3SPU0uvg3EtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nFyvzeeW; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-429c82bf86bso3689768f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 23:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764142581; x=1764747381; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uwb4gEZQsVssNNQKKaHnFD1mEjqfKdCKrDRZhkYlGCU=;
        b=nFyvzeeWb9JDcvgVDAYupEKe6ZHkm4uagrSkxVy2oqcywFoW45d+53JI8Nr5+qYYk5
         E//hPD8GXgnK0x3i/VMddEYgSaHT3RVgkIU99oOD27WsgW2yYMqTfzD5ZCSoPEChDHqx
         bGqRS9VW0ZbCXoIB3PShKO1uljkgYEPFZyVglhtvpNYP6YDL2/oYOL26xBnBB1zeQMk7
         toOfRW7KauApdiCrw7EGdjcPufAEEJvL+bg3gExLqk8LlS+0NgPcDpByO2u3L93zgjhD
         M6qx7s1XLLnoV6Z4k9Nk1LD/mNWQX0EDxBfESv0dTGZ8AkTjN41+5c+GKID4dkZOAFzN
         1r1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764142581; x=1764747381;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uwb4gEZQsVssNNQKKaHnFD1mEjqfKdCKrDRZhkYlGCU=;
        b=W0NxnDqc/tv/1cuIT4wzIQaJCzbPjvE5FzBQB+C+ArBpOHhxV3SjqypFZLkuQMw2Lv
         n8/rJmdEPAst1JAJy0uNe9+1Bz6B6D7WPrI8U8hwRO45I/tduzwgjrrUbLewkL9AP122
         OSdpBf8EdKjq7sgL+PobiD+KF6olu6iMBpLC5sanZQ/Z0SwX5agvCAc5UvLmOvjis7WG
         hwswmkZwJVZ0NCTzMtgG7qC2K6yliHWTTaReDpmE0ljKzUL/F8aA1I5z412hfyV4j3co
         ZnbRDG5IRU+GYidGKuPZ5vAXLV0ZXFlvNl+zcno3xh3ao/Nw52BdTaCgwsyqmmF32xLx
         w/fg==
X-Forwarded-Encrypted: i=1; AJvYcCW80hbfJm2ENGa1F38IRlh+cu7cpvpu4Iep1thJSNBIVuxremttkq5MdvwXJLJ6n0OBBqYiNkfysc4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3CHvzafU098RIYogyn7Z688ejp/+pbesWl5iQZklOqt5bNwut
	4Di5NS4p0HgsKwgQiWpNFvkcL2ap9ihA8XJBLRG8r0IRAQ940DP73gbBvQBw2+CJEaU=
X-Gm-Gg: ASbGncspYMTz9eajtK5nLp0K2dG0Q5tA1itDzWPR3HnqGhR3nd6ZK534lhv905+TwJy
	Xh7pCe98cpzr1rDeczTKM3i9/yFqmVQlLU/r9Ub6J6FuARM6c21oeMJIs00xab9Wl7OimiiiIeS
	GXUqlXzYJ5rpJtDV9ToTcQvu1I5T4Q1Kr/pLLOlZvPWBd3KDZC4UC2zYRg5uCa8cpBqgdzPmpzQ
	k0LUhT5f0ARrP7apXrsknrNCt5PeaX+gjvZWeLa3UtSqoM5g6I9SEicVFQSpMdEDZczhLiccxbb
	rK37fwsz3ld7joas3N3NG6e1bv9kiWvfcHXJdrx0xYEXIZgtsh/MpjoMl8Ubx7vc7PPtAYeeXjw
	wrzMumoXlDyGGDK9mzfomJW7IGderCQ9SuWqYiReNLip0JIghoD2yEbytrI/pcTValT6eKuKZj6
	BI5BhFq0UYonO5dk55
X-Google-Smtp-Source: AGHT+IEkJIVmft0K1+fBvK9APlqevDyQqqLhuiwQwAv9PNhWzAVjw6Cn97feu3xnWTKXQ+ps5Ed2JA==
X-Received: by 2002:a5d:5f91:0:b0:42b:3bc4:16e9 with SMTP id ffacd0b85a97d-42cc1abdf6amr18484142f8f.4.1764142580820;
        Tue, 25 Nov 2025 23:36:20 -0800 (PST)
Received: from draszik.lan ([212.129.87.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb919bsm38547158f8f.34.2025.11.25.23.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 23:36:20 -0800 (PST)
Message-ID: <1fafb9117a9faa32222a55efc77794156635d105.camel@linaro.org>
Subject: Re: [PATCH 4/6] mfd: max77759: modify irq configs
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Amit Sunil Dhamne <amitsd@google.com>, Sebastian Reichel
 <sre@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Lee Jones
 <lee@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Badhri
 Jagan Sridharan	 <badhri@google.com>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>,  Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Alim
 Akhtar	 <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, RD
 Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Date: Wed, 26 Nov 2025 07:36:35 +0000
In-Reply-To: <e25ff0e5ff103433942fc7744eea4a3c61ce1daf.camel@linaro.org>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
		 <20251123-max77759-charger-v1-4-6b2e4b8f7f54@google.com>
		 <5c901a6c831775a04924880cc9f783814f75b6aa.camel@linaro.org>
		 <aa7bdeb1-c8a9-4353-af56-869f16a083c2@google.com>
	 <e25ff0e5ff103433942fc7744eea4a3c61ce1daf.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-11-26 at 06:44 +0000, Andr=C3=A9 Draszik wrote:
> Hi Amit,
>=20
> On Tue, 2025-11-25 at 17:10 -0800, Amit Sunil Dhamne wrote:
> > Hi Andr=C3=A9,
> >=20
> > On 11/23/25 10:21 PM, Andr=C3=A9 Draszik wrote:
> > > Hi Amit,
> > >=20
> > > Thanks for your patches to enable the charger!
> >=20
> > Ack!
> >=20
> >=20
> > > > From: Amit Sunil Dhamne <amitsd@google.com>
> > > >=20
> > > > Define specific bit-level masks for charger's registers and modify =
the
> > > > irq mask for charger irq_chip. Also, configure the max77759 interru=
pt
> > > > lines as active low to all interrupt registrations to ensure the
> > > > interrupt controllers are configured with the correct trigger type.
> > > >=20
> > > > Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> > > > ---
> > > > =C2=A0=C2=A0drivers/mfd/max77759.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 24 +++++++++++++++++-------
> > > > =C2=A0=C2=A0include/linux/mfd/max77759.h |=C2=A0 9 +++++++++
> > > > =C2=A0=C2=A02 files changed, 26 insertions(+), 7 deletions(-)
> > > >=20
> > > > diff --git a/drivers/mfd/max77759.c b/drivers/mfd/max77759.c
> > > > index 6cf6306c4a3b..5fe22884f362 100644
> > > > --- a/drivers/mfd/max77759.c
> > > > +++ b/drivers/mfd/max77759.c
> > > > @@ -256,8 +256,17 @@ static const struct regmap_irq max77759_topsys=
_irqs[] =3D {
> > > > =C2=A0=C2=A0};
> > > > =C2=A0=20
> > > > =C2=A0=C2=A0static const struct regmap_irq max77759_chgr_irqs[] =3D=
 {
> > > > -	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_1, 0, GENMASK(7, 0)),
> > > > -	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_2, 1, GENMASK(7, 0)),
> > > > +	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_1, 0,
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_A=
ICL |
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_C=
HGIN |
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_C=
HG |
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_I=
NLIM),
> > > > +	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_2, 1,
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_=
BAT_OILO |
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_=
CHG_STA_CC |
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_=
CHG_STA_CV |
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_=
CHG_STA_TO |
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_=
CHG_STA_DONE),
> > > > =C2=A0=C2=A0};
>=20
> You should also add the remaining bits in each register here, so that the
> regulator-irq can mask them when no user exists. It will only touch the
  ^^^^^^^^^^^^^
  regmap-irq

A.


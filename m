Return-Path: <linux-usb+bounces-30937-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 057EDC884F1
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 07:44:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E0CB34E26E6
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 06:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB8A30CDA4;
	Wed, 26 Nov 2025 06:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sEkxo4FN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37E3318120
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 06:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764139459; cv=none; b=LR4feA5TfAZGpsK0D7zmk8VP/rzImU3wqCscbyXOYYUoeHHC5DnaykDQthvDQrBlrHRBiTbV9GNutPffZQbyJcaFAiOxZx1qpqEhB/BqkEvWPFkvJPcM3DMsbhukqdb9nx3JTX3im276thg68rNhZI2h43T1iMjaThNPLkkCB/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764139459; c=relaxed/simple;
	bh=Etr+Ix0Iw21+0ZkT9TJ1m440KHu3t5b0AqRdb6wd3oE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bw/kzKgOnjSCTtmvvYB9KR0gi86guvmshegW3laRwi+uGAVQxVCQfbUsXgZ059mtZEr0OBN2KJS11NOfRUDJ7cC3SxU8kZl8mbyxqUr1EafHpCBdGnFwr1RfhqtHsTe+LzhzpB7nFUgENp5uCjj07pIm4nGHz7vUIQXZ/Ptx7F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sEkxo4FN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477770019e4so52694675e9.3
        for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 22:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764139456; x=1764744256; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iagMIGIeHxyM0iFPX2ThJoiCFK8Ow6UALIrOqYnhTgg=;
        b=sEkxo4FNAaggmEKWzQPa5gxZBF43mgLKyvRcMpAC7TsCaKcScDt7nN6skKpDJ3H7m8
         Ene9A1fxI/8NvnuNGkbpTxWZ0rMZr7d9BpmxNTxz1BQgGT23xbTAvlT4LmX4aJV78sea
         ZPsvECfQloLv4KJb6ojxpaLJym5P6NYMx62E2k6kKg7MzSlc9/+eIhlTD76PMfuMQw5J
         1F/fLBVE1Sb/60y4KBNlaOg/sIrrwQ6pV2I+XrM9p+rlAqz+CELueA+TPNo9Mbdpzciz
         MvStquhWftveiivwtI9aaw2ZQ7W28t2z97z2iiAKyRUacVfDQN6YuYTogNNpecR1SVXz
         2/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764139456; x=1764744256;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iagMIGIeHxyM0iFPX2ThJoiCFK8Ow6UALIrOqYnhTgg=;
        b=d06T+d7po+vgI1thUU/oH1E/BVLZeES8UPvp5/rzIRVlqFhUtpbk4+g3wPtoyo90v+
         Xuf+Mr7Y7gLryHcFGzRUGjwHXLXlq55VcqqnGPRCrgJbCrOUzaSoVQuoa3jJ+sSKyII7
         iRYBeN0Jy6Km5Vrz76fG/eFxQdylKruYAZ77n4w8PnUMABtcJV5NYbys0W2UcR4odbGs
         PDp4uf7TihqwgTTF0Y4NmGmPq3RDzaj63XdwsYfaO8DwEVVYht9otF45Y2zulnjdZGvg
         dol9n4hp//df+IPh6Zk7D3s/FggYAVIdxu91T+nOYTy8iTCn2CGDEPLDHiR1Xj1wLsu3
         fxhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOS1SU+auu1fCvmQYhGkGnzijPQfhttGJcVGUca1VyBKwKQStjp22jM3WpWl/lUX3cFUtHHSUtqf4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqElz7WqmvHptXn4s6tya3WasliBYTNAyBsA2v88bECWXbSwQ4
	WIvN6VlcEpoDRcgsEXWULND082Zy6r+c6rMyvdsHr3ZfQ+8Fa0Z0AOAl8PbhBzfqxKo=
X-Gm-Gg: ASbGnctBla+eWcDQuNU2HXl+ol+uaT6IQVJWzb5ph2h2G6Ek8q1AXpNNpLnZybkhnct
	n/YnQFj6ZPgoELgin9BokapcRyZdOySSFT4KYqq5bElzK1pFMK9eDH9+oFSufDR/6Zoeg1H3jdC
	OqRyOg1IhS/WowdY1y5v2b3sG+0Zntpuqe756kBYkju1K1gU61VIZJ+sUYCyyfmeZJgma1Pq1ZM
	p7VBq3O7naacJDZFXoq1uwcxSWvvlWM4CqayEPg5XFEav28iT/d4T4/73FXnihz9ebJU7Ruu1HZ
	10zMhzzv72D+1VauJWV8Csi1/Vx3utAzC4fd19hH+KIErY/1Lt6ILD3uWDUaNgbxnseFwSzgk1J
	6N8Wzo/7KV/Vuo9quI4XLjQuJuIjx1fSrSoqwkOFMskQGVbNqgsXmyIySWNKaNCMjbAnKkoQS/K
	aBD4SOcQbp7/4BaSFG
X-Google-Smtp-Source: AGHT+IGY6wpQR5oGHT//GHTCibu+r9RkZemJQTbELxXxGfU09J5aQ0TWFaLsehta2pjsoi8ZOGTqhA==
X-Received: by 2002:a05:6000:2891:b0:429:9323:2bec with SMTP id ffacd0b85a97d-42e0f356945mr5897156f8f.40.1764139456149;
        Tue, 25 Nov 2025 22:44:16 -0800 (PST)
Received: from draszik.lan ([212.129.87.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e454sm38406428f8f.2.2025.11.25.22.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 22:44:15 -0800 (PST)
Message-ID: <e25ff0e5ff103433942fc7744eea4a3c61ce1daf.camel@linaro.org>
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
Date: Wed, 26 Nov 2025 06:44:30 +0000
In-Reply-To: <aa7bdeb1-c8a9-4353-af56-869f16a083c2@google.com>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
	 <20251123-max77759-charger-v1-4-6b2e4b8f7f54@google.com>
	 <5c901a6c831775a04924880cc9f783814f75b6aa.camel@linaro.org>
	 <aa7bdeb1-c8a9-4353-af56-869f16a083c2@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Amit,

On Tue, 2025-11-25 at 17:10 -0800, Amit Sunil Dhamne wrote:
> Hi Andr=C3=A9,
>=20
> On 11/23/25 10:21 PM, Andr=C3=A9 Draszik wrote:
> > Hi Amit,
> >=20
> > Thanks for your patches to enable the charger!
>=20
> Ack!
>=20
>=20
> > > From: Amit Sunil Dhamne <amitsd@google.com>
> > >=20
> > > Define specific bit-level masks for charger's registers and modify th=
e
> > > irq mask for charger irq_chip. Also, configure the max77759 interrupt
> > > lines as active low to all interrupt registrations to ensure the
> > > interrupt controllers are configured with the correct trigger type.
> > >=20
> > > Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> > > ---
> > > =C2=A0=C2=A0drivers/mfd/max77759.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 24 +++++++++++++++++-------
> > > =C2=A0=C2=A0include/linux/mfd/max77759.h |=C2=A0 9 +++++++++
> > > =C2=A0=C2=A02 files changed, 26 insertions(+), 7 deletions(-)
> > >=20
> > > diff --git a/drivers/mfd/max77759.c b/drivers/mfd/max77759.c
> > > index 6cf6306c4a3b..5fe22884f362 100644
> > > --- a/drivers/mfd/max77759.c
> > > +++ b/drivers/mfd/max77759.c
> > > @@ -256,8 +256,17 @@ static const struct regmap_irq max77759_topsys_i=
rqs[] =3D {
> > > =C2=A0=C2=A0};
> > > =C2=A0=20
> > > =C2=A0=C2=A0static const struct regmap_irq max77759_chgr_irqs[] =3D {
> > > -	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_1, 0, GENMASK(7, 0)),
> > > -	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_2, 1, GENMASK(7, 0)),
> > > +	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_1, 0,
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_AIC=
L |
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_CHG=
IN |
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_CHG=
 |
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_INL=
IM),
> > > +	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_2, 1,
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_BA=
T_OILO |
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_CH=
G_STA_CC |
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_CH=
G_STA_CV |
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_CH=
G_STA_TO |
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_CH=
G_STA_DONE),
> > > =C2=A0=C2=A0};

You should also add the remaining bits in each register here, so that the
regulator-irq can mask them when no user exists. It will only touch the
bits it knows about, so the state of the mask register is non-
deterministic with this change as-is (depends on how the bootloader
configured it).

[...]

> >=20
> >=20
> > > diff --git a/include/linux/mfd/max77759.h b/include/linux/mfd/max7775=
9.h
> > > index c6face34e385..0ef29a48deec 100644
> > > --- a/include/linux/mfd/max77759.h
> > > +++ b/include/linux/mfd/max77759.h
> > > @@ -62,7 +62,16 @@
> > > =C2=A0=C2=A0#define MAX77759_CHGR_REG_CHG_INT=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xb0
> > > =C2=A0=C2=A0#define MAX77759_CHGR_REG_CHG_INT2=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xb1
> > > =C2=A0=C2=A0#define MAX77759_CHGR_REG_CHG_INT_MASK=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xb2
> > > +#define MAX77759_CHGR_REG_CHG_INT_AICL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 BIT(7)
> > > +#define MAX77759_CHGR_REG_CHG_INT_CHGIN=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BIT(6)
> > > +#define MAX77759_CHGR_REG_CHG_INT_CHG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(4)
> > > +#define MAX77759_CHGR_REG_CHG_INT_INLIM=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BIT(2)
> > > =C2=A0=C2=A0#define MAX77759_CHGR_REG_CHG_INT2_MASK=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xb3
> > > +#define MAX77759_CHGR_REG_CHG_INT2_BAT_OILO=C2=A0=C2=A0=C2=A0=C2=A0 =
BIT(4)
> > > +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CC=C2=A0=C2=A0 BIT(3)
> > > +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CV=C2=A0=C2=A0 BIT(2)
> > > +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_TO=C2=A0=C2=A0 BIT(1)
> > > +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_DONE BIT(0)
> > Even if wireless out of scope, it'd still be nice to add macros for
> > the remaining bits to make this complete and avoid having to update
> > these again in case wireless support gets added in the future.
>=20
> I would prefer to only define the macros I am currently using to keep=20
> the review focused, unless you consider this a strict requirement.

It makes sense to add them now, as per above.



> > Also, would be nice to keep existing style and indent the bits from
> > the registers (see existing bit definitions in this file a few lines
> > further up).
> > Finally, can you add the bits below the respective register (0xb0 / 0xb=
1)
> > please, to keep suffix meaningful, and to follow existing style for cas=
es
> > like this (see MAX77759_MAXQ_REG_UIC_INT1).
>=20
> I will fix the indentation and ordering in the next revision.
>=20
> Regarding bit definitions: In [PATCH 5/6], the max77759_charger.c driver=
=20
> defines bits for the register addresses defined in this file. Currently,=
=20
> those macros are only used locally by the max77759 charger driver. Would=
=20
> you prefer I move those definitions to this header file as well?

Yes, would be nice to have them all in one place (in this file). That said,
CHG_INT, CHG_INT_MASK, and CHG_INT_OK all have the same layout and share
the same bits, so I personally would probably reuse the ones you added for
INT for all three of them - MASK (as you did already), and also for the OK
register. But up to you.

Cheers,
Andre'


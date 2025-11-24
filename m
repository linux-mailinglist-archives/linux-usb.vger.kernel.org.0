Return-Path: <linux-usb+bounces-30845-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A317BC7F07C
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 07:21:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E39BD3A53C5
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 06:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946152D12F5;
	Mon, 24 Nov 2025 06:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rTx2fQ4Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E81A2BE053
	for <linux-usb@vger.kernel.org>; Mon, 24 Nov 2025 06:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763965253; cv=none; b=KubOCvg9cU1T/mYd2F9BLEJLtzxvu4UDKtgrHvh4EFti8eSuMNsV881J8v8f8W4/t0T72FvhgVcryu7YXcTICbYxPR1NCDNE8mY+E1WRXO/Zh3AmKBff2H2lUI6U9Qqoem0f3EAAiGJDv8JcbOhRO0WLU20YNbs972GvCxBD4Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763965253; c=relaxed/simple;
	bh=yknGv046L7yMedwEjSmM6+EdFvU3S2cf1Pirgu5kUDk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HvFpM0z5sRLUXqXNm7WkRMT7tgdWG4/bkOXiAkPDJyt8x7PV6E2KqLryHx/wft/OUh56xhjtYMIDhqz3jxiLBFWWyNsyVahXbh7Vxg8LwNWZBr5Hfub1YMcPzUyuK21ZlunHNlMMb4qKJu9k5T0T+rexfaVheZq/EkCO03rozZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rTx2fQ4Q; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso24940045e9.3
        for <linux-usb@vger.kernel.org>; Sun, 23 Nov 2025 22:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763965249; x=1764570049; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=REZ04im9FdK76DRTIwu+Cc/Q2WxCSUPnF2cnra53O5Y=;
        b=rTx2fQ4Qk8jEIihvh86EgMDzgo6/L1tTd/B3a7eqIVhrkIZlZPWGE+r6rjJ3D1OeS9
         7Bu/WZot5WHBeTL6PYG3wVXOTvqqTp3HQ2bH0E66J+Oab8OC+2imVrQcRnnB0iIUq11H
         F9XUfcN7Bf1dNOR42M2RxYWtwslAWeYfGJgvQUfptX8McOnHvPQMbYefbNadDsT/xqhw
         +rXJ7X5jE4CgHfa4MeOT1KK1l3Rxbo1t+Wwr5WwYL/eYkg1pImmAI7RVYSxSiiF5xlQH
         htDFq5WFQugeSe9pcdv2XFmUBlkcmbcfdNeTIO9Ud+OEZd2AcEV4Ap1HM97Dca5Im0zR
         Mpgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763965249; x=1764570049;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=REZ04im9FdK76DRTIwu+Cc/Q2WxCSUPnF2cnra53O5Y=;
        b=M/oxe/cyW5fV6I+Gt41gJ+f3y+yJ95BgPh14IiHamz3SpK+ZBeIpjMQ3cw32wOEWVY
         XhXxSx3Pgae1cARagi7Q7gwbqtE6uGRDkO2cO3LCSoFx3s7ZNUWYPmJkuEUS5K6QjOg2
         oRc1CPSGEY01OyM2uJAgW1xdR4/AaZMse6iIO9WTMsvHsJRPDwKtuStU0UeNZ4hiYx3N
         xyvHBqyyqr0t9LaVL/0prQ/9s+Ntd8FniuczzzqzytJj4IDYSwDQ70q4v2/auc3gIOUO
         pVCyuWeiK44jKgjfM8FY9I4UnRu+dNbNF0etAXhZzhet9q/QTHa6GiJvGBVOD/yTaTQq
         MpuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUq+8o4EHNQLqYV//LP7onmI6+hIqdWPwwl2YZ/xboWBLSe2U9rR4PqDyF+aAjs62Y2eWal4V2vT0E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8EpsYuGXiLXiREX1HGX36+tSm6BHsprO6uE7DDtrhfRBdImG1
	CquN/VZm90uYKskfM1z5GoF6Bee1nSHgFMmQgiPRCKwXgWgnkWQhwo6y2EBN/dtJHrA=
X-Gm-Gg: ASbGnct9daNL8Y+Pxg5T/LuaPTvKBgdLGcLL87uA6oeS4W/bVMV3NARDSOFi8k3qLvD
	icqN0AK4TWcAzBigQBHqhfQlrGHfyQmWnqtoUp2Bo5SdAHyCxjfIuFn7mmfPeN+rqGndCNvYzD3
	xXGsBTXfirOaoEqwb4D6kERAYoFTuo6Ch/Z8zbk33ZgIJJlZkqzr2huD7g9g6vDpqHQfeRpPG7Y
	Q0/MtIGIo0pFo8x9CU47DRDwLdIQoLTjJlyRZ0cYINt7X/BvI6is2f2wM42avUDH8fgDplEgbv1
	s0IxjQ82u9I9Ac+QENlGlIBaes85oTxtkSWBDezZTN5vmkyOaVWjS/SpIMhRqfksgxq70SJSIuW
	zsDanyCqy9KCoCOM2eSfPI+gfVC57Z4ljaK2qrQMQt5p6yl2OVSnDLWPh4xsyWQcJJyjRpVfTRy
	CEjX/oGXB5Uccy7xLw/Q9PXMDp9mxa
X-Google-Smtp-Source: AGHT+IEkAHuQrVSean0CMnJmgdroQFGEXS2JnDMuJL0ECBf4DUqCtzz0alMdPUQuLJolnNwjmMRrhw==
X-Received: by 2002:a05:600c:3110:b0:477:632c:5b91 with SMTP id 5b1f17b1804b1-477c01b4b2amr122845505e9.16.1763965249310;
        Sun, 23 Nov 2025 22:20:49 -0800 (PST)
Received: from draszik.lan ([212.129.72.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e454sm26304551f8f.2.2025.11.23.22.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 22:20:48 -0800 (PST)
Message-ID: <5c901a6c831775a04924880cc9f783814f75b6aa.camel@linaro.org>
Subject: Re: [PATCH 4/6] mfd: max77759: modify irq configs
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: amitsd@google.com, Sebastian Reichel <sre@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus	 <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, RD
 Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Date: Mon, 24 Nov 2025 06:21:00 +0000
In-Reply-To: <20251123-max77759-charger-v1-4-6b2e4b8f7f54@google.com>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
	 <20251123-max77759-charger-v1-4-6b2e4b8f7f54@google.com>
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

Thanks for your patches to enable the charger!

> From: Amit Sunil Dhamne <amitsd@google.com>
>=20
> Define specific bit-level masks for charger's registers and modify the
> irq mask for charger irq_chip. Also, configure the max77759 interrupt
> lines as active low to all interrupt registrations to ensure the
> interrupt controllers are configured with the correct trigger type.
>=20
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> ---
> =C2=A0drivers/mfd/max77759.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 24 +++=
++++++++++++++-------
> =C2=A0include/linux/mfd/max77759.h |=C2=A0 9 +++++++++
> =C2=A02 files changed, 26 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/mfd/max77759.c b/drivers/mfd/max77759.c
> index 6cf6306c4a3b..5fe22884f362 100644
> --- a/drivers/mfd/max77759.c
> +++ b/drivers/mfd/max77759.c
> @@ -256,8 +256,17 @@ static const struct regmap_irq max77759_topsys_irqs[=
] =3D {
> =C2=A0};
> =C2=A0
> =C2=A0static const struct regmap_irq max77759_chgr_irqs[] =3D {
> -	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_1, 0, GENMASK(7, 0)),
> -	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_2, 1, GENMASK(7, 0)),
> +	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_1, 0,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_AICL |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_CHGIN |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_CHG |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_INLIM),
> +	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_2, 1,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_BAT_OI=
LO |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_CHG_ST=
A_CC |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_CHG_ST=
A_CV |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_CHG_ST=
A_TO |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_CHG_ST=
A_DONE),
> =C2=A0};
> =C2=A0
> =C2=A0static const struct regmap_irq_chip max77759_pmic_irq_chip =3D {
> @@ -486,8 +495,8 @@ static int max77759_add_chained_irq_chip(struct devic=
e *dev,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 "failed to get parent vIRQ(%d) for chi=
p %s\n",
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 pirq, chip->name);
> =C2=A0
> -	ret =3D devm_regmap_add_irq_chip(dev, regmap, irq,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IRQF_ONESHOT | IRQF_SHARED, 0, =
chip,
> +	ret =3D devm_regmap_add_irq_chip(dev, regmap, irq, IRQF_ONESHOT |
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IRQF_SHARED | IRQF_TRIGGER_LOW,=
 0, chip,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data);

Please correct me if I'm wrong, but I don't think this makes sense for a
chained IRQ in this case. What problem does this change fix?

> =C2=A0	if (ret)
> =C2=A0		return dev_err_probe(dev, ret, "failed to add %s IRQ chip\n",
> @@ -519,8 +528,9 @@ static int max77759_add_chained_maxq(struct i2c_clien=
t *client,
> =C2=A0
> =C2=A0	ret =3D devm_request_threaded_irq(&client->dev, apcmdres_irq,
> =C2=A0					NULL, apcmdres_irq_handler,
> -					IRQF_ONESHOT | IRQF_SHARED,
> -					dev_name(&client->dev), max77759);
> +					IRQF_ONESHOT | IRQF_SHARED |
> +					IRQF_TRIGGER_LOW, dev_name(&client->dev),
> +					max77759);

dito.

> =C2=A0	if (ret)
> =C2=A0		return dev_err_probe(&client->dev, ret,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 "MAX77759_MAXQ_INT_APCMDRESI failed\n"=
);
> @@ -633,7 +643,7 @@ static int max77759_probe(struct i2c_client *client)
> =C2=A0		return dev_err_probe(&client->dev, -EINVAL,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 "invalid IRQ: %d\n", client->irq);
> =C2=A0
> -	irq_flags =3D IRQF_ONESHOT | IRQF_SHARED;
> +	irq_flags =3D IRQF_ONESHOT | IRQF_SHARED | IRQF_TRIGGER_LOW;

I don't believe IRQF_TRIGGER_LOW should be added here, as this is board-spe=
cific.
The polarity is meant to be set via DT (and the only current user of this d=
river
does so).

> =C2=A0	irq_flags |=3D irqd_get_trigger_type(irq_data);

That's what gets us the config from DT.

> =C2=A0
> =C2=A0	ret =3D devm_regmap_add_irq_chip(&client->dev, max77759->regmap_to=
p,
> diff --git a/include/linux/mfd/max77759.h b/include/linux/mfd/max77759.h
> index c6face34e385..0ef29a48deec 100644
> --- a/include/linux/mfd/max77759.h
> +++ b/include/linux/mfd/max77759.h
> @@ -62,7 +62,16 @@
> =C2=A0#define MAX77759_CHGR_REG_CHG_INT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xb0
> =C2=A0#define MAX77759_CHGR_REG_CHG_INT2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xb1
> =C2=A0#define MAX77759_CHGR_REG_CHG_INT_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xb2
> +#define MAX77759_CHGR_REG_CHG_INT_AICL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BIT(7)
> +#define MAX77759_CHGR_REG_CHG_INT_CHGIN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(6)
> +#define MAX77759_CHGR_REG_CHG_INT_CHG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(4)
> +#define MAX77759_CHGR_REG_CHG_INT_INLIM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(2)
> =C2=A0#define MAX77759_CHGR_REG_CHG_INT2_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0xb3
> +#define MAX77759_CHGR_REG_CHG_INT2_BAT_OILO=C2=A0=C2=A0=C2=A0=C2=A0 BIT(=
4)
> +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CC=C2=A0=C2=A0 BIT(3)
> +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CV=C2=A0=C2=A0 BIT(2)
> +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_TO=C2=A0=C2=A0 BIT(1)
> +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_DONE BIT(0)

Even if wireless out of scope, it'd still be nice to add macros for
the remaining bits to make this complete and avoid having to update
these again in case wireless support gets added in the future.

Also, would be nice to keep existing style and indent the bits from
the registers (see existing bit definitions in this file a few lines
further up).

Finally, can you add the bits below the respective register (0xb0 / 0xb1)
please, to keep suffix meaningful, and to follow existing style for cases
like this (see MAX77759_MAXQ_REG_UIC_INT1).


Cheers,
Andre'


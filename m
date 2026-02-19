Return-Path: <linux-usb+bounces-33478-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +G3ALmcyl2kcvgIAu9opvQ
	(envelope-from <linux-usb+bounces-33478-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 16:55:19 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 217031606D1
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 16:55:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69EE63010B81
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 15:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1A834AB1D;
	Thu, 19 Feb 2026 15:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yV9ak2c9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B0134A786
	for <linux-usb@vger.kernel.org>; Thu, 19 Feb 2026 15:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771516349; cv=none; b=FYi/bllnuvONAc3prDW0Yma7f5S5e8hwqDDvHKYJbema0GWYjLNqofwbw5vBjJ/ZNinNRYZuMMluuHUk8/4i9WGIWr8ggceuHWUdQTe4gHeAz/Sm7UV3kPqa0OnQyQKVVstCEY8ztlnHqLpM0QVzoHoo14yN3iCz+CR/DOysk3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771516349; c=relaxed/simple;
	bh=hUVMfsGdV0aDbsIFOhfMsdPp5kAixuq61G/flR5Alxg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j+Gt46gm+8H+t+C9ecVuhfgIufExotJFpSdwXzCXUBeTg3RtkloPPmGy7WxoYJMclq43TgdZ65i9ayrXDTEOIQqY1NR47N7jJTAA9HkPASEm7cMMENtEqlyUSFolehWJ6GUKpuqDZq0wyd9aNF4iHm1fVmWjYaUhLSCHgdU3t2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yV9ak2c9; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-436e8758b91so874041f8f.0
        for <linux-usb@vger.kernel.org>; Thu, 19 Feb 2026 07:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771516346; x=1772121146; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ausNYp9VNOhe1fBHOC525G26Oe60ih9EhrjdJ5sgpHg=;
        b=yV9ak2c9B8AV5lOFP2+ASu81htz4cub/EZEvHYTW6zwjxUR0sbJ3wNLOLEVTKUmniP
         Qg8C9YIASU2HiwGMvPlurEY5c/W3ET39r5gHOJ7kUZ+EdIEmraU0C24ueJM7mACg4PmJ
         ZfaKOqaNq0ptYYVRRMX/2DHWJTvP5sWZtMhaFvPE44b9l5mW1CNB56MV1wLIGMvN3ZCF
         SFryge4s8mXDYNGrOiOCuw+MdBh1Y8yKQFnXe/eIgdyxSV7zBpnVZgUyCFBwgsdcqv/m
         m6kcXoAB49/10DVAJsXRUI1I8nt1XhrdEw8XOexD0Wc8vDpyODntZbRxMsk8939vdZAE
         JvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771516346; x=1772121146;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ausNYp9VNOhe1fBHOC525G26Oe60ih9EhrjdJ5sgpHg=;
        b=kZ+NaOJa1lCOPIBcB4Oumov16U4lCaHtXwPg9K0xGaf483CY0dcLW1iwjOsugOFA//
         4RWXwYq4VukYA/PaZ05wW+5/8FVf6aSKSp0Epg9zObWrx9D9zbIY+VbTVcgQ4vonXVhY
         wEqQwi4tNDcxraW+0oeNWhKaOJqAqPqkvwZCDtgMNHScBxwpeSJBmTu4xKrTPdOXWrvK
         esY3RnuuV12WFYgc/3k/yeqKcoTQVVZdKKJWuFLjavGK9eeC3zHZjvaCVIFtXQEYVFqK
         ziSI953J93ntkDyQPsVNylViz+fgXGGPs7TV50QNRUz7rVeM8KOAEbD6DhVaIWtTJvg7
         /EDw==
X-Forwarded-Encrypted: i=1; AJvYcCX9YCV0BWRpDW6rJUFqr/NTr3RnordZUgR/UISyozk4nMvJnbrEz2ab868dxV4CJfXbhFjSYmmU600=@vger.kernel.org
X-Gm-Message-State: AOJu0YznmHEnBp92cvhPn6gLq5p+5PbH4M/HJQWR/cY1liKEfgJ8HQHC
	5kip/NYxdNPdcOBfjrEmYDjBLfMcsn6+cvgz94XEMNrYPs3ToZGz7BC1K8taKgFtwJM=
X-Gm-Gg: AZuq6aJhuCQT/EcuSUWpfTM5cJ9UrHWmyCwx9gGbohVDBjtGHPFSav4ccGFZE/+u6T/
	T8SbbSZlLJgj3fVlm/0oa6vwYctRbwH2YORNcN9H3+2fw/ormGHQtqjTZxorsK62tw+Oa7qeO57
	sP/S85kpng9V9p+8Ng6TRkI+ba3Cb4R7RLPDDqW6nkgK7fB2e04NKlj+lEORIaefTI9ZIsUJiTR
	6PDR57OiPTl9jCnxNQua3e8xRSSrWjEj4iOxGbMD4OnrNDYniCEJzaJof9SVWJxC1NKW1qrrK4y
	X4/RlRZCPFKXmMT0+bX77RcOB/HexVMiPI0aBswrg2J0k6XwyVR2sWKP9rMuXIwSEQ6/iu9QI/N
	JswixdtYfhDM/zdNH95u4/OL17q+7AFG+wm2mASVUdNLlo/VTgllC7mLPdxW3zB/NJwAQwaXAZ4
	2qowiz8f9gA0V6gXsERIa1t3PTnWFo+w==
X-Received: by 2002:a05:6000:2001:b0:436:3475:4737 with SMTP id ffacd0b85a97d-4379db8cfddmr32328493f8f.30.1771516346564;
        Thu, 19 Feb 2026 07:52:26 -0800 (PST)
Received: from draszik.lan ([212.129.80.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5ac7csm47748995f8f.7.2026.02.19.07.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 07:52:26 -0800 (PST)
Message-ID: <f46fa180198ec103aeb1e1c06286c6a2a0fb8b7f.camel@linaro.org>
Subject: Re: [PATCH v7 5/6] power: supply: max77759: add charger driver
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: amitsd@google.com, Sebastian Reichel <sre@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus	 <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Mark Brown	 <broonie@kernel.org>, Matti
 Vaittinen <mazziesaccount@gmail.com>, Andrew Morton	
 <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, RD
 Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Date: Thu, 19 Feb 2026 15:52:55 +0000
In-Reply-To: <20260218-max77759-charger-v7-5-e8d907ce69c5@google.com>
References: <20260218-max77759-charger-v7-0-e8d907ce69c5@google.com>
	 <20260218-max77759-charger-v7-5-e8d907ce69c5@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33478-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[google.com,kernel.org,linuxfoundation.org,linux.intel.com,linaro.org,samsung.com,gmail.com,linux-foundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 217031606D1
X-Rspamd-Action: no action

Hi Amit,

I was trying out your series and noticed a few things that I didn't before:

On Wed, 2026-02-18 at 21:59 +0000, Amit Sunil Dhamne via B4 Relay wrote:

[...]

>=20
> diff --git a/drivers/power/supply/max77759_charger.c b/drivers/power/supp=
ly/max77759_charger.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..035f16822d85de94c7707ce11=
c49345c714cd559
> --- /dev/null
> +++ b/drivers/power/supply/max77759_charger.c

[...]

> +		dev_err(chg->dev, "Invalid mode transition from %d to %d",
> +			chg->mode, mode);

All your format strings are missing the final \n throughout this patch.

[...]

> +static int max77759_charger_probe(struct platform_device *pdev)
> +{
> +	struct regulator_config chgin_otg_reg_cfg;
> +	struct power_supply_config psy_cfg;
> +	struct device *dev =3D &pdev->dev;
> +	struct max77759_charger *chg;
> +	int ret;
> +
> +	device_set_of_node_from_dev(dev, dev->parent);
> +	chg =3D devm_kzalloc(dev, sizeof(*chg), GFP_KERNEL);
> +	if (!chg)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, chg);
> +	chg->dev =3D dev;
> +	chg->regmap =3D dev_get_regmap(dev->parent, "charger");
> +	if (!chg->regmap)
> +		return dev_err_probe(dev, -ENODEV, "Missing regmap");
> +
> +	ret =3D devm_mutex_init(dev, &chg->lock);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to initialize lock");
> +
> +	ret =3D devm_mutex_init(dev, &chg->retry_lock);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to initialize retry_lock");
> +
> +	psy_cfg.fwnode =3D dev_fwnode(dev);
> +	psy_cfg.drv_data =3D chg;
> +	chg->psy =3D devm_power_supply_register(dev, &max77759_charger_desc,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &psy_cfg);
> +	if (IS_ERR(chg->psy))
> +		return dev_err_probe(dev, -EPROBE_DEFER,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to register psy, ret=3D%ld",
> +				=C2=A0=C2=A0=C2=A0=C2=A0 PTR_ERR(chg->psy));

Why are you returning -EPROBE_DEFER here instead of the original error? Thi=
s
is quite unusual.


Cheers,
Andre'


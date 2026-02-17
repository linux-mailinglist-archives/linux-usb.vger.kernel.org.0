Return-Path: <linux-usb+bounces-33406-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAUGGaNplGlFDgIAu9opvQ
	(envelope-from <linux-usb+bounces-33406-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 14:14:11 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA71814C73C
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 14:14:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E61093034B2C
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 13:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F41B361DA9;
	Tue, 17 Feb 2026 13:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OAPNoYdu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59766361DBD
	for <linux-usb@vger.kernel.org>; Tue, 17 Feb 2026 13:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771334040; cv=none; b=fFLtLEvTysjbpHQ7NA4/iON5EJS7RT2E5MrZEBpW4Bk8UzDVJ8QBkin/E40eopqlahjKvX/zdpumJMgpNnu/r8U2a2dC9Ny/ipWlPagYtullxH/monqFCUufy7XkfXgtC0MvxZ8jaQNZVvDKo8o7leZPbjvK0SbaRHJBT00aVYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771334040; c=relaxed/simple;
	bh=ghiYn5zctv6YevvmbOXMIchikB5+PZqKiOLbd6hIvi0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aRFRwYjtBAPTVjD3X3XrBIgmR93CReUuo6iTS9K+ph+dqqcv0YwzjIQLDcwHMXe4LLIOjInjmB7hxP2dz1lUFgDct4REaUbN4mT2PPRey0QKzO9TdEjMO/kDGDBTmt4tmDH70uUXIpLH5wFdLaAkNQ8prIyYsqe2oo1A/tV9Oeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OAPNoYdu; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-658b6757f7fso7942373a12.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Feb 2026 05:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771334035; x=1771938835; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x1C0IPnydug6rw3V3fM8YPHePn3LBKfIJJtqgR74b5I=;
        b=OAPNoYduWYQSL32nmW69nrWuR03uaN696N+g+GsecDLfcQGnKikRKlnwjFXm7jZIvC
         VoUbx7IkICPpby2qPD748XaG4VJS0thzOiDW5SBPdgEdPEKLH1Q+W+yf75nnkHf68qN7
         JEQloHR++epOZTLfmKq90FhtXesttZPXg8/S2nFvytEY1oyGxqS1EsW0P3n89H77zDaA
         M+HtcBqQX1L0pNaoiIeMDg00dLoF0r3BhFlL6hmkeqN4bWToklocg6n6hiBKVShGqr+P
         Vsvc0o2lFLkLYbnhoulvgEESi2/EFr5uHYV66j/ChgtXBh+MXCpJDl0XtChzUdEssfOT
         xD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771334035; x=1771938835;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x1C0IPnydug6rw3V3fM8YPHePn3LBKfIJJtqgR74b5I=;
        b=pTWxFct6a2YeAG2sAtnbWOwnyXgs2GD6JT3rcodQPlBExQJHVEPpxTgenEkrP4vcOu
         KtLmVPf4Vcc+S7H+iTXCydbB84hAfvwCmSjJfL3sI2bgQWvc/bEdO/P2Dfr27Kx6NsDF
         h1DaXWCCtKIvFUODqKNUfdHMGbRDmqDCXFcFjuuTQWlk018iOyIwPqaVxSym0YrR7iMD
         iMkVeE62ejQBjdvQ+UODguNY06dFM39lUORYiGoCU1CnCYtbCqwb/hv84ZbOJ2bvQBMZ
         UBq9y/b2n/ivY+A0CPNkHObOR/CAW/eOLwcKNoBOZDNGM4V8c4BMjLFWY/byiQEesXrt
         I/0w==
X-Forwarded-Encrypted: i=1; AJvYcCVL4X4oQ/YN21CNL+7e+N9zUEc/CEyrrOekEl1eD/IqL+3+VDenDNekS4AsMAkFXiyIstmKnXu/0tw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5vYEjnbCxBkZ93PHpIbke8qGiyeMF64+n9JIxEQGha6ZZAOh6
	X1juLg04/oIuk5/PkAjtbLren9EHpS7XjLN0gSGkrmpgvs+44ry5QNuaBCaPq1uCXWo=
X-Gm-Gg: AZuq6aLfXyLQjb+QUFoZPeuNi5NcjAxpTORhURNP1cCB2YgpnDhszmjf7NEwZiElGVr
	cqe4ORy4qGHbUCqS/CWNjQUjprGC0Wndznp4cgeB/N4kuLWj1mns635d8ByvV+4jbG9C9mzIjdg
	QhDW9A1t/acK+s+3EQL04eNi1S0KwnqGHfhpsFVKAv+OjcUqQx2ZaKtV3sLIuo+8P/SOHwHIj+9
	l/Eaucp6ImSfMXIWz7Gt4Nv/kV1lG4Egkdv+q5IvoZFN+75Foj5c7yLK0nyenr4nJuvbEbNycXy
	Gt643LiUdSonMrzZVJARnOG9ra5lGA5YycV1SF3SEDJJXk5a5MrH18rTHekxwjshKTV6KCjiSMC
	/OeqrReivE7mcy9zFsEzdl4RtUH6A53ArR6F5X3xKFE0DI2rGNQVX0AbS/Suq/oGxujossx9277
	GHPz6zS/D7YJBOEJbTAy7uhS9kTRs=
X-Received: by 2002:aa7:d719:0:b0:641:88ff:10ad with SMTP id 4fb4d7f45d1cf-65bc4298c44mr4741148a12.14.1771334035506;
        Tue, 17 Feb 2026 05:13:55 -0800 (PST)
Received: from draszik.lan ([212.129.84.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad4fa7c7sm2473768a12.31.2026.02.17.05.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 05:13:55 -0800 (PST)
Message-ID: <0b6e7cb7223e553d9b53df464959e97fd3d1ce43.camel@linaro.org>
Subject: Re: [PATCH v6 5/6] power: supply: max77759: add charger driver
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
Date: Tue, 17 Feb 2026 13:14:14 +0000
In-Reply-To: <20260214-max77759-charger-v6-5-28c09bda74b4@google.com>
References: <20260214-max77759-charger-v6-0-28c09bda74b4@google.com>
	 <20260214-max77759-charger-v6-5-28c09bda74b4@google.com>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33406-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[google.com,kernel.org,linuxfoundation.org,linux.intel.com,linaro.org,samsung.com,gmail.com,linux-foundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: BA71814C73C
X-Rspamd-Action: no action

Hi Amit,

All below comments are only minor, feel free to ignore them.

On Sat, 2026-02-14 at 03:12 +0000, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
>=20
> Add support for MAX77759 battery charger driver. This is a 4A 1-Cell
> Li+/LiPoly dual input switch mode charger. While the device can support
> USB & wireless charger inputs, this implementation only supports USB
> input. This implementation supports both buck and boost modes.
>=20
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> ---
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +
> =C2=A0drivers/power/supply/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 11 +
> =C2=A0drivers/power/supply/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0drivers/power/supply/max77759_charger.c | 768 +++++++++++++++++++++=
+++++++++++
> =C2=A04 files changed, 786 insertions(+)

[...]

> diff --git a/drivers/power/supply/max77759_charger.c b/drivers/power/supp=
ly/max77759_charger.c
> new file mode 100644
> index 000000000000..d4e02764ba04
> --- /dev/null
> +++ b/drivers/power/supply/max77759_charger.c
> @@ -0,0 +1,768 @@

[...]

> +
> +/* USB input current limits (in uA) */
> +static const struct linear_range chgin_ilim_ranges[] =3D {
> +	LINEAR_RANGE(100000, 0x3, 0x7F, 25000),
> +};

Shouldn't this one also have a entry for 0x00...0x02:
	LINEAR_RANGE(100000, 0x0, 0x2, 0),

Then you can also drop the umax() call in get_input_current_limit().

Ah, I see now there is no linear_range_get_selector_within_array(),
meaning the code is fine as-is, unless you want to add that as
well :-)


[...]

> +static int max77759_charger_init(struct max77759_charger *chg)
> +{
> +	struct power_supply_battery_info *info;
> +	u32 regval, fast_chg_curr, fv;
> +	int ret;
> +
> +	ret =3D regmap_read(chg->regmap, MAX77759_CHGR_REG_CHG_CNFG_00, &regval=
);
> +	if (ret)
> +		return ret;
> +
> +	chg->mode =3D FIELD_GET(MAX77759_CHGR_REG_CHG_CNFG_00_MODE, regval);
> +	ret =3D charger_set_mode(chg, MAX77759_CHGR_MODE_OFF);
> +	if (ret)
> +		return ret;
> +
> +	if (power_supply_get_battery_info(chg->psy, &info)) {
> +		fv =3D CHG_FV_DEFAULT_MV;
> +		fast_chg_curr =3D CHG_CC_DEFAULT_UA;
> +	} else {
> +		fv =3D info->constant_charge_voltage_max_uv / 1000;
> +		fast_chg_curr =3D info->constant_charge_current_max_ua;
> +	}
> +
> +	ret =3D set_fast_charge_current_limit(chg, fast_chg_curr);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D set_float_voltage_limit(chg, fv);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D unlock_prot_regs(chg, true);
> +	if (ret)
> +		return ret;
> +
> +	/* Disable wireless charging input */
> +	ret =3D regmap_update_bits(chg->regmap, MAX77759_CHGR_REG_CHG_CNFG_12,
> +				 MAX77759_CHGR_REG_CHG_CNFG_12_WCINSEL, 0);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_update_bits(chg->regmap, MAX77759_CHGR_REG_CHG_CNFG_18,
> +				 MAX77759_CHGR_REG_CHG_CNFG_18_WDTEN, 0);
> +	if (ret)
> +		return ret;
> +
> +	return unlock_prot_regs(chg, false);

Should early error returns here try to lock the protection again? Something
like:

+	ret =3D unlock_prot_regs(chg, true);
+	if (ret)
+		return ret;
+
+	/* Disable wireless charging input */
+	ret =3D regmap_update_bits(chg->regmap, MAX77759_CHGR_REG_CHG_CNFG_12,
+				 MAX77759_CHGR_REG_CHG_CNFG_12_WCINSEL, 0);
+	if (ret)
+		goto relock;
+
+	ret =3D regmap_update_bits(chg->regmap, MAX77759_CHGR_REG_CHG_CNFG_18,
+				 MAX77759_CHGR_REG_CHG_CNFG_18_WDTEN, 0);
+	if (ret)
+		goto relock;
+
+	return unlock_prot_regs(chg, false);
+
+relock:
+	(void) unlock_prot_regs(chg, false);
+	return ret;

I guess if one of the regmap_update_bits() failed, then locking the
registers might not work either, so I have no strong opinion on
adding that.

With or without updates:

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>


Cheers,
Andre'


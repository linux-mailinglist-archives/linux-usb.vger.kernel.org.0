Return-Path: <linux-usb+bounces-30854-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B23B7C7F7AF
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 10:10:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D73E334836B
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 09:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDB732F5A1B;
	Mon, 24 Nov 2025 09:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X9EVSicO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F165B2F5311
	for <linux-usb@vger.kernel.org>; Mon, 24 Nov 2025 09:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763975369; cv=none; b=VYKdLNf/BCcA0ISFs1uj2aU5D7F/CLF49qfSMQe1KDlY3MZla9D/NeJsch+TVnn6mdQBUjcdw/RcwBWd7yMslXEuw5xsNpl8WfWthpQyIX3MRrFMMjyI08FdZhyzb/UTs/eFXzSoCHX3jzMttLG+RN9Gi4C/Ih1KOijQ7DwpC6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763975369; c=relaxed/simple;
	bh=7cucVKRF1i3U03wQQZLLaXMd6VYekFa/vhwxJjBb0wM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UAAOpqdztp3VmRVNd1OsN80SWUZWClZPsyZCUqb4o5U0KwwkbUW028pDlbPvSyJ5RY0URuY98ydn4ySpT2+BFGDOebAdIYdKbBt6oZB2B8x9soQCdAyYRR5caZbhWDVUgvJ7Nv6wntgWcgYxsMvFvFgWwA4bHyDIFLgpz7juj6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X9EVSicO; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b379cd896so2158779f8f.3
        for <linux-usb@vger.kernel.org>; Mon, 24 Nov 2025 01:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763975365; x=1764580165; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OvXHuoRgH+XIUx292dJAYC+bXU3Y0ChyF2IbAzcMS/Q=;
        b=X9EVSicOG5kFedBvxTqDIIeuZHrgVhbmsI9Le4AlBj6Ihivl6ynbpfuufKRyy1ex3s
         jx1nXKjlbLynhnWJUpG31IwszI9yHnUsGs3Kafbm7Gdx+oTA71dMmslVU/2YxUCf9z8L
         8zbtDaUkx6Um0kcRoEOVmKxv/F+4/1OmtjIH6ESm0NxDivD3Q6SklCKmb/cQl9S33MKg
         6HrSjIAXyAKgEjNPuBjYqirBPJ5pprxr4fX6mkJL5cHn1hgvRbK0pOlZZk5PVythSGy7
         Tf4plCwzPYl8NmAzDJ90x6dzXZkBviqbXTHrqHh7nj9AYr3OmLlwKyUIBfd0n3WN/Tj4
         m9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763975365; x=1764580165;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OvXHuoRgH+XIUx292dJAYC+bXU3Y0ChyF2IbAzcMS/Q=;
        b=NHsZ4QtSmOUwCOy3jq0jlX4HwZQhxERj1h6vI1vmt7rnAtV14cve3eCI4HNkHWj8Te
         vMbrKIOJX3rkmtEvydl8ZzoBPE5/hVIsO01aT09tSs5XZphXycJ51Lli/OHRwd+Zr2LH
         TQ5AXqsbfQgRo9ZQ8wbF+6grW6ewJLdvO7LN4n0jYYdni3FX6g3rdwZ++tw1x+9zVg2h
         5R1jmaxrbSDvv8pdaAl1FqiEa0OjEFmLJEf8PVN6PxOLM1EG/5FMIHHDh10+DaopgF9K
         GAh2Y2tjqCaqRBQL3AdMl8eoChEFhqZ7pBeZlcrqLxGuiexIKGtFKsdNTP6qtZsEQCtw
         c4Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUflkoTyYXZN+cIaGmWNDwYh38WwWukMBxQoSXWrKzIkTitzyIjnjzgf6VbnEENZ595Gg4JnSdh+vM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmQSj8CcmubluCWR0CCweMEW9uLTmgwx2pPptf6aKP1Ufnnc/w
	R006Z+OCkeWeO5gsd0ZJ/0HpEt1MQBRLP2pIOgyNnKzBmGBIYR4H3xHwMNMyIQgLsso=
X-Gm-Gg: ASbGncvqQ3SHT4IDkVT/4xWRPecWyKtyyeufeXKRMDWIYXVzuWV9TTYrBBgtxBpjZYV
	xn7dOf/ROcD5C7kUYpftSkVgLgdokgIte8nO2GF4v19vFzGy1yvdobt7MaZImxC4kfsrW4PKgel
	ydp3voWQLmupWHdmXUbZi1fvry7Qlf/bNiHAHV2GtoXwgrg5PMe8LBpZ5FuYhSejDCR0Vp2JlLc
	Zzq2tGj96p7hwbbOK+uckdjwwY3n+SbBH+pizeikbK0lXOlNrTULnFyOMwLdIOlNQyL0Of05nCi
	ExAbTjBFGrZDyWsIoZa+RdTlDhft80TsakgXH+5n+o731mu00CVSnlO5/hKViGG/1/pYKhJC/F4
	V2DAxKg+UHxZ7ZCNJ/IvxV7zcce3rzoS10untsIEzrwrZR5Rt7ijeI6nyGO5GjusGqRZ0hhqkns
	C0SOoj8gVG2ZG6sIKrrw==
X-Google-Smtp-Source: AGHT+IGb2anSnU9yUNqdmZbv+SeaRHh1StnydsjMu/nMg2MY1ixTXj9wwNITrqgGCjoJ7tz/T/jZVA==
X-Received: by 2002:a5d:5f44:0:b0:42b:41dc:1b58 with SMTP id ffacd0b85a97d-42cc1d19957mr11009024f8f.45.1763975365182;
        Mon, 24 Nov 2025 01:09:25 -0800 (PST)
Received: from draszik.lan ([212.129.72.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb9190sm27162766f8f.33.2025.11.24.01.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 01:09:24 -0800 (PST)
Message-ID: <9cad7b42dbfea351fb3b708736bf6f6715bcf694.camel@linaro.org>
Subject: Re: [PATCH 6/6] usb: typec: tcpm/tcpci_maxim: deprecate WAR for
 setting charger mode
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
Date: Mon, 24 Nov 2025 09:09:37 +0000
In-Reply-To: <20251123-max77759-charger-v1-6-6b2e4b8f7f54@google.com>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
	 <20251123-max77759-charger-v1-6-6b2e4b8f7f54@google.com>
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

On Sun, 2025-11-23 at 08:35 +0000, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
>=20
> TCPCI maxim driver directly writes to the charger's register space to
> set charger mode depending on the power role. As MAX77759 chg driver
> exists, this WAR is not required.
>=20
> Instead, use a regulator interface to set OTG Boost mode.
>=20
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> ---
> =C2=A0drivers/usb/typec/tcpm/tcpci_maxim.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 1 +
> =C2=A0drivers/usb/typec/tcpm/tcpci_maxim_core.c | 48 ++++++++++++++++++++=
+----------
> =C2=A02 files changed, 34 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.h b/drivers/usb/typec/tcp=
m/tcpci_maxim.h
> index b33540a42a95..6c82a61efe46 100644
> --- a/drivers/usb/typec/tcpm/tcpci_maxim.h
> +++ b/drivers/usb/typec/tcpm/tcpci_maxim.h
> @@ -60,6 +60,7 @@ struct max_tcpci_chip {
> =C2=A0	struct tcpm_port *port;
> =C2=A0	enum contamiant_state contaminant_state;
> =C2=A0	bool veto_vconn_swap;
> +	struct regulator *otg_reg;
> =C2=A0};
> =C2=A0
> =C2=A0static inline int max_tcpci_read16(struct max_tcpci_chip *chip, uns=
igned int reg, u16 *val)
> diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/type=
c/tcpm/tcpci_maxim_core.c
> index 19f638650796..6d819a762fa1 100644
> --- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> +++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> @@ -10,6 +10,7 @@
> =C2=A0#include <linux/kernel.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> =C2=A0#include <linux/usb/pd.h>
> =C2=A0#include <linux/usb/tcpci.h>
> =C2=A0#include <linux/usb/tcpm.h>
> @@ -202,32 +203,49 @@ static void process_rx(struct max_tcpci_chip *chip,=
 u16 status)
> =C2=A0	tcpm_pd_receive(chip->port, &msg, rx_type);
> =C2=A0}
> =C2=A0
> +static int get_otg_regulator_handle(struct max_tcpci_chip *chip)
> +{
> +	if (IS_ERR_OR_NULL(chip->otg_reg)) {
> +		chip->otg_reg =3D devm_regulator_get_exclusive(chip->dev,
> +							=C2=A0=C2=A0=C2=A0=C2=A0 "otg-vbus");
> +		if (IS_ERR_OR_NULL(chip->otg_reg)) {
> +			dev_err(chip->dev,
> +				"Failed to get otg regulator handle");
> +			return -ENODEV;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> =C2=A0static int max_tcpci_set_vbus(struct tcpci *tcpci, struct tcpci_dat=
a *tdata, bool source, bool sink)
> =C2=A0{
> =C2=A0	struct max_tcpci_chip *chip =3D tdata_to_max_tcpci(tdata);
> -	u8 buffer_source[2] =3D {MAX_BUCK_BOOST_OP, MAX_BUCK_BOOST_SOURCE};
> -	u8 buffer_sink[2] =3D {MAX_BUCK_BOOST_OP, MAX_BUCK_BOOST_SINK};
> -	u8 buffer_none[2] =3D {MAX_BUCK_BOOST_OP, MAX_BUCK_BOOST_OFF};

You should also remove the corresponding #defines at the top of this file.

> -	struct i2c_client *i2c =3D chip->client;
> =C2=A0	int ret;
> =C2=A0
> -	struct i2c_msg msgs[] =3D {
> -		{
> -			.addr =3D MAX_BUCK_BOOST_SID,
> -			.flags =3D i2c->flags & I2C_M_TEN,
> -			.len =3D 2,
> -			.buf =3D source ? buffer_source : sink ? buffer_sink : buffer_none,
> -		},
> -	};
> -
> =C2=A0	if (source && sink) {
> =C2=A0		dev_err(chip->dev, "Both source and sink set\n");
> =C2=A0		return -EINVAL;
> =C2=A0	}
> =C2=A0
> -	ret =3D i2c_transfer(i2c->adapter, msgs, 1);
> +	ret =3D get_otg_regulator_handle(chip);
> +	if (ret) {
> +		/*
> +		 * Regulator is not necessary for sink only applications. Return
> +		 * success in cases where sink mode is being modified.
> +		 */
> +		return source ? ret : 1;
> +	}
> +
> +	if (source) {
> +		if (!regulator_is_enabled(chip->otg_reg))
> +			ret =3D regulator_enable(chip->otg_reg);
> +	} else {
> +		if (regulator_is_enabled(chip->otg_reg))
> +			ret =3D regulator_disable(chip->otg_reg);
> +	}

Given otg_reg is the fake regulator created by a previous patch in this
series, this means that the regulator API is really used to configure two
out of 16 possible charger modes here. That doesn't look right.

Cheers,
Andre'


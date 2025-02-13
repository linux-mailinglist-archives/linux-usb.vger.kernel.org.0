Return-Path: <linux-usb+bounces-20602-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B61B8A33E53
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2025 12:45:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27BD0188C962
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2025 11:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB1921422A;
	Thu, 13 Feb 2025 11:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="twS3QFWf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41907211A36
	for <linux-usb@vger.kernel.org>; Thu, 13 Feb 2025 11:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739447104; cv=none; b=Lv+Krrysbf0GH38nvl8VEU1Kfl2eR0pmkey04mD8WOLxV1oELJyCM1wHD1K8UGY1mEilWP30j1Uwf5QZG0GBrkKx/IB5nVsbwKjS3Bhgw5Ukra+ZYlJckEByJ8h6N3patFaHbcwWlQjhrnh51Apx0700aLmySA3xmQXWPiJ29HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739447104; c=relaxed/simple;
	bh=7PtZe0tSJIetPwypQyiZo24A/z2QBMIiJyjFAjqbFBc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LPmIjZF3UgoMM1ZAMvQZfdvNOyLNrQB/redO3MIWW0RpOZxpZgInd2yr+UQDsbbwq1ApL2N1qfmYl3d55xAjyLdrtsjBACMsU2mjljeoAvDA+EVHz+P53Z4XyRRfQJxyEBBwruCSjndhDjqfxfisUHSzeNfaOWq+1+moE1xIe+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=twS3QFWf; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-438a39e659cso5244905e9.2
        for <linux-usb@vger.kernel.org>; Thu, 13 Feb 2025 03:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739447100; x=1740051900; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B864o0fggh+K1JfNxHrkc432l7fxNgcBloINRuCFBwY=;
        b=twS3QFWfAlmH026H6yFe9sNWWcDXHLNDQ6d3N2Fw7niGxOd5nbZZTVbK3Cbr/rad8o
         2mg2LEnpIORi7F9SCkAFkw70/xvVYXq5omR60cFAhAYRR3+Z/aucvLdPDjmJ/OWsJBeR
         ViQKiz/q32m78pAU7gH/5y/junQsVILhIgaW46HGFRueeypIBl5rVHOI9IkZ5eeNaKlP
         r8vcL8aMEidy7c3wUqpIC3hkTmvuEMikSzt6WknrmuaZOv3RB/tUtbk0ebp+qfistzOa
         Ymppjaav8JiRpPcTqrzEAL6VRN4TRQt2BnMtLVeRhCpd1u9t3ZNFyi/bggO0tImbJZuJ
         YPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739447100; x=1740051900;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B864o0fggh+K1JfNxHrkc432l7fxNgcBloINRuCFBwY=;
        b=gJKLPYIp8aDB9QnP4ooaVTFYyny1c4gHsAMEbVnLBcx29FnOLy7c1puwOYLk3oWyeG
         MTnT6wC1zNjAfN5TDRq5GwRC8jsxHzook6jOvhPT9yDmgjOx9fe/FmDVj63hfAga6unz
         o5z/FjYGmwggd1nTYDdkyNWR7fRM8VoJFPJQzbGuYTofTyCNKFsroHh7vjPbSZ6zD9mh
         JvPtzoTLjaz/i1OA5phuwfGHjfyLHnB0p34h11HHaffVePqaPo1S0YLAKAO9L2F1Q+QG
         2yoj7SAoQpVsrkCBscbCQS4431zttMitjOKfe5acQ+czcb9APCQnJSeuKuTUduhrsGAB
         dEEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0voa8beh2Sbx3qg0wfyyLnev5X3yTe4o0uDhudDbqHfESZNM60R4s66kLmdE8/uqiRXLmbuD9aug=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/KBmkb6w9VJop23v3HaT0tBHAZNpa5r8+CibQUq+7ujytqlIf
	zeMGbkmbiPUTOtMlKz4poOFbiqCQCV5MP12d15avmZfj8Cqklz5iCNAphCZUAx8=
X-Gm-Gg: ASbGnct3LJprCOmySP2lAf1HU8l0Vbitv29Ke4EmopHGGfavWEj9G1Tp7fiEUQxExhu
	fRK5x08bzVVMJxw1Y99qGl/h4YCtC8eJpqqYNRJNEabKcHi0DrkkXikAZQfU4HXtf/dDICjOQml
	n7pl7l27tIQ8w5ZpPBxaIr7A1PU++llrebNrdBupfLxKDeACiyxgGKNWxIXmChw+GJhk0sTEwHJ
	EsXxoXVQDQ90inGRYu+h5uo4BXM2+fImtzORhm3dEeNoEEo8hTP4o0Qozpr8WeG3O7ZJ1A1N5pU
	t1yiHLyVbNym0bsQNHM=
X-Google-Smtp-Source: AGHT+IHKD0ms8VgaTWGBDJMvklWj7HpF1w1pq+OTWxzqSwoHxcvtoBbQvKht7o4Zc8bM5Shdt4UGsA==
X-Received: by 2002:a5d:584e:0:b0:38d:d79a:f82a with SMTP id ffacd0b85a97d-38dea256f8emr5496991f8f.7.1739447100552;
        Thu, 13 Feb 2025 03:45:00 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b41b5sm1688110f8f.14.2025.02.13.03.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 03:45:00 -0800 (PST)
Message-ID: <58af4b607adbe74725d4869f8f5a09cd5d3be2d3.camel@linaro.org>
Subject: Re: [PATCH] usb: typec: tcpm/tcpci_maxim: better interrupt name
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Will
 McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-usb@vger.kernel.org,  linux-kernel@vger.kernel.org
Date: Thu, 13 Feb 2025 11:44:59 +0000
In-Reply-To: <2025021302-malformed-captivity-e862@gregkh>
References: <20250213-max33359-irq-name-v1-1-1900da7a1e79@linaro.org>
	 <2025021302-malformed-captivity-e862@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2-2 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Greg,

On Thu, 2025-02-13 at 11:11 +0100, Greg Kroah-Hartman wrote:
> On Thu, Feb 13, 2025 at 09:37:54AM +0000, Andr=C3=A9 Draszik wrote:
> > This changes the output of /proc/interrupts from the non-descriptive:
> > =C2=A0=C2=A0=C2=A0 1-0025
> > (or similar) to a more descriptive:
> > =C2=A0=C2=A0=C2=A0 1-0025-max33359
> >=20
> > This makes it easier to find the device, in particular if there are
> > multiple i2c devices, as one doesn't have to remember (or lookup) where
> > it is located.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0drivers/usb/typec/tcpm/tcpci_maxim_core.c | 13 ++++++++++---
> > =C2=A01 file changed, 10 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/ty=
pec/tcpm/tcpci_maxim_core.c
> > index fd1b80593367..46fc626589db 100644
> > --- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> > +++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> > @@ -420,12 +420,14 @@ static irqreturn_t max_tcpci_isr(int irq, void *d=
ev_id)
> > =C2=A0	return IRQ_WAKE_THREAD;
> > =C2=A0}
> > =C2=A0
> > -static int max_tcpci_init_alert(struct max_tcpci_chip *chip, struct i2=
c_client *client)
> > +static int max_tcpci_init_alert(struct max_tcpci_chip *chip,
> > +				struct i2c_client *client,
> > +				const char *name)
> > =C2=A0{
> > =C2=A0	int ret;
> > =C2=A0
> > =C2=A0	ret =3D devm_request_threaded_irq(chip->dev, client->irq, max_tc=
pci_isr, max_tcpci_irq,
> > -					(IRQF_TRIGGER_LOW | IRQF_ONESHOT), dev_name(chip->dev),
> > +					(IRQF_TRIGGER_LOW | IRQF_ONESHOT), name,
> > =C2=A0					chip);
> > =C2=A0
> > =C2=A0	if (ret < 0)
> > @@ -485,6 +487,7 @@ static int max_tcpci_probe(struct i2c_client *clien=
t)
> > =C2=A0	int ret;
> > =C2=A0	struct max_tcpci_chip *chip;
> > =C2=A0	u8 power_status;
> > +	const char *name;
> > =C2=A0
> > =C2=A0	chip =3D devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
> > =C2=A0	if (!chip)
> > @@ -531,7 +534,11 @@ static int max_tcpci_probe(struct i2c_client *clie=
nt)
> > =C2=A0
> > =C2=A0	chip->port =3D tcpci_get_tcpm_port(chip->tcpci);
> > =C2=A0
> > -	ret =3D max_tcpci_init_alert(chip, client);
> > +	name =3D devm_kasprintf(&client->dev, GFP_KERNEL, "%s-%s",
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_name(&client->dev), client->name=
);
> > +	if (!name)
> > +		return -ENOMEM;
>=20
> Please always test your code before sending it out.=C2=A0 You just leaked=
 a
> bunch of stuff here :(

Thanks for the review!

I can not see what leak you're referring to. Could you please clarify?

Thanks,
Andre'



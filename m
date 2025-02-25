Return-Path: <linux-usb+bounces-21012-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEDFA437DA
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 09:42:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 382A11758F8
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 08:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62E1B260A38;
	Tue, 25 Feb 2025 08:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Envf/ird"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117CB254858
	for <linux-usb@vger.kernel.org>; Tue, 25 Feb 2025 08:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740472968; cv=none; b=HACowLpUsy+nI3RfU3U7Hn2y2no3LbbUJ+Oke0rvLTT0NJtufv57Wj1B2QoRg/CnC+KKPZfdmKZ4fbakLH0U0asXCD2GZ/cM4/auT3urbBsU2699B9iHfrEwhDK3FLOAE2SP2g1g01IrI4UwmG4nLEb0YAXCJZeX6RrIeaPmyPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740472968; c=relaxed/simple;
	bh=jRXq8ssUo91/daY5t5TlTKQcS9XD51HyEpcgQhSKrbE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cWGRZPVBLVCdPSp4P5cakgIjQ0tNdhZvQYt9chU0GhabAx4et0PDAgByj961+xTXEGzL+InpYfem2gv+ObNrJIds1DalxU/GBUYGsf6Hn6Sovs6pBZWI7Rz2sUzN4Y5YhvGKhO+agrvEh6sMHQjgXuNglR9PjJtJO/9pO7QDU/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Envf/ird; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-439846bc7eeso32937855e9.3
        for <linux-usb@vger.kernel.org>; Tue, 25 Feb 2025 00:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740472964; x=1741077764; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CqB8W2CJN8Ny6/nq8A+RmCQatW6F2vm+JwrvzYnwz3E=;
        b=Envf/irdgQDveYaozPGPhoMRIgsq1vOoGHoW1F80Gm2t+/+hnzVJb0LLRuSY475sjv
         mnc6Pbh0sFruNLg0dN6H50BpCUPjSdbQ34novZ565DLJ2RkTzykN7saASejA/KGeofuv
         nWKDIrBqMlQGMC7uyeqmADiJ7bAbnOoBR0WlX4+sOQEgVsi2CzfwDeSEb2TIV36FOhvp
         6QDEYkkM6dip30j1toeVqEKX4KC7U4lzqFEyuA+9lCnEU5UBwws03tdZkujjAbfKbtNE
         lvtXROELXADtQGWHtSYbQvhaSSdQXvBYQwbkZRklY5rgdPdW/u+SZmp4fudBi0Vjy5XO
         cnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740472964; x=1741077764;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CqB8W2CJN8Ny6/nq8A+RmCQatW6F2vm+JwrvzYnwz3E=;
        b=Qsfmg9XFl8UWILj7UT4+DKJv0dMqcROBbHAkcxXxwqUQRo2ClL54Iihlm9MZCHdBQf
         gL0Q+i7bLRlHfirih2EVjMRU74M4sZTw7arZeuTMJbjlPtOZ4osfgvNDwe/jyByUfJt4
         KkO1dmf2JwaKD+t4xTBDfii2q7f313R6brA8GvQMTP6VLEw42ltD13/ib8/uuCJe3O7Z
         cV2ko1Xo0APU5Ueem/9+oiJywSf34EK5aISKEmCQ0yoCnGCVhS/T2eFYAokyDVyzh511
         d4b1lAmz4m65jmnBj6AtjuaYzQ6AgZeyns7n57D0jo0MbJ2G8XM6LNssUkzWtgt3bIsR
         O/mg==
X-Forwarded-Encrypted: i=1; AJvYcCU9Xu5eBrQoZVrW5fAEiXtGYS1S1BK2aaab2bBhn3s847HExb9q7vldOOMCO9cRCOa531FVUXJaJ1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuYmOyOH7yBtGnAnmr/0yxiiWFTZE8eI9TxIGvxh2AMngz38o4
	KGy/pjpV/Gt8YTZCMyMv/JOKaXdJiQ/8gKCAsveqpivQDGmx+rDFFPw8161cRnE=
X-Gm-Gg: ASbGncueMyv/M3uFNlt0HFTVojMtJB76zmPXoznlXoc9vF9Puf3w4vrIILHqnEyIgDX
	fPH7Hg9fiO89MCAtQPIqA6ZC2fXV7ZDG2yMOQIpA625l4ViJruHWy/XS9vrY7HasUw9IiDsjpPu
	DEIwiglyetkXC08vpp923TVIk32Uu6aBcL7CQ6MeyrgU0ljpK8uogYtq/MFF3qcpArbWjBqp+SG
	TQKlAjSvGsWDtW9vHQe+asl6rxPxw5rWJpXImITBRKb7tKheq0AquHwmzZpwpNIbwijd+6pX4cM
	u6NgsU+FAy9ehq1NOVkGQN3teLf4L0c=
X-Google-Smtp-Source: AGHT+IGJgd1NygEBIqg6/grk4B+Un8Sa506Ytea8slhBHwOSxzKdp9L8SvAlX2UbbxiCmluDx72reQ==
X-Received: by 2002:a05:600c:1910:b0:439:9225:2f50 with SMTP id 5b1f17b1804b1-439ae1f1586mr165534235e9.16.1740472964310;
        Tue, 25 Feb 2025 00:42:44 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab1539dc0sm17679615e9.9.2025.02.25.00.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 00:42:43 -0800 (PST)
Message-ID: <a4b065a1b96cf87078320374f7a682b3e3762336.camel@linaro.org>
Subject: Re: [PATCH] usb: typec: tcpm/tcpci_maxim: better interrupt name
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: William McVicker <willmcvicker@google.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, kernel-team@android.com,
 linux-usb@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Tue, 25 Feb 2025 08:42:43 +0000
In-Reply-To: <Z6-8Q9oDj04NurJ5@google.com>
References: <20250213-max33359-irq-name-v1-1-1900da7a1e79@linaro.org>
	 <Z6-8Q9oDj04NurJ5@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Will,

On Fri, 2025-02-14 at 13:57 -0800, William McVicker wrote:
> On 02/13/2025, Andr=C3=A9 Draszik wrote:
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
> > +	ret =3D max_tcpci_init_alert(chip, client, name);
> > =C2=A0	if (ret < 0)
> > =C2=A0		return dev_err_probe(&client->dev, ret,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 "IRQ initialization failed\n");
>=20
> Can you just change the `init_name` instead like this?
>=20
> =C2=A0 chip->client->dev.init_name =3D name;
>=20
> That way calling `dev_name()` will get you this more informative name as =
well?

I don't think that member is supposed to be set by anybody. Looking
at device_add(), this seems to only be meant to be statically set
by statically allocated devices and is cleared upon device_add().
Essentially no driver sets this in the kernel.

So it doesn't appear to be appropriate.

Cheers,
Andre'



Return-Path: <linux-usb+bounces-7746-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23562876C94
	for <lists+linux-usb@lfdr.de>; Fri,  8 Mar 2024 22:58:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5655D282CF7
	for <lists+linux-usb@lfdr.de>; Fri,  8 Mar 2024 21:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711B95FDAD;
	Fri,  8 Mar 2024 21:58:30 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B3424B2A
	for <linux-usb@vger.kernel.org>; Fri,  8 Mar 2024 21:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709935110; cv=none; b=Z1HjwBb5XUhoXIsNfWKP/j9zuhD5CHGnUiCgexJ9xiDFWEDZndYxmbpPzARjIyBlc9uO5Ljx8cBNBuuSDZaQ+xyr5ixFXwVmRxwMDN9ujTm1YbHiZcBUI72MlOKOScJH/QyNzmPbmKvnbZWm8GP7FqQLfNnS7Gdw5q4XB7Vy/p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709935110; c=relaxed/simple;
	bh=jdRp3ycnJ2inLRjB5QbGRF0M5UnIWgjy+M+stLJdElI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ANDCbwqW9fMzMdbo3d+I9bvj1mEp1i/eMMIqDaRESX+BBwm+uzM/4Fb0n2q4GsZR7j23j3spEzZqXNs96r6PukTbdp+nWGzIgt3qkaAUAuMr07tQBJ7Ao5mmNgyZFg+tH+GuMch5n1jhj/RD3que1QkMhgbCsUDldBvQw2jJ/4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5dca1efad59so2041906a12.2
        for <linux-usb@vger.kernel.org>; Fri, 08 Mar 2024 13:58:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709935107; x=1710539907;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ssskNoWRSgCf0JIsEmdc/9vm6xbNQG/h290+Hjyy4Ms=;
        b=TD/lLVa8PwJMBrwrxiA2KfhiCRSt5O6FFKkz+DCkkmjj7SptTcNSeI4zi2q7h3VNkJ
         OdEFevbQQq6/rb5u/uRHgzCBoLUKkHI7+PezD2Lio0aPfmsKrNvazGSBjOrTcKIQgtlE
         +woIsL6149h2nAcgdYFVbKzdLjtTffcxTflPPnLzhdEnZssPlca33rno9jyDBx2rn0WG
         XGzXCaIfNmV3AZSWe7tPBmCa9JG8oZTt/zXFucyicxMtR0OW3BcGH+7JJuzbOZgqamUY
         LaIh0GuOWXOs5Y1BgVPIp4blNhs5GhvpntQGfrKoc5mjTJcqJUOneqp9iWzFOojM/uT8
         ovUg==
X-Forwarded-Encrypted: i=1; AJvYcCXigaQmWMEzJwOW4vmJ9VxexQjxfobGl73A1HkJNe3AJRwpaFFqeHdzhXnvTM6za7AWjt5d/JCHejSXOklEpUFKhYffwUuvNJhr
X-Gm-Message-State: AOJu0YztRb86tSdCbOqfhNKJNadgcDrs3ZcauBcacArLZxq1RIYQfXQC
	0LN/gDBggJZTXf5udpUhykKpJLfRcwSyc9hLOb5aDGiYX8S802l7L/Oa7avQXphmdY2vQEGSyoZ
	un2M=
X-Google-Smtp-Source: AGHT+IFZ/B9Q9BM4+JaRrVPqYSOZwZirEIB9Olp87R9nCLM6pykqEyS178FOw4nQALVX/Vp33qnx1A==
X-Received: by 2002:a05:6a20:1454:b0:1a0:e944:15b7 with SMTP id a20-20020a056a20145400b001a0e94415b7mr357270pzi.5.1709935106742;
        Fri, 08 Mar 2024 13:58:26 -0800 (PST)
Received: from localhost (71-212-63-227.tukw.qwest.net. [71.212.63.227])
        by smtp.gmail.com with ESMTPSA id g19-20020a631113000000b005cd8044c6fesm167442pgl.23.2024.03.08.13.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 13:58:26 -0800 (PST)
From: Kevin Hilman <khilman@kernel.org>
To: =?utf-8?Q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Greg
 Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Roger Quadros <rogerq@kernel.org>, Peter Chen
 <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, Nishanth
 Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo
 <kristo@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?utf-8?Q?Gr=C3=A9gor?=
 =?utf-8?Q?y?= Clement
 <gregory.clement@bootlin.com>, Alan Stern <stern@rowland.harvard.edu>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 =?utf-8?Q?Th=C3=A9o?=
 Lebrun <theo.lebrun@bootlin.com>
Subject: Re: [PATCH v4 4/9] usb: cdns3-ti: support reset-on-resume behavior
In-Reply-To: <20240307-j7200-usb-suspend-v4-4-5ec7615431f3@bootlin.com>
References: <20240307-j7200-usb-suspend-v4-0-5ec7615431f3@bootlin.com>
 <20240307-j7200-usb-suspend-v4-4-5ec7615431f3@bootlin.com>
Date: Fri, 08 Mar 2024 13:58:25 -0800
Message-ID: <7h4jdgperi.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Th=C3=A9o Lebrun <theo.lebrun@bootlin.com> writes:

> Add match data support, with one boolean to indicate whether the
> hardware resets after a system-wide suspend. If hardware resets, we
> force execute ->runtime_resume() at system-wide resume to run the
> hardware init sequence.

Is "whether the hardware resets after a system-wide suspend" really a
function of the IP itself, or rather whether the IP is in a power domain
that might power down?

> No compatible exploits this functionality, just yet.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---
>  drivers/usb/cdns3/cdns3-ti.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/drivers/usb/cdns3/cdns3-ti.c b/drivers/usb/cdns3/cdns3-ti.c
> index 4c8a557e6a6f..f76327566798 100644
> --- a/drivers/usb/cdns3/cdns3-ti.c
> +++ b/drivers/usb/cdns3/cdns3-ti.c
> @@ -57,9 +57,14 @@ struct cdns_ti {
>  	unsigned vbus_divider:1;
>  	struct clk *usb2_refclk;
>  	struct clk *lpm_clk;
> +	const struct cdns_ti_match_data *match_data;
>  	int usb2_refclk_rate_code;
>  };
>=20=20
> +struct cdns_ti_match_data {
> +	bool reset_on_resume;
> +};
> +
>  static const int cdns_ti_rate_table[] =3D {	/* in KHZ */
>  	9600,
>  	10000,
> @@ -101,6 +106,7 @@ static int cdns_ti_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, data);
>=20=20
>  	data->dev =3D dev;
> +	data->match_data =3D device_get_match_data(dev);
>=20=20
>  	data->usbss =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(data->usbss)) {
> @@ -220,8 +226,29 @@ static int cdns_ti_runtime_resume(struct device *dev)
>  	return 0;
>  }
>=20=20
> +static int cdns_ti_suspend(struct device *dev)
> +{
> +	struct cdns_ti *data =3D dev_get_drvdata(dev);
> +
> +	if (data->match_data && data->match_data->reset_on_resume)
> +		return pm_runtime_force_suspend(dev);
> +	else
> +		return 0;
> +}
> +
> +static int cdns_ti_resume(struct device *dev)
> +{
> +	struct cdns_ti *data =3D dev_get_drvdata(dev);
> +
> +	if (data->match_data && data->match_data->reset_on_resume)
> +		return pm_runtime_force_resume(dev);
> +	else
> +		return 0;
> +}

Conditionally forcing runtime suspend/resume based on a property of the
IP doesn't feel right to me.

IMO, the device should always runtime suspend/resume, and in the
runtime PM hooks is where the conditional logic should be.

And speaking of the conditional logic... let's go back to whether
"resets_on_resume" is a property of the IP or the enclosing power
domain.

Instead of having an IP-specific flag, another way of approaching this
when ->runtime_resume() is called every time is simply for that hook to
check if a reset has happend.  Sometimes you can tell this simply by
reading a register that has been previously programmed by the driver but
has a known reset.  Simply check that regisister and you can tell
whether context has been lost.

Doing it this way makes the driver "smart" and then you don't have to
rely on bool flag based on the IP and dependent on the DT compatible.

Kevin


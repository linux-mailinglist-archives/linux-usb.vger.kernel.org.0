Return-Path: <linux-usb+bounces-2833-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4677E7EA032
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 16:39:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE6FCB209A5
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 15:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8BCD219F8;
	Mon, 13 Nov 2023 15:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="h+pKxhhp"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951122136C;
	Mon, 13 Nov 2023 15:39:22 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2F97C2;
	Mon, 13 Nov 2023 07:39:20 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A665E1BF205;
	Mon, 13 Nov 2023 15:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699889959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u9MG5uzj9KQUsOrxENnxvvEipektRY8PwOqU1a1sxvk=;
	b=h+pKxhhp1kqlFBkKKeFOsot3Jc+zUn/nlEFFWqEDlvHPcjtwahibUEAswn7zXe4hcGw8Sk
	w5xONfMo8ugmcpJwE3Gw/L0dWz/D/1LfSI2tdeC6KZUFLf1Q9RV9wwyyvu0uo9mzp7EW/2
	r8bLenTiq9QDk03wLryYQkAxHwzlZdMMsDEK57EM1RYL1AVzuf6fq7ilsXrjU8dxdbkILK
	LWmHeeXv945ljH7MmJyzKv+ykSBPZ0V2fgLU4BOhU2bqqEH0Klv4qozh8ovDTk7BGA+Si1
	rA4xMoo1nFE+CgAXxnl6DdAdximE7BqZRfHJLhevYE/Ygc1PUEMQdeDowLKknw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: =?utf-8?Q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Greg
 Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Roger Quadros <rogerq@kernel.org>, Peter Chen
 <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, Nishanth
 Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo
 <kristo@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 =?utf-8?Q?Th=C3=A9o?=
 Lebrun <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 3/6] usb: cdns3-ti: add suspend/resume procedures for J7200
In-Reply-To: <20231113-j7200-usb-suspend-v1-3-ad1ee714835c@bootlin.com>
References: <20231113-j7200-usb-suspend-v1-0-ad1ee714835c@bootlin.com>
 <20231113-j7200-usb-suspend-v1-3-ad1ee714835c@bootlin.com>
Date: Mon, 13 Nov 2023 16:39:17 +0100
Message-ID: <87zfzh64t6.fsf@BL-laptop>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Hello Th=C3=A9o,

> Hardware initialisation is only done at probe. The J7200 USB controller
> is reset at resume because of power-domains toggling off & on. We
> therefore (1) toggle PM runtime at suspend/resume & (2) reconfigure the
> hardware at resume.
>
> Reuse the newly extracted cdns_ti_init_hw() function that contains the
> register write sequence.
>
> We guard this behavior based on compatible to avoid modifying the
> current behavior on other platforms. If the controller does not reset
> we do not want to touch PM runtime & do not want to redo reg writes.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---
>  drivers/usb/cdns3/cdns3-ti.c | 48 ++++++++++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 47 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/cdns3/cdns3-ti.c b/drivers/usb/cdns3/cdns3-ti.c
> index c331bcd2faeb..50b38c4b9c87 100644
> --- a/drivers/usb/cdns3/cdns3-ti.c
> +++ b/drivers/usb/cdns3/cdns3-ti.c
> @@ -197,6 +197,50 @@ static int cdns_ti_probe(struct platform_device *pde=
v)
>  	return error;
>  }
>=20=20
> +#ifdef CONFIG_PM
> +
> +static int cdns_ti_suspend(struct device *dev)
> +{
> +	struct cdns_ti *data =3D dev_get_drvdata(dev);
> +
> +	if (!of_device_is_compatible(dev_of_node(dev), "ti,j7200-usb"))
> +		return 0;

Just a small remark:

What about adding a boolean in the cdns_ti struct for taking care of
it ? Then you will go through the device tree only during probe. Moreover
if this behaviour is needed for more compatible we can just add them in
the probe too.

Besides this you still can add my

Reviewed-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory

> +
> +	pm_runtime_put_sync(data->dev);
> +
> +	return 0;
> +}
> +
> +static int cdns_ti_resume(struct device *dev)
> +{
> +	struct cdns_ti *data =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (!of_device_is_compatible(dev_of_node(dev), "ti,j7200-usb"))
> +		return 0;
> +
> +	ret =3D pm_runtime_get_sync(dev);
> +	if (ret < 0) {
> +		dev_err(dev, "pm_runtime_get_sync failed: %d\n", ret);
> +		goto err;
> +	}
> +
> +	cdns_ti_init_hw(data);
> +
> +	return 0;
> +
> +err:
> +	pm_runtime_put_sync(data->dev);
> +	pm_runtime_disable(data->dev);
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops cdns_ti_pm_ops =3D {
> +	SET_SYSTEM_SLEEP_PM_OPS(cdns_ti_suspend, cdns_ti_resume)
> +};
> +
> +#endif /* CONFIG_PM */
> +
>  static int cdns_ti_remove_core(struct device *dev, void *c)
>  {
>  	struct platform_device *pdev =3D to_platform_device(dev);
> @@ -218,6 +262,7 @@ static void cdns_ti_remove(struct platform_device *pd=
ev)
>  }
>=20=20
>  static const struct of_device_id cdns_ti_of_match[] =3D {
> +	{ .compatible =3D "ti,j7200-usb", },
>  	{ .compatible =3D "ti,j721e-usb", },
>  	{ .compatible =3D "ti,am64-usb", },
>  	{},
> @@ -228,8 +273,9 @@ static struct platform_driver cdns_ti_driver =3D {
>  	.probe		=3D cdns_ti_probe,
>  	.remove_new	=3D cdns_ti_remove,
>  	.driver		=3D {
> -		.name	=3D "cdns3-ti",
> +		.name		=3D "cdns3-ti",
>  		.of_match_table	=3D cdns_ti_of_match,
> +		.pm		=3D pm_ptr(&cdns_ti_pm_ops),
>  	},
>  };
>=20=20
>
> --=20
> 2.41.0
>
>

--=20
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com


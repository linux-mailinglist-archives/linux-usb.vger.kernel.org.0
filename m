Return-Path: <linux-usb+bounces-2896-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B557EC15A
	for <lists+linux-usb@lfdr.de>; Wed, 15 Nov 2023 12:38:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C1AE281395
	for <lists+linux-usb@lfdr.de>; Wed, 15 Nov 2023 11:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07A8171B3;
	Wed, 15 Nov 2023 11:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C1btWkMT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E14168B4;
	Wed, 15 Nov 2023 11:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9DD4C433C8;
	Wed, 15 Nov 2023 11:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700048277;
	bh=Pu4tFAOY3zxIIjiLvSPYrBxg0B7lYHQiyaQQXyNG4sI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C1btWkMToN5RfkwTirTgfoqjtovEzIAC5G2W5FcV2dedEYaiyQ2+PauqC3i8TOS5S
	 mJL27GvEUxF5C1zsi+aLhlvYd700Kjs0bVRRk5lH2f28a8jjP+wZgsgEj9D3o4Wc/a
	 8IwElx5j3f+X7TItvpfL5cvWbmk1bXzGdXEmHZMF+uAlOKDFFlAuD/SQeiS0PgK7qW
	 UYgx37uoGlshojY/ScnopSxpX5c2EqJ7wRvDN4owObZuxpw33NheSHuuIMt74fw4tK
	 FpZG3THZ6pakM9X/s7ITUsYQxninvteLr/7cp3Cd6RlmRrr/TBUELLAKZ5TJoutbbU
	 GOlxAwRpSMPsA==
Message-ID: <5080372b-1f48-4cbc-a6c4-8689c28983cb@kernel.org>
Date: Wed, 15 Nov 2023 13:37:51 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] usb: cdns3-ti: add suspend/resume procedures for
 J7200
Content-Language: en-US
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Chen <peter.chen@kernel.org>,
 Pawel Laszczak <pawell@cadence.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20231113-j7200-usb-suspend-v1-0-ad1ee714835c@bootlin.com>
 <20231113-j7200-usb-suspend-v1-3-ad1ee714835c@bootlin.com>
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20231113-j7200-usb-suspend-v1-3-ad1ee714835c@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 13/11/2023 16:26, Théo Lebrun wrote:
> Hardware initialisation is only done at probe. The J7200 USB controller
> is reset at resume because of power-domains toggling off & on. We
> therefore (1) toggle PM runtime at suspend/resume & (2) reconfigure the
> hardware at resume.

at probe we are doing a pm_runtime_get() and never doing a put thus
preventing any runtime PM.

> 
> Reuse the newly extracted cdns_ti_init_hw() function that contains the
> register write sequence.
> 
> We guard this behavior based on compatible to avoid modifying the
> current behavior on other platforms. If the controller does not reset
> we do not want to touch PM runtime & do not want to redo reg writes.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  drivers/usb/cdns3/cdns3-ti.c | 48 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 47 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/cdns3/cdns3-ti.c b/drivers/usb/cdns3/cdns3-ti.c
> index c331bcd2faeb..50b38c4b9c87 100644
> --- a/drivers/usb/cdns3/cdns3-ti.c
> +++ b/drivers/usb/cdns3/cdns3-ti.c
> @@ -197,6 +197,50 @@ static int cdns_ti_probe(struct platform_device *pdev)
>  	return error;
>  }
>  
> +#ifdef CONFIG_PM
> +
> +static int cdns_ti_suspend(struct device *dev)
> +{
> +	struct cdns_ti *data = dev_get_drvdata(dev);
> +
> +	if (!of_device_is_compatible(dev_of_node(dev), "ti,j7200-usb"))
> +		return 0;
> +
> +	pm_runtime_put_sync(data->dev);
> +
> +	return 0;

You might want to check suspend/resume ops in cdns3-plat and
do something similar here.

> +}
> +
> +static int cdns_ti_resume(struct device *dev)
> +{
> +	struct cdns_ti *data = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (!of_device_is_compatible(dev_of_node(dev), "ti,j7200-usb"))
> +		return 0;
> +
> +	ret = pm_runtime_get_sync(dev);
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
> +static const struct dev_pm_ops cdns_ti_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(cdns_ti_suspend, cdns_ti_resume)
> +};
> +
> +#endif /* CONFIG_PM */
> +
>  static int cdns_ti_remove_core(struct device *dev, void *c)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
> @@ -218,6 +262,7 @@ static void cdns_ti_remove(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id cdns_ti_of_match[] = {
> +	{ .compatible = "ti,j7200-usb", },
>  	{ .compatible = "ti,j721e-usb", },
>  	{ .compatible = "ti,am64-usb", },
>  	{},
> @@ -228,8 +273,9 @@ static struct platform_driver cdns_ti_driver = {
>  	.probe		= cdns_ti_probe,
>  	.remove_new	= cdns_ti_remove,
>  	.driver		= {
> -		.name	= "cdns3-ti",
> +		.name		= "cdns3-ti",
>  		.of_match_table	= cdns_ti_of_match,
> +		.pm		= pm_ptr(&cdns_ti_pm_ops),
>  	},
>  };
>  
> 

-- 
cheers,
-roger


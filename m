Return-Path: <linux-usb+bounces-3117-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D117F3443
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 17:53:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93C80282A3C
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 16:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5491F4A9AF;
	Tue, 21 Nov 2023 16:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ra6Vhd55"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BB52563;
	Tue, 21 Nov 2023 16:53:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CE4CC433C7;
	Tue, 21 Nov 2023 16:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700585615;
	bh=dXMSeMNK+WEBDV6rnNty0bayoAnlHmRDxFemjBJL70E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ra6Vhd55uJUnkSGETGcDSGW77NyER+qrJBIyENP3uAPYGiRUemWipmmhMGJika2xK
	 OTrvmNCYHM2k6oEaRQqR30ujYKgxmVSXp0Cygnya952ww30PVtxhv01Sgm5Meo06Zw
	 DvXk7eEo7SnZEE+J1XCKENfBU3gUTJhVA1FG5bOkGbZasJKZ+8H8c1+dC1heCKtFhK
	 A2fO2twFLiA+Fpf3daT6uxwCp+STjsR39x4g8T+1YcB/wTIIa5asKzcv6Y3/CuVoGX
	 t/BumSB2tJTR85lpdGri4xW6sGKdpZYAVhXnqe6ufmYrjPMhBl2Q3okB/M4JShskYu
	 I0dIeaL3sUNgg==
Message-ID: <d2bd89f1-a86b-4fe4-a7ad-20c7e8caf9b6@kernel.org>
Date: Tue, 21 Nov 2023 18:53:28 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] usb: cdns3-ti: signal reset-on-resume to xHCI for
 J7200 platform
Content-Language: en-US
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Chen <peter.chen@kernel.org>,
 Pawel Laszczak <pawell@cadence.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>
References: <20231120-j7200-usb-suspend-v2-0-038c7e4a3df4@bootlin.com>
 <20231120-j7200-usb-suspend-v2-6-038c7e4a3df4@bootlin.com>
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20231120-j7200-usb-suspend-v2-6-038c7e4a3df4@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 20/11/2023 19:06, Théo Lebrun wrote:
> Pass CDNS3_RESET_ON_RESUME as platform data to cdns3 host role. It will
> in turn pass it down to xHCI platform data as XHCI_RESET_ON_RESUME.
> 
> Avoid this warning on resume:
> 
>   [   16.017462] xhci-hcd xhci-hcd.1.auto: xHC error in resume, USBSTS 0x401, Reinit
> 
> When used, remote wakeup is not expected to work.
> 
> Only focus J7200 as other SoC are untested.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  drivers/usb/cdns3/cdns3-ti.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/cdns3/cdns3-ti.c b/drivers/usb/cdns3/cdns3-ti.c
> index 84f93c2fcd5c..7d56a1acbc54 100644
> --- a/drivers/usb/cdns3/cdns3-ti.c
> +++ b/drivers/usb/cdns3/cdns3-ti.c
> @@ -16,6 +16,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/property.h>
> +#include "core.h"
>  
>  /* USB Wrapper register offsets */
>  #define USBSS_PID		0x0
> @@ -128,6 +129,7 @@ static int cdns_ti_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *node = pdev->dev.of_node;
> +	const struct of_dev_auxdata *auxdata;
>  	struct cdns_ti *data;
>  	unsigned long rate;
>  	int error, i;
> @@ -177,7 +179,8 @@ static int cdns_ti_probe(struct platform_device *pdev)
>  
>  	cdns_ti_init_hw(data);
>  
> -	error = of_platform_populate(node, NULL, NULL, dev);
> +	auxdata = of_device_get_match_data(dev);
> +	error = of_platform_populate(node, NULL, auxdata, dev);
>  	if (error) {
>  		dev_err(dev, "failed to create children: %d\n", error);
>  		return error;
> @@ -222,8 +225,20 @@ static const struct dev_pm_ops cdns_ti_pm_ops = {
>  
>  #endif /* CONFIG_PM */
>  
> +static struct cdns3_platform_data cdns_ti_j7200_pdata = {
> +	.quirks = CDNS3_RESET_ON_RESUME,
> +};

We will need to introduce a new data structure "struct cdns_ti_platform_data"
and add platform specific details like "reset_on_resume" to it.
This is to address what Krzysztof pointed to in patch 4.

> +
> +static const struct of_dev_auxdata cdns_ti_j7200_auxdata[] = {
> +	{
> +		.compatible = "cdns,usb3",
> +		.platform_data = &cdns_ti_j7200_pdata,
> +	},
> +	{},
> +};
> +
>  static const struct of_device_id cdns_ti_of_match[] = {
> -	{ .compatible = "ti,j7200-usb", },
> +	{ .compatible = "ti,j7200-usb", .data = cdns_ti_j7200_auxdata, },

Here we should pass "struct cdns_ti_platform_data"

>  	{ .compatible = "ti,j721e-usb", },
>  	{ .compatible = "ti,am64-usb", },
>  	{},
> 

-- 
cheers,
-roger


Return-Path: <linux-usb+bounces-25856-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB37B06821
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jul 2025 22:52:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30D863A41EB
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jul 2025 20:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D9127F183;
	Tue, 15 Jul 2025 20:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="EpTHwobX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F2D1547CC
	for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 20:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752612660; cv=none; b=ZDEaHVbtpjA4JRt246sfh4FHNMpkt0aX30qpLuPgWwNj0LyWzRPJf/pnBWyBVK38k/PZa4RGXL8sHq8QCWCFQ111/k9Mzq4Bj5EcKCKYhDcvzXghreHgZ/8e2NMm8pC4RmYZnKkEaVXIVT0LLG4SfL8Vnvv3aVcDHG/ADlea7SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752612660; c=relaxed/simple;
	bh=ta9D9l0sNfw9yK5xNXD1io+mIIUgisZQWGkniL0sFwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ajboAmpc9rbnEFNelaX9+gjPgoW/vbnUDqhRgdMWbP0HGHpGsPvheum+T41yQ7b9f5qN6O/4gvgATE9eXo80/85M454gB3g4HR/jTNP3ES/a1G4rh7jdCMiUU+SHHpJdS+nqP7YBee29t5t1bdf42dZk3oquBH5cNZeXzLc+B3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=EpTHwobX; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-875dd57d63bso15710639f.0
        for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 13:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1752612656; x=1753217456; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2PrzlKp6Ndz0XZN+tOgdPWMwN70RpwNAjzRw7fPkSwc=;
        b=EpTHwobX6CJB7IMftTcPLunda58ygbVHVgUcHMTsQKX5DZDnCanfEw20NbcSZVPpWf
         6hkHL6FV2mcqquio/mPytd/wf9UBCA64DvsCZvYI+pS1e6diMt7Yc/CLDjFFmUTiALYW
         VUmqG/IKSy+8HDk52mKjEWRgT98UwCfE4jyoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752612656; x=1753217456;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2PrzlKp6Ndz0XZN+tOgdPWMwN70RpwNAjzRw7fPkSwc=;
        b=Wz0sRaHEmmJpHnRW2vXRt/UkjZwVfqbEHSet2BokF9WiQkLIA+ONrrxQNY4L0APWiZ
         6tMhzOlKp6YwD2/W47jPJTh7jEWNKKkt1ZSEq9Mdu29dw83r0eK94VUFtTW8IWUT5Zh7
         7wPg71tMJF7bs4IJFJCLbVsc07zEF4u1nZR2nBtwI4FW41bJYJnoPGw0A/eUJ4XVgxGS
         SrwPe6P3dsUJsceMnkfETU9TDiQNKwh6MFysNeadPNjXPUAsBK8YZjG3PnqXJ04Awpe6
         AxcVm/42UEkHcOC+4ebpi3wNtsP9qsD9VEibytcGAGjfjQYnC8TcfYRFg31OUFD+K4JX
         A2ag==
X-Gm-Message-State: AOJu0YwUP8VpkoQGIcQHBXi6v1vTkawnCDhbzeWa3E1iLzcGC8FqykkI
	TG+rWH9QxDAL3dw9XZQfDuGzys78uKsbsRNqHNgV9Yl9Lmo9FHk7sddOspG4C6r2aw==
X-Gm-Gg: ASbGncvJLc7YAjEJgP2pwPWpTD/50GURaCEiNmoExsTny6cygmI92NYt9dK9qktYM36
	eWlrcILPA+niWvstBvKm6MrBJMRrH3mEtvntPcssaDVlqI/7h/Gcc9eCfN0quxRA1DL58gJAC1I
	bdb3jLltmkSXOm3/3Q06Un52NNwkY+snqyzdMgxm2obdjywvURMbnZIYnQzoTlm987Q9+cuzzDF
	u3moaI+bvtYiBI9OKoWfYULENZrUH37se73w5q28WmCTkds4DzC8tVbrj/MW6BxELuzfPYD22lJ
	IGn66FeHSMQo+XUvS3fnaoPIEsjNR23s9+7WcFHKVPPrDmzCFjeKr6ZBP8AFLW4CpT+xLA3zFof
	v7NwLuofW6085yp2gwlcuetpEoICKPaXK165DDBy9InQ8QI8ux2neUolu
X-Google-Smtp-Source: AGHT+IHLQJumT9t67r83VjJePjrJb0CNowI2o2x0J9A/UE5FEvsuyjASYQa/RK/HhKJB8B4Tedv2UA==
X-Received: by 2002:a05:6602:7418:b0:873:1e91:210e with SMTP id ca18e2360f4ac-879af07dc11mr540280439f.4.1752612656290;
        Tue, 15 Jul 2025 13:50:56 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50556b0f567sm2718073173.123.2025.07.15.13.50.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 13:50:55 -0700 (PDT)
Message-ID: <d2e9a521-568e-433d-a59b-9b98138ace2b@ieee.org>
Date: Tue, 15 Jul 2025 15:50:54 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] usb: dwc3: add generic driver to support flattened
To: Ze Huang <huang.ze@linux.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250712-dwc3_generic-v6-0-cc87737cc936@linux.dev>
 <20250712-dwc3_generic-v6-2-cc87737cc936@linux.dev>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250712-dwc3_generic-v6-2-cc87737cc936@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/12/25 2:49 AM, Ze Huang wrote:
> To support flattened dwc3 dt model and drop the glue layer, introduce the
> `dwc3-generic` driver. This enables direct binding of the DWC3 core driver
> and offers an alternative to the existing glue driver `dwc3-of-simple`.

I'm not familiar with dwc-of-simple.c, and won't comment on
how this differs from that (or does not).

Given you're implementing an alternative though, can you explain
in a little more detail what's different between the two?  Why
would someone choose to use this driver rather than the other one?

> 
> Signed-off-by: Ze Huang <huang.ze@linux.dev>
> ---
>   drivers/usb/dwc3/Kconfig             |  11 +++
>   drivers/usb/dwc3/Makefile            |   1 +
>   drivers/usb/dwc3/dwc3-generic-plat.c | 182 +++++++++++++++++++++++++++++++++++
>   3 files changed, 194 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> index 310d182e10b50b253d7e5a51674806e6ec442a2a..4925d15084f816d3ff92059b476ebcc799b56b51 100644
> --- a/drivers/usb/dwc3/Kconfig
> +++ b/drivers/usb/dwc3/Kconfig
> @@ -189,4 +189,15 @@ config USB_DWC3_RTK
>   	  or dual-role mode.
>   	  Say 'Y' or 'M' if you have such device.
>   
> +config USB_DWC3_GENERIC_PLAT
> +	tristate "DWC3 Generic Platform Driver"
> +	depends on OF && COMMON_CLK
> +	default USB_DWC3
> +	help
> +	  Support USB3 functionality in simple SoC integrations.
> +	  Currently supports SpacemiT DWC USB3. Platforms using
> +	  dwc3-of-simple can easily switch to dwc3-generic by flattening
> +	  the dwc3 child node in the device tree.
> +	  Say 'Y' or 'M' here if your platform integrates DWC3 in a similar way.
> +
>   endif
> diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
> index 830e6c9e5fe073c1f662ce34b6a4a2da34c407a2..96469e48ff9d189cc8d0b65e65424eae2158bcfe 100644
> --- a/drivers/usb/dwc3/Makefile
> +++ b/drivers/usb/dwc3/Makefile
> @@ -57,3 +57,4 @@ obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
>   obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
>   obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
>   obj-$(CONFIG_USB_DWC3_RTK)		+= dwc3-rtk.o
> +obj-$(CONFIG_USB_DWC3_GENERIC_PLAT)	+= dwc3-generic-plat.o
> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..766f4cf17b6909793956f44660d3b3febad50a23
> --- /dev/null
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> @@ -0,0 +1,182 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * dwc3-generic-plat.c - DesignWare USB3 generic platform driver
> + *
> + * Copyright (C) 2025 Ze Huang <huang.ze@linux.dev>
> + *
> + * Inspired by dwc3-qcom.c and dwc3-of-simple.c
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include "glue.h"
> +
> +struct dwc3_generic {
> +	struct device		*dev;
> +	struct dwc3		dwc;
> +	struct clk_bulk_data	*clks;
> +	int			num_clocks;
> +	struct reset_control	*resets;
> +};
> +
> +static void dwc3_generic_reset_control_assert(void *data)
> +{
> +	reset_control_assert(data);
> +}
> +

The next function can go away.  (See below.)

> +static void dwc3_generic_clk_bulk_disable_unprepare(void *data)
> +{
> +	struct dwc3_generic *dwc3 = data;
> +
> +	clk_bulk_disable_unprepare(dwc3->num_clocks, dwc3->clks);
> +}
> +
> +static int dwc3_generic_probe(struct platform_device *pdev)
> +{
> +	struct dwc3_probe_data probe_data = {};
> +	struct device *dev = &pdev->dev;
> +	struct dwc3_generic *dwc3;
> +	struct resource *res;
> +	int ret;
> +
> +	dwc3 = devm_kzalloc(dev, sizeof(*dwc3), GFP_KERNEL);
> +	if (!dwc3)
> +		return -ENOMEM;
> +
> +	dwc3->dev = dev;
> +
> +	platform_set_drvdata(pdev, dwc3);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "missing memory resource\n");
> +		return -ENODEV;
> +	}
> +
> +	dwc3->resets = devm_reset_control_array_get_optional_exclusive(dev);
> +	if (IS_ERR(dwc3->resets))
> +		return dev_err_probe(dev, PTR_ERR(dwc3->resets), "failed to get resets\n");
> +

It isn't enforced on exclusive resets, but I'm pretty sure
resets are assumed to be asserted initially.

> +	ret = reset_control_assert(dwc3->resets);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to assert resets\n");
> +
> +	ret = devm_add_action_or_reset(dev, dwc3_generic_reset_control_assert, dwc3->resets);
> +	if (ret)
> +		return ret;

The re-assert shouldn't be set up unless the deassert below
succeeds.

> +	usleep_range(10, 1000);

This seems like a large range.  You could just do msleep(1);
Also, can you add a comment explaining why a delay is needed,
and why 1 millisecond is the right amount of time to sleep?

> +	ret = reset_control_deassert(dwc3->resets);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to deassert resets\n");
> +
> +	ret = devm_clk_bulk_get_all(dwc3->dev, &dwc3->clks);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to get clocks\n");

Call devm_clk_bulk_get_all_enabled() instead of doing the two
steps separately here.

					-Alex

> +	dwc3->num_clocks = ret;
> +
> +	ret = clk_bulk_prepare_enable(dwc3->num_clocks, dwc3->clks);
> +	if (ret)
j> +		return dev_err_probe(dev, ret, "failed to enable clocks\n");
> +
> +	ret = devm_add_action_or_reset(dev, dwc3_generic_clk_bulk_disable_unprepare, dwc3);
> +	if (ret)
> +		return ret;
> +
> +	dwc3->dwc.dev = dev;
> +	probe_data.dwc = &dwc3->dwc;
> +	probe_data.res = res;
> +	probe_data.ignore_clocks_and_resets = true;
> +	ret = dwc3_core_probe(&probe_data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register DWC3 Core\n");
> +
> +	return 0;
> +}
> +
> +static void dwc3_generic_remove(struct platform_device *pdev)
> +{
> +	struct dwc3_generic *dwc3 = platform_get_drvdata(pdev);
> +
> +	dwc3_core_remove(&dwc3->dwc);
> +}
> +
> +static int dwc3_generic_suspend(struct device *dev)
> +{
> +	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = dwc3_pm_suspend(&dwc3->dwc);
> +	if (ret)
> +		return ret;
> +
> +	clk_bulk_disable_unprepare(dwc3->num_clocks, dwc3->clks);
> +
> +	return 0;
> +}
> +
> +static int dwc3_generic_resume(struct device *dev)
> +{
> +	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_bulk_prepare_enable(dwc3->num_clocks, dwc3->clks);
> +	if (ret)
> +		return ret;
> +
> +	ret = dwc3_pm_resume(&dwc3->dwc);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int dwc3_generic_runtime_suspend(struct device *dev)
> +{
> +	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
> +
> +	return dwc3_runtime_suspend(&dwc3->dwc);
> +}
> +
> +static int dwc3_generic_runtime_resume(struct device *dev)
> +{
> +	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
> +
> +	return dwc3_runtime_resume(&dwc3->dwc);
> +}
> +
> +static int dwc3_generic_runtime_idle(struct device *dev)
> +{
> +	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
> +
> +	return dwc3_runtime_idle(&dwc3->dwc);
> +}
> +
> +static const struct dev_pm_ops dwc3_generic_dev_pm_ops = {
> +	SYSTEM_SLEEP_PM_OPS(dwc3_generic_suspend, dwc3_generic_resume)
> +	RUNTIME_PM_OPS(dwc3_generic_runtime_suspend, dwc3_generic_runtime_resume,
> +		       dwc3_generic_runtime_idle)
> +};
> +
> +static const struct of_device_id dwc3_generic_of_match[] = {
> +	{ .compatible = "spacemit,k1-dwc3", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);
> +
> +static struct platform_driver dwc3_generic_driver = {
> +	.probe		= dwc3_generic_probe,
> +	.remove		= dwc3_generic_remove,
> +	.driver		= {
> +		.name	= "dwc3-generic-plat",
> +		.of_match_table = dwc3_generic_of_match,
> +		.pm	= pm_ptr(&dwc3_generic_dev_pm_ops),
> +	},
> +};
> +module_platform_driver(dwc3_generic_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("DesignWare USB3 generic platform driver");
> 



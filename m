Return-Path: <linux-usb+bounces-31623-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3FCCCE0CB
	for <lists+linux-usb@lfdr.de>; Fri, 19 Dec 2025 01:22:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A68F23028C56
	for <lists+linux-usb@lfdr.de>; Fri, 19 Dec 2025 00:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E9F1E5B94;
	Fri, 19 Dec 2025 00:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="hJ5t+wb6";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="cPwdtaEG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7521C84A6;
	Fri, 19 Dec 2025 00:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766103764; cv=none; b=agh820v4Q1BraSAEvOIGaLRfUf/QRgOwyERcOfU0KaKJZ2BhgxU+zHNfvhmTP+L/vXnyc8kTMpeKqduU4oVvoBvF3HYVqpwDWS4ZCBr9QmshL0ylO/aVwhHCHUR8Ld7GiUYGHeC08QSKSrRHwmhLQ9WHYh7YpdYSIN/dKCbyE6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766103764; c=relaxed/simple;
	bh=PTOgKRDyXQsYi2sqDj2MMaZ1zo748jWk0jnvnyy1FOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L7aObmVhIBEHShWc+FPyJhG0HHVw/wfnTXDHpji946HnPHkhT5bgs3X3Bh1GRQVKTxR1LzfkfeJ7zcUMwlKfcu+qbcJ5IX/8+bFRIK7CYGpgtCQIZOQ6sIyhlkhoBvn10eIwCCBRhr64K8l3jUFOLBxr/8o9de902HRSAoysyl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=hJ5t+wb6; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=cPwdtaEG; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1766103761; bh=PTOgKRDyXQsYi2sqDj2MMaZ1zo748jWk0jnvnyy1FOc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hJ5t+wb6phVm5Y6TNB7JRCUe2l33GArgInDrqRCYQZ4AxJBmQRXAsbBOSL3CkSqi5
	 YNHgrRz/+w8mAjxriE9mfhWlE9cPlrqVAnR9K0Hg5Yg7gCVh3dGjIRf6oFVFI1760X
	 RgIGJv118NHEOi+aOhKpouBw1XLbSZyjrDTZUTbbprNXlWdqzNeRs7Yj1D8jvOeuP4
	 seGOws6AXzuvYwc9MJuPKxr/XQHgRE3hP88jJ5XgIg3qdbinyPm3fuHxhXxQHbm34l
	 y+dzAstiyNfr+GqVSAm9XIDlhlAcbWlnf6LJcybhWqnUtcYcXDdmiCToIvrU2SGfSz
	 0VSX8n/uFIZvQ==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 0172B3E7A9A;
	Fri, 19 Dec 2025 00:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1766103760; bh=PTOgKRDyXQsYi2sqDj2MMaZ1zo748jWk0jnvnyy1FOc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cPwdtaEGs8LB0pTZEt9KmKNg8S6ulPfjq318D7LqxToZUr7VG0bGb/dEyX9xdNo+F
	 lgb61IpqOeIl2yA+gpft0vN235CZI40ghX1CwqULIqWHKlswaqYqZisP133tvJNcdT
	 5N/kihIOnSferKwNPK8gM9eDbylqn6rBd5TaspA2E+CZ+ib9TrdzC9ANIJCB+0PGMF
	 YDcTlkaz/yETqSBE5OTTnPk328zro+filTQ2GtRdqa/eTQcZx2p+C16CtE4X4++O7T
	 HA7abbdbi/TVGSvMVpg+XyvZd6vDyF6Yu+Ycrqp/m4zu3/M6cddccdRQsQxgd7Y1vl
	 nv1/WYAVe0wMA==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 7E1A53E769B;
	Fri, 19 Dec 2025 00:22:40 +0000 (UTC)
Message-ID: <09fd6c25-a35e-4f9e-a457-92f6506f461f@mleia.com>
Date: Fri, 19 Dec 2025 02:22:39 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] usb: gadget: lpc32xx_udc: clean up probe error
 labels
To: Johan Hovold <johan@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Alan Stern <stern@rowland.harvard.edu>, Ma Ke <make24@iscas.ac.cn>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251218153519.19453-1-johan@kernel.org>
 <20251218153519.19453-5-johan@kernel.org>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20251218153519.19453-5-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251219_002241_023336_4C6E099F 
X-CRM114-Status: GOOD (  16.78  )

On 12/18/25 17:35, Johan Hovold wrote:
> Error labels should be named after what they do rather than after from
> where they are jumped to.
> 
> Rename the probe error labels for consistency and to improve
> readability.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>   drivers/usb/gadget/udc/lpc32xx_udc.c | 21 ++++++++++-----------
>   1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
> index a962d4294fbe..83c7e243dcf9 100644
> --- a/drivers/usb/gadget/udc/lpc32xx_udc.c
> +++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
> @@ -3084,7 +3084,7 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
>   	if (!udc->udca_v_base) {
>   		dev_err(udc->dev, "error getting UDCA region\n");
>   		retval = -ENOMEM;
> -		goto i2c_fail;
> +		goto err_disable_clk;
>   	}
>   	udc->udca_p_base = dma_handle;
>   	dev_dbg(udc->dev, "DMA buffer(0x%x bytes), P:0x%08x, V:0x%p\n",
> @@ -3097,7 +3097,7 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
>   	if (!udc->dd_cache) {
>   		dev_err(udc->dev, "error getting DD DMA region\n");
>   		retval = -ENOMEM;
> -		goto dma_alloc_fail;
> +		goto err_free_dma;
>   	}
>   
>   	/* Clear USB peripheral and initialize gadget endpoints */
> @@ -3111,14 +3111,14 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
>   	if (retval < 0) {
>   		dev_err(udc->dev, "LP request irq %d failed\n",
>   			udc->udp_irq[IRQ_USB_LP]);
> -		goto irq_req_fail;
> +		goto err_destroy_pool;
>   	}
>   	retval = devm_request_irq(dev, udc->udp_irq[IRQ_USB_HP],
>   				  lpc32xx_usb_hp_irq, 0, "udc_hp", udc);
>   	if (retval < 0) {
>   		dev_err(udc->dev, "HP request irq %d failed\n",
>   			udc->udp_irq[IRQ_USB_HP]);
> -		goto irq_req_fail;
> +		goto err_destroy_pool;
>   	}
>   
>   	retval = devm_request_irq(dev, udc->udp_irq[IRQ_USB_DEVDMA],
> @@ -3126,7 +3126,7 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
>   	if (retval < 0) {
>   		dev_err(udc->dev, "DEV request irq %d failed\n",
>   			udc->udp_irq[IRQ_USB_DEVDMA]);
> -		goto irq_req_fail;
> +		goto err_destroy_pool;
>   	}
>   
>   	/* The transceiver interrupt is used for VBUS detection and will
> @@ -3137,7 +3137,7 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
>   	if (retval < 0) {
>   		dev_err(udc->dev, "VBUS request irq %d failed\n",
>   			udc->udp_irq[IRQ_USB_ATX]);
> -		goto irq_req_fail;
> +		goto err_destroy_pool;
>   	}
>   
>   	/* Initialize wait queue */
> @@ -3146,7 +3146,7 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
>   
>   	retval = usb_add_gadget_udc(dev, &udc->gadget);
>   	if (retval < 0)
> -		goto add_gadget_fail;
> +		goto err_destroy_pool;
>   
>   	dev_set_drvdata(dev, udc);
>   	device_init_wakeup(dev, 1);
> @@ -3158,13 +3158,12 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
>   	dev_info(udc->dev, "%s version %s\n", driver_name, DRIVER_VERSION);
>   	return 0;
>   
> -add_gadget_fail:
> -irq_req_fail:
> +err_destroy_pool:
>   	dma_pool_destroy(udc->dd_cache);
> -dma_alloc_fail:
> +err_free_dma:
>   	dma_free_coherent(&pdev->dev, UDCA_BUFF_SIZE,
>   			  udc->udca_v_base, udc->udca_p_base);
> -i2c_fail:
> +err_disable_clk:
>   	clk_disable_unprepare(udc->usb_slv_clk);
>   err_put_client:
>   	put_device(&udc->isp1301_i2c_client->dev);

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

-- 
Best wishes,
Vladimir


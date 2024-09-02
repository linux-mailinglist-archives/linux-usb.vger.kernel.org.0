Return-Path: <linux-usb+bounces-14498-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60192968948
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2024 15:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E3E81C21B42
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2024 13:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6D320FA9E;
	Mon,  2 Sep 2024 13:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="WAYlBi5y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C59183CBB
	for <linux-usb@vger.kernel.org>; Mon,  2 Sep 2024 13:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725285571; cv=none; b=qDaL8nTx/KRLeqznD67awMAkc9F+d7GrC1d7dCWeLkYz4jb8JkBcl/18YR9CpfZbr/VtZUkhFuxiIlVPw+DOoBDUElOdcrbrFhEt2osTa3GDnCcZ9Ln5GGHVPumxKinuIN+4oYYQVFmiOYlbC07L/yakL+kYVOk4wuSywStZEa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725285571; c=relaxed/simple;
	bh=DPUwrKEX2aTzxirXKp5y/TNy2XqvUYq/gxL8iKrJ+jY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O/15CfrAVy8DdAP/uI4m1Gy774Q7mmBXQKuPDZeTtuWYyqJ627tL9W+dEWqwve52GV+Zqdj3kQ1ev6ktXsKjEl5oFZ/25GlZxhjJj91vLE8J9CaIMD+unR47xeIWnxbmPeNl7IjhKvFuJaIjAUhDzAvfiZoyEmXr9PJuCIg5GiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=WAYlBi5y; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6c35357cdacso12335026d6.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Sep 2024 06:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1725285568; x=1725890368; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3gbj1ygV/9/idhVix3ALp3+oVE2OAL81xJouBb7EPq0=;
        b=WAYlBi5y4f53D+SrE221/U2EyprjLt/nkRN5HMZyLkBZnEl/OhSNmSGc3fOCqpF0+t
         xSyywD6IKT42mlnn63e1H+1or1TecXljREvy8P+E76cZczcBrwLdDND35YcG6a8GL80P
         dXgEAPuarILURqWbHKCRyznsrS3hj5PNnuEKiTfdoKivhx7yMvegezNqiP7XPmfQVKFD
         sxhiTWoS7Kz+Ld209NDacJo2IbH0E8fCkvl0t+4E8A6mi4+WQ8ZlGpK9CQF6mFRLNvxl
         T4M7giRbKXJq3V6OuzybNR0fD+679RCK3rn114nyR+xN5r/HEM2k35CQNrwb/b9KA3Ii
         ra0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725285568; x=1725890368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gbj1ygV/9/idhVix3ALp3+oVE2OAL81xJouBb7EPq0=;
        b=Dm8TOx7kEBzN6dPmaTTDaXIjFnk5INlUp9b4ikxDzZ7odwauM6PKDZm4tsPsZoWJ4l
         03i8LQhXG1rwKBQgBI5s0IMqWibSMIpA8uYplNUiTvSPjE+xaWRnZ+moqK5Iv4Sy1UEA
         k/7G0HfW/MXll7sv6sTZxMc1jWZoJNebAbLMk1qzdSmvGBIGeJDRhV49IPf5toaMzGbQ
         WotjrrItWbkcUj2/dJ31GG36+In9tWdOYFmH9espQpVXI6UYJvMoEOK/wLAIsZTqO/7q
         72zg0HUXGi/8OMSvLWs5LZMZnaEPb/U/5VBaSi4G62DWxniAurhyvkBwdQag6kmUBClh
         fulw==
X-Forwarded-Encrypted: i=1; AJvYcCUcE4juq/QDMDHF/tpLUcvYumzdMbKCSltXNkTlKe4/UcuH93TJOQmx++KnuAxLRtacZR17VBcbYF4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpqyewIDyNPK1Z6PvCi21pQR9xSI7pqYO0GSeOcx6cSoqrM4/q
	ygEYJmk7xQb622siZu1QHTrdd/a07mydICU+oV1neU+noAhLVCMK1UARjNoGtQ==
X-Google-Smtp-Source: AGHT+IGB8ins+w/j5r8JsWHb8qbJBY+OK0kBRaRNF0jmAv8UOgfRM127LHoWgPP2E2Z//w0NqNpwAQ==
X-Received: by 2002:a0c:f413:0:b0:6bf:7927:3a9f with SMTP id 6a1803df08f44-6c355f87aa7mr74079116d6.46.1725285568512;
        Mon, 02 Sep 2024 06:59:28 -0700 (PDT)
Received: from rowland.harvard.edu (wrls-249-137-9.wrls-client.fas.harvard.edu. [140.247.12.9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c340bfa741sm42124776d6.21.2024.09.02.06.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 06:59:28 -0700 (PDT)
Date: Mon, 2 Sep 2024 09:59:25 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Zhang Zekun <zhangzekun11@huawei.com>
Cc: patchwork@huawei.com, Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-usb@vger.kernel.org, vz@mleia.com
Subject: Re: [PATCH 2/2] usb: ohci-nxp: Use helper function
 devm_clk_get_enabled()
Message-ID: <6c65e493-19ff-4fd9-8b2a-c96bcad761f6@rowland.harvard.edu>
References: <20240902123020.29267-1-zhangzekun11@huawei.com>
 <20240902123020.29267-3-zhangzekun11@huawei.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902123020.29267-3-zhangzekun11@huawei.com>

On Mon, Sep 02, 2024 at 08:30:20PM +0800, Zhang Zekun wrote:
> devm_clk_get() and clk_prepare_enable() can be replaced by helper
> function devm_clk_get_enabled(). Let's use devm_clk_get_enabled() to
> simplify code and avoid calling clk_disable_unprepare().
> 
> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ohci-nxp.c | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-nxp.c b/drivers/usb/host/ohci-nxp.c
> index 8264c454f6bd..5b775e1ea527 100644
> --- a/drivers/usb/host/ohci-nxp.c
> +++ b/drivers/usb/host/ohci-nxp.c
> @@ -51,8 +51,6 @@ static struct hc_driver __read_mostly ohci_nxp_hc_driver;
>  
>  static struct i2c_client *isp1301_i2c_client;
>  
> -static struct clk *usb_host_clk;
> -
>  static void isp1301_configure_lpc32xx(void)
>  {
>  	/* LPC32XX only supports DAT_SE0 USB mode */
> @@ -155,6 +153,7 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
>  	struct resource *res;
>  	int ret = 0, irq;
>  	struct device_node *isp1301_node;
> +	struct clk *usb_host_clk;
>  
>  	if (pdev->dev.of_node) {
>  		isp1301_node = of_parse_phandle(pdev->dev.of_node,
> @@ -180,26 +179,20 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
>  	}
>  
>  	/* Enable USB host clock */
> -	usb_host_clk = devm_clk_get(&pdev->dev, NULL);
> +	usb_host_clk = devm_clk_get_enabled(&pdev->dev, NULL);
>  	if (IS_ERR(usb_host_clk)) {
> -		dev_err(&pdev->dev, "failed to acquire USB OHCI clock\n");
> +		dev_err(&pdev->dev, "failed to acquire and start USB OHCI clock\n");
>  		ret = PTR_ERR(usb_host_clk);
>  		goto fail_disable;
>  	}
>  
> -	ret = clk_prepare_enable(usb_host_clk);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "failed to start USB OHCI clock\n");
> -		goto fail_disable;
> -	}
> -
>  	isp1301_configure();
>  
>  	hcd = usb_create_hcd(driver, &pdev->dev, dev_name(&pdev->dev));
>  	if (!hcd) {
>  		dev_err(&pdev->dev, "Failed to allocate HC buffer\n");
>  		ret = -ENOMEM;
> -		goto fail_hcd;
> +		goto fail_disable;
>  	}
>  
>  	hcd->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> @@ -229,8 +222,6 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
>  	ohci_nxp_stop_hc();
>  fail_resource:
>  	usb_put_hcd(hcd);
> -fail_hcd:
> -	clk_disable_unprepare(usb_host_clk);
>  fail_disable:
>  	isp1301_i2c_client = NULL;
>  	return ret;
> @@ -243,7 +234,6 @@ static void ohci_hcd_nxp_remove(struct platform_device *pdev)
>  	usb_remove_hcd(hcd);
>  	ohci_nxp_stop_hc();
>  	usb_put_hcd(hcd);
> -	clk_disable_unprepare(usb_host_clk);
>  	isp1301_i2c_client = NULL;
>  }
>  
> -- 
> 2.17.1
> 


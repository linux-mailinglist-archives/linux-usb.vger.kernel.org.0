Return-Path: <linux-usb+bounces-2972-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E80C17EF7BE
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 20:17:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA81628106B
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 19:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E22B4315C;
	Fri, 17 Nov 2023 19:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UAL+5Y54"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 891EDD4F
	for <linux-usb@vger.kernel.org>; Fri, 17 Nov 2023 11:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700248654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kYkliK5LLyBWsCelrZj1qHbRtpj0yIQa/B4ipiOpxIw=;
	b=UAL+5Y54hXY9hevEGGz7s9uKB/TYyN0oH7yig03pQddhIMG1y8/5E/iGqF1vSxfdcb/Cgc
	bjNqtbM+DivNhRc20FbG9ECxEJJ82DGix3My38UrZ1Udbet/N0Hm8XbAy2MugCVEZzw5OZ
	8/SGoZlhMci6Zu0P6TpV8CWeh+E7lL4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-hosCXbVDOQKOXfC0bAI92Q-1; Fri, 17 Nov 2023 14:17:33 -0500
X-MC-Unique: hosCXbVDOQKOXfC0bAI92Q-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-77bc58d49dfso264689485a.3
        for <linux-usb@vger.kernel.org>; Fri, 17 Nov 2023 11:17:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700248652; x=1700853452;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYkliK5LLyBWsCelrZj1qHbRtpj0yIQa/B4ipiOpxIw=;
        b=eGn8WDVWZiSXmIIeGGU1QDxKCcU6PqMgXSwNIZ0HQEB8zYMf6im9X6bkUw1vK4GUrn
         O8WgouoBl7yNzalKF8qELGGqyx266JCYjT9c5IGeSBK/tpSlwBHbO2i12FLwA5U7ICIK
         C2U4MiR2HdVt0nNCd4q7iNti44Ca/3bU+TBfB9o9YjZTjq7M7Xs22h69m5fztsVit2yU
         Dhiae+sSW/5IVQtxWrD2jRO3iAtLYpLKr7Xpbj3cnhwBt1PoRvr5kRIfq+8mjUIDR0u7
         F+Q+gbjqF5yksIyKM5jMylzyhv7xixySWNS39flolSko7EK2OhzlaeiNF+vbyz/dirh3
         gt/g==
X-Gm-Message-State: AOJu0YwLqYsfWAYLIZWJQP8DvnkwW3QVXgIyoI41kvkEUZz+Jy9n1aSM
	QSVGLeJEPVjvN+CDKfC6xVYSyBZyO4WEfQW2y6fB5DxiSfRSSE9i2IYMK6Zvfb+lM2I1lpwTyNp
	yfYjLNXIqL0pWApJm0KpA
X-Received: by 2002:a05:620a:389e:b0:775:cf5f:8a81 with SMTP id qp30-20020a05620a389e00b00775cf5f8a81mr393656qkn.62.1700248652650;
        Fri, 17 Nov 2023 11:17:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmHO48ofPq25XthhBvwYR4euVlRe27xZWlBqEgcuk1cvhzJ6JOgacr2A8MKYqMEK47wSFwZw==
X-Received: by 2002:a05:620a:389e:b0:775:cf5f:8a81 with SMTP id qp30-20020a05620a389e00b00775cf5f8a81mr393636qkn.62.1700248652362;
        Fri, 17 Nov 2023 11:17:32 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::49])
        by smtp.gmail.com with ESMTPSA id pr13-20020a05620a86cd00b007770d47c621sm809192qkn.66.2023.11.17.11.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 11:17:32 -0800 (PST)
Date: Fri, 17 Nov 2023 13:17:29 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 3/3] USB: dwc3: qcom: fix ACPI platform device leak
Message-ID: <zgmlodcauv3jdnwvjlmhudad236gszhmx5de3k2qzamb2rv7z6@dswepa2tvjqh>
References: <20231117173650.21161-1-johan+linaro@kernel.org>
 <20231117173650.21161-4-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117173650.21161-4-johan+linaro@kernel.org>

On Fri, Nov 17, 2023 at 06:36:50PM +0100, Johan Hovold wrote:
> Make sure to free the "urs" platform device, which is created for some
> ACPI platforms, on probe errors and on driver unbind.
> 
> Compile-tested only.
> 
> Fixes: c25c210f590e ("usb: dwc3: qcom: add URS Host support for sdm845 ACPI boot")
> Cc: Shawn Guo <shawn.guo@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Acked-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 37 +++++++++++++++++++++++++++++-------
>  1 file changed, 30 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 0703f9b85cda..10fb481d943b 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -767,9 +767,9 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static struct platform_device *
> -dwc3_qcom_create_urs_usb_platdev(struct device *dev)
> +static struct platform_device *dwc3_qcom_create_urs_usb_platdev(struct device *dev)
>  {
> +	struct platform_device *urs_usb = NULL;
>  	struct fwnode_handle *fwh;
>  	struct acpi_device *adev;
>  	char name[8];
> @@ -789,9 +789,26 @@ dwc3_qcom_create_urs_usb_platdev(struct device *dev)
>  
>  	adev = to_acpi_device_node(fwh);
>  	if (!adev)
> -		return NULL;
> +		goto err_put_handle;
> +
> +	urs_usb = acpi_create_platform_device(adev, NULL);
> +	if (IS_ERR_OR_NULL(urs_usb))
> +		goto err_put_handle;
> +
> +	return urs_usb;
>  
> -	return acpi_create_platform_device(adev, NULL);
> +err_put_handle:
> +	fwnode_handle_put(fwh);
> +
> +	return urs_usb;
> +}
> +
> +static void dwc3_qcom_destroy_urs_usb_platdev(struct platform_device *urs_usb)
> +{
> +	struct fwnode_handle *fwh = urs_usb->dev.fwnode;
> +
> +	platform_device_unregister(urs_usb);
> +	fwnode_handle_put(fwh);
>  }
>  
>  static int dwc3_qcom_probe(struct platform_device *pdev)
> @@ -875,13 +892,13 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	qcom->qscratch_base = devm_ioremap_resource(dev, parent_res);
>  	if (IS_ERR(qcom->qscratch_base)) {
>  		ret = PTR_ERR(qcom->qscratch_base);
> -		goto clk_disable;
> +		goto free_urs;
>  	}
>  
>  	ret = dwc3_qcom_setup_irq(pdev);
>  	if (ret) {
>  		dev_err(dev, "failed to setup IRQs, err=%d\n", ret);
> -		goto clk_disable;
> +		goto free_urs;
>  	}
>  
>  	/*
> @@ -900,7 +917,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  
>  	if (ret) {
>  		dev_err(dev, "failed to register DWC3 Core, err=%d\n", ret);
> -		goto clk_disable;
> +		goto free_urs;
>  	}
>  
>  	ret = dwc3_qcom_interconnect_init(qcom);
> @@ -939,6 +956,9 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  		platform_device_del(qcom->dwc3);
>  	}
>  	platform_device_put(qcom->dwc3);
> +free_urs:
> +	if (qcom->urs_usb)
> +		dwc3_qcom_destroy_urs_usb_platdev(qcom->urs_usb);
>  clk_disable:
>  	for (i = qcom->num_clocks - 1; i >= 0; i--) {
>  		clk_disable_unprepare(qcom->clks[i]);
> @@ -965,6 +985,9 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
>  	}
>  	platform_device_put(qcom->dwc3);
>  
> +	if (qcom->urs_usb)
> +		dwc3_qcom_destroy_urs_usb_platdev(qcom->urs_usb);
> +
>  	for (i = qcom->num_clocks - 1; i >= 0; i--) {
>  		clk_disable_unprepare(qcom->clks[i]);
>  		clk_put(qcom->clks[i]);
> -- 
> 2.41.0
> 
> 



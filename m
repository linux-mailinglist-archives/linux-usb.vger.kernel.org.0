Return-Path: <linux-usb+bounces-2970-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EB57EF7A5
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 20:04:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8DB11C208FB
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 19:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D4AF32C8B;
	Fri, 17 Nov 2023 19:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XiwYQeO4"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21949D6D
	for <linux-usb@vger.kernel.org>; Fri, 17 Nov 2023 11:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700247834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X+KCXQbIarVw8dFpyS/S6NmCYqtvRHzg1KlSXBjGlMw=;
	b=XiwYQeO4fhaR3b0JA3o53rclKNdPfm9CODon0eQSnJGAawRCvj1eTeD8V8HObCC+wR4bYr
	+0HHbtpblejv8+uu86sJGHphleWocDL3sUWxS2zUm1UE03LgpEIpT3ceyTpjxR5UpA5h/I
	2RORWGmbgenFcIPAkEH23As/TeVlcBA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-sFwdk6C1Ozq0rxTWaV1nEw-1; Fri, 17 Nov 2023 14:03:52 -0500
X-MC-Unique: sFwdk6C1Ozq0rxTWaV1nEw-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-41cc6fa3ea4so27874931cf.1
        for <linux-usb@vger.kernel.org>; Fri, 17 Nov 2023 11:03:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700247832; x=1700852632;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+KCXQbIarVw8dFpyS/S6NmCYqtvRHzg1KlSXBjGlMw=;
        b=jB3J0UpeSsdaqthzQUaROiU6fBtXEN2XwIpfnAZlynNz/nK05vMn8oSBw0xOcnBRTz
         dXY9NdJV+eNPcy8n31lnnZJLDys5J3Dav2NU8c/Q8rbPAuuQOJMVjlhWgqXkCLMi5MyU
         vZ4uvncwKG7cUQzESMw4fAJjU1X/U29ejyzMzBzRctj+z16n9Am0efnZGtgrl7gk1cFy
         zFoZr87Vu5Qcl9A9uu51rYYVZkTIUbkDitPeHW+4dH+kvLZDjnes1/6R4ahfOP4aOSHA
         aL6DHacmXfdEHxqzZTT+8AAGhDqY3RPsslDhYIfOHlsWtblacYdhtNmk3jRmRA7g03Zn
         t1Pw==
X-Gm-Message-State: AOJu0Yyu267OAOg32JigGuaJqzjMDD7LUkqqEivqv2fBwU6fkspGejQ2
	vIn2egvh8BSbvLaZMIxvdG4rtQtSMGmM63fsBSZO/4Ek++/RNQKkD08PRrrkSoYU4Coj/CVVRax
	jOkblsGGyGgfLxSVARM5P
X-Received: by 2002:ac8:5d09:0:b0:41c:c045:3ed with SMTP id f9-20020ac85d09000000b0041cc04503edmr527670qtx.68.1700247831917;
        Fri, 17 Nov 2023 11:03:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgrKAJm8oEake3WBQPoR8ynpL7SEnW6LA4DrAoArIRr8hwun119GSAFcqC7ATK0hCExElHWQ==
X-Received: by 2002:ac8:5d09:0:b0:41c:c045:3ed with SMTP id f9-20020ac85d09000000b0041cc04503edmr527648qtx.68.1700247831507;
        Fri, 17 Nov 2023 11:03:51 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::49])
        by smtp.gmail.com with ESMTPSA id c14-20020ac8660e000000b004198d026be6sm775588qtp.35.2023.11.17.11.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 11:03:51 -0800 (PST)
Date: Fri, 17 Nov 2023 13:03:48 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 1/3] USB: dwc3: qcom: fix resource leaks on probe deferral
Message-ID: <uof6ti3ula3gfijsucp5yjp6bxldjhmyek77xub5ybifrm3g3b@d3qd4jqusvix>
References: <20231117173650.21161-1-johan+linaro@kernel.org>
 <20231117173650.21161-2-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117173650.21161-2-johan+linaro@kernel.org>

On Fri, Nov 17, 2023 at 06:36:48PM +0100, Johan Hovold wrote:
> The driver needs to deregister and free the newly allocated dwc3 core
> platform device on ACPI probe errors (e.g. probe deferral) and on driver
> unbind but instead it leaked those resources while erroneously dropping
> a reference to the parent platform device which is still in use.
> 
> For OF probing the driver takes a reference to the dwc3 core platform
> device which has also always been leaked.
> 
> Fix the broken ACPI tear down and make sure to drop the dwc3 core
> reference for both OF and ACPI.
> 
> Fixes: 8fd95da2cfb5 ("usb: dwc3: qcom: Release the correct resources in dwc3_qcom_remove()")
> Fixes: 2bc02355f8ba ("usb: dwc3: qcom: Add support for booting with ACPI")
> Fixes: a4333c3a6ba9 ("usb: dwc3: Add Qualcomm DWC3 glue driver")
> Cc: stable@vger.kernel.org      # 4.18
> Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Cc: Lee Jones <lee@kernel.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

I foobared the review of one of the patches listed as being fixed by
this, but for what it is worth I think this makes sense.

Hopefully my eye is better this time.

Acked-by: Andrew Halaney <ahalaney@redhat.com>

>  drivers/usb/dwc3/dwc3-qcom.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 3de43df6bbe8..00c3021b43ce 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -758,6 +758,7 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
>  	if (!qcom->dwc3) {
>  		ret = -ENODEV;
>  		dev_err(dev, "failed to get dwc3 platform device\n");
> +		of_platform_depopulate(dev);
>  	}
>  
>  node_put:
> @@ -899,7 +900,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  
>  	if (ret) {
>  		dev_err(dev, "failed to register DWC3 Core, err=%d\n", ret);
> -		goto depopulate;
> +		goto clk_disable;
>  	}
>  
>  	ret = dwc3_qcom_interconnect_init(qcom);
> @@ -934,7 +935,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	if (np)
>  		of_platform_depopulate(&pdev->dev);
>  	else
> -		platform_device_put(pdev);
> +		platform_device_del(qcom->dwc3);
> +	platform_device_put(qcom->dwc3);
>  clk_disable:
>  	for (i = qcom->num_clocks - 1; i >= 0; i--) {
>  		clk_disable_unprepare(qcom->clks[i]);
> @@ -957,7 +959,8 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
>  	if (np)
>  		of_platform_depopulate(&pdev->dev);
>  	else
> -		platform_device_put(pdev);
> +		platform_device_del(qcom->dwc3);
> +	platform_device_put(qcom->dwc3);
>  
>  	for (i = qcom->num_clocks - 1; i >= 0; i--) {
>  		clk_disable_unprepare(qcom->clks[i]);
> -- 
> 2.41.0
> 
> 



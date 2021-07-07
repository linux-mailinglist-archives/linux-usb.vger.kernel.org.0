Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD2503BE254
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jul 2021 07:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230188AbhGGFJP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Jul 2021 01:09:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230120AbhGGFJP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Jul 2021 01:09:15 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5018C06175F
        for <linux-usb@vger.kernel.org>; Tue,  6 Jul 2021 22:06:34 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id i12-20020a05683033ecb02903346fa0f74dso1084929otu.10
        for <linux-usb@vger.kernel.org>; Tue, 06 Jul 2021 22:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ewsnBO2VYMDmTPFn4XS4iVagvqGxMha1vsC+XKr8iq8=;
        b=oL0mmCV0JBMKux24TweZssC9DFvq2pOq6KdCz4ZnJBVDoGOOqA0EOuWfqGD7BA//I6
         Lkh1Tfte5zWUYPCWlFd4kpvNmHz3IvOGnNq5LslBG0Kj4YAoMFI8pag0jyvn/75OhrNN
         qk62xeVC4kE4IKfD92MCsDFY2E0cq5R27yo+LDY85YkGeDItks4Y5/sqVBHL1gdvQpHO
         /2fTsuPQ51SAtvdHwRz/ScTvC3LrkHIY0eLntWsViFz+B4BTg34xQytsYDd2pJ1udK0D
         HttGmE4GPlvy0YsC6acXLCPYAtVnCPgqdtKrKH6ou4YAWLxgQWMhp0BBeR79MN0N+q8K
         SZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ewsnBO2VYMDmTPFn4XS4iVagvqGxMha1vsC+XKr8iq8=;
        b=XP8MawzpYrtwR3ZE+fx4iR3+E13rIjN/rUp+hZIFS3u/KF7GVtSxf8cwVy6C0+28+t
         GxSFYkT0qoiwkt7L0D/m8jj20ArxifJlHeCpeHIAJlq5xKiI44Iof4C+t+XIJO4sTMzS
         hal5ZngM5jXsrwUdd4b7kMitorDZZHy2zwlMT0BYo2a0rX7/DhPR+5O7I8R43IIPAnbF
         NJu0Ut2pTc8uLVE6XB7iTTMnFdh/vvhhwvl3228H29P2nrip0AbKZkEnu0OHPirAX6cv
         Qg44rMYJ/cUJVSrhTx0SfmDC6HSiHxQlzV7dlty4KovSH5oa9QYOIMYlva/oSArowa+K
         h3TQ==
X-Gm-Message-State: AOAM532vOgZFAEEG5BwKNTCtuuV4MM9+yN7bpxVqcEmOH51XzKvBad79
        v3qB9Ir8Z4ywesAtBnNKV6EcPA==
X-Google-Smtp-Source: ABdhPJwdT5VftxZZy8FfC4B65nujbrhnZP/dCRVAybTtn7B3REUmMHdbzVtFeCs34sUdc+nyRs3vxA==
X-Received: by 2002:a9d:1d23:: with SMTP id m32mr17399612otm.16.1625634394252;
        Tue, 06 Jul 2021 22:06:34 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id f20sm541138otq.35.2021.07.06.22.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 22:06:33 -0700 (PDT)
Date:   Wed, 7 Jul 2021 00:06:32 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     balbi@kernel.org, agross@kernel.org, gregkh@linuxfoundation.org,
        jackp@codeaurora.org, wcheng@codeaurora.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] usb: dwc3: dwc3-qcom: Fix typo in the dwc3 vbus
 override API
Message-ID: <YOU2WKv2A/kYIJ0X@yoga>
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
 <20210704013314.200951-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210704013314.200951-2-bryan.odonoghue@linaro.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat 03 Jul 20:33 CDT 2021, Bryan O'Donoghue wrote:

> From: Wesley Cheng <wcheng@codeaurora.org>
> 
> There was an extra character in the dwc3_qcom_vbus_override_enable()
> function.  Removed the extra character.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 49e6ca94486d..2e61302e3e91 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -115,7 +115,7 @@ static inline void dwc3_qcom_clrbits(void __iomem *base, u32 offset, u32 val)
>  	readl(base + offset);
>  }
>  
> -static void dwc3_qcom_vbus_overrride_enable(struct dwc3_qcom *qcom, bool enable)
> +static void dwc3_qcom_vbus_override_enable(struct dwc3_qcom *qcom, bool enable)
>  {
>  	if (enable) {
>  		dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_SS_PHY_CTRL,
> @@ -136,7 +136,7 @@ static int dwc3_qcom_vbus_notifier(struct notifier_block *nb,
>  	struct dwc3_qcom *qcom = container_of(nb, struct dwc3_qcom, vbus_nb);
>  
>  	/* enable vbus override for device mode */
> -	dwc3_qcom_vbus_overrride_enable(qcom, event);
> +	dwc3_qcom_vbus_override_enable(qcom, event);
>  	qcom->mode = event ? USB_DR_MODE_PERIPHERAL : USB_DR_MODE_HOST;
>  
>  	return NOTIFY_DONE;
> @@ -148,7 +148,7 @@ static int dwc3_qcom_host_notifier(struct notifier_block *nb,
>  	struct dwc3_qcom *qcom = container_of(nb, struct dwc3_qcom, host_nb);
>  
>  	/* disable vbus override in host mode */
> -	dwc3_qcom_vbus_overrride_enable(qcom, !event);
> +	dwc3_qcom_vbus_override_enable(qcom, !event);
>  	qcom->mode = event ? USB_DR_MODE_HOST : USB_DR_MODE_PERIPHERAL;
>  
>  	return NOTIFY_DONE;
> @@ -811,7 +811,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  
>  	/* enable vbus override for device mode */
>  	if (qcom->mode == USB_DR_MODE_PERIPHERAL)
> -		dwc3_qcom_vbus_overrride_enable(qcom, true);
> +		dwc3_qcom_vbus_override_enable(qcom, true);
>  
>  	/* register extcon to override sw_vbus on Vbus change later */
>  	ret = dwc3_qcom_register_extcon(qcom);
> -- 
> 2.30.1
> 

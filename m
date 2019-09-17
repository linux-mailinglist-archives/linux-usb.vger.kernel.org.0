Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82F4DB5693
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2019 21:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728270AbfIQT6i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Sep 2019 15:58:38 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39388 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728006AbfIQT6i (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Sep 2019 15:58:38 -0400
Received: by mail-pf1-f194.google.com with SMTP id i1so2764876pfa.6
        for <linux-usb@vger.kernel.org>; Tue, 17 Sep 2019 12:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tAt20ZtT6/V6jtPZAgZl62EdYLrMxlX9bTR2hscPgas=;
        b=gK25IE/TKxsN/R8h9YVrCAj9/xBFjOYRVpzU5l3muVi7cdMu3eZSu+aFdek2HoZytb
         VAkVcFdphBvmT9Y6iESM4Koe9D0lP6BQMxr0bqUTt+ivHEN8NpqHrPulJ++E1gkS4ZXl
         /cAc+WMMQkYnXgz/gn7/lis+h1t2U1X9F8H5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tAt20ZtT6/V6jtPZAgZl62EdYLrMxlX9bTR2hscPgas=;
        b=G/smaKGcEDM45s9VqZo/tQdKpbN65WxlQ5V70tDztA/T+wLt8HGcQSXVxW31C2CTDx
         WaAAfptIFwQf7fAagvBrYVilGTDgh/wVrm1TxlGPQ7JWPgD9pGDZ7yVhPZBoF5gSuoaN
         YzQ9RBMdGUwh8GBdAJN3tBpbw1A8CE7nRL66yg9B9mbtFySJiM1XrEatoZIU6XRoHJ/+
         H2Px4jTb/WAVeKG07OqD6cQ/KTmdg/rYNfPDU8Fz2xcb+DZ5epW4JSwZMN6KNsjDo3dl
         3ienXprPRlH4QRBWhmd7HB4wCT1zLUnQsjEI//iV9XIu5cSyZekfu6/dAMDM7OVwtZfy
         8ygw==
X-Gm-Message-State: APjAAAXTepuMfoYOlQax+nKiroQSuC8QiXOgVn1sWE31HjobPFa96mdz
        DXHGofQFgOKh/u03a6RRGZ2H8g==
X-Google-Smtp-Source: APXvYqyYk6nWXOzE1cg11+NQ7aSPb6HMh8zRfyEhcp8XAT9fCtjO83D0nQFS5UVVw1u/PQCRWAe8HQ==
X-Received: by 2002:a63:f401:: with SMTP id g1mr580534pgi.314.1568750317289;
        Tue, 17 Sep 2019 12:58:37 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id bb15sm2935588pjb.2.2019.09.17.12.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2019 12:58:36 -0700 (PDT)
Date:   Tue, 17 Sep 2019 12:58:35 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Cc:     balbi@kernel.org, agross@kernel.org, david.brown@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V3 3/3] arm64: dts: sdm845: Add interconnect properties
 for USB
Message-ID: <20190917195835.GL133864@google.com>
References: <1568718649-20124-1-git-send-email-cchiluve@codeaurora.org>
 <1568718649-20124-4-git-send-email-cchiluve@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1568718649-20124-4-git-send-email-cchiluve@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 17, 2019 at 04:40:49PM +0530, Chandana Kishori Chiluveru wrote:
> Populate USB DT nodes with interconnect properties.
> 
> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index fcb9330..e4885f3 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -1837,6 +1837,12 @@
>  
>  			resets = <&gcc GCC_USB30_PRIM_BCR>;
>  
> +			interconnects = <&rsc_hlos MASTER_USB3_0
> +					 &rsc_hlos SLAVE_EBI1>,
> +					<&rsc_hlos MASTER_APPSS_PROC
> +					 &rsc_hlos SLAVE_USB3_0>;
> +			interconnect-names = "usb-ddr", "apps-usb";
> +
>  			usb_1_dwc3: dwc3@a600000 {
>  				compatible = "snps,dwc3";
>  				reg = <0 0x0a600000 0 0xcd00>;
> @@ -1881,6 +1887,12 @@
>  
>  			resets = <&gcc GCC_USB30_SEC_BCR>;
>  
> +			interconnects = <&rsc_hlos MASTER_USB3_1
> +					 &rsc_hlos SLAVE_EBI1>,
> +					<&rsc_hlos MASTER_APPSS_PROC
> +					 &rsc_hlos SLAVE_USB3_1>;
> +			interconnect-names = "usb-ddr", "apps-usb";
> +
>  			usb_2_dwc3: dwc3@a800000 {
>  				compatible = "snps,dwc3";
>  				reg = <0 0x0a800000 0 0xcd00>;

Please collect tags from earlier versions, unless the new version has
'major' changes (which is a bit of a judgement call).

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

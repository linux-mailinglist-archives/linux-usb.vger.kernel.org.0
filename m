Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C555A394D59
	for <lists+linux-usb@lfdr.de>; Sat, 29 May 2021 19:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbhE2RJL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 29 May 2021 13:09:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbhE2RJK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 29 May 2021 13:09:10 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D524C061574
        for <linux-usb@vger.kernel.org>; Sat, 29 May 2021 10:07:34 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id t10-20020a05683022eab0290304ed8bc759so6634608otc.12
        for <linux-usb@vger.kernel.org>; Sat, 29 May 2021 10:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YA91sBPn0zwwbxlssSM8hTajsH+fA9/jt+cb29CA/KE=;
        b=KftmWWC+YlHD6Lhc3x7HrpPfD2MzZqfDFwgxXZJcQH2kUHXATovRhUeSCArLVUHJKE
         1SpcswWKX9fE/KE9pPcN/Q0Y9V1od9D5GoxmAQQyvMaXPfC39Jzx6uwLMKYvrws1/gxK
         LeyxO2DJpcTAQipj0pYzfYbRfKcx0Ubd3E0O+fKtAaEa08jNChtaz61oOkziNDREeD/2
         eGNQLbpA3d6yLhdpY5FgEjiNQjGyxUdzPCkKkUEEptD4Irjc6TNdkgzty1ebV5vTaVmp
         Yhz1lnyZTmBQF013RaOOZVsN32Fhx2x69JtO+IXtnF8j2beZOyNq8dQIxC6SkFQpmdR7
         4Rjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YA91sBPn0zwwbxlssSM8hTajsH+fA9/jt+cb29CA/KE=;
        b=mxhAqXYyPpk1vJHQhbpviVRJxuJpYzeUkQbsGJiOAaa5pAiXcjZMyd6dPbQf6liVcD
         fcuMFPjv4AK0BVWYxW5DZYJtOs/Y/0F2lzyNZ5PLS6+fq+pGX3xtJ/nKFOtL6rIBfEtB
         4cVV0clHsSIEe0InVtz3smzELhfLKaGlpDtZy08+E8R3AnytdiwvRTUX6Qps0uhWXEEa
         ossVXR9EVGpOOV/q/G0kn2q/PK8+ygbwaDsfHz1zUlkdPz8McJpG1kpgHNd03TNidvzK
         xi1+bndlTg+xgQIgLYOQ9WimWD0fZsp2ZpJ3EN+y3PM9QArejWkxNSKqQu2POqh0MnPW
         Ndqw==
X-Gm-Message-State: AOAM530nxJDnT0cfhrZAQWLi8ktGwYUdLlp3syoiXnxxzdxj4G3rpfjL
        1H2B99tyP3opDikf53WWP/OQcaQbcrQD8Q==
X-Google-Smtp-Source: ABdhPJzgUBYSwpCjkaEAyLAysdd0MI9ukwHNAwy5t9SKrqcg6zp6seZaqyUp6lAB4xB7JLMcOrKGxg==
X-Received: by 2002:a9d:8c2:: with SMTP id 60mr11775276otf.217.1622308053620;
        Sat, 29 May 2021 10:07:33 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w6sm1887879otj.5.2021.05.29.10.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 10:07:33 -0700 (PDT)
Date:   Sat, 29 May 2021 12:07:31 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, agross@kernel.org,
        robh+dt@kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, jackp@codeaurora.org,
        Thinh.Nguyen@synopsys.com
Subject: Re: [PATCH v8 5/5] arm64: boot: dts: qcom: sm8150: Enable dynamic TX
 FIFO resize logic
Message-ID: <YLJ000lIVhZM5WEV@builder.lan>
References: <1621410238-31395-1-git-send-email-wcheng@codeaurora.org>
 <1621410238-31395-6-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621410238-31395-6-git-send-email-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed 19 May 02:43 CDT 2021, Wesley Cheng wrote:

> Enable the flexible TX FIFO resize logic on SM8150.  Using a larger TX FIFO
> SZ can help account for situations when system latency is greater than the
> USB bus transmission latency.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>

Based on my previous request of always adding this for the Qualcomm
platforms that supports it, which is implemented in patch 4, I don't see
a need for this patch.

Am I missing something?

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 51235a9..8f532cb 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -2275,6 +2275,7 @@
>  				iommus = <&apps_smmu 0x140 0>;
>  				snps,dis_u2_susphy_quirk;
>  				snps,dis_enblslpm_quirk;
> +				tx-fifo-resize;
>  				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
>  				phy-names = "usb2-phy", "usb3-phy";
>  			};
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DED26256FD1
	for <lists+linux-usb@lfdr.de>; Sun, 30 Aug 2020 20:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgH3Szd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 30 Aug 2020 14:55:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726594AbgH3SzZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 30 Aug 2020 14:55:25 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B59EC061573
        for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2020 11:55:24 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id b3so3288575qtg.13
        for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2020 11:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jXrSKvfqB4+Buys69P+bVAXzX+bSR1lG5u67Zo5PRtY=;
        b=HanuPX9hVfAaMBoIfhMzUGtXvCQIwGuqg/HblZb3DrJni5pvpRIa3CRkw4jG2r8bHO
         hsqbcu2htVUmpJgjv/+fI0Z8Q/8l+eaSGKv3cZChM2I7NcBXuleldlMZXuMGMHjxHbYF
         2hDfSeHNE6kSxhWCtRhVkuOpIil+/+6wN9u86iRw4S59y5q9AQo8zy6rlWy0X7wWdZkB
         mNV6Okhmg32GafV37F7sdpOrBSjpnTK7wDe9fyvjbp4L/+powrCCQma6RPFkaYuN+v5o
         wVxvZwVq8fsuX7U+jPTejQXc++1sEE4Yf1OYwwmgHonIgdSAQn57yKX3ombFN4kTpLGh
         aXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jXrSKvfqB4+Buys69P+bVAXzX+bSR1lG5u67Zo5PRtY=;
        b=M8TWI8/iUj8UH5fk4gp0RJeCvO886Jxgi4SBj1e10cTmv/Fktqe1SoQFOGT4+n8vVC
         twYrV8s0gFEHru8D/9tGd9eZKW7687WddW3hF0UTi3O0t1Fv3Cl/tjda3HpBBhscuFlu
         D+vkS8x8HPp5Lrre30jg0V1S8vELTZYC425RnfS9UE4EyjkbE85eNLnnGs6Utxr7+jhL
         AP1CNyGAkXpEnm92P26GHp2jGqDa+8pSfUX1cYXoX3B1ZV9ZDSqsEKo8ZKM+geTPA14d
         Pji2tfsYqiKZQfTXUjJp0oE/DhptpBH+TKRiIVf2bSw5zDrpk5gzboFKFNFV1wTAg/CW
         wNng==
X-Gm-Message-State: AOAM5318ta5mXxAQkfhX/NhUl2pprMhh5s60aoWfJf+rt15GMHj1+m3R
        X9dNaxY6XnDQyU+jxKPoaPfONw==
X-Google-Smtp-Source: ABdhPJy/ocA9TsLg/Ih3oR4Qq4aGqIWbqqqZHo0pVWvRyYt7k/l2EHjr6jEpGm4Wn1jbuQIKEgf/6g==
X-Received: by 2002:aed:2352:: with SMTP id i18mr10442115qtc.167.1598813723414;
        Sun, 30 Aug 2020 11:55:23 -0700 (PDT)
Received: from uller (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
        by smtp.gmail.com with ESMTPSA id d16sm7632575qte.19.2020.08.30.11.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 11:55:22 -0700 (PDT)
Date:   Sun, 30 Aug 2020 18:55:21 +0000
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     sboyd@kernel.org, heikki.krogerus@linux.intel.com,
        agross@kernel.org, robh+dt@kernel.org, gregkh@linuxfoundation.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 3/4] arm64: boot: dts: qcom: pm8150b: Add node for USB
 type C block
Message-ID: <20200830185521.GC1947@uller>
References: <20200812071925.315-1-wcheng@codeaurora.org>
 <20200812071925.315-4-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200812071925.315-4-wcheng@codeaurora.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed 12 Aug 07:19 UTC 2020, Wesley Cheng wrote:

> The PM8150B has a dedicated USB type C block, which can be used for type C
> orientation and role detection.  Create the reference node to this type C
> block for further use.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/pm8150b.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> index e112e8876db6..053c659734a7 100644
> --- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> @@ -53,6 +53,13 @@ power-on@800 {
>  			status = "disabled";
>  		};
>  
> +		pm8150b_typec: typec@1500 {
> +			compatible = "qcom,pm8150b-usb-typec";
> +			status = "disabled";
> +			reg = <0x1500>;
> +			interrupts = <0x2 0x15 0x5 IRQ_TYPE_EDGE_RISING>;
> +		};
> +
>  		pm8150b_temp: temp-alarm@2400 {
>  			compatible = "qcom,spmi-temp-alarm";
>  			reg = <0x2400>;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2CC1758E01
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jul 2023 08:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231178AbjGSGjo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jul 2023 02:39:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230212AbjGSGjl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Jul 2023 02:39:41 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A53CF1FDC
        for <linux-usb@vger.kernel.org>; Tue, 18 Jul 2023 23:39:35 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-993d1f899d7so910597666b.2
        for <linux-usb@vger.kernel.org>; Tue, 18 Jul 2023 23:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689748774; x=1692340774;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=72PaLUSSuoFU0PTvBWd+xwIa1Skzf0/nV9CmdSHfMuA=;
        b=KX+Ptl0NWz8bP7E9tEBd5Jz5vGlc8R2BPv7DQgoV/CuwlGyqeU7qF/IPnnWyz9fBXW
         KVcF5xXcQZdGMaNIgRcsO6Q8HhE7uefeLWUpQIAd3NNgNErFsTmg09+pato+gqSH6tPC
         ALThPj7+WTuGCwgK625EvwVvYgDziulTEbEM3WbjvR6FfgcUXki6Jsm1ownCMKX75O9t
         8H98Qj2R7RV527Tl60YIS69iCoU175VEIsJV0KqOY65GpVl5ARuAzzQqKwQPVwm/zweH
         q87Cpi2ZdZcTjn0l6G8zro6vm7skVMu2qkvc5wTl/h8N/JpKFQ/8nHn5qTqBcxykUJK4
         6xWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689748774; x=1692340774;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=72PaLUSSuoFU0PTvBWd+xwIa1Skzf0/nV9CmdSHfMuA=;
        b=V/Zedsyus3dicDKSHnSNQ3WZk1vQB5m5Gy4WaPO3cjTU4vIsQKlqQw2j3JzjxGLJcy
         OkhvFcoLJbfPQs/f3TYtqh9UwGlMWAeOqzV26GJOiwRsZf0ZRXbt5lErge/27CjnIRmv
         j3DwvgCDbnd6qkj0fPi+woyvK/4OwL2TDZKVa6D35IEZ1VULGjLRb4JKfRBMIb+LPdPu
         DE5EqDqP6rMhdMMIL/cuN/f00W6wIeH+7aqqqD2rZD0TiC9e6nh36VIcRXE9vrJRssXx
         JHjJuU58xqbtZEbvTLQp6RQzIUij6D2syCyOX5AKrHV0TD4SA7pZkYRYh+oc6FVmbe7w
         HVGg==
X-Gm-Message-State: ABy/qLZymQNJHXi6V4QRWlY008YCSL4K1Q4OvKcQeTyjQX3HPGlL5K4i
        CWy2nNQ9gVPvb8ScNfF3j6ttow==
X-Google-Smtp-Source: APBJJlFX6SEMOhzwgOYEClD4Ea2P2nHJ7RaCK3OxdQknYfcBuuRn+Knk9rUpijP8hznvmXQYVG4uFA==
X-Received: by 2002:a17:906:7a4b:b0:992:58fc:bcb8 with SMTP id i11-20020a1709067a4b00b0099258fcbcb8mr1373352ejo.56.1689748774154;
        Tue, 18 Jul 2023 23:39:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id w21-20020a1709064a1500b00997d76981e0sm1840403eju.208.2023.07.18.23.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 23:39:32 -0700 (PDT)
Message-ID: <ec93a939-883d-5778-2f32-69eb370c9768@linaro.org>
Date:   Wed, 19 Jul 2023 08:39:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] usb: dwc2: Add platform specific data for Intel
 Stratix10 platform
Content-Language: en-US
To:     Meng Li <Meng.Li@windriver.com>, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, dinguyen@kernel.org, hminas@synopsys.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
References: <20230719025509.3007986-1-Meng.Li@windriver.com>
 <20230719025509.3007986-2-Meng.Li@windriver.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230719025509.3007986-2-Meng.Li@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19/07/2023 04:55, Meng Li wrote:
> Intel Stratix10 is very the same with Agilex platform, the DWC2 IP on
> the Stratix platform also does not support clock-gating. So, refer to
> commit 3d8d3504d233("usb: dwc2: Add platform specific data for
> Intel's Agilex"), add platform specific data for Intel Stratix10 platform.
> 
> Signed-off-by: Meng Li <Meng.Li@windriver.com>
> ---
>  drivers/usb/dwc2/params.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
> index 8eab5f38b110..3d085ae1ecd8 100644
> --- a/drivers/usb/dwc2/params.c
> +++ b/drivers/usb/dwc2/params.c
> @@ -267,6 +267,8 @@ const struct of_device_id dwc2_of_match_table[] = {
>  	  .data = dwc2_set_stm32mp15_hsotg_params },
>  	{ .compatible = "intel,socfpga-agilex-hsotg",
>  	  .data = dwc2_set_socfpga_agilex_params },
> +	{ .compatible = "intel,socfpga-stratix10-hsotg",
> +	  .data = dwc2_set_socfpga_agilex_params },

NAK. I already wrote why.

Best regards,
Krzysztof


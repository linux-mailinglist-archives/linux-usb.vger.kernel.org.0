Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9FC0725CF0
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jun 2023 13:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240389AbjFGLUP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Jun 2023 07:20:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240284AbjFGLUN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Jun 2023 07:20:13 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1654F19BB
        for <linux-usb@vger.kernel.org>; Wed,  7 Jun 2023 04:20:08 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b1a6a8e851so79047391fa.2
        for <linux-usb@vger.kernel.org>; Wed, 07 Jun 2023 04:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686136806; x=1688728806;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BTBg9MyG6jhsl+u10WSeM0LsmdB54Dp+FeeVDwf+P1E=;
        b=GqGvhfCD5CfG/i9PdEtiYtDORlS2hSYj/XdMUA6gwOK8QYt2DOpbQVjlH403owaCe1
         lt2U1vB/X6Q7w6wsrTq+cvIdnX26i/HZvKpE5YJoX+GTLQcdhI8JXBPwryb7qPQMyEMU
         XipEAQqFjEkejFo7Nr4oTddfOWdKj0frkMfRavbwap9iA+85xQEXxQjlNigBkP5nr/dP
         0ywDsqvbzc0MGbhC37pE6yc3JUO0S6eAkpMYkhavE0Vbsz54D8dNOaWTbMlKHV2dLEv/
         CrZNM3bNoMVLKZSfpx85+uyuxt4osLX51Td9LTfFkLvgjisW/b36SNH7JkiB89JbhNDM
         IdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686136806; x=1688728806;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BTBg9MyG6jhsl+u10WSeM0LsmdB54Dp+FeeVDwf+P1E=;
        b=doVTfIh0OfFW98aSm+Jyi2uup2xsH3Qxt43Vm3Bk6JtaQt94kuC741CJ/BOab35IzX
         +YoYrj9srE0FX7OZduCIiT0g04UeJQ+bu9t1VYBHitoSwshRil8iiaARoY2ajZWxwzlN
         fDl5adtmgl+mq3FCQvkh8HbZDRhACCUHLIKNZk07h4z9bvY4Vx5vmns13Q8l5qfuv/17
         XhQQP3EvjwgL/xZhuNUzS0PLh+YjCc9hH3Lu03QzLSbK0jPMsA50nanI3kiy0DPu3KLc
         oVqL578+Dn+hnmCajOa5Imn1c402z1k03JCdc/WiYsNijk2z5EVWhCiqncldoiA4hyG0
         9tXQ==
X-Gm-Message-State: AC+VfDwAUjW9LzgGYEJwwBUz/8+AK2U6M4Hs22D8z1sOJ4O7uv7GKBjL
        glrsPHP+M+FRU1GP6Ua5QoUVrw==
X-Google-Smtp-Source: ACHHUZ4dGJnb/Q4jQtanIF6np0lUFYJ9Kec/sjx85wUK5bWSOr8484OmnpVW6Ub4tegvaeUknGYZyQ==
X-Received: by 2002:a2e:320c:0:b0:2b1:e966:b349 with SMTP id y12-20020a2e320c000000b002b1e966b349mr1944701ljy.31.1686136806130;
        Wed, 07 Jun 2023 04:20:06 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id y19-20020a2e3213000000b002b1e6a78d3esm1096403ljy.82.2023.06.07.04.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 04:20:05 -0700 (PDT)
Message-ID: <f007fbf0-b1a7-cb44-d662-c30bf114365e@linaro.org>
Date:   Wed, 7 Jun 2023 14:20:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/9] phy: qcom-m31: Introduce qcom,m31 USB phy
Content-Language: en-GB
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, catalin.marinas@arm.com,
        will@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        p.zabel@pengutronix.de, arnd@arndb.de, geert+renesas@glider.be,
        neil.armstrong@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, rafal@milecki.pl, quic_srichara@quicinc.com,
        quic_varada@quicinc.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
References: <cover.1686126439.git.quic_varada@quicinc.com>
 <636308462efb579734de829fb6e9cbda81b982f7.1686126439.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <636308462efb579734de829fb6e9cbda81b982f7.1686126439.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 07/06/2023 13:56, Varadarajan Narayanan wrote:
> Introduce CONFIG_PHY_QCOM_M31_USB for including the M31 phy driver
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>

Is there any reason to keep Kconfig, Makefile and driver in different 
commits?

> ---
>   drivers/phy/qualcomm/Kconfig | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
> index 67a45d9..8a363dd 100644
> --- a/drivers/phy/qualcomm/Kconfig
> +++ b/drivers/phy/qualcomm/Kconfig
> @@ -188,3 +188,14 @@ config PHY_QCOM_IPQ806X_USB
>   	  This option enables support for the Synopsis PHYs present inside the
>   	  Qualcomm USB3.0 DWC3 controller on ipq806x SoC. This driver supports
>   	  both HS and SS PHY controllers.
> +
> +config PHY_QCOM_M31_USB
> +	tristate "Qualcomm M31 HS PHY driver support"
> +	depends on (USB || USB_GADGET) && ARCH_QCOM
> +	select USB_PHY
> +	help
> +	  Enable this to support M31 HS PHY transceivers on Qualcomm chips
> +	  with DWC3 USB core. It handles PHY initialization, clock
> +	  management required after resetting the hardware and power
> +	  management. This driver is required even for peripheral only or
> +	  host only mode configurations.

-- 
With best wishes
Dmitry


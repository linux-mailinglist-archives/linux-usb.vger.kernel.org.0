Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C97DB6600B6
	for <lists+linux-usb@lfdr.de>; Fri,  6 Jan 2023 13:58:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233980AbjAFM5i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Jan 2023 07:57:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234746AbjAFM5A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Jan 2023 07:57:00 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5286675D32
        for <linux-usb@vger.kernel.org>; Fri,  6 Jan 2023 04:56:49 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id co23so1197451wrb.4
        for <linux-usb@vger.kernel.org>; Fri, 06 Jan 2023 04:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=74dZ6pX8Hzz0wsD+Rsd26TBqQcFBKeyHe2CX60hOkAw=;
        b=QvgwMKcl770gVhG3ElVmYe9D+yX6RxX07iUym3DL4v75V+bUiMIk6d1XN30kz72hkD
         guv87kWgeuYsJ5q+YAPrxHZf7JrtCAqn6vcKzvy7y+YaiCHOf3AC2Cq5RZIhqXX+q6SQ
         ue/VYGO1uOIk8WHNuzC6w112PN5Mtpl5kohZBkoKEVph/daoBycoFGJEf55BHMMMskZj
         MvoTGP0uJV8caK2M/a9mfD69LRwOl5TgAJ5zK7pwRxtwr8L/vtCBGP7GTqsBE825gmcq
         Dsul/1R2zcqmm3O3Ff8NqBS5lwXnuC4oKBQZF2ESgqniIa70YpdraMXTWUgCSwRbvFwi
         Gmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=74dZ6pX8Hzz0wsD+Rsd26TBqQcFBKeyHe2CX60hOkAw=;
        b=Fau0Hvhjd1vTNFtHmDCACRu+MkI35SksYHUl7SNw2bFlUfu+HiW70AV4xOn/H7QArY
         FrjNSQNWlA04eq5fgJCtotP4all9+fmE8uOoqZXvJ1gFNQoXG/JU/Si9ZONyBDp5cBMi
         mPnnuWaqrq/D8UAkA69yV3U2NECjV/15sWXpzbw8JzUAgLkYoKhcHJq50SHCAznR1v6n
         nmNgxw3uUTaw9aoDMBeZbGAgap1EULvaIrGAtufuL+WQUgdIpJq2K372X5ttRap9TEVw
         2mMAuo9wSAsYRWb2N070/yygfZROsZplJDHjgtwtEqiWb85PTZRKERVU0LAORJ7Mdp7R
         EXog==
X-Gm-Message-State: AFqh2kq3/5xx7Yt9SSjUQV8YvFNIz8Em/caOmpd0iOQaIPnS/Xvx59TF
        dopZY4YE5FywgYmRVBfCF84E6Q==
X-Google-Smtp-Source: AMrXdXuiv7CJBvtiOg0LAC+AjzfIEkruZ3G21KfoSikp3a4fKbahEWvyGwVK+J0sGjtgBgZgW/5o6g==
X-Received: by 2002:a05:6000:1109:b0:28d:b028:b16 with SMTP id z9-20020a056000110900b0028db0280b16mr17595490wrw.32.1673009807929;
        Fri, 06 Jan 2023 04:56:47 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l13-20020adfe58d000000b00296730b5c3esm1106814wrm.102.2023.01.06.04.56.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 04:56:47 -0800 (PST)
Message-ID: <fb2a4f7d-f35a-2c48-ad31-3138a4fae247@linaro.org>
Date:   Fri, 6 Jan 2023 13:56:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: enable USB device port for
 mt8195-demo board
Content-Language: en-US
To:     Macpaul Lin <macpaul.lin@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Bear Wang <bear.wang@mediatek.com>,
        Pablo Sun <pablo.sun@mediatek.com>,
        Macpaul Lin <macpaul@gmail.com>,
        Miles Chen <miles.chen@mediatek.com>,
        linux-usb@vger.kernel.org,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Tinghan Shen <tinghan.shen@mediatek.com>,
        Rex-BC Chen <rex-bc.chen@mediatek.com>,
        Chen-Yu Tsai <wenst@chromium.org>
References: <20230105092809.14214-1-macpaul.lin@mediatek.com>
 <20230105092809.14214-3-macpaul.lin@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230105092809.14214-3-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 05/01/2023 10:28, Macpaul Lin wrote:
> 1. Enable USB device port (USB port0).
> 2. Enable u2 speed for other USB HOST (USB port1/2/3).
> 3. Configure mt6360 (TYPEC) related pinctrls.
> 
> Note: Full dual-role switch capability requires TYPEC MUX driver and dts
> update will be send in separate patches.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 51 ++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> index 07a864cb8b54..207bb5f4c58f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> @@ -12,6 +12,7 @@
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
>  #include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
> +#include <dt-bindings/usb/pd.h>
>  
>  / {
>  	model = "MediaTek MT8195 demo board";
> @@ -380,6 +381,22 @@
>  		};
>  	};
>  
> +	mt6360_pins: mt6360-pins {
> +		pins {
> +			pinmux = <PINMUX_GPIO100__FUNC_GPIO100>,
> +				 <PINMUX_GPIO101__FUNC_GPIO101>;
> +			input-enable;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	u3_p0_vbus: u3_p0vbusdefault {

No underscores in node names. Also does not look correct naming. Please
run `make dtbs_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

> +		pins_cmd_dat {

Same problem.



Best regards,
Krzysztof


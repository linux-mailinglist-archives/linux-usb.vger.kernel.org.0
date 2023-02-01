Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E7A76865DF
	for <lists+linux-usb@lfdr.de>; Wed,  1 Feb 2023 13:24:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231896AbjBAMYR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Feb 2023 07:24:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231302AbjBAMYQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Feb 2023 07:24:16 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF6C923D9E;
        Wed,  1 Feb 2023 04:24:14 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so1237032wma.1;
        Wed, 01 Feb 2023 04:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5NXeygwaQpVhvvyoIfJEG0rtDRDaeZnCcjZ3p7DxynU=;
        b=kGMj/9EuKpvBCoAS0DyvEcY2pb7pGkqUKT85bBe7bFbOvQQlJ5EbYB5Qajdec16WuA
         cezG0jdYDet88QdgNdztxokxGr1gRCZV97tzQvnAqfNt94dBYMMc+rTBP8tDpURpuR+I
         MqH/JUORO17a/oUoPoq6CjC8ghTsSvf/WSFPCbSUzYkVDnT4YLhVSW/pvjCi1G0JsPji
         3ROEcThmlfRGPySPHOpeUqM4DnrZ2QI3C5Gqu7jpNqkhKDeKm0358Oc8kI9h4FPSfzra
         NDh5werIkF0/BuZUmc+HK0d7FC1k5KwwGLavTTp6RQQkGVc1XZ5hgEPDLAvWQcALH7Nu
         UAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5NXeygwaQpVhvvyoIfJEG0rtDRDaeZnCcjZ3p7DxynU=;
        b=jazdfJ58oB/kTzphpu2JGwfunZEG0dVMmqDNhCEsvTqXQDUcy8Ac5km1McypHP8RTO
         nA1fkDPBJ0C0wAVZZis9gyaQTi1O9p1U1Qag+pF0uLymhFgPVYBF75BT9l/a1mlkbmO7
         U64oXgZ64S5kqoky7jsL16mqld+OB0Y3EnMM5az6Eo4dl7pUrdvZcXvUGPzqltIlt1jF
         1OmOIzUCoMyk8St4N3gUuu17zgl2XF7e5ej/3YGYAoEURkgkiX0HWnt7TllmKh5rULc3
         Lpcz5rOPca8twV1wOjiSQ2y25J/33zoD1+Os48RxzBgcG/skwIrZ/sTfLJiA9o9ZHRmS
         lLPw==
X-Gm-Message-State: AO0yUKU9pAUQcT1GFV40TkmhD1xI7xmDeaasUw0b+zJP/Jj+yM+2pOdl
        Att0zcvxR4ahARhyIAPADRg=
X-Google-Smtp-Source: AK7set+AJxtFxtJnhlRu+9+rAujgOdwo1SlUDYOgPkXUXvN5pI91jKGPYipsr54QFjPp32w8dBCZPQ==
X-Received: by 2002:a7b:c8ce:0:b0:3d9:ebf9:7004 with SMTP id f14-20020a7bc8ce000000b003d9ebf97004mr1878075wml.29.1675254253412;
        Wed, 01 Feb 2023 04:24:13 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id u1-20020a05600c00c100b003a3442f1229sm1591451wmm.29.2023.02.01.04.24.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 04:24:12 -0800 (PST)
Message-ID: <ac19ed51-75a5-58d7-5f1b-6faf9ef2b3b4@gmail.com>
Date:   Wed, 1 Feb 2023 13:24:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: enable USB device port for
 mt8195-demo board
Content-Language: en-US
To:     Macpaul Lin <macpaul.lin@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
From:   Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230105092809.14214-3-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
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
>   arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 51 ++++++++++++++++++++
>   1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> index 07a864cb8b54..207bb5f4c58f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> @@ -12,6 +12,7 @@
>   #include <dt-bindings/input/input.h>
>   #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
>   #include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
> +#include <dt-bindings/usb/pd.h>
>   
>   / {
>   	model = "MediaTek MT8195 demo board";
> @@ -380,6 +381,22 @@
>   		};
>   	};
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
> +		pins_cmd_dat {
> +			pinmux = <PINMUX_GPIO63__FUNC_VBUSVALID>;
> +			input-enable;
> +		};
> +	};
> +
>   	uart0_pins: uart0-pins {
>   		pins {
>   			pinmux = <PINMUX_GPIO98__FUNC_UTXD0>,
> @@ -393,6 +410,14 @@
>   				 <PINMUX_GPIO103__FUNC_URXD1>;
>   		};
>   	};
> +
> +	usb_otg_vbus: usb-otg-vbus-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "otg-vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		enable-active-high;
> +	};
>   };
>   
>   
> @@ -412,6 +437,22 @@
>   	status = "okay";
>   };
>   
> +&u3port0 {
> +	status = "okay";
> +};
> +
> +&u2port1 {
> +	status = "okay";
> +};
> +
> +&u2port2 {
> +	status = "okay";
> +};
> +
> +&u2port3 {
> +	status = "okay";
> +};
> +
>   &u3phy0 {
>   	status = "okay";
>   };
> @@ -428,6 +469,16 @@
>   	status = "okay";
>   };
>   
> +&ssusb {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&u3_p0_vbus>;
> +	vusb33-supply = <&mt6359_vusb_ldo_reg>;
> +	dr_mode = "otg";
> +	mediatek,usb3-drd;

What it that used for?
git grep didn't gave me any hit.

Regards,
Matthias

> +	usb-role-switch;
> +	status = "okay";
> +};
> +
>   &xhci0 {
>   	vusb33-supply = <&mt6359_vusb_ldo_reg>;
>   	vbus-supply = <&otg_vbus_regulator>;

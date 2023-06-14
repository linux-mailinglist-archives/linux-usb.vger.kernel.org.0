Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96A43726895
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jun 2023 20:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230424AbjFGSYy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Jun 2023 14:24:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231261AbjFGSYl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Jun 2023 14:24:41 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 496502119
        for <linux-usb@vger.kernel.org>; Wed,  7 Jun 2023 11:24:18 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f629ccb8ebso4727798e87.1
        for <linux-usb@vger.kernel.org>; Wed, 07 Jun 2023 11:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686162248; x=1688754248;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GCynyLWoW2V3VpBJECgKopAvXwYKryE2bi0AEhbuOKc=;
        b=UORlCDAJSTYZ4uIWUmqhcz5py1aYRNayzTtulmKmCRBhjbvUp5Sc4fYPJFnCb75juH
         uWwpIburuUdUDyFMAIFi8TeiKQuQ6ndhBSsS5tOWCe3itNJG+EtJSRLhAPIX1MjX3f6n
         oK6t/bVYLQ1CzirArOwccdOg/exui1KseunFxziTYoMvJqkLa8VvUdaH+edeqNCcOK25
         dstAnZ5d9iOqhh4Vfo6OUP6MHv5/Oh7LrY4ClO8mkR6x0AAOXPd78wcv4HgUaEtAwvih
         a0VEseZTwFw4fOa6vy/q6yFt2LPcjoswaEAKG2PUkOnoKRsZXXTYfiCsL7wDRFPlkX4C
         9IrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686162248; x=1688754248;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GCynyLWoW2V3VpBJECgKopAvXwYKryE2bi0AEhbuOKc=;
        b=YiR+zXTPvwPOo1QmH6bpbhf46r10w+djNlPQf+TG5AYx/EiyZ0RMI4nbMA5DChSH0M
         DrOXn+iY8aL3xQir1xCcM4mub/cTzSV6BQtfqNj+9m1acPcCWCK3JaM5lmffm5Y/ud2A
         sGXv53kzs2V2NSUC4mNilRm7TRTopdGup12D7rx1cHU0Md41MNwJkPu6BAzsgkBp0Hh1
         EnG+m+/xz4rO7c88TGzvJmm54gQ7k/qmL0wzZiMwtLwBqMIPEZiYqvjT/IMeswkdD2t+
         o53LO1sSgCsg2BECWbcA3TpCH2lVDLkN1VNHmwRiYVBWHVXPBJcF+DEaLSXvDTMCPc0S
         aHNw==
X-Gm-Message-State: AC+VfDwtR+NkTc3zuCs4O+Ki1hZMsPTbX0WV3G2OTRxhtQavgnRoPXrR
        MOecV1qau+Cz1Q54KAh4ycQLiQ==
X-Google-Smtp-Source: ACHHUZ7cQ53ZaeBJXCSc0n79qlL4eVvWwXaB9K9+BZIUq9VFZ/qoirsRWNkWsGjBsklIkcutqeGZhA==
X-Received: by 2002:ac2:4c8e:0:b0:4f6:2629:6cf3 with SMTP id d14-20020ac24c8e000000b004f626296cf3mr2269056lfl.46.1686162247872;
        Wed, 07 Jun 2023 11:24:07 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id o5-20020ac24345000000b004f004c0498esm1879989lfl.71.2023.06.07.11.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 11:24:07 -0700 (PDT)
Message-ID: <ff8c76e4-fb6c-106d-eae3-45edc06b0c0b@linaro.org>
Date:   Wed, 7 Jun 2023 20:24:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, vkoul@kernel.org, kishon@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, gregkh@linuxfoundation.org,
        catalin.marinas@arm.com, will@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, p.zabel@pengutronix.de, arnd@arndb.de,
        geert+renesas@glider.be, neil.armstrong@linaro.org,
        nfraprado@collabora.com, broonie@kernel.org, rafal@milecki.pl,
        quic_srichara@quicinc.com, quic_varada@quicinc.org,
        quic_wcheng@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <cover.1686126439.git.quic_varada@quicinc.com>
 <1b48e737aa14f5b5539cbf04d473182121d5b1ad.1686126439.git.quic_varada@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 7/9] arm64: dts: qcom: ipq5332: Add USB related nodes
In-Reply-To: <1b48e737aa14f5b5539cbf04d473182121d5b1ad.1686126439.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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



On 7.06.2023 12:56, Varadarajan Narayanan wrote:
> Add USB phy and controller nodes
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5332.dtsi | 55 +++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> index c2d6cc65..3183357 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> @@ -383,6 +383,61 @@
>  				status = "disabled";
>  			};
>  		};
> +
> +		usb_0_m31phy: hs_m31phy@7b000 {
> +			compatible = "qcom,ipq5332-m31-usb-hsphy";
> +			reg = <0x0007b000 0x12C>,
random uppercase hex

> +			      <0x08af8800 0x400>;
> +			reg-names = "m31usb_phy_base",
> +				    "qscratch_base";
> +			phy_type= "utmi";
Missing space before '='

> +
> +			resets = <&gcc GCC_QUSB2_0_PHY_BCR>;
> +			reset-names = "usb2_phy_reset";
> +
> +			status = "okay";
If you're only defining the node, it's enabled by default

In this case, you'd probably want to disable it by default.

> +		};
> +
> +		usb2: usb2@8a00000 {
> +			compatible = "qcom,ipq5332-dwc3", "qcom,dwc3";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
Please push these 3 properties to the end

And add status = "disabled" below them.

> +
> +			reg = <0x08af8800 0x100>;
> +
> +			clocks = <&gcc GCC_USB0_MASTER_CLK>,
> +				<&gcc GCC_SNOC_USB_CLK>,
> +				<&gcc GCC_USB0_SLEEP_CLK>,
> +				<&gcc GCC_USB0_MOCK_UTMI_CLK>;
> +
Please remove this newline.

> +			clock-names = "core",
> +				"iface",
> +				"sleep",
> +				"mock_utmi";
Please align this, and all other similar lists.

> +
> +			interrupts-extended = <&intc GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
interrupts-extended is unnecessary with just a single interrupt
source.. you can make it `interrupts` and drop the GIC reference.

It would also be nice to push the interrupt properties below 'reg'.
We're working on documenting and automating checking the preferred
property order.

> +			interrupt-names = "pwr_event";
> +
> +			resets = <&gcc GCC_USB_BCR>;
> +
> +			qcom,select-utmi-as-pipe-clk;
> +
> +			usb2_0_dwc: usb@8a00000 {
> +				compatible = "snps,dwc3";
> +				reg = <0x08a00000 0xe000>;
> +				clocks = <&gcc GCC_USB0_MOCK_UTMI_CLK>;
> +				clock-names = "ref";
> +				interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> +				usb-phy = <&usb_0_m31phy>;
> +				tx-fifo-resize;
> +				snps,is-utmi-l1-suspend;
> +				snps,hird-threshold = /bits/ 8 <0x0>;
> +				snps,dis_u2_susphy_quirk;
> +				snps,dis_u3_susphy_quirk;
> +				snps,ref-clock-period-ns = <21>;
1/21 is 0.0476..  that doesn't seem to correspond to the ref
clk frequency?

Konrad
> +			};
> +		};
>  	};
>  
>  	timer {

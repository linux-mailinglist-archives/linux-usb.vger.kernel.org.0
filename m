Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E530778850D
	for <lists+linux-usb@lfdr.de>; Fri, 25 Aug 2023 12:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244419AbjHYKio (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Aug 2023 06:38:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244505AbjHYKif (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Aug 2023 06:38:35 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3275CE77
        for <linux-usb@vger.kernel.org>; Fri, 25 Aug 2023 03:38:32 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so93755866b.3
        for <linux-usb@vger.kernel.org>; Fri, 25 Aug 2023 03:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692959910; x=1693564710;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4eZohkMhT18ZevoTYowtU1nwE+F5rPhtMYikewT3XXg=;
        b=e9jvLTsyfDb7v5/FGy790xy/syp7CqL6sJhs+3z5/Ntvdmo1P+B/X8/pR+v/yHt1XK
         Y9eB3bA/4WxUdvQwxVAuxwJJjv9Pp+/QZFzqYvpAUpG0s9R63PFkI6U5t3MMboKE1JJw
         FJbARFWXYYIseW0tW32cVHY3sQn9YExgp/vo5vLVJVtnBWAlPnEgkzWRYf7yfUREu6y9
         fxNoqdp+OChYblufYtYWD9KOxb6FQjw7EVKqYpqBMNFouUAXEbchpEXlbp1A+B7W/7Ft
         jirOnOlJxDjN7Wh4i8kGCsaGYJ7v5DcQDphocFeMeTqVCdRECeKz+uMmsO1LXgOQhZ1R
         aJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692959910; x=1693564710;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4eZohkMhT18ZevoTYowtU1nwE+F5rPhtMYikewT3XXg=;
        b=iuGP2GsYDYVxrg/hUQq5oCFbUhckLK/NEHHBDAvZ3ebnxpKnFkRhrM9ABXO3Fd9wTT
         d5+9guQ9Iq59gpe1ZQkhTF/Kt+JB7aosDZjx0rYx8MEjUkmntpIWklRp8iwuVX7oykHi
         1KtfeGOuODso3uJt5mX/UbQHENsx8WbvvCKdEx+wYdo9X43Iou14MOBNasYFaBDTCIez
         tNRGTtxWSsChEpLYc2PiM+/uNlvOYC1asuvrEfBc40PsKZALUlaRLg9Ep8VDb3sYTuIE
         SuicHpJ8lIWzBLiNGEKWIUnKvATKEW3BzbPMNP8DLQJAKUHiMUmPcW6muJlt/2rME+61
         Payg==
X-Gm-Message-State: AOJu0YzyC8m0R8TolnUvfEj2V392HU0nJv8t98JcNb4Ay++7eIl2nUB4
        /spYjb5pvoVxZbR/SLaFB6AD0A==
X-Google-Smtp-Source: AGHT+IH0qcquB6UUsjccrAhAd5g5uk1lWTfoEshvV6vXgxsyW5wPkuOjsmNdJVNE/Rf5imzVP/it5A==
X-Received: by 2002:a17:906:5dd8:b0:99e:7a6:d412 with SMTP id p24-20020a1709065dd800b0099e07a6d412mr15041752ejv.19.1692959910695;
        Fri, 25 Aug 2023 03:38:30 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id k16-20020a170906971000b009a0955a7ad0sm827555ejx.128.2023.08.25.03.38.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 03:38:30 -0700 (PDT)
Message-ID: <7c0dbf30-295f-6735-88d1-f4e524936c72@linaro.org>
Date:   Fri, 25 Aug 2023 12:38:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 4/5] arm64: dts: qcom: ipq5018: Add USB related nodes
Content-Language: en-US
To:     Nitheesh Sekar <quic_nsekar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, quic_srichara@quicinc.com,
        quic_varada@quicinc.com, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc:     Amandeep Singh <quic_amansing@quicinc.com>
References: <20230825093531.7399-1-quic_nsekar@quicinc.com>
 <20230825093531.7399-5-quic_nsekar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230825093531.7399-5-quic_nsekar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 25/08/2023 11:35, Nitheesh Sekar wrote:
> Add USB phy and controller nodes.
> 
> Co-developed-by: Amandeep Singh <quic_amansing@quicinc.com>
> Signed-off-by: Amandeep Singh <quic_amansing@quicinc.com>
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 54 +++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index 9f13d2dcdfd5..ff477923a823 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -238,6 +238,60 @@
>  				status = "disabled";
>  			};
>  		};
> +
> +		usbphy0: phy@5b000 {
> +			compatible = "qcom,ipq5018-usb-hsphy";
> +			reg = <0x0005b000 0x120>;
> +
> +			clocks = <&gcc GCC_USB0_PHY_CFG_AHB_CLK>;
> +
> +			resets = <&gcc GCC_QUSB2_0_PHY_BCR>;
> +
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
> +		usb: usb2@8a00000 {

usb@

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +			compatible = "qcom,ipq5018-dwc3", "qcom,dwc3";
> +			reg = <0x08af8800 0x400>;
> +


Best regards,
Krzysztof


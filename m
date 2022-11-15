Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D653E6299DC
	for <lists+linux-usb@lfdr.de>; Tue, 15 Nov 2022 14:16:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbiKONQe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Nov 2022 08:16:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230420AbiKONQc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Nov 2022 08:16:32 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8260B28E3E
        for <linux-usb@vger.kernel.org>; Tue, 15 Nov 2022 05:16:30 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id bp15so24286066lfb.13
        for <linux-usb@vger.kernel.org>; Tue, 15 Nov 2022 05:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vl1BV7fBxn6Va3uDyQcOPanm5XadBqhJHUBBX9Sb6bI=;
        b=M+nPLf+nbaNgQJZE3GZoHbIVDgFHNZyWDibcs3t07MLtUGfM+jXjJ4HMxEXGmruaKO
         2rMbiJQKIt7T5dUt2xI7GQIs4T6EFphstUZVsobgWUz2wybUBqkKo7BhEiE8k0VGYmP9
         F92t0Z8Up2MvN5Lx6F4B4tZ3/H/qeK11Khpe5vrxAFRc2z+jjVmdB/f0snl28Phd5G3Z
         VhU2P0WgWkgC5B+NIS2hkr5ga7bb0r1QfvFF9P8c7bWl1W+KitlJNJSELPEElQtzJUHj
         5VIPwVqpArabsYNNFerQQ62tF72X3gcMAVY68mmBQjvkbIyJ0LCzOioZk0BrnsaHOlcJ
         rtnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vl1BV7fBxn6Va3uDyQcOPanm5XadBqhJHUBBX9Sb6bI=;
        b=z4gh+eaGda+mvns9bjMSl9J/zGWt+cp+mCOrqVcMiKThBFdsG8O3MOu9QU6ekHY3de
         Vz7iJ/xzLc5buHiNGrhi2/28ID6K0M8Zj7mMYCqOJywC2vDJVnfN/QMmjRHbBbR1PNwP
         1gG8Y/lyWUh3iLArYhoh15vnYwE0aE28za6T7Y5/2PURbTJ6/z31L4WddRUZAZu89PI1
         7LltsAQQbmGSwKFt2OKJeyjyaZIKT389eDY3OR/I1DID5m3yFa2mdC0xM/Rxdmzf0ik6
         V89lOKYbHhFRJXjZ5Zaq3yrrx4ITWfCMiTOJM+oJGF9HsxpR8prTC4RBSKCJjAZLkQZW
         zOrQ==
X-Gm-Message-State: ANoB5pk9xLlUF4Raxob+jtyul73oxJHt2Tj8/a9sfij2T/xG1TWquE74
        09LvdJHxK2ahqaTjSVYQ3gyZAg==
X-Google-Smtp-Source: AA0mqf4khaa5y9EhlBl8gS9PmoJr4OoakMGwbZAbkLgVi7zDvGOcJrtmg5qiaP7TkzP5lsOga3hyuw==
X-Received: by 2002:a05:6512:128e:b0:4b3:ccea:9b2e with SMTP id u14-20020a056512128e00b004b3ccea9b2emr6383119lfs.379.1668518188894;
        Tue, 15 Nov 2022 05:16:28 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bi20-20020a05651c231400b0026dcf0cbb97sm2507562ljb.137.2022.11.15.05.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 05:16:28 -0800 (PST)
Message-ID: <51d42fc2-0492-9077-302d-5c3be4b45cd1@linaro.org>
Date:   Tue, 15 Nov 2022 14:16:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 6/7] ARM: dts: r9a06g032: Add the USBF controller node
Content-Language: en-US
To:     Herve Codina <herve.codina@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
References: <20221114111513.1436165-1-herve.codina@bootlin.com>
 <20221114111513.1436165-7-herve.codina@bootlin.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221114111513.1436165-7-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 14/11/2022 12:15, Herve Codina wrote:
> Add the USBF controller available in the r9a06g032 SoC.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  arch/arm/boot/dts/r9a06g032.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
> index 563024c9a4ae..a4bb069457a3 100644
> --- a/arch/arm/boot/dts/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/r9a06g032.dtsi
> @@ -117,6 +117,18 @@ dmamux: dma-router@a0 {
>  			};
>  		};
>  
> +		udc: usb@4001e000 {
> +			compatible = "renesas,r9a06g032-usbf", "renesas,rzn1-usbf";
> +			reg = <0x4001e000 0x2000>;
> +			interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&sysctrl R9A06G032_HCLK_USBF>,
> +				 <&sysctrl R9A06G032_HCLK_USBPM>;
> +			clock-names = "hclkf", "hclkpm";
> +			power-domains = <&sysctrl>;
> +			status = "disabled";

If you provided all resources (clocks, power domains etc), why disabling it?

Best regards,
Krzysztof


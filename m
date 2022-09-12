Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 152D35B58ED
	for <lists+linux-usb@lfdr.de>; Mon, 12 Sep 2022 13:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbiILLBB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Sep 2022 07:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbiILLA7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Sep 2022 07:00:59 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BDC8220CC
        for <linux-usb@vger.kernel.org>; Mon, 12 Sep 2022 04:00:56 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id p5so10057538ljc.13
        for <linux-usb@vger.kernel.org>; Mon, 12 Sep 2022 04:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=VNRLB5dMr8KxcMuJauPpZNtGEDYIcFeLhKYuKfQ2WK4=;
        b=Wr271pDa4rYLOMj1WYVJWc+MhXbFaiyoYNkavxMyqSK0firTu7PnHjPX39Rgx7kg6O
         stiKUajPEgJzCGa8pAk3WO8Qc91CsGQGrOY8LJ9j52EVVd1MgNPN3WaVUuEJnJN11u4b
         Qpg5WIoDM7DlRIOn4EJIs4ZEtbl9xc8upENfntB+G01YNTtdBEv/YwlO25SJuNNc/nL6
         a3+S9EEJWQBLPyv5sAJ4LR/Wj54TYjrFhtt0kPua0B2frGbW9lGlwZ1V6Oqz7i7sx03d
         yGtQxThRzGLvFRlb8Np9yms1PBoIZPkKtHK6nE3JHQPr1W9wN+R147UYGbkNUD7oxVWm
         S0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=VNRLB5dMr8KxcMuJauPpZNtGEDYIcFeLhKYuKfQ2WK4=;
        b=iTuTzPbK9EFaYyIKy/7hEFShibuZLYvUdKvKjy20NzqnduG2+nWwN3WaJtXmI1cY3T
         93Cc0OekFPoZ4R7me1wTmPMO0f95FwgmseIa5Q00kY1PksGDZg7KBCjyUBKefA8bcAKP
         t1Hyqk6bbpWlxfQzQFbZI9OEMsc0M+JLmDTGfrbmibYUngP3AtmC9BnYKOcuKtB4n1+C
         d2dfFgC6gtXFcWHPQ9KYiV1jXrB8ggBYLnNbIeYVnlqCzexVvAnNHRgN2uiqJQ+Y0cpj
         KSTGcf+m2SMJzDagZ7137sgQFLeuwkLYSW2PJbi/XHwtIarWXnHVetkjEmJSaPt/LX2Y
         pt+Q==
X-Gm-Message-State: ACgBeo3opywEFHgeGMgz2hOnhfJEu6lLpn9o5YWsNYdqsBkZl8cOf3Zo
        CNmWIWzn39s69w/183kuV2RoPg==
X-Google-Smtp-Source: AA6agR5qUmM2ZmB3u+ceQgLmGH1b3qt0oNh2whK2G3kPo3FfMoZ57icsO07DBG7SNBSMhG5XpY/UNg==
X-Received: by 2002:a2e:9801:0:b0:25e:45ed:edc5 with SMTP id a1-20020a2e9801000000b0025e45ededc5mr7229723ljj.467.1662980454897;
        Mon, 12 Sep 2022 04:00:54 -0700 (PDT)
Received: from [10.129.96.84] ([109.232.243.34])
        by smtp.gmail.com with ESMTPSA id v6-20020a197406000000b004979df1c1fasm1010823lfe.61.2022.09.12.04.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 04:00:54 -0700 (PDT)
Message-ID: <15b65ac4-6656-dec5-80fd-e3c29b226a25@linaro.org>
Date:   Mon, 12 Sep 2022 13:00:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 6/7] arm64: dts: allwinner: h616: OrangePi Zero 2: Add USB
 nodes
Content-Language: en-US
To:     Andre Przywara <andre.przywara@arm.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, Karl Kurbjun <karl.os@veroson.com>,
        Icenowy Zheng <icenowy@aosc.io>
References: <20220911235945.6635-1-andre.przywara@arm.com>
 <20220911235945.6635-7-andre.przywara@arm.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220911235945.6635-7-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/09/2022 01:59, Andre Przywara wrote:
> The OrangePi Zero 2 has one USB-A host port, VBUS is provided by
> a GPIO controlled regulator.
> The USB-C port is meant to power the board, but is also connected to
> the USB 0 port, which we configure as an MUSB peripheral.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../allwinner/sun50i-h616-orangepi-zero2.dts  | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> index 02893f3ac99d..3197dc43397b 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> @@ -49,8 +49,25 @@ reg_vcc5v: vcc5v {
>  		regulator-max-microvolt = <5000000>;
>  		regulator-always-on;
>  	};
> +
> +	reg_usb1_vbus: usb1-vbus {

Generic node names, so at least generic prefix/suffix (regulator-usb1-vbus)

> +		compatible = "regulator-fixed";
> +		regulator-name = "usb1-vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&reg_vcc5v>;
> +		enable-active-high;
> +		gpio = <&pio 2 16 GPIO_ACTIVE_HIGH>; /* PC16 */
> +		status = "okay";

No need for status.


Best regards,
Krzysztof

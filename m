Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 368305FC609
	for <lists+linux-usb@lfdr.de>; Wed, 12 Oct 2022 15:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbiJLNLZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Oct 2022 09:11:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbiJLNLS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Oct 2022 09:11:18 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E286A2852
        for <linux-usb@vger.kernel.org>; Wed, 12 Oct 2022 06:11:15 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id a24so2544002qto.10
        for <linux-usb@vger.kernel.org>; Wed, 12 Oct 2022 06:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=duZMII461PybSOKzGZSZqhJJ/qLu0MRfPY5z6dxigmI=;
        b=a7bw5Q23wINBvoFwz/iFZmdlemcJRCm9fhL7eS0XFlNQBZ19p4im/mcGTwHU1NAtzD
         jk6jZhamKzPFSoVWO4p59MOJu3n5voX+W74YhAqC7zhP2wesfnJPhWUO72deAIFWJSC7
         1p84rOHvcqZr6MaJnxgvtHgl8Y7lZOjcflhrDrkG1Qpr8tBoWZAXn7m+cbyhPn418YZX
         PzSlw2xNcMvMAr0PyXBqclS6lkLZ6DWGl3D4omft/y9F/Aic/TZwQ8Dz3yxFtaCJM/lm
         JFVVbcwmfcVn4kc6k5L7cHk5gOn9ei/ckUCjW4d+no+hO8d6nJWpK6ew5z4KYzrgRvwn
         V2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=duZMII461PybSOKzGZSZqhJJ/qLu0MRfPY5z6dxigmI=;
        b=GgxTJ0j53PHkXOxq+pGNaggDt91csn8PAdZjRPneqawn7LS78x5p5/8d89Qiw6QZTR
         Q/VXPfftky9USPAoTvU40eyMngHwLxStR+CSXGc7H9zpTOfIFp1jbIIvA9vN7JETA5lz
         TDfsgJAQYhO3o1540aARGsOymaw5Uz2WiJ+lGl3gudFbl0I9H1Mzegf1FnI4nfYK62AS
         mD50c8640iGh4Zb1ZLd58rWREj/xm3YgCR+uhbOLFrV/0ALUq7WLSk4ei4DGBiLlxzL/
         h6Lt2VF6FRDlFsOO3obAud52Jhpoup5ZQJQkaR0I7YQ7ubXwFUl5K3HscV4b1q6dCNKV
         a5XQ==
X-Gm-Message-State: ACrzQf20sxosEiD3yZc2qLbIWv+DPoskQ3ENzveIuIi9CyI6XlVkDtQF
        Lr54haz3UvfyaEGUg+0isjK7Ow==
X-Google-Smtp-Source: AMsMyM5zJrz3dx98rqmztHfBVMqSLyUW8p6tkWsBylvPbfbtBcCaSwdh6OYo7aZ0HedmoRQQhkOkng==
X-Received: by 2002:ac8:7fcc:0:b0:39c:bdf4:6323 with SMTP id b12-20020ac87fcc000000b0039cbdf46323mr2836670qtk.201.1665580274377;
        Wed, 12 Oct 2022 06:11:14 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id he35-20020a05622a602300b0039a55f78792sm6338703qtb.89.2022.10.12.06.11.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 06:11:13 -0700 (PDT)
Message-ID: <12461098-aea7-e486-f303-ef2387a6ae1f@linaro.org>
Date:   Wed, 12 Oct 2022 09:11:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 10/10] ARM: dts: suniv: add device tree for PopStick
 v1.1
Content-Language: en-US
To:     Icenowy Zheng <uwu@icenowy.me>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andre Przywara <andre.przywara@arm.com>
Cc:     soc@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org
References: <20221012055602.1544944-1-uwu@icenowy.me>
 <20221012055602.1544944-11-uwu@icenowy.me>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221012055602.1544944-11-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/10/2022 01:56, Icenowy Zheng wrote:
> PopStick is a minimal Allwinner F1C200s dongle, with its USB controller
> wired to a USB Type-A port, a SD slot and a SPI NAND flash on board, and
> an on-board CH340 USB-UART converted connected to F1C200s's UART0.


(...)

> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led {
> +			function = LED_FUNCTION_STATUS;
> +			color = <LED_COLOR_ID_GREEN>;
> +			gpios = <&pio 4 6 GPIO_ACTIVE_HIGH>; /* PE6 */
> +			linux,default-trigger = "heartbeat";
> +		};
> +	};
> +
> +	reg_vcc3v3: vcc3v3 {

Generic node names, so at least generic "regulator" prefix or suffix.

> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +};
> +
> +&mmc0 {
> +	cd-gpios = <&pio 4 3 GPIO_ACTIVE_LOW>; /* PE3 */
> +	bus-width = <4>;
> +	disable-wp;
> +	status = "okay";

Keep status as last property.

> +	vmmc-supply = <&reg_vcc3v3>;
> +};
> +
> +&spi0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi0_pc_pins>;
> +	status = "okay";
> +
> +	flash@0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "spi-nand";
> +		reg = <0>;

compatible and reg are by convention the first properties.

> +		spi-max-frequency = <40000000>;
> +

Best regards,
Krzysztof


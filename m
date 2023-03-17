Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0971A6BE42C
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 09:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231461AbjCQIqF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 04:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231939AbjCQIpP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 04:45:15 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A1FB5A93C
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 01:44:37 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id fd5so17438495edb.7
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 01:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679042675;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=juFmrQz7oKZJRVloOKbAwgle6hn0N8TdFSrYHqJtuGs=;
        b=alyQrUOzldXMFXcXM/xm57EnS7Biz1DBBOCfYjMGS+7LLhegBZpU9leCj5vcMtwmLE
         HPYbUWzopVK2UWhT9Bx7o8W2KKqzOF217Tx1jZER1jkeAb+WEfIt1utEjhcXplxyfiXr
         afYezteJUkdwfm/v7IsGnLl+azcWRjGVbhVTLeYnlgJ8dj7jozEzDh1WVtibhJlpbd2s
         0cwY/4DtVZTvNe11Lusn/tfqI0zA/RUH3kdSWB+qpiluR41RRA6+VJmJXQjVJKw1u5BS
         n/HdliYLBUZFLH9SseWrmT0axULEsZPJGH3m4b8zBoKFeI24PCS+QeULJ8TPc9wKv1d7
         ZQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679042675;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=juFmrQz7oKZJRVloOKbAwgle6hn0N8TdFSrYHqJtuGs=;
        b=vsIfQBGTcONL62jjpaAMMsGP25I36Pur5vmFxCf/CxhFAwU9xZVwyEM93dEM7ywIUv
         ctY0Tc8KzEzsCoE/8nHb/q/icrdrGT0PqEfGj+ZIVrFF2mwA2H1vnYYR3NrXYwald0IN
         5YS2dNOmTkWfcwCRLkAx4UQabGwq+jAlA5F5hrX5fBYnGSwAaUOOKRo/TNVEjDosu9y9
         BGhtmS5qloftlPy/JZ904GJIyhduC2bG7kyyOtlomgidzUGvrAumfVHhkXJJx5tHBSzV
         jIQa3H9HKsxcZ2IJoTeZ+F7CooA6xovsIJVu3kHzCZHgDKLidC9hB+U49jp5a1R3SqVi
         8Mfw==
X-Gm-Message-State: AO0yUKVi2Qrf3O9yaXKR03MW5V7hbKvAE7N92GU8osHG+nWhwF0hBP9W
        IFK7hG1f92hr6cPnIua6KnB12Q==
X-Google-Smtp-Source: AK7set8TDDSh0NPwZz11d/QCnupF+zzxPhz66o7xVZyQ0Nwr55I5QWoofBSxOkS7LU7Suo6Z4CCdEw==
X-Received: by 2002:a17:906:568a:b0:931:d8db:8a2f with SMTP id am10-20020a170906568a00b00931d8db8a2fmr1374810ejc.58.1679042675695;
        Fri, 17 Mar 2023 01:44:35 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:848a:1971:93e0:b465? ([2a02:810d:15c0:828:848a:1971:93e0:b465])
        by smtp.gmail.com with ESMTPSA id lt11-20020a170906fa8b00b008e54ac90de1sm701978ejb.74.2023.03.17.01.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 01:44:35 -0700 (PDT)
Message-ID: <79593668-6ded-7290-f39b-e226d30e6e95@linaro.org>
Date:   Fri, 17 Mar 2023 09:44:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 5/5] dts: usb: add StarFive JH7110 USB dts
 configuration.
Content-Language: en-US
To:     Minda Chen <minda.chen@starfivetech.com>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        Conor Dooley <conor@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <peter.chen@kernel.org>,
        Roger Quadros <rogerq@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>
References: <20230315104411.73614-1-minda.chen@starfivetech.com>
 <20230315104411.73614-6-minda.chen@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230315104411.73614-6-minda.chen@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 15/03/2023 11:44, Minda Chen wrote:
> USB Glue layer and Cadence USB subnode configuration,
> also includes USB and PCIe phy dts configuration.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

> ---
>  .../jh7110-starfive-visionfive-2.dtsi         |  7 +++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 54 +++++++++++++++++++
>  2 files changed, 61 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index a132debb9b53..c64476aebc1a 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -236,3 +236,10 @@
>  	pinctrl-0 = <&uart0_pins>;
>  	status = "okay";
>  };
> +
> +&usb0 {
> +	status = "okay";
> +	usbdrd_cdns3: usb@0 {

You should rather override by phandle this as well.

> +		dr_mode = "peripheral";
> +	};
> +};
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index f70a4ed47eb4..17722fd1be62 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -362,6 +362,60 @@
>  			status = "disabled";
>  		};
>  
> +		usb0: usb@10100000 {
> +			compatible = "starfive,jh7110-usb";
> +			clocks = <&stgcrg JH7110_STGCLK_USB0_LPM>,
> +				 <&stgcrg JH7110_STGCLK_USB0_STB>,
> +				 <&stgcrg JH7110_STGCLK_USB0_APB>,
> +				 <&stgcrg JH7110_STGCLK_USB0_AXI>,
> +				 <&stgcrg JH7110_STGCLK_USB0_UTMI_APB>;
> +			clock-names = "lpm", "stb", "apb", "axi", "utmi_apb";
> +			resets = <&stgcrg JH7110_STGRST_USB0_PWRUP>,
> +				 <&stgcrg JH7110_STGRST_USB0_APB>,
> +				 <&stgcrg JH7110_STGRST_USB0_AXI>,
> +				 <&stgcrg JH7110_STGRST_USB0_UTMI_APB>;
> +			starfive,stg-syscon = <&stg_syscon 0x4 0xc4 0x148 0x1f4>;
> +			starfive,sys-syscon = <&sys_syscon 0x18>;
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x0 0x0 0x10100000 0x100000>;

reg and ranges should be second property. This also applies to your
binding example.


Best regards,
Krzysztof


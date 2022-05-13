Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D373526274
	for <lists+linux-usb@lfdr.de>; Fri, 13 May 2022 14:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380489AbiEMM6E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 May 2022 08:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380483AbiEMM6C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 May 2022 08:58:02 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 893849B198
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 05:57:58 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id w4so11307777wrg.12
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 05:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=cU4ZtNl2vEtEVH/Lak30VWKkW5zSu+7jhI7ooziHVxo=;
        b=hY7RshcVZtZ0WoJs33dta6NDd8NbGGJgoY7ZVCt1MeX0kX/Xj3Lur613Or1JybyFNm
         1HZ68gzAyuZJ8HOhwzUYP2bCfyxQ3UjhIhkwG50UoTionya9gp2Lp4+3JXKF5s9OXTad
         rtkkhgzPeqz0KXuiSklUoKWKV7iFh885UjegJnXpUGHMq0GfXN1SzZwNVOCpUZQvmUAl
         wZVv/mwulIFZpoVx+IaJq/yTsvsiD6UHDTj6qw8PTVLML5IPn0FdBM9nRLhQC9e2aKAB
         /u01OAXzCFlE6Lf25zxbalQ7Q0ZuFUrf1H9RfwLN2zlEoQ/ShPfPWcIgEmgvSF9B8Pws
         Vwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cU4ZtNl2vEtEVH/Lak30VWKkW5zSu+7jhI7ooziHVxo=;
        b=DbChzED2Oke6Nm6PVqC/30iu627q3KPr1DwI4YwXpcWof90WP7NiLeYSRKEES5AFJ3
         4AEd0u1DQLnvnXvUWvirOyR0EWrnk7GBOdh8iciLbh0owQhu9STCtEzNnzxt5DDHfhJd
         z2a61g6QHgyCbnZDD6hD+OJ0e+wa2w66t0OjOiA1mYGGirD4dbHWUZFz9Jg4/+OMwXer
         r1Bkyq1uaRS3aiVgG6lz4Xy7o1QIsTS+D+JA1snvHKviJYTx8kSAJk+BkUTOwfZx4iN6
         8dblaz8EHSL0wfc62bEawLolSoyt3abv5on8k1G0v1s5wTLUylzLcZzcnDm66k5pe94C
         1jxg==
X-Gm-Message-State: AOAM531WA4eULhcy85HUx1YugTgQLJwwSURNNvoL3nfp6/iDv4Fq+76D
        oMUxwwgsF4OrU67VO5k1KOHAGQ==
X-Google-Smtp-Source: ABdhPJzDRMdFOUy5RI8IXI6VfHQuWSfZtMpfsZMkCc8yuVYUOfKov2JEFDGTvRzp8Wcd+aX5lCvZjQ==
X-Received: by 2002:a5d:5012:0:b0:20a:d9a9:44dc with SMTP id e18-20020a5d5012000000b0020ad9a944dcmr3858584wrt.627.1652446677102;
        Fri, 13 May 2022 05:57:57 -0700 (PDT)
Received: from [192.168.0.172] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d11-20020adfa34b000000b0020c86a9f33bsm2731239wrb.18.2022.05.13.05.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 05:57:56 -0700 (PDT)
Message-ID: <8f0d4127-7e66-cf50-21c9-99680f737e30@linaro.org>
Date:   Fri, 13 May 2022 14:57:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/3] dt-bindings: usb: atmel: Add Microchip LAN966x
 compatible string
Content-Language: en-US
To:     Herve Codina <herve.codina@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Horatiu Vultur <horatiu.vultur@microchip.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220513105850.310375-1-herve.codina@bootlin.com>
 <20220513105850.310375-3-herve.codina@bootlin.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220513105850.310375-3-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 13/05/2022 12:58, Herve Codina wrote:
> The USB device controller available in the Microchip LAN966x SOC
> is the same IP as the one present in the SAMA5D3 SOC.
> 
> Add the LAN966x compatible string and set the SAMA5D3 compatible
> string as a fallback for the LAN966x.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  Documentation/devicetree/bindings/usb/atmel-usb.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/atmel-usb.txt b/Documentation/devicetree/bindings/usb/atmel-usb.txt
> index f512f0290728..a6fab7d63f37 100644
> --- a/Documentation/devicetree/bindings/usb/atmel-usb.txt
> +++ b/Documentation/devicetree/bindings/usb/atmel-usb.txt
> @@ -87,6 +87,9 @@ Required properties:
>  	       "atmel,at91sam9g45-udc"
>  	       "atmel,sama5d3-udc"
>  	       "microchip,sam9x60-udc"
> +	       "microchip,lan996x-udc"

No wildcards please, especially that it closely fits previous wildcard
(lan996x includes lan9960 which looks a lot like sam9x60...)


Best regards,
Krzysztof

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8279A6DED96
	for <lists+linux-usb@lfdr.de>; Wed, 12 Apr 2023 10:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbjDLI2h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Apr 2023 04:28:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbjDLI2f (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Apr 2023 04:28:35 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AA23F3
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 01:28:33 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id qb20so26359213ejc.6
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 01:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681288112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jd92r82riwJsOveYZKHTDW/KsSsFPyivg2ELpgoEsB8=;
        b=PUSbPGzizsrr+vFCMuzzRcGEUYcTlSjWUG024UhbJUVEC9efv7g2Znddtmhck85VUH
         TzDnIdpCWArQsdfyoqA/Gh9Jj/aD3sWUro5uHXlzVOPgUXVCEQoO/I2k2S49uBZIjELG
         Z90g07/D+8XZY6CNGW8T8gXOrGbGPZss0z+y8a0W7BUnMXbS0ROHvFLH+gX8swuE38GO
         dfdMY8eYn8ddEpQ+5kkH237k5Oeu8Sb+hNOMbHpeZkMCSdrf+CG+bhXv0V2oAK11CsTr
         pjFK+TfyZxDTDw7vZp81KQdD/581KEBQMeLy+lqignQkEo4ApuXJGIqaEyDJBGm7qhFQ
         0W6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681288112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jd92r82riwJsOveYZKHTDW/KsSsFPyivg2ELpgoEsB8=;
        b=viP7wHBzARTTmquG6F1tgcQh+J5aIUwXD/oU1i+lJ0ssR+1TIAYdwYBkLIz8TtTo5C
         m1lGkUvjaLq9l02g6uNNTZ5mpRoSZX2CNulHWLAGnP7oeJjZeL475/ElxXP24/oo0QLn
         1lrT+8fk4/lDEgwgWKURAh0VHOyMtNHYGwdeRHhLg3sndUgHxU3IbIZhYtKyNTqEs1XT
         iXI+kxri9sSWlqWHoBWAcUSwCMTiY3/LyUhzMdBKulZAJQpZ65Zzr2YqEC8Kvnc6AVJC
         TkXtscT+CokQjrlZiOU4cTFlpw27Wrpcn6k5/zSLJ8QcD3XBXTqdlZWOYC1cVtr+1gYX
         AV3A==
X-Gm-Message-State: AAQBX9eMnqV8ge8K6XAIMzOBuG0FNgIn1+3AtU8cqs2B+9Ge2Sl0NUeE
        biCO7oaMy/G6LaO7y9DnWCUtUg==
X-Google-Smtp-Source: AKy350Z9boqUdZ08KOV1oZ83itELQafURismAgL/2KJC7VKIlkPW5aN1TQUaIaa6fsETnYFLrkN0og==
X-Received: by 2002:a17:907:703:b0:948:b9ea:3302 with SMTP id xb3-20020a170907070300b00948b9ea3302mr14702454ejb.1.1681288111982;
        Wed, 12 Apr 2023 01:28:31 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8fa0:9989:3f72:b14f? ([2a02:810d:15c0:828:8fa0:9989:3f72:b14f])
        by smtp.gmail.com with ESMTPSA id f17-20020a170906739100b0094e5679dd2csm532308ejl.165.2023.04.12.01.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 01:28:31 -0700 (PDT)
Message-ID: <38575aee-139c-688c-21a0-69844e5ae1c2@linaro.org>
Date:   Wed, 12 Apr 2023 10:28:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4 2/7] dt-bindings: phy: Add StarFive JH7110 PCIe
 document
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
        Albert Ou <aou@eecs.berkeley.edu>,
        Mason Huo <mason.huo@starfivetech.com>
References: <20230406015216.27034-1-minda.chen@starfivetech.com>
 <20230406015216.27034-3-minda.chen@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230406015216.27034-3-minda.chen@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 06/04/2023 03:52, Minda Chen wrote:
> Add StarFive JH7110 SoC PCIe 2.0 PHY dt-binding.
> PCIe PHY0 (phy@10210000) can be used as USB 3.0 PHY.

Subject: drop second/last, redundant "document". The "dt-bindings"
prefix is already stating that this is documentation.

> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> ---
>  .../phy/starfive,jh7110-pcie-phy.yaml         | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/starfive,jh7110-pcie-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/starfive,jh7110-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/starfive,jh7110-pcie-phy.yaml
> new file mode 100644
> index 000000000000..1b868f75ddae
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/starfive,jh7110-pcie-phy.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/starfive,jh7110-pcie-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive PCIe 2.0 PHY

JH7110

Unless you plan to add here more compatibles, but then use enum for
compatible, not const.


> +
> +maintainers:
> +  - Minda Chen <minda.chen@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-pcie-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  starfive,sys-syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      items:
> +        - description: phandle to System Register Controller sys_syscon node.
> +        - description: PHY connect offset of SYS_SYSCONSAIF__SYSCFG register for USB PHY.

No improvements here.

> +    description:
> +      The phandle to System Register Controller syscon node and the PHY connect offset
> +      of SYS_SYSCONSAIF__SYSCFG register. Connect PHY to USB3 controller.
> +
> +  starfive,stg-syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      items:
> +        - description: phandle to System Register Controller stg_syscon node.
> +        - description: PHY mode offset of STG_SYSCONSAIF__SYSCFG register.
> +        - description: PHY enable for USB offset of STG_SYSCONSAIF__SYSCFG register.

No improvements.


Best regards,
Krzysztof


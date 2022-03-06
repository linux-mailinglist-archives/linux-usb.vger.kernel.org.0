Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF5BA4CEB6F
	for <lists+linux-usb@lfdr.de>; Sun,  6 Mar 2022 13:08:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232619AbiCFMIt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Mar 2022 07:08:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232094AbiCFMIr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Mar 2022 07:08:47 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 311A3E02D
        for <linux-usb@vger.kernel.org>; Sun,  6 Mar 2022 04:07:54 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A86253F5FB
        for <linux-usb@vger.kernel.org>; Sun,  6 Mar 2022 12:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646568472;
        bh=5IOaq+YufH1O5iptx1mkNlYrqkIWyE0RDyxFyfke9gU=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:
         In-Reply-To:Content-Type;
        b=vd0ie6BPZz8FLoZp3sSDN5HPGpyhfx5WXJYHPdP9GDMEPV3HwAXKsWrf74VzWPWhY
         rEZqcTufKYIPBcA3L98EWIXgj/CnAqBew3Ea2lOzD9Fhp2+UCeZ8ConuBHZwyRfYvB
         yPQ/Ozbd4CofmRiHtiBYJclz/g05uKFn9qiYfOTXZ6FPdz6NBza6OWeIJka5vC74Sd
         BGJ80VFaG7+LuC0F0Ns40y9+JMrQLDv5GiFM6y11KarCYAvZKftrQ9Z4AgAU7KBwuB
         uxjN0AgUJ4EA9IEsdFn3kYoZyLMQlSMnsQVCPzC1+zljmElLn0xfzIGunqKp4x6GfF
         Jh1lraK7Y9xfA==
Received: by mail-ed1-f70.google.com with SMTP id y26-20020a50ce1a000000b00415e9b35c81so4543766edi.9
        for <linux-usb@vger.kernel.org>; Sun, 06 Mar 2022 04:07:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5IOaq+YufH1O5iptx1mkNlYrqkIWyE0RDyxFyfke9gU=;
        b=mXF+6HEnO7sXfWRUbguevdlFML3wDYVGgylLZR8o4q+UA3dhQa+e3Ls2PYUSSmBF78
         eCV3hcS1mlBvguOu3L9UG2vZ9m4hG0qA8pMAnMSIKsdoOHufLj0Ww/Kt1/A1lBDH/EMJ
         xlimjLA+FNjcnJG3C+zvIHg655YsWLLjZplf0QU/gpPW426NRyXKF8QVe2VH0hNde0Rr
         LSUMm8Tuj/Tx6KOsy2nPvhQqFEjdgP7W9U/QPxGR2Cm+PyvocfJ9NcXtaNqO28qHjAUf
         Q8U6oMWODCdKvBPnEJ5vOzF4MxR5o7PlP/b+iJzyGAKBofoGYeP2gN8/nUVo9TcZJIro
         KQLg==
X-Gm-Message-State: AOAM533Z465di1DE4KwVBSxYN1d3HwEW/GkW26BAzalG+E7bb86CmN4E
        10zQbVONT2nC1Enh1XhQN+IIlitVmNs5qqfmi0C1cYiBqFl7BswcEkRd8WjwOmo9twSybluvxFK
        +0/jUiouqZcOEWBJesDVQP2zclaG4+0s+M9K/7A==
X-Received: by 2002:a17:906:3e09:b0:6cf:cf2c:2c02 with SMTP id k9-20020a1709063e0900b006cfcf2c2c02mr5603564eji.291.1646568472015;
        Sun, 06 Mar 2022 04:07:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDfebfdKiG4YwPAGHmL0vGHlXgw8Al3VjbRvS0kYtSEJSQ7isfS6n1MA1Itv/GVcirehCDoA==
X-Received: by 2002:a17:906:3e09:b0:6cf:cf2c:2c02 with SMTP id k9-20020a1709063e0900b006cfcf2c2c02mr5603548eji.291.1646568471776;
        Sun, 06 Mar 2022 04:07:51 -0800 (PST)
Received: from [192.168.0.140] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id bn14-20020a170906c0ce00b006c5ef0494besm3728787ejb.86.2022.03.06.04.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Mar 2022 04:07:51 -0800 (PST)
Message-ID: <67ec6f3a-1579-f77a-a54d-381472252d6b@canonical.com>
Date:   Sun, 6 Mar 2022 13:07:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/2] dt-bindings: usb: Add bindings doc for Sunplus
 EHCI driver
Content-Language: en-US
To:     Vincent Shih <vincent.sunplus@gmail.com>,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        p.zabel@pengutronix.de, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, wells.lu@sunplus.com
References: <1646547036-14885-1-git-send-email-vincent.sunplus@gmail.com>
 <1646547036-14885-3-git-send-email-vincent.sunplus@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <1646547036-14885-3-git-send-email-vincent.sunplus@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 06/03/2022 07:10, Vincent Shih wrote:
> Add bindings doc for Sunplus EHCI driver
> 
> Signed-off-by: Vincent Shih <vincent.sunplus@gmail.com>
> ---
> Changes in v2:
>   - Address the comments by Rob Herring.
> 
>  .../bindings/usb/sunplus,sp7021-usb-ehci.yaml      | 63 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/sunplus,sp7021-usb-ehci.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/sunplus,sp7021-usb-ehci.yaml b/Documentation/devicetree/bindings/usb/sunplus,sp7021-usb-ehci.yaml
> new file mode 100644
> index 0000000..905f68c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/sunplus,sp7021-usb-ehci.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) Sunplus Co., Ltd. 2021
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/sunplus,sp7021-usb-ehci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sunplus SP7021 EHCI Controller Device Tree bindings

s/Device Tree bindings//
(title describes hardware)

> +
> +allOf:
> +  - $ref: usb-hcd.yaml#
> +
> +maintainers:
> +  - Vincent Shih <vincent.sunplus@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: sunplus,sp7021-usb2-ehci

You do not use this compatible in the driver.

> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    minItems: 1

Suddenly it became minItems. This looks odd, it should be maxItems: 1
rather. How many reset lines do you have there?


> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    maxItems: 1

phy-names needs list of names.

> +
> +required:
> +  - compatible
> +  - clocks
> +  - resets
> +  - reg
> +  - interrupts
> +  - phys
> +  - phy-names
> +
> +additionalProperties: false

This should be unevaluatedProperties:false, because you reference
usb-hcd schema.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    sp_ehci0: usb@9c102100 {
> +      compatible = "sunplus,sp7021-usb-ehci";
> +      clocks = <&clkc 0x3a>;
> +      resets = <&rstc 0x2a>;
> +      reg = <0x9c102100 0x68>;

reg goes after compatible in DTS.

Best regards,
Krzysztof

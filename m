Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17E12661625
	for <lists+linux-usb@lfdr.de>; Sun,  8 Jan 2023 16:21:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233053AbjAHPVc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 8 Jan 2023 10:21:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbjAHPV3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 8 Jan 2023 10:21:29 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E6C7DF89
        for <linux-usb@vger.kernel.org>; Sun,  8 Jan 2023 07:21:28 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id az7so5813799wrb.5
        for <linux-usb@vger.kernel.org>; Sun, 08 Jan 2023 07:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gD/H0/iEsnGJ/IZn2dFZYdThaenFE0vshIzFDdHdaKg=;
        b=q0coa+9GRNgVSBf00UH6xf+oZE4ZyfF7KkWWsWcGnmCdGixZYSEu9JMgxIdEcBIQjS
         2uZ81QB4I6xkJr1d5sV0nHHjgsPdU7y0my3xDLBzVRoOFK8gI5IQ6prX/IccOOkaiSrE
         B9YyAtpC53Y2XSKXbDM0VGMOs9MGh2a8wQqYBhgyGgPwebBdBYdiC1l6IV4284ypam06
         xeMGmxml3NGNL11keIea3VD6K7KFW3WQqa4equc/A1X3KSEUd6aZD+nwMTAkguVnaN5m
         UwgvsC3AE5cJeeOF5bubuIl3W+SjcrNvEXBsta5spmf5JXRoWj5NYwBuu+PT8HT/N50Q
         1lCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gD/H0/iEsnGJ/IZn2dFZYdThaenFE0vshIzFDdHdaKg=;
        b=1NtR0hKbh+dQ8wTMuURC72Z/bph5EpQBEYMWNxMtnTKmSrhyOb3QhuNKM+klhnMCfr
         4w2k2RaQks6iGyYW70ZMto5ky3uN73x7jZ+GVH1314HYsK1esti4NMSXSC/98qEcX9AO
         qI8OqGnPZPjRN/dMhgHi4KiEhQG0h87NVb43SytAX1yuklZqVuK6MG8NmsCWcfFIWh1z
         zuMfobAahWPgzYGAhU8ThoJmVBkNNJGxlufGW5IKGeKYicAZqbe0QuejVGyS0AMk/l7q
         d7kpYmYnR3L/c4u+9+cQkVmrQ3Vqhn6ohwNlYlHA/rYPNmL/Phn8XNtGZUuFJMsEuEwM
         g1Mw==
X-Gm-Message-State: AFqh2kp/PG5+q/V+lr07ubNvAFwT+NQ0kVt/fjClH+sKA7PkjOplUmwQ
        Cg3cpYNxNpkQDr/R/OgpwsYyGg==
X-Google-Smtp-Source: AMrXdXuuJcCP0BIPka5BWNC9RlBqsIkzDIiYgM0Fwcnq+I/V1qoz5nWOjl/XmoBKbtjt118Z0rvSlA==
X-Received: by 2002:adf:eb09:0:b0:2aa:1121:1b79 with SMTP id s9-20020adfeb09000000b002aa11211b79mr9773794wrn.25.1673191286648;
        Sun, 08 Jan 2023 07:21:26 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id w10-20020a5d608a000000b0027cfd9463d7sm6266273wrt.110.2023.01.08.07.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jan 2023 07:21:26 -0800 (PST)
Message-ID: <b1485d8a-71ea-7b75-74ab-77eef595ae10@linaro.org>
Date:   Sun, 8 Jan 2023 16:21:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V5 1/6] dt-bindings: usb: Add NVIDIA Tegra234 XUSB host
 controller binding
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        waynec@nvidia.com, Thierry Reding <treding@nvidia.com>
References: <20230106152858.49574-1-jonathanh@nvidia.com>
 <20230106152858.49574-2-jonathanh@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230106152858.49574-2-jonathanh@nvidia.com>
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

On 06/01/2023 16:28, Jon Hunter wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> Add device-tree binding documentation for the XUSB host controller present
> on Tegra234 SoC. This controller supports the USB 3.1 specification.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> V4 -> V5: No changes
> V3 -> V4: minor update to the power-domain description
> V2 -> V3: nothing has changed
> V1 -> V2: address the issue on phy-names property
> 
>  .../bindings/usb/nvidia,tegra234-xusb.yaml    | 158 ++++++++++++++++++
>  1 file changed, 158 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
> new file mode 100644
> index 000000000000..190a23c72963
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
> @@ -0,0 +1,158 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/nvidia,tegra234-xusb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra234 xHCI controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +description: The Tegra xHCI controller supports both USB2 and USB3 interfaces

Line ends after "description:"

> +  exposed by the Tegra XUSB pad controller.
> +
> +properties:
> +  compatible:
> +    const: nvidia,tegra234-xusb
> +
> +  reg:
> +    items:
> +      - description: base and length of the xHCI host registers

Just "xHCI host registers". Same in other places.

> +      - description: base and length of the XUSB FPCI registers
> +      - description: base and length of the XUSB bar2 registers
> +
> +  reg-names:
> +    items:
> +      - const: hcd
> +      - const: fpci
> +      - const: bar2
> +
> +  interrupts:
> +    items:
> +      - description: xHCI host interrupt
> +      - description: mailbox interrupt
> +
> +  clocks:
> +    items:
> +      - description: XUSB host clock
> +      - description: XUSB Falcon source clock
> +      - description: XUSB SuperSpeed clock
> +      - description: XUSB SuperSpeed source clock
> +      - description: XUSB HighSpeed clock source
> +      - description: XUSB FullSpeed clock source
> +      - description: USB PLL
> +      - description: reference clock
> +      - description: I/O PLL
> +
> +  clock-names:
> +    items:
> +      - const: xusb_host
> +      - const: xusb_falcon_src
> +      - const: xusb_ss
> +      - const: xusb_ss_src
> +      - const: xusb_hs_src
> +      - const: xusb_fs_src
> +      - const: pll_u_480m
> +      - const: clk_m
> +      - const: pll_e
> +
> +  interconnects:
> +    items:
> +      - description: read client
> +      - description: write client
> +
> +  interconnect-names:
> +    items:
> +      - const: dma-mem # read
> +      - const: write
> +
> +  iommus:
> +    maxItems: 1
> +
> +  nvidia,xusb-padctl:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the XUSB pad controller that is used to configure
> +      the USB pads used by the XHCI controller
> +
> +  phys:
> +    minItems: 1
> +    maxItems: 8
> +
> +  phy-names:
> +    minItems: 1
> +    maxItems: 8
> +    items:
> +      enum:
> +        - usb2-0
> +        - usb2-1
> +        - usb2-2
> +        - usb2-3
> +        - usb3-0
> +        - usb3-1
> +        - usb3-2
> +        - usb3-3

Why do you have so many optional phys? In what case you would put there
usb2-0 and usb3-3 together? Or even 8 phys at the same time? IOW, what
are the differences between them and why one controller would be
connected once to usb3-2 and once to usb3-3 phy? And once to both?

> +
> +  power-domains:
> +    items:
> +      - description: XUSBC power domain (for Host and USB 2.0)
> +      - description: XUSBA power domain (for SuperSpeed)
> +
> +  power-domain-names:
> +    items:
> +      - const: xusb_host
> +      - const: xusb_ss
> +
> +  dma-coherent:

Just: true

> +    type: boolean

Drop

> +
> +allOf:
> +  - $ref: usb-xhci.yaml
> +
> +unevaluatedProperties: false
> +

Best regards,
Krzysztof


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BBBD5BDD6C
	for <lists+linux-usb@lfdr.de>; Tue, 20 Sep 2022 08:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231183AbiITGh3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Sep 2022 02:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbiITGgh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Sep 2022 02:36:37 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 240005F219;
        Mon, 19 Sep 2022 23:35:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C6755B81CEE;
        Tue, 20 Sep 2022 06:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B27C433C1;
        Tue, 20 Sep 2022 06:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663655734;
        bh=z4g70PWNS19WDaZZAXAoI1HGOBQ1YJ7dA7waNDxTJ+U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l5Twc8sPOZQJX+kvswAylubH6gwPowlY7GN/3Z8oGoS5TZfrtK7a4uw/aA34Hr/0i
         1Hvnz9QIGt+0ykQoZKjXYskD2llkqqcGkBnMgOW7C6Tz0T3V9NZqYx/uvuMXhmJrqk
         JncAZzUVlWHHkplP7W4bIDFqmq3O0/M0PaS9DfI+MnT47jD5MIXSADJo63pevsCPnb
         Itn0HRwiaLbZdB+t/BnVmlBzNALhmgH0kevAkMp9maNERiBLRJsKYNktFVEsKsI7Mb
         hQXq+h6kbdfeF+OOhh5BFHVvVTLC3+OOVKYnYr+2/lGB+UvIag5cm2JbcJeIqGhJYj
         KxdmvuLnuSecA==
Date:   Tue, 20 Sep 2022 12:05:30 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, Karl Kurbjun <karl.os@veroson.com>,
        Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH 2/7] dt-bindings: usb: Add special clock for Allwinner
 H616 PHY
Message-ID: <YylfMk4QJsgTOCe0@matsya>
References: <20220911235945.6635-1-andre.przywara@arm.com>
 <20220911235945.6635-3-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220911235945.6635-3-andre.przywara@arm.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12-09-22, 00:59, Andre Przywara wrote:
> The USB PHY IP in the Allwinner H616 SoC requires a quirk that involves
> some resources from port 2's PHY and HCI IP. In particular the PMU clock
> for port 2 must be surely ungated before accessing the REG_HCI_PHY_CTL
> register of port 2. To allow each USB port to be controlled
> independently of port 2, we need a handle to that particular PMU clock
> in the *PHY* node, as the HCI and PHY part might be handled by separate
> drivers.
> 
> Add that clock to the requirements of the H616 PHY binding, so that a
> PHY driver can apply the quirk in isolation, without requiring help from
> port 2's HCI driver.

This is phy binding patch and not a usb one, pls fix the subystem name
for patch

> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../phy/allwinner,sun8i-h3-usb-phy.yaml       | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun8i-h3-usb-phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun8i-h3-usb-phy.yaml
> index e288450e0844..3a3168392597 100644
> --- a/Documentation/devicetree/bindings/phy/allwinner,sun8i-h3-usb-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/allwinner,sun8i-h3-usb-phy.yaml
> @@ -36,18 +36,22 @@ properties:
>        - const: pmu3
>  
>    clocks:
> +    minItems: 4
>      items:
>        - description: USB OTG PHY bus clock
>        - description: USB Host 0 PHY bus clock
>        - description: USB Host 1 PHY bus clock
>        - description: USB Host 2 PHY bus clock
> +      - description: PMU clock for host port 2
>  
>    clock-names:
> +    minItems: 4
>      items:
>        - const: usb0_phy
>        - const: usb1_phy
>        - const: usb2_phy
>        - const: usb3_phy
> +      - const: pmu2_clk
>  
>    resets:
>      items:
> @@ -98,6 +102,21 @@ required:
>  
>  additionalProperties: false
>  
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - sun50i-h616-usb-phy
> +
> +then:
> +  properties:
> +    clocks:
> +      minItems: 5
> +
> +    clock-names:
> +      minItems: 5
> +
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> -- 
> 2.35.3

-- 
~Vinod

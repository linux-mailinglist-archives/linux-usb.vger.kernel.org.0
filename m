Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E51C8763C7E
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jul 2023 18:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbjGZQ3S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jul 2023 12:29:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbjGZQ3S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jul 2023 12:29:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1387C26A1;
        Wed, 26 Jul 2023 09:29:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9E98C61BC2;
        Wed, 26 Jul 2023 16:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65A4EC433C8;
        Wed, 26 Jul 2023 16:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690388956;
        bh=ZVCmTrjZgRuUMiAs+8tqCzy75T2DMxHWuEZMbl9wyKk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I/HrksIQv40llE0OQU3gtKSFhQLDbu7BrCI2PAToDpozpfEOPCzZMvTJnaWOqJPnJ
         2EisLEhLYlcNvl3Haewa3FNsXapoNVnXUaIdhHO3Lb17hd1sFzcPww5br0zE0lkEPx
         T1G4kwxvGvGsn2eX8YSN8ZKdtceuInUKg6J4QDJDw9m04adWTtR/o/B5bEFVorE8ST
         46N7UznvCB5z1cyvUiPruVHfSNo7iJv6CigiIgt1vVYHFvPqgeLO02f83H9hN3xfqN
         XuRnwhR4gwB/vL8rPrzq+NJLLkx0fURwharxwBUoM8Jt2HQGsnlD8Dyu7X7VayEydW
         fA2W42v313E1A==
Received: (nullmailer pid 1549550 invoked by uid 1000);
        Wed, 26 Jul 2023 16:29:14 -0000
Date:   Wed, 26 Jul 2023 10:29:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     adrian.ho.yin.ng@intel.com
Cc:     gregkh@linuxfoundation.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Thinh.Nguyen@synopsys.com,
        p.zabel@pengutronix.de
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: Add Intel SoCFPGA USB controller
Message-ID: <20230726162914.GA1542946-robh@kernel.org>
References: <cover.1690179693.git.adrian.ho.yin.ng@intel.com>
 <0d12c7a196d6ad81cfc69b281dd1c4cca623d9bd.1690179693.git.adrian.ho.yin.ng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d12c7a196d6ad81cfc69b281dd1c4cca623d9bd.1690179693.git.adrian.ho.yin.ng@intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 24, 2023 at 02:36:58PM +0800, adrian.ho.yin.ng@intel.com wrote:
> From: Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>
> 
> Existing binding intel,keembay-dwc3.yaml does not have the required
> properties for Intel SoCFPGA devices.
> Introduce new binding description for Intel SoCFPGA USB controller
> which will be used for current and future SoCFPGA devices.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>
> ---
>  .../bindings/usb/intel,socfpga-dwc3.yaml      | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml b/Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml
> new file mode 100644
> index 000000000000..e36b087c2651
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/intel,socfpga-dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Intel SoCFPGA DWC3 USB controller
> +
> +maintainers:
> +  - Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - intel,agilex5-dwc3
> +      - const: intel,socfpga-dwc3
> +
> +  reg:
> +    description: Offset and length of DWC3 controller register
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Controller Master/Core clock
> +      - description: Controller Suspend clock
> +
> +  ranges: true
> +
> +  resets:
> +    description: A list of phandles for resets listed in reset-names
> +    maxItems: 2
> +
> +  reset-names:
> +    items:
> +      - const: dwc3
> +      - const: dwc3-ecc
> +
> +  '#address-cells':
> +    enum: [ 1, 2 ]
> +
> +  '#size-cells':
> +    enum: [ 1, 2 ]
> +
> +# Required child node:
> +
> +patternProperties:
> +  "^usb@[0-9a-f]+$":
> +    $ref: snps,dwc3.yaml#

One node, no wrapper node and dwc3 child node please unless you have 
actual registers for the wrapper. Based on the example having the same 
register addresses in both nodes, you don't need the wrapper.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/reset/altr,rst-mgr.h>
> +
> +    usb@11000000 {
> +          compatible = "intel,agilex5-dwc3", "intel,socfpga-dwc3";
> +          reg = <0x11000000 0x100000>;

You really have 1MB worth of registers? That chews up 1MB of 
kernel virtual space. Not a big deal for 64-bit, but it is a problem on 
32-bit systems. Define the length to just what you need.

> +          ranges;
> +          clocks = <&clkmgr 54>,
> +                   <&clkmgr 55>;
> +          resets = <&rst USB0_RESET>, <&rst USB1_RESET>;
> +          reset-names = "dwc3", "dwc3-ecc";
> +          #address-cells = <1>;
> +          #size-cells = <1>;

BTW, this implies that you can only DMA 32-bit bits. Not sure if the 
dwc3 supports more. 

> +
> +          usb@11000000 {
> +                compatible = "snps,dwc3";
> +                reg = <0x11000000 0x100000>;
> +                interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> +                dr_mode = "host";
> +          };
> +    };
> +
> -- 
> 2.26.2
> 

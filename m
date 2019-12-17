Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBD5A123574
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2019 20:14:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727241AbfLQTOf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Dec 2019 14:14:35 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:46583 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727070AbfLQTOe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Dec 2019 14:14:34 -0500
Received: by mail-io1-f67.google.com with SMTP id t26so11886489ioi.13
        for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2019 11:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gk4zGNe4RkiCC67QiUQNXztH/c+pmqVCrQR1ZNiu5/g=;
        b=cjy9caXMF5Od130mHudpDibjbCaHKnj0LTk2mAzK7ZlxMECAw8bGp78YldI59f2kg3
         I3O+ubladcHrSlM7MIk5GJAAWvbF0yYWKOaDCFeR1VqP2T2nTfTkil31EBzvw8duon+o
         sO4eRl9SNuroo4P86yIvujh9TXBqF+dE33JlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gk4zGNe4RkiCC67QiUQNXztH/c+pmqVCrQR1ZNiu5/g=;
        b=kRNS/6YVtlbF9xlaMYqtCluDvPqxwHQwyfTuP7ATbDwWShtWzpShQgEa5IispcSo+D
         dN7zlZnLY4b4kUJtu1ft7S1yRMqZnNb57lExzDCBzMu44N0wMidx90+l09Ter7JVKyf7
         3gqsNQwIJAgcbmtyQ7sJNL5tfmmo8sPv0cWEB8aIDx2podjYz9MIAfcQ722lG5kV0SbP
         B549Hy97NahuzaCiIv/FrhDnTSsDJ5dtOXlTrA+p+P841fm1X+w2ZoCL9bfLPZJEhX7r
         oiu1QdxUVxtwVYVFM9/d9BfNCVOAwQ3uim2FKuPHAPv6Hyb4CKwrTzzOrJ/D8dN3SCVm
         7YZg==
X-Gm-Message-State: APjAAAVsvd4eTUa9lX6SeabaJdbCugNHpzGvG72SRPg8XrxXT2x3r/Dg
        +rAZJwfKzDP4h/DYlC6jvRtYYs4HeCM=
X-Google-Smtp-Source: APXvYqw5X+x5YegRUchL2VgNcTBkpFTAiczpkRr7EPFS0bzFW+Lvg7UlioMY573xWg0JTmQkaWieaw==
X-Received: by 2002:a6b:fa0e:: with SMTP id p14mr4883104ioh.10.1576610073177;
        Tue, 17 Dec 2019 11:14:33 -0800 (PST)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com. [209.85.166.176])
        by smtp.gmail.com with ESMTPSA id o12sm5348443ioh.42.2019.12.17.11.14.31
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2019 11:14:32 -0800 (PST)
Received: by mail-il1-f176.google.com with SMTP id x5so6381928ila.6
        for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2019 11:14:31 -0800 (PST)
X-Received: by 2002:a92:ca90:: with SMTP id t16mr4233941ilo.218.1576610071185;
 Tue, 17 Dec 2019 11:14:31 -0800 (PST)
MIME-Version: 1.0
References: <1576474742-23409-1-git-send-email-sanm@codeaurora.org> <1576474742-23409-2-git-send-email-sanm@codeaurora.org>
In-Reply-To: <1576474742-23409-2-git-send-email-sanm@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 17 Dec 2019 11:14:17 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U48gdGHMbQ22M_59t6va2n41Zh1CDTqMJYpLCwiD35Mg@mail.gmail.com>
Message-ID: <CAD=FV=U48gdGHMbQ22M_59t6va2n41Zh1CDTqMJYpLCwiD35Mg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-usb@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Sun, Dec 15, 2019 at 9:40 PM Sandeep Maheswaram <sanm@codeaurora.org> wrote:
>
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> new file mode 100644
> index 0000000..c8eda58
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -0,0 +1,153 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SuperSpeed DWC3 USB SoC controller
> +
> +maintainers:
> +  - Manu Gautam <mgautam@codeaurora.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qcom,msm8996-dwc3
> +          - qcom,msm8998-dwc3
> +          - qcom,sdm845-dwc3
> +      - const: qcom,dwc3
> +
> +  reg:
> +    description: Offset and length of register set for QSCRATCH wrapper
> +    maxItems: 1
> +
> +  "#address-cells":
> +    enum: [ 1, 2 ]
> +
> +  "#size-cells":
> +    enum: [ 1, 2 ]
> +
> +  power-domains:
> +    description: specifies a phandle to PM domain provider node
> +    maxItems: 1
> +
> +  clocks:
> +    description:
> +      A list of phandle and clock-specifier pairs for the clocks
> +      listed in clock-names.
> +    minItems: 3

Actually, maybe the best way to express the min/max is to match what
'gpu/arm,mali-midgard.yaml' does.  Specifically later down in the
bindings you can amend this, like this I think:

allOf:
- if:
    properties:
      compatible:
        contains:
          const: "qcom,msm8996-dwc3"
  then:
    properties:
      clocks:
        minItems: 3
        maxItems: 3
      clock-names:
        minItems: 3
        maxItems: 3

...then remove minItems from here.  Now you'll have the default
min/max of 5 for most devices but for the special case of
"qcom,msm8996-dwc3" you'll have min/max of 3.


> +    items:
> +      - description: System Config NOC clock. Not present on "qcom,msm8996-dwc3" compatible.
> +      - description: Master/Core clock, have to be >= 125 MHz for SS operation and >= 60MHz for HS operation

To make the grammer gooder, s/have/has/


> +      - description: System bus AXI clock. Not present on "qcom,msm8996-dwc3" compatible.
> +      - description: Mock utmi clock needed for ITP/SOF generation in host mode.Its frequency should be 19.2MHz.
> +      - description: Sleep clock, used for wakeup when USB3 core goes into low power mode (U3).

* Please word wrap to ~80 chracters.
* As Stephen says, order matters.  Please match order of old bindings
(and in clock-names)
* Please end each with a period.


> +  clock-names:
> +    minItems: 3
> +    items:
> +      - const: cfg_noc
> +      - const: core
> +      - const: iface
> +      - const: mock_utmi
> +      - const: sleep
> +
> +  assigned-clocks:
> +    items:
> +      - description: Phandle to MOCK_UTMI_CLK.
> +      - description: Phandle to MASTER_CLK.
> +
> +  assigned-clock-rates:
> +    description:
> +      Should be 19.2MHz (19200000) for MOCK_UTMI_CLK
> +      >=125MHz (125000000) for MASTER_CLK in SS mode
> +      >=60MHz (60000000) for MASTER_CLK in HS mode
> +    maxItems: 2

You can still express some limits here even if we don't go all out
with the "oneOf".  AKA I think this is better:

assigned-clock-rates:
  items:
    - const: 19200000
    - minimum: 60000000
      description: >= 60 MHz in HS mode, >= 125 MHz in SS mode


> +  resets:
> +    maxItems: 1
> +
> +  interrupts:
> +    description:
> +      Specifies interrupts from controller wrapper used
> +      to wakeup from low power/suspend state. Must contain
> +      one or more entry for interrupt-names property.

Now that sub-items have a description this top level description
doesn't add anything.  Delete.


> +    items:
> +      - description: The interrupt that is asserted when a wakeup event is received on USB2 bus.
> +      - description: The interrupt that is asserted when a wakeup event is received on USB3 bus.

Word wrap please.


> +      - description: Wakeup event on DM line.
> +      - description: Wakeup event on DP line.
> +
> +  interrupt-names:
> +    $ref: /schemas/types.yaml#/definitions/string-array

As Rob said in response to your previous version: "Already has a type,
don't need."


> +    items:
> +      - const: hs_phy_irq
> +      - const: ss_phy_irq
> +      - const: dm_hs_phy_irq
> +      - const: dp_hs_phy_irq
> +
> +  qcom,select-utmi-as-pipe-clk:
> +    description:
> +      If present, disable USB3 pipe_clk requirement.
> +      Used when dwc3 operates without SSPHY and only
> +      HS/FS/LS modes are supported.
> +    type: boolean
> +
> +# Required child node:
> +
> +patternProperties:
> +  "^dwc3@[0-9a-f]+$":
> +    type: object
> +    description:
> +      A child node must exist to represent the core DWC3 IP block
> +      The content of the node is defined in dwc3.txt.
> +
> +# Phy documentation is provided in the following places:
> +# Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt   - USB3 QMP PHY
> +# Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt - USB2 QUSB2 PHY
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - power-domains
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +        usb3_0: usb30@a6f8800 {
> +            compatible = "qcom,dwc3";

Your example is missing the SoC-specific compatible string, so it
fails your own schema.


> +            reg = <0xa6f8800 0x400>;
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +            ranges;
> +            interrupts = <0 131 0>, <0 486 0>, <0 488 0>, <0 489 0>;

In general I believe "0" is frowned upon for IRQ flags.  Your example
should probably be this from sdm845:

interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
     <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH>,
     <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>;

...and you'll likely need a #include in the example.  See below.


> +            interrupt-names = "hs_phy_irq", "ss_phy_irq",
> +                    "dm_hs_phy_irq", "dp_hs_phy_irq";
> +
> +            clocks = <&gcc GCC_USB30_PRIM_MASTER_CLK>,

As Rob requested in the previous version, please run:

make dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/usb/qcom,dwc3.yaml

If the next version doesn't pass "dt_binding_check" I suspect that
people will stop reviewing your change, so please make sure you've
figured out how to do this.

When you do that, you'll see a syntax error here because
"GCC_USB30_PRIM_MASTER_CLK" isn't defined anywhere in your example.
You need to include it.  AKA this should be at the top of your
example:

#include <dt-bindings/clock/qcom,gcc-sdm845.h>

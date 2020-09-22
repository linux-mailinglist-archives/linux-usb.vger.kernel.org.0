Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F90E274457
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 16:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbgIVOdA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 10:33:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:33722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726494AbgIVOc7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 10:32:59 -0400
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 977EB239E5;
        Tue, 22 Sep 2020 14:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600785178;
        bh=iasRiDoscB8RQGc1B7ahh0O0NY83ofVDe3BIh/9UiXQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TlAZF21XZ3ML7hOT1h1dkRIeSSQMA8vFzlS561jACZ8ho9sBq9xj/wIBhb7P7TTVy
         3bCxMRL1XksrI5fLMACScGU+R9ECW1WaZbP4dwoaK1gHmmQG6Idhk9lgPv36u4qQ8Y
         GCE2OVsgOpVDpHqmz+y7XjpH3UFzn/Z5mIhJYBSg=
Received: by mail-ed1-f49.google.com with SMTP id c8so16390977edv.5;
        Tue, 22 Sep 2020 07:32:58 -0700 (PDT)
X-Gm-Message-State: AOAM5301QV9ij23vjWFy8o5F6unYf2WOiS5oJC/0GhidjqsWx9Qm1NHI
        TCc6XLin+1SoieThf2xASQjXwD3qFra934SmQ5Y=
X-Google-Smtp-Source: ABdhPJwL0FWetiMV2ZBTJY1nyf9ErWVwOBz9YMwZaUj1XXBB7jWGnDD/oueiTZMGL/DYVeWN+qydwkmcwsKXsVOSeXg=
X-Received: by 2002:a05:6402:515:: with SMTP id m21mr4266498edv.348.1600785177034;
 Tue, 22 Sep 2020 07:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <1600771612-30727-1-git-send-email-jun.li@nxp.com> <1600771612-30727-4-git-send-email-jun.li@nxp.com>
In-Reply-To: <1600771612-30727-4-git-send-email-jun.li@nxp.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Tue, 22 Sep 2020 16:32:44 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfocQZY-5Xmn5q=oetmS1doe0zXsQH=uXx0+CxGaESgUg@mail.gmail.com>
Message-ID: <CAJKOXPfocQZY-5Xmn5q=oetmS1doe0zXsQH=uXx0+CxGaESgUg@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] dt-bindings: usb: dwc3-imx8mp: add imx8mp dwc3
 glue bindings
To:     Li Jun <jun.li@nxp.com>
Cc:     robh+dt@kernel.org, shawnguo@kernel.org, balbi@kernel.org,
        mathias.nyman@intel.com, gregkh@linuxfoundation.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, Anson.Huang@nxp.com, aisheng.dong@nxp.com,
        peng.fan@nxp.com, fugang.duan@nxp.com, qiangqing.zhang@nxp.com,
        horia.geanta@nxp.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 22 Sep 2020 at 12:56, Li Jun <jun.li@nxp.com> wrote:
>
> NXP imx8mp integrates 2 dwc3 3.30b IP and add some wakeup logic
> to support low power mode, the glue layer is for this wakeup
> functionality, which has a separated interrupt, can support
> wakeup from U3 and connect events for host, and vbus wakeup for
> device.
>
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   | 99 ++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
> new file mode 100644
> index 0000000..a5d5566
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2020 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/fsl,imx8mp-dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP iMX8MP Soc USB Controller
> +
> +maintainers:
> +  - Li Jun <jun.li@nxp.com>
> +
> +properties:
> +  compatible:
> +    items:

Items are not necessary


> +    - const: fsl,imx8mp-dwc3
> +
> +  reg:
> +    maxItems: 1
> +    description: Address and length of the register set for the wrapper of
> +      dwc3 core on the SOC.
> +
> +  "#address-cells":
> +    enum: [ 1, 2 ]
> +
> +  "#size-cells":
> +    enum: [ 1, 2 ]
> +
> +  ranges: true
> +
> +  interrupts:
> +    maxItems: 1
> +    description: The interrupt that is asserted when a wakeup event is
> +      received.
> +
> +  clocks:
> +    description:
> +      A list of phandle and clock-specifier pairs for the clocks
> +      listed in clock-names.
> +    items:
> +      - description: system hsio root clock.
> +      - description: suspend clock, used for usb wakeup logic.
> +
> +  clock-names:
> +    items:
> +      - const: hsio
> +      - const: suspend
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
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +  - clocks
> +  - clock-names
> +  - interrupts
> +
> +additionalProperties: false

Do you actually validate your DTS changes with this schema? They do
not look like passing the validation...

Best regards,
Krzysztof

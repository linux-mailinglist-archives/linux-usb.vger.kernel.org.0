Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FFDD274811
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 20:23:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgIVSXO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 14:23:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:52648 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726526AbgIVSXO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 14:23:14 -0400
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C1A3423A34;
        Tue, 22 Sep 2020 18:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600798993;
        bh=GSCu9GXAhuGzC5gGgyow7P9n+KXGkvZXBndaUzUHCIg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=k5u5VLi7sUWY6THM9NZGWxzVsw7n/I0s1EIgazcDg4ui/JFokqQC0qMMP1zuY6zT0
         PmRElxzwQ020PHJufm8wnVUk7y1QXPjSFcwvFK0Xr7JIhHVOpysiDS4GTelA8zfd1d
         llILFr5C6o003iwZN/0RlelQarZTqmabUJ/wn9zo=
Received: by mail-ej1-f48.google.com with SMTP id p9so24255745ejf.6;
        Tue, 22 Sep 2020 11:23:12 -0700 (PDT)
X-Gm-Message-State: AOAM532bfAHJ1CbH2QZGhkUyXCoHJIP+S1mRpasxZxaihmIFjJXl5Q4K
        EJ7fVJ2syYIQ9H83IjGy+PxKBGdr/w6uKS3hEGU=
X-Google-Smtp-Source: ABdhPJw8FKzJLMabeTiCWUHmXAy3SDx3zLWVir4fUXAYWxXSsYJ8yKFs5m3+W3FP4o8OL30RKnzqA2m7BXp5wo9bxXo=
X-Received: by 2002:a17:906:4a51:: with SMTP id a17mr6293102ejv.381.1600798991296;
 Tue, 22 Sep 2020 11:23:11 -0700 (PDT)
MIME-Version: 1.0
References: <1600771612-30727-1-git-send-email-jun.li@nxp.com>
 <1600771612-30727-4-git-send-email-jun.li@nxp.com> <CAJKOXPfocQZY-5Xmn5q=oetmS1doe0zXsQH=uXx0+CxGaESgUg@mail.gmail.com>
 <VE1PR04MB6528C9AF51263B92EA687BEB893B0@VE1PR04MB6528.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB6528C9AF51263B92EA687BEB893B0@VE1PR04MB6528.eurprd04.prod.outlook.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Tue, 22 Sep 2020 20:22:58 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeEV+BJGn76dnS5uca+NfDqFT-T=eqSWipJ8HH4W6mfVw@mail.gmail.com>
Message-ID: <CAJKOXPeEV+BJGn76dnS5uca+NfDqFT-T=eqSWipJ8HH4W6mfVw@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] dt-bindings: usb: dwc3-imx8mp: add imx8mp dwc3
 glue bindings
To:     Jun Li <jun.li@nxp.com>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Andy Duan <fugang.duan@nxp.com>,
        Joakim Zhang <qiangqing.zhang@nxp.com>,
        Horia Geanta <horia.geanta@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 22 Sep 2020 at 18:45, Jun Li <jun.li@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Krzysztof Kozlowski <krzk@kernel.org>
> > Sent: Tuesday, September 22, 2020 10:33 PM
> > To: Jun Li <jun.li@nxp.com>
> > Cc: robh+dt@kernel.org; shawnguo@kernel.org; balbi@kernel.org;
> > mathias.nyman@intel.com; gregkh@linuxfoundation.org;
> > s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com;
> > dl-linux-imx <linux-imx@nxp.com>; Anson Huang <anson.huang@nxp.com>;
> > Aisheng Dong <aisheng.dong@nxp.com>; Peng Fan <peng.fan@nxp.com>; Andy Duan
> > <fugang.duan@nxp.com>; Joakim Zhang <qiangqing.zhang@nxp.com>; Horia
> > Geanta <horia.geanta@nxp.com>; linux-usb@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> > Subject: Re: [PATCH v3 3/6] dt-bindings: usb: dwc3-imx8mp: add imx8mp dwc3
> > glue bindings
> >
> > On Tue, 22 Sep 2020 at 12:56, Li Jun <jun.li@nxp.com> wrote:
> > >
> > > NXP imx8mp integrates 2 dwc3 3.30b IP and add some wakeup logic to
> > > support low power mode, the glue layer is for this wakeup
> > > functionality, which has a separated interrupt, can support wakeup
> > > from U3 and connect events for host, and vbus wakeup for device.
> > >
> > > Signed-off-by: Li Jun <jun.li@nxp.com>
> > > ---
> > >  .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   | 99
> > ++++++++++++++++++++++
> > >  1 file changed, 99 insertions(+)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
> > > b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
> > > new file mode 100644
> > > index 0000000..a5d5566
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
> > > @@ -0,0 +1,99 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) # Copyright
> > > +(c) 2020 NXP %YAML 1.2
> > > +---
> > > +$id:
> > >
> > +https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevi
> > >
> > +cetree.org%2Fschemas%2Fusb%2Ffsl%2Cimx8mp-dwc3.yaml%23&amp;data=02%7C
> > >
> > +01%7Cjun.li%40nxp.com%7Ceaedeb64ec15472183d108d85f046841%7C686ea1d3bc
> > >
> > +2b4c6fa92cd99c5c301635%7C0%7C0%7C637363819819667936&amp;sdata=IvFQ8l0
> > > +7VXUMbG8riyITSTZb1P50oIXs%2BkAV%2FeX8ntk%3D&amp;reserved=0
> > > +$schema:
> > >
> > +https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevi
> > >
> > +cetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=02%7C01%7Cjun.li%40
> > >
> > +nxp.com%7Ceaedeb64ec15472183d108d85f046841%7C686ea1d3bc2b4c6fa92cd99c
> > >
> > +5c301635%7C0%7C0%7C637363819819677934&amp;sdata=H3%2BcwgiLKBynHv4N%2F
> > > +dogBi3SwaizVHmqieJXVrErv0I%3D&amp;reserved=0
> > > +
> > > +title: NXP iMX8MP Soc USB Controller
> > > +
> > > +maintainers:
> > > +  - Li Jun <jun.li@nxp.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> >
> > Items are not necessary
> >
> >
> > > +    - const: fsl,imx8mp-dwc3
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +    description: Address and length of the register set for the wrapper
> > of
> > > +      dwc3 core on the SOC.
> > > +
> > > +  "#address-cells":
> > > +    enum: [ 1, 2 ]
> > > +
> > > +  "#size-cells":
> > > +    enum: [ 1, 2 ]
> > > +
> > > +  ranges: true
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +    description: The interrupt that is asserted when a wakeup event is
> > > +      received.
> > > +
> > > +  clocks:
> > > +    description:
> > > +      A list of phandle and clock-specifier pairs for the clocks
> > > +      listed in clock-names.
> > > +    items:
> > > +      - description: system hsio root clock.
> > > +      - description: suspend clock, used for usb wakeup logic.
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: hsio
> > > +      - const: suspend
> > > +
> > > +# Required child node:
> > > +
> > > +patternProperties:
> > > +  "^dwc3@[0-9a-f]+$":
> > > +    type: object
> > > +    description:
> > > +      A child node must exist to represent the core DWC3 IP block
> > > +      The content of the node is defined in dwc3.txt.
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - "#address-cells"
> > > +  - "#size-cells"
> > > +  - ranges
> > > +  - clocks
> > > +  - clock-names
> > > +  - interrupts
> > > +
> > > +additionalProperties: false
> >
> > Do you actually validate your DTS changes with this schema? They do not look
> > like passing the validation...
>
> I did run dt_binding_check, maybe I missed some errors as there are always some other
> failures, I will re-run to double check.

dt_binding_check is good for the binding and example. Except this you
need to run dtbs_check so your new DTS will be checked. In this case
it points to missing properties in the bindings.

Best regards,
Krzysztof

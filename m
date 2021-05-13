Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C628D37F443
	for <lists+linux-usb@lfdr.de>; Thu, 13 May 2021 10:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232040AbhEMIjs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 May 2021 04:39:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231939AbhEMIjr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 May 2021 04:39:47 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4554C06174A
        for <linux-usb@vger.kernel.org>; Thu, 13 May 2021 01:38:37 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id x5so26126114wrv.13
        for <linux-usb@vger.kernel.org>; Thu, 13 May 2021 01:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:content-transfer-encoding:date:message-id:to:cc
         :subject:from:references:in-reply-to;
        bh=YPyHABehcPKN0gbmBVN79yfxXtPiGFE8c/l3J3/fASM=;
        b=bhwgaS7JCh4fHnxhGgDKBZdEul7kPMnJeM2/4+hsqBeTHtgNMlqmsPzFNgy8dsQFDf
         kS4Sg9TYXtMFgR0sDg5sdbnztvNC0ofRJob/5iwOgtCB7Qs3msSA+ph99J3L7Cxs1Rg0
         69a4urNcs7o6kEUVy2GuW868t6iBQjgEmJ1iDdDjASFRQVyUR5oDtWXrpMT0E5z0T4Ct
         oJ7Drp+KxH6PoK7YxRENWlLzLR509dxFMwf/41hwzjo5vI88iVXGq2IOk64PXsHVuEVj
         l5bR3KJlXokJJWPOaYXjF31JE5TDGBkO1WS4EkzJYnvMzWVEu4dZmA3Bqtdwt9uM0T1P
         AmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:to:cc:subject:from:references:in-reply-to;
        bh=YPyHABehcPKN0gbmBVN79yfxXtPiGFE8c/l3J3/fASM=;
        b=BVYKtj3AMGxK8XXRL+JVjxVAX+c6km4oh08j10DMBSqMDXKaSQPhYhJ5wQV0Gl7Hwl
         aLjTTTIB+iozUc5hvqD+1YQQqRKEGjZDbwgx+5Bt4LE5s2/RB14qXLMyr7p3uGmqVEKx
         xUd+mtRNeK7Yl4t9y3o+a3B44Crl2IkF2bLQUa6PmKdM6XW3z84CG2akLoJj/U7bOE5s
         sZS4YrNIms9I9ZKPPVcqMnEyoXSFt6PaGdbcl2Ktp21QoWCOExcbQVxasgrlG8OP1OxG
         5nEUQCBVpn0O45b+9mWJdPi/CjRAJaKCkxNdEYajJqRhd/w1dxMBdOJoRHLZZ1cGXhRl
         l/Fg==
X-Gm-Message-State: AOAM531vu5vh0lBBMPYNOmTAxq9TrewA5RJE++kM/rD9B57tokXZcTJB
        +FsSfUtppsX5CbW2t1Y1Otlqqw==
X-Google-Smtp-Source: ABdhPJzDJYwmbvF06LrEStYKzwizktBy/fQeBfAcsB5As9gYXBp2Ycjf6GDCV+n/EjQalmb0Q8Bs0Q==
X-Received: by 2002:adf:d1e1:: with SMTP id g1mr51033253wrd.401.1620895116329;
        Thu, 13 May 2021 01:38:36 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id c15sm2138294wrr.3.2021.05.13.01.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 01:38:36 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 13 May 2021 09:38:35 +0100
Message-Id: <CBBZD46SA2KN.1FVB86QVGBRCU@arch-thunder>
To:     "Rob Herring" <robh@kernel.org>
Cc:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Sebastian Siewior" <bigeasy@linutronix.de>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 8/9] dt-bindings: usb: nxp,isp1760: add bindings
From:   "Rui Miguel Silva" <rui.silva@linaro.org>
References: <20210511085101.2081399-1-rui.silva@linaro.org>
 <20210511085101.2081399-9-rui.silva@linaro.org>
 <20210511192213.GA2451465@robh.at.kernel.org>
In-Reply-To: <20210511192213.GA2451465@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Rob,
Thanks for the review.

On Tue May 11, 2021 at 8:22 PM WEST, Rob Herring wrote:

> On Tue, May 11, 2021 at 09:51:00AM +0100, Rui Miguel Silva wrote:
> > The nxp,isp1760 driver is old in the tree, but did not had a bindings
> > entry, since I am extend it to support isp1763 in the same family, use
> > this to add a proper yaml bindings file.
> >=20
> > Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> > ---
> >  .../devicetree/bindings/usb/nxp,isp1760.yaml  | 59 +++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/nxp,isp1760.y=
aml
> >=20
> > diff --git a/Documentation/devicetree/bindings/usb/nxp,isp1760.yaml b/D=
ocumentation/devicetree/bindings/usb/nxp,isp1760.yaml
> > new file mode 100644
> > index 000000000000..0d76529e9662
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/nxp,isp1760.yaml
> > @@ -0,0 +1,59 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/nxp,isp1760.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP ISP1760 family controller bindings
> > +
> > +maintainers:
> > +  - Sebastian Siewior <bigeasy@linutronix.de>
> > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > +
> > +description: |
> > +  NXP ISP1760 family, which includes ISP1760/1761/1763 devicetree cont=
roller
> > +  bindings
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nxp,usb-isp1760
> > +      - nxp,usb-isp1761
> > +      - nxp,usb-isp1763
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
>
> In the 1761 datasheet, looks like there's a separate host and device=20
> irq.

Good catch, I miss that in the ISP1761 case.

>
> > +
> > +  bus-width:
> > +    description:
> > +      Number of data lines.
> > +    enum: [8, 16, 32]
> > +    default: 32
> > +
> > +  dr_mode:
> > +    enum:
> > +      - host
> > +      - peripheral
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +
> > +additionalProperties: true
>
> Like what? 'true' is only correct for common collections of properties.

You are right, will fix in v4, thanks.

------
Cheers,
     Rui
>
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    usb@40200000 {
> > +        compatible =3D "nxp,usb-isp1763";
> > +        reg =3D <0x40200000 0x100000>;
> > +        interrupts-parent =3D <&gic>;
> > +        interrupts =3D <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
> > +        bus-width =3D <16>;
> > +        dr_mode =3D "host";
> > +    };
> > +
> > +...
> > --=20
> > 2.31.1
> >=20




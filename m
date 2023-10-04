Return-Path: <linux-usb+bounces-1081-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6067B8593
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 18:44:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id C7EC31C208DA
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 16:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1485D1C2A8;
	Wed,  4 Oct 2023 16:44:31 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9931B1BDC8;
	Wed,  4 Oct 2023 16:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC080C433C8;
	Wed,  4 Oct 2023 16:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696437870;
	bh=bJUdCu4n8Q616ruuLdWGE4yAQa292y0ym8neR1k201A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J0goTKf7yenCuo1njZMrdo0wDTZQ5t1AC2tPHka97g2Tw8m49Gbju3yP3QFrztt7U
	 PN/0QG/WY1onVRnFunFTmiV9QhcIcASYT19N+va3cryvt4q6+Z/cxMIAidJ0kNOF6w
	 Wb6oOuXTJuD/I8RpVkWvMcI6ZlSMYBsAhNIz3SnnCzNfffbYTB2YrbsY0PUk90MCpe
	 2XKJDz2xfxe/JJuLwx14ZYyXc7RqfTlkL3KlVH/Bsg2k18iK1dSy93uImyHWmQyRvG
	 g5ANS9iQg3CvKRycbtbSuhZny1k3bnQKtZBxX2WwR2Ycjzan5KB/Tk8fCQBuv1mTh4
	 cNatltJeDS8HA==
Date: Thu, 5 Oct 2023 00:32:23 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, linux-riscv@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: Add T-HEAD TH1520 USB controller
Message-ID: <ZR2Tl1rkRdIG+fQa@xhacker>
References: <20230927164222.3505-1-jszhang@kernel.org>
 <20230927164222.3505-2-jszhang@kernel.org>
 <cf68f6f1-e405-4c20-b4e1-da04189d0e2f@sifive.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cf68f6f1-e405-4c20-b4e1-da04189d0e2f@sifive.com>

On Wed, Sep 27, 2023 at 03:00:59PM -0500, Samuel Holland wrote:
> On 2023-09-27 11:42 AM, Jisheng Zhang wrote:
> > T-HEAD TH1520 platform's USB has a wrapper module around
> > the DesignWare USB3 DRD controller. Add binding information doc for
> > it.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  .../bindings/usb/thead,th1520-usb.yaml        | 73 +++++++++++++++++++
> >  1 file changed, 73 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/thead,th1520-usb.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/thead,th1520-usb.yaml b/Documentation/devicetree/bindings/usb/thead,th1520-usb.yaml
> > new file mode 100644
> > index 000000000000..afb618eb5013
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/thead,th1520-usb.yaml
> > @@ -0,0 +1,73 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: T-HEAD TH1520 DWC3 USB Controller Glue
> > +
> > +maintainers:
> > +  - Jisheng Zhang <jszhang@kernel.org>
> > +
> > +properties:
> > +  compatible:
> > +    const: thead,th1520-usb
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 4
> > +
> > +  clock-names:
> > +    items:
> > +      - const: ref
> > +      - const: bus_early
> > +      - const: phy
> > +      - const: suspend
> 
> Except for "phy", these clocks are already documented in snps,dwc3.yaml. Are
> they necessary for the glue/PHY, or do they belong only in the controller node?

Hi Samuel,

Enabling ref, bus_early clks are necessary for the glue layer, because
we program the glue registers before calling of_platform_populate()

> They are not used by the driver in patch 2. Also, the PHY clock probably belongs
> with the PHY node.

Except enabling the phy clk, we don't need to touch the phy, so I'm not
sure how to handle this if we have a dedicated phy driver thus a phy node.
or use the usb-nop-xceiv?

Thanks
> 
> > +
> > +  ranges: true
> > +
> > +  '#address-cells':
> > +    enum: [ 1, 2 ]
> > +
> > +  '#size-cells':
> > +    enum: [ 1, 2 ]
> > +
> > +# Required child node:
> > +
> > +patternProperties:
> > +  "^usb@[0-9a-f]+$":
> > +    $ref: snps,dwc3.yaml#
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - ranges
> > +
> > +additionalProperties: false
> 
> The driver in patch 2 uses the thead,misc-sysreg and vbus-supply properties,
> neither of which is documented here. Also, depending on the other bindings, the
> VBUS supply should be referenced from the USB PHY or connector node, not here.
> 
> Regards,
> Samuel
> 
> > +examples:
> > +  - |
> > +
> > +    usb {
> > +          compatible = "thead,th1520-usb";
> > +          reg = <0xec03f000 0x1000>;
> > +          clocks = <&clk 1>,
> > +                   <&clk 2>,
> > +                   <&clk 3>,
> > +                   <&clk 4>;
> > +          clock-names = "ref", "bus_early", "phy", "suspend";
> > +          ranges;
> > +          #address-cells = <1>;
> > +          #size-cells = <1>;
> > +
> > +          usb@e7040000 {
> > +                compatible = "snps,dwc3";
> > +                reg = <0xe7040000 0x10000>;
> > +                interrupts = <68>;
> > +                dr_mode = "host";
> > +          };
> > +    };
> 


Return-Path: <linux-usb+bounces-26039-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5FBB0C3BF
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 13:58:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22FCC3BE91C
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 11:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54A12C159A;
	Mon, 21 Jul 2025 11:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="p36aVARw"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F32B1F2B88
	for <linux-usb@vger.kernel.org>; Mon, 21 Jul 2025 11:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753099097; cv=none; b=iYafAIB7wWJm1asnQoDMNJ2jTDBVwnf5XR9R0FHjCJOzCP0gFS1FTvqd5Hk5GK2SU2tHNKyD6ii3nxoHcvXny11h1/mdH/tPai5pjlTuTva04UlqIPmbMHbZ1clD/0h4jsYlRG3Redbe0ixGsbDaK2yO2ov5ltywOTcCGcZLLtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753099097; c=relaxed/simple;
	bh=FWnSi8E8XYIWk4QCaR4TwKiOWABo39dyPNERnvREGtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQ4iBMDucSxJ5RF9C/iytDOydfz3J/93fePJQY/22MpvpscHuTiYAdk+u+cZD9IrAQB9YKassiky0dyQmXe4btuciWuJOGyTnrnZVqFQEdaitVoKF94ZNMFmK6BHFqV2KIJGWobrXOTXUa1QgDUv09mAhh6PBrzgrtYB74I9rfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=p36aVARw; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Mon, 21 Jul 2025 19:57:56 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753099082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bfrHdHadKeOGrxubHlclT+KsEtO7bFXUMTU/oDEY5dQ=;
	b=p36aVARw7D43XfPT4ZZedi3YcLfN/KR5oUPoLSSqFTzIk6/rRnSzX8rESovL+8J02HVpqK
	U992BQVKcaz3RmNJ5lrzf3drMvWTqoYIvY1gWUbhXWMl26WB00iJSqa3Ka9D1Z70ZXJrx7
	02rJ8Oad5yjpUM8tTyLq8oiqLFz/Pgw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ze Huang <huang.ze@linux.dev>
To: Philipp Zabel <p.zabel@pengutronix.de>, Ze Huang <huang.ze@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: usb: dwc3: add support for SpacemiT
 K1
Message-ID: <aH4rRKPHzB0kd7Ek@monica.localdomain>
References: <20250712-dwc3_generic-v6-0-cc87737cc936@linux.dev>
 <20250712-dwc3_generic-v6-1-cc87737cc936@linux.dev>
 <468961ac17fb5dd4365943a24206040575b0e982.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <468961ac17fb5dd4365943a24206040575b0e982.camel@pengutronix.de>
X-Migadu-Flow: FLOW_OUT

On Mon, Jul 21, 2025 at 01:02:54PM +0200, Philipp Zabel wrote:
> On Sa, 2025-07-12 at 15:49 +0800, Ze Huang wrote:
> > Add support for the USB 3.0 Dual-Role Device (DRD) controller embedded
> > in the SpacemiT K1 SoC. The controller is based on the Synopsys
> > DesignWare Core USB 3 (DWC3) IP, supporting USB3.0 host mode and USB 2.0
> > DRD mode.
> > 
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Ze Huang <huang.ze@linux.dev>
> > ---
> >  .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  | 107 +++++++++++++++++++++
> >  1 file changed, 107 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..c967ad6aae50199127a4f8a17d53fc34e8d9480b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> > @@ -0,0 +1,107 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/spacemit,k1-dwc3.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SpacemiT K1 SuperSpeed DWC3 USB SoC Controller
> > +
> > +maintainers:
> > +  - Ze Huang <huang.ze@linux.dev>
> > +
> > +description: |
> > +  The SpacemiT K1 embeds a DWC3 USB IP Core which supports Host functions
> > +  for USB 3.0 and DRD for USB 2.0.
> > +
> > +  Key features:
> > +  - USB3.0 SuperSpeed and USB2.0 High/Full/Low-Speed support
> > +  - Supports low-power modes (USB2.0 suspend, USB3.0 U1/U2/U3)
> > +  - Internal DMA controller and flexible endpoint FIFO sizing
> > +
> > +  Communication Interface:
> > +  - Use of PIPE3 (125MHz) interface for USB3.0 PHY
> > +  - Use of UTMI+ (30/60MHz) interface for USB2.0 PHY
> > +
> > +allOf:
> > +  - $ref: snps,dwc3-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: spacemit,k1-dwc3
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    const: usbdrd30
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  phys:
> > +    items:
> > +      - description: phandle to USB2/HS PHY
> > +      - description: phandle to USB3/SS PHY
> > +
> > +  phy-names:
> > +    items:
> > +      - const: usb2-phy
> > +      - const: usb3-phy
> > +
> > +  resets:
> > +    items:
> > +      - description: USB3.0 AHB reset line
> > +      - description: USB3.0 VCC reset line
> > +      - description: USB3.0 PHY reset line
> 
> Are we sure all resets will only ever need to be triggered together?
>
> Otherwise it might be safer to add a reset-names property.
>

Yeah, that's helpful. Will add reset-names property in next version.

> 
> regards
> Philipp


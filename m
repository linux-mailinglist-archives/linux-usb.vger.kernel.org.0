Return-Path: <linux-usb+bounces-31348-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DC9CB14E6
	for <lists+linux-usb@lfdr.de>; Tue, 09 Dec 2025 23:38:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1100F310A250
	for <lists+linux-usb@lfdr.de>; Tue,  9 Dec 2025 22:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DF462ED168;
	Tue,  9 Dec 2025 22:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ieeCri33"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B482EC54A;
	Tue,  9 Dec 2025 22:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765319874; cv=none; b=aUHlHbNzWZQLC/5mjP+KwVzmeUHuUfpA8EHlbAwK5n7BypU2LlkqfKvvQox6s1B1JGEaqrr17oc6rbjl8T7C7Y/1v5vmVhPfLRixyMM+3XIA5ywagN8JTbjyDs/U1h5E+ffxDQfvEwGNT8k940sbO0iLBP4Ru09tujkl8xHJXyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765319874; c=relaxed/simple;
	bh=z0X+SLq8oqqF9Ecnf7WAKlKrV/c9O21OXRq5oNj0Zyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B4vfs4gt6eeFwtRsFcVBDPpjSpbzT/X63yQHjpUgpqO9IJAes3uwomWPETEjN1utv50ynhubLlzR/gwO+X8v96/CvWFmxK578cvE6Mwh8IpuQeWrBk54KfXV6vFoXe40oyGY/auCPIKrrBki9x+/J9tQSsdvP6adhY/DGlhKqfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ieeCri33; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC54C4CEF5;
	Tue,  9 Dec 2025 22:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765319873;
	bh=z0X+SLq8oqqF9Ecnf7WAKlKrV/c9O21OXRq5oNj0Zyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ieeCri336JbO2W4n5JduqzwXptUt41FIMtHwK9LrnKzJzCWYOLhnotnNgGTr/Y7I4
	 GV6tS9w7+a3K4Z41mg289mVpG9xe49JMl7avctGw9/n5BTxN7sFr+T0yocyBcHLuHH
	 0twqgqQPVrbmkGTP+rBmflQC89AGeI8/FKH2eDqJj8ejt/vJhxBTOVpAAnX5+eAm1I
	 1a/5ejXF1LavA+u5DTHE4MwTDgjUGQQeZkMx0FLqIPz7AD4MTdOdxwF1lFJxD+zCvg
	 fvCcAJDQIGfq+WOxAvUF8/BmYnnN1B+7CCK0dMDqo+Zj+qnKZRM/NfFgMNhMZHVAEl
	 B0ms7B5x/An7A==
Date: Tue, 9 Dec 2025 16:37:51 -0600
From: Rob Herring <robh@kernel.org>
To: adrianhoyin.ng@altera.com
Cc: gregkh@linuxfoundation.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dinguyen@kernel.org, Thinh.Nguyen@synopsys.com,
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: dwc3: Add support for Altera
 Agilex5 DWC3
Message-ID: <20251209223751.GB1242261-robh@kernel.org>
References: <cover.1765249127.git.adrianhoyin.ng@altera.com>
 <4c8d2a1fa93e38afe64ce71bf2709e76352eb630.1765249127.git.adrianhoyin.ng@altera.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c8d2a1fa93e38afe64ce71bf2709e76352eb630.1765249127.git.adrianhoyin.ng@altera.com>

On Tue, Dec 09, 2025 at 02:25:08PM +0800, adrianhoyin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> 
> Add device tree binding for the Synopsys DesignWare USB3 (DWC3) controller
> on Altera Agilex5 SoC. The binding describes SoC-specific integration
> including clock and reset control for the USB subsystem.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> ---
>  .../bindings/usb/altr,agilex5-dwc3.yaml       | 96 +++++++++++++++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml b/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml
> new file mode 100644
> index 000000000000..d40719e0e49d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/altr,agilex5-dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Altera Agilex5 DWC3 USB SoC Controller Wrapper
> +
> +maintainers:
> +  - Adrian Ng <adrianhoyin.ng@altera.com>
> +
> +description:
> +  The Altera Agilex5 SoCFPGA integrates a Synopsys DesignWare USB3 (DWC3)
> +  controller that supports host, device and DRD modes. This binding describes
> +  SoC integration including clocks, resets, PHY connections, and optional
> +  IOMMU support.
> +
> +allOf:
> +  - $ref: snps,dwc3-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: altr,agilex5-dwc3
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Controller suspend clock
> +      - description: Master/Core bus clock
> +
> +  clock-names:
> +    items:
> +      - const: suspend_clk
> +      - const: bus_clk

Don't invent new names. The common names are 'suspend' and 'bus_early'.

Sure there is no 'ref' clock too?

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  phys:
> +    items:
> +      - description: USB2 PHY
> +      - description: USB3 PHY
> +
> +  phy-names:
> +    items:
> +      - const: usb2-phy
> +      - const: usb3-phy
> +
> +  iommus:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: DWC3 core reset
> +      - description: DWC3 ECC reset
> +
> +  reset-names:
> +    items:
> +      - const: dwc3
> +      - const: dwc3-ecc
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - phys
> +  - phy-names
> +  - resets
> +  - reset-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/reset/altr,rst-mgr-s10.h>
> +    #include <dt-bindings/clock/intel,agilex5-clkmgr.h>
> +
> +    usb31: usb@11000000 {

Drop unused labels.

> +        compatible = "altr,agilex5-dwc3";
> +        reg = <0x11000000 0x100000>;
> +        interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clkmgr AGILEX5_USB31_SUSPEND_CLK>,
> +                 <&clkmgr AGILEX5_USB31_BUS_CLK_EARLY>;
> +        clock-names = "suspend_clk", "bus_clk";
> +        phys = <&usbphy0>, <&usbphy1>;
> +        phy-names = "usb2-phy", "usb3-phy";
> +        resets = <&rst USB1_RESET>, <&rst USB1_OCP_RESET>;
> +        reset-names = "dwc3", "dwc3-ecc";
> +        iommus = <&smmu 7>;
> +        dr_mode = "host";
> +    };
> -- 
> 2.49.GIT
> 


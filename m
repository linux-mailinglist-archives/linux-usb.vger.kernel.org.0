Return-Path: <linux-usb+bounces-25506-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CFCAFA035
	for <lists+linux-usb@lfdr.de>; Sat,  5 Jul 2025 15:10:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E27F1896CA4
	for <lists+linux-usb@lfdr.de>; Sat,  5 Jul 2025 13:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01A1256C71;
	Sat,  5 Jul 2025 13:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gE760dQL"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F532E3706
	for <linux-usb@vger.kernel.org>; Sat,  5 Jul 2025 13:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751721023; cv=none; b=m6LIrZO6Pm3Tryd7PyGdEGxAzTYSgMyEPSt0no/9Ku66kznMGx5eqJZee14cbV62/KUh+TvXJoAZL0tAzHpgHHzNlKCwqLm2aKH4FBaPZ18p7uMw7SXfhTCw+A99OXGCFACFUlBR7WpEIHHJusVZRD2IJsuBnz93UvKbAf2H3J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751721023; c=relaxed/simple;
	bh=3CMNxNiW3+FIc/BUcKb5WWD/6E4scgZ1RkowNRMoOTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bPRWDfen4cqEa+Bm6Ab/htcr1/LG1iCCrLqt5R2DXMmRg+j5XyvFgKQFP5xfuQMOdhNfPsjzRRRdpTMyx/hEiig/HK8EZoB0X3X0fQgH5/CFloGrwgn+CbY7M3q8qJtickXzFvrMdfxCe8o2e30WfFfQRYtA9jgKiU1UW7k5L/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gE760dQL; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Sat, 5 Jul 2025 21:10:13 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751721018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4OGIJ7s7TRMTl0Xs4Ki+8/cZ1uyPe+zE5+yenLTGv2o=;
	b=gE760dQLmmt4M1FpGuvtCjTMneBR22mOZWVOcIZ5eNf90hp4uPPBE6WmbuaR04iddZF/Ob
	zd2bVNvkTghi3Ig+J/HMvdSiOP22aiX3dXE0voGSFTnxS/TelUvQ9PSKiPL8kzT+Mq/SFW
	EJ8ClOjPIGy6WwA7d3x1nw9yd/fB+VM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ze Huang <huang.ze@linux.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Ze Huang <huang.ze@linux.dev>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: dwc3: add support for SpacemiT
 K1
Message-ID: <aGkkKEMyY1JG7Z80@monica.localdomain>
References: <20250705-dwc3_generic-v5-0-9dbc53ea53d2@linux.dev>
 <20250705-dwc3_generic-v5-1-9dbc53ea53d2@linux.dev>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705-dwc3_generic-v5-1-9dbc53ea53d2@linux.dev>
X-Migadu-Flow: FLOW_OUT

On Sat, Jul 05, 2025 at 09:01:25PM +0800, Ze Huang wrote:
> Add support for the USB 3.0 Dual-Role Device (DRD) controller embedded
> in the SpacemiT K1 SoC. The controller is based on the Synopsys
> DesignWare Core USB 3 (DWC3) IP, supporting USB3.0 host mode and USB 2.0
> DRD mode.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Ze Huang <huang.ze@linux.dev>
> ---

Hi Krzysztof,

I kept your Reviewed-by tag, as this version only includes minor updates:
- Dropped the `interconnects` property
- Updated the `resets` property to match the latest convention from Alex's patch

Let me know if you have any concerns.

>  .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  | 107 +++++++++++++++++++++
>  1 file changed, 107 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..c967ad6aae50199127a4f8a17d53fc34e8d9480b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/spacemit,k1-dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SpacemiT K1 SuperSpeed DWC3 USB SoC Controller
> +
> +maintainers:
> +  - Ze Huang <huang.ze@linux.dev>
> +
> +description: |
> +  The SpacemiT K1 embeds a DWC3 USB IP Core which supports Host functions
> +  for USB 3.0 and DRD for USB 2.0.
> +
> +  Key features:
> +  - USB3.0 SuperSpeed and USB2.0 High/Full/Low-Speed support
> +  - Supports low-power modes (USB2.0 suspend, USB3.0 U1/U2/U3)
> +  - Internal DMA controller and flexible endpoint FIFO sizing
> +
> +  Communication Interface:
> +  - Use of PIPE3 (125MHz) interface for USB3.0 PHY
> +  - Use of UTMI+ (30/60MHz) interface for USB2.0 PHY
> +
> +allOf:
> +  - $ref: snps,dwc3-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: spacemit,k1-dwc3
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: usbdrd30
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  phys:
> +    items:
> +      - description: phandle to USB2/HS PHY
> +      - description: phandle to USB3/SS PHY
> +
> +  phy-names:
> +    items:
> +      - const: usb2-phy
> +      - const: usb3-phy
> +
> +  resets:
> +    items:
> +      - description: USB3.0 AHB reset line
> +      - description: USB3.0 VCC reset line
> +      - description: USB3.0 PHY reset line
> +
> +  vbus-supply:
> +    description: A phandle to the regulator supplying the VBUS voltage.
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
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    usb@c0a00000 {
> +        compatible = "spacemit,k1-dwc3";
> +        reg = <0xc0a00000 0x10000>;
> +        clocks = <&syscon_apmu 16>;
> +        clock-names = "usbdrd30";
> +        interrupts = <125>;
> +        phys = <&usb2phy>, <&usb3phy>;
> +        phy-names = "usb2-phy", "usb3-phy";
> +        resets = <&syscon_apmu 8>,
> +                 <&syscon_apmu 9>,
> +                 <&syscon_apmu 10>;
> +        vbus-supply = <&usb3_vbus>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        hub_2_0: hub@1 {
> +            compatible = "usb2109,2817";
> +            reg = <1>;
> +            vdd-supply = <&usb3_vhub>;
> +            peer-hub = <&hub_3_0>;
> +            reset-gpios = <&gpio 3 28 1>;
> +        };
> +
> +        hub_3_0: hub@2 {
> +            compatible = "usb2109,817";
> +            reg = <2>;
> +            vdd-supply = <&usb3_vhub>;
> +            peer-hub = <&hub_2_0>;
> +            reset-gpios = <&gpio 3 28 1>;
> +        };
> +    };
> 
> -- 
> 2.50.0
> 


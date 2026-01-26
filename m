Return-Path: <linux-usb+bounces-32741-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GL4aGa2Sd2m9hgEAu9opvQ
	(envelope-from <linux-usb+bounces-32741-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 17:13:33 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C66098A8D8
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 17:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1ABE309E8D3
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 16:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE472DB7A0;
	Mon, 26 Jan 2026 16:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oL4H+9br"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977482D838B;
	Mon, 26 Jan 2026 16:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769443716; cv=none; b=GJ3USzDpfQPGNGcl0eMBhLElNyq1RLOhEeEpKZPuo1H5abUoV1IV584kQkSCllUCOKyBDzOMShD0tji77DUTjFJhLW8SMcNq2cuML2EdkaU5iBETfo8jL0dFHKAK49+z8BwFnv2ek4Ys0HHdR+bnYM7KIc94/FvUhhCrcDKFz18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769443716; c=relaxed/simple;
	bh=c6axItoMiQ9cC+E02cbzZ5QD/iyCedHOOGBlyz8k0Gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AoxVgPWQ5V2M0rrk61iLItYtxypruLvHhwUS2eU7wVGd4KcQfcUgWuW2fh0eBqQcoiPlIDnYoDRiFkMSQ9mikpqm2uY3K4lb7ShPUV5U4q3M0SGuWhtitr+3A4vq8jYEz/FWJYJ1SAvRBdNHL3r2XICwLurg7yICwOjfV+t9WU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oL4H+9br; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB31C116C6;
	Mon, 26 Jan 2026 16:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769443716;
	bh=c6axItoMiQ9cC+E02cbzZ5QD/iyCedHOOGBlyz8k0Gw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oL4H+9brBvQQciFVd/g76ODijbRcg6C7UIbukEMxHNRZXBhS3F1gdCSD0kpRJsyCu
	 DRATsDd4nNnDhNEnfES2TPI9hJHVu8FoQYe+Cw1pHbMQP0F2c2/6m7NSOGEPs+VL15
	 8ohW5o7O1ulmcT9xgfSJyk9CLHZ2TO11aJcMhMYsrPIcz3M1/09l7CwhHV7E0k8HPK
	 FuCa94eIpda4fHIKOSuTofDP5Br2NOCBLjnxn9h4iLkc9rA4+k/rWPkV8eF+DVpBXl
	 M2UbUfm96k4TmrtXhJKI32ppbWcsxnJlca9F2xtCO1ve057VrSacPgzKjft5NVUtFY
	 Kahxrx4Et16Jw==
Date: Mon, 26 Jan 2026 10:08:35 -0600
From: Rob Herring <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@ti.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: usb: ti,dwc3: convert to DT schema
Message-ID: <20260126160835.GA2502193-robh@kernel.org>
References: <20260126-ti-usb-v1-0-2855c129eb6d@gmail.com>
 <20260126-ti-usb-v1-2-2855c129eb6d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-ti-usb-v1-2-2855c129eb6d@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32741-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.39.16:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ti.com:email,devicetree.org:url,4a0ab000:email,0.0.0.0:email]
X-Rspamd-Queue-Id: C66098A8D8
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 01:22:05PM +0000, Charan Pedumuru wrote:
> Convert OMAP DWC3 USB Glue Layer binding to DT schema.
> Changes during conversion:
> - Introduce a new compatible string pattern "omap_dwc3" to match nodes
>   already present in existing device tree sources.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/omap-usb.txt |  80 ---------------
>  Documentation/devicetree/bindings/usb/ti,dwc3.yaml | 112 +++++++++++++++++++++
>  2 files changed, 112 insertions(+), 80 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/omap-usb.txt b/Documentation/devicetree/bindings/usb/omap-usb.txt
> deleted file mode 100644
> index f0dbc5ae45ae..000000000000
> --- a/Documentation/devicetree/bindings/usb/omap-usb.txt
> +++ /dev/null
> @@ -1,80 +0,0 @@
> -OMAP GLUE AND OTHER OMAP SPECIFIC COMPONENTS
> -
> -OMAP MUSB GLUE
> - - compatible : Should be "ti,omap4-musb" or "ti,omap3-musb"
> - - ti,hwmods : must be "usb_otg_hs"
> - - multipoint : Should be "1" indicating the musb controller supports
> -   multipoint. This is a MUSB configuration-specific setting.
> - - num-eps : Specifies the number of endpoints. This is also a
> -   MUSB configuration-specific setting. Should be set to "16"
> - - ram-bits : Specifies the ram address size. Should be set to "12"
> - - interface-type : This is a board specific setting to describe the type of
> -   interface between the controller and the phy. It should be "0" or "1"
> -   specifying ULPI and UTMI respectively.
> - - mode : Should be "3" to represent OTG. "1" signifies HOST and "2"
> -   represents PERIPHERAL.
> - - power : Should be "50". This signifies the controller can supply up to
> -   100mA when operating in host mode.
> - - usb-phy : the phandle for the PHY device
> - - phys : the phandle for the PHY device (used by generic PHY framework)
> - - phy-names : the names of the PHY corresponding to the PHYs present in the
> -   *phy* phandle.
> -
> -Optional properties:
> - - ctrl-module : phandle of the control module this glue uses to write to
> -   mailbox
> -
> -SOC specific device node entry
> -usb_otg_hs: usb_otg_hs@4a0ab000 {
> -	compatible = "ti,omap4-musb";
> -	ti,hwmods = "usb_otg_hs";
> -	multipoint = <1>;
> -	num-eps = <16>;
> -	ram-bits = <12>;
> -	ctrl-module = <&omap_control_usb>;
> -	phys = <&usb2_phy>;
> -	phy-names = "usb2-phy";
> -};
> -
> -Board specific device node entry
> -&usb_otg_hs {
> -	interface-type = <1>;
> -	mode = <3>;
> -	power = <50>;
> -};
> -
> -OMAP DWC3 GLUE
> - - compatible : Should be
> -	* "ti,dwc3" for OMAP5 and DRA7
> -	* "ti,am437x-dwc3" for AM437x
> - - ti,hwmods : Should be "usb_otg_ss"
> - - reg : Address and length of the register set for the device.
> - - interrupts : The irq number of this device that is used to interrupt the
> -   MPU
> - - #address-cells, #size-cells : Must be present if the device has sub-nodes
> - - utmi-mode : controls the source of UTMI/PIPE status for VBUS and OTG ID.
> -   It should be set to "1" for HW mode and "2" for SW mode.
> - - ranges: the child address space are mapped 1:1 onto the parent address space
> -
> -Optional Properties:
> - - extcon : phandle for the extcon device omap dwc3 uses to detect
> -   connect/disconnect events.
> - - vbus-supply : phandle to the regulator device tree node if needed.
> -
> -Sub-nodes:
> -The dwc3 core should be added as subnode to omap dwc3 glue.
> -- dwc3 :
> -   The binding details of dwc3 can be found in:
> -   Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> -
> -omap_dwc3 {
> -	compatible = "ti,dwc3";
> -	ti,hwmods = "usb_otg_ss";
> -	reg = <0x4a020000 0x1ff>;
> -	interrupts = <0 93 4>;
> -	#address-cells = <1>;
> -	#size-cells = <1>;
> -	utmi-mode = <2>;
> -	ranges;
> -};
> -
> diff --git a/Documentation/devicetree/bindings/usb/ti,dwc3.yaml b/Documentation/devicetree/bindings/usb/ti,dwc3.yaml
> new file mode 100644
> index 000000000000..859da4b1f207
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ti,dwc3.yaml
> @@ -0,0 +1,112 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/ti,dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments OMAP DWC3 USB Glue Layer
> +
> +maintainers:
> +  - Felipe Balbi <balbi@ti.com>
> +
> +description:
> +  Texas Instruments glue layer for Synopsys DesignWare USB3 (DWC3)
> +  controller on OMAP and AM43xx SoCs. Manages SoC-specific integration
> +  including register mapping, interrupt routing, UTMI/PIPE interface mode
> +  selection (HW/SW), and child DWC3 core instantiation via address space
> +  translation. Supports both legacy single-instance and multi-instance
> +  (numbered) configurations.
> +
> +properties:
> +  $nodename:
> +    pattern: "^omap_dwc3(_[0-9]+)?@.*$"

Drop.

> +
> +  compatible:
> +    enum:
> +      - ti,dwc3
> +      - ti,am437x-dwc3
> +
> +  ti,hwmods:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      TI PRCM hardware module name that must be enabled (powered and
> +      clocked) for this node. "usb_otg_ss" refers to the SuperSpeed
> +      (USB3 + USB2 OTG) controller wrapper/glue layer found in OMAP5,
> +      DRA7, AM57x, and similar TI SoCs using DWC3.
> +    const: usb_otg_ss

Drop. Not used anywhere.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  utmi-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Controls the source of UTMI/PIPE status for VBUS and OTG ID.
> +      1 for HW mode, 2 for SW mode.
> +    enum: [1, 2]
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
> +  extcon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle for the extcon device used to detect connect/
> +      disconnect events.
> +
> +  vbus-supply:
> +    description: Phandle to the regulator device tree node if needed.
> +
> +patternProperties:
> +  "^usb@[0-9a-f]+$":
> +    type: object
> +    $ref: snps,dwc3.yaml#
> +    unevaluatedProperties: false
> +
> +required:
> +  - reg
> +  - compatible
> +  - interrupts
> +  - "#address-cells"
> +  - "#size-cells"
> +  - utmi-mode
> +  - ranges
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    omap_dwc3_1@0 {
> +        compatible = "ti,dwc3";
> +        reg = <0x0 0x10000>;
> +        interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        utmi-mode = <2>;
> +        ranges = <0 0 0x20000>;
> +
> +        usb@10000 {
> +            compatible = "snps,dwc3";
> +            reg = <0x10000 0x17000>;
> +            interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names = "peripheral", "host", "otg";
> +            phys = <&usb2_phy1>, <&usb3_phy1>;
> +            phy-names = "usb2-phy", "usb3-phy";
> +            maximum-speed = "super-speed";
> +            dr_mode = "otg";
> +            snps,dis_u3_susphy_quirk;
> +            snps,dis_u2_susphy_quirk;
> +        };
> +    };
> +...
> 
> -- 
> 2.52.0
> 


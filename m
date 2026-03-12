Return-Path: <linux-usb+bounces-34690-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLf1EVncsmlMQQAAu9opvQ
	(envelope-from <linux-usb+bounces-34690-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 16:31:37 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E721327482A
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 16:31:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68B92328EE50
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 15:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EBED3C5DD8;
	Thu, 12 Mar 2026 15:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rtbr6A+m"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0752233263F;
	Thu, 12 Mar 2026 15:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773329079; cv=none; b=fOMBXenVzz9Z+32yd2RdRVxXlDIAgY2JWW4dWtjBfZ1duxZq0SFtjyiyaBgKnIZHjR1yeYOeuvW5h/Ptq4eAGE/EvRYC/4Hb0XEew6yug2dJ+rh0PjeRAEMvw9wpCZe2CFLRTQGH9tz7YzpGfNIkCC5njcWhWHDBh5g9WKf7LDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773329079; c=relaxed/simple;
	bh=FC1xOthI+Hgr5ZInoBGAY+I22tfeLRPBkTrAlsfMr/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ob9b650M8tNIa5Zqjgbo31UNIr+5lZg9wCm8U7XCeltV4bv53Wozm1FVSGep9jEMvQEutD6CC5NPf+/FXTr0gS++6vxZDUAuwcl3w19W6f/Jprcy8IrMADHTbjmSfk0zkmcFcNixD/Q2I8T/kDPMQ60Zjs6dGRBzTRpVhdkTfiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rtbr6A+m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D4ADC4CEF7;
	Thu, 12 Mar 2026 15:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773329078;
	bh=FC1xOthI+Hgr5ZInoBGAY+I22tfeLRPBkTrAlsfMr/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rtbr6A+mfmIb8HoIMT4umPsG/5YEEzDzixaL/4ba1ufpe7Vs1TvfNL78geSRJF3Ju
	 pym92WhPr0eMi4otqccX+9IN74+06ZV8P97VVM5LgcNW35WFPZVDP4Yf3Lt4UgqBn+
	 teQS420h1OQ7f/XJ9eCi1Ms/BJCpKNXmJ4hRCGZIyEjUO2S/w5CJje2+h3UW/sJZSC
	 jnK9Mhae/Suy7dOCzokVn3mN5I7HTMG7LM1uQgECVFQpQurwMPe1xCuxKfT7wsJhur
	 hp6HxyIihyyMFJhipy8X9tGgRULS8UzADKJKmyEsMYDdSxoOtV69I+HZ5jR4cakP4v
	 WBgnF5On5Perg==
Date: Thu, 12 Mar 2026 10:24:37 -0500
From: Rob Herring <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: st,st-ehci-300x: convert to DT schema
Message-ID: <20260312152437.GA3161241-robh@kernel.org>
References: <20260307-st-ehci-v1-1-3801a99ae913@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307-st-ehci-v1-1-3801a99ae913@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-34690-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,fe203e00:email,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E721327482A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 07, 2026 at 07:31:42AM +0000, Charan Pedumuru wrote:
> Convert STMicroelectronics USB EHCI Controller binding to DT schema.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/ehci-st.txt  | 38 ---------
>  .../devicetree/bindings/usb/st,st-ehci-300x.yaml   | 95 ++++++++++++++++++++++
>  2 files changed, 95 insertions(+), 38 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ehci-st.txt b/Documentation/devicetree/bindings/usb/ehci-st.txt
> deleted file mode 100644
> index d6f2bdee20fc..000000000000
> --- a/Documentation/devicetree/bindings/usb/ehci-st.txt
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -ST USB EHCI controller
> -
> -Required properties:
> - - compatible		: must be "st,st-ehci-300x"
> - - reg			: physical base addresses of the controller and length of memory mapped
> -			  region
> - - interrupts		: one EHCI interrupt should be described here
> - - pinctrl-names	: a pinctrl state named "default" must be defined
> - - pinctrl-0		: phandle referencing pin configuration of the USB controller
> -See: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> - - clocks		: phandle list of usb clocks
> - - clock-names		: should be "ic" for interconnect clock and "clk48"
> -See: Documentation/devicetree/bindings/clock/clock-bindings.txt
> -
> - - phys			: phandle for the PHY device
> - - phy-names		: should be "usb"
> - - resets		: phandle + reset specifier pairs to the powerdown and softreset lines
> -			  of the USB IP
> - - reset-names		: should be "power" and "softreset"
> -See: Documentation/devicetree/bindings/reset/st,stih407-powerdown.yaml
> -See: Documentation/devicetree/bindings/reset/reset.txt
> -
> -Example:
> -
> -	ehci1: usb@fe203e00 {
> -		compatible = "st,st-ehci-300x";
> -		reg = <0xfe203e00 0x100>;
> -		interrupts = <GIC_SPI 148 IRQ_TYPE_NONE>;
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&pinctrl_usb1>;
> -		clocks = <&clk_s_a1_ls 0>;
> -		phys = <&usb2_phy>;
> -		phy-names = "usb";
> -
> -		resets = <&powerdown STIH416_USB1_POWERDOWN>,
> -			 <&softreset STIH416_USB1_SOFTRESET>;
> -		reset-names = "power", "softreset";
> -	};
> diff --git a/Documentation/devicetree/bindings/usb/st,st-ehci-300x.yaml b/Documentation/devicetree/bindings/usb/st,st-ehci-300x.yaml
> new file mode 100644
> index 000000000000..0cd625cd003b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/st,st-ehci-300x.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/st,st-ehci-300x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics USB EHCI Controller (ST EHCI 300x)
> +
> +maintainers:
> +  - Peter Griffin <peter.griffin@linaro.org>
> +
> +description:
> +  The STMicroelectronics EHCI 300x controller is a USB 2.0 Enhanced Host
> +  Controller Interface used in several ST SoCs. It provides high-speed USB
> +  host functionality and interfaces with an external USB PHY. The controller
> +  requires clock, reset, interrupt, and pin control configuration along with
> +  PHY connection information to operate correctly.
> +
> +allOf:
> +  - $ref: usb-hcd.yaml#
> +
> +properties:
> +  compatible:
> +    const: st,st-ehci-300x
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +

> +  pinctrl-names:
> +    const: default
> +
> +  pinctrl-0:
> +    maxItems: 1

These can be dropped as pinctrl properties are always allowed.

With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


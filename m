Return-Path: <linux-usb+bounces-26036-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89342B0C21A
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 13:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1FC616B00A
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 11:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7CBF28FFE6;
	Mon, 21 Jul 2025 11:03:21 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D83228FFD0
	for <linux-usb@vger.kernel.org>; Mon, 21 Jul 2025 11:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753095801; cv=none; b=mq9fZ7r9p6YB11FkbDG2mCHV4E6eJ4RokGz1p2HFGPlUarzVn9dWav9P4o/LNWlehjtbwpvQI/hkF0m9IlFYyepwhySt1Zpf3T1/2jnZU8jnQrjmi+R/AkoI7v0BrTBVVBiCs0hKPSRdbu8UBL5++PamAUE+u7vCSfDuv5UXdWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753095801; c=relaxed/simple;
	bh=tP1pRW7y+RfdfgdYUK6Db/rhMYAb4jSsqxNDlIgclUc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EX5W5LMHaVsT+p7PNZ8R2Ej0Hl9yJbljVOi+Xgg4PFQUfMnwOzgC7YyLg3w6OgxAMT+Ck1HMmooim4HNA5Yfzk1YCKpGCGhSUwF9UkzmquLR9EsixhAW2YsIpqfXGs5qNfNX2Lv5ooFeQR0PRkFtn4ncRfFRYRckD3MZknq/k0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1udoIJ-00073c-OP; Mon, 21 Jul 2025 13:02:55 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1udoII-009Xfy-35;
	Mon, 21 Jul 2025 13:02:54 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1udoII-000Ebv-2o;
	Mon, 21 Jul 2025 13:02:54 +0200
Message-ID: <468961ac17fb5dd4365943a24206040575b0e982.camel@pengutronix.de>
Subject: Re: [PATCH v6 1/2] dt-bindings: usb: dwc3: add support for SpacemiT
 K1
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Ze Huang <huang.ze@linux.dev>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun
 Lan <dlan@gentoo.org>,  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski
	 <krzysztof.kozlowski@linaro.org>
Date: Mon, 21 Jul 2025 13:02:54 +0200
In-Reply-To: <20250712-dwc3_generic-v6-1-cc87737cc936@linux.dev>
References: <20250712-dwc3_generic-v6-0-cc87737cc936@linux.dev>
	 <20250712-dwc3_generic-v6-1-cc87737cc936@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

On Sa, 2025-07-12 at 15:49 +0800, Ze Huang wrote:
> Add support for the USB 3.0 Dual-Role Device (DRD) controller embedded
> in the SpacemiT K1 SoC. The controller is based on the Synopsys
> DesignWare Core USB 3 (DWC3) IP, supporting USB3.0 host mode and USB 2.0
> DRD mode.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Ze Huang <huang.ze@linux.dev>
> ---
>  .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  | 107 +++++++++++++++=
++++++
>  1 file changed, 107 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml =
b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..c967ad6aae50199127a4f8a17=
d53fc34e8d9480b
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
> +  The SpacemiT K1 embeds a DWC3 USB IP Core which supports Host function=
s
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

Are we sure all resets will only ever need to be triggered together?
Otherwise it might be safer to add a reset-names property.

regards
Philipp


Return-Path: <linux-usb+bounces-31831-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EC6CE8E89
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 08:39:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A25F30161BF
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 07:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B1E2FA0DF;
	Tue, 30 Dec 2025 07:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgdQZZSV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B2E1E51E0;
	Tue, 30 Dec 2025 07:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767080362; cv=none; b=QK6c+jcTd5+t7J81qgfNkPn4zvwI9lKPLber8h9XwPbKV5chTk03fl33Wp9Bozvbi07/U7XZCxaj5yBvK8ym9+pqaszRTlbq9DMpJ7ZR7Y5GxYcAlzxdPKL5xKdf3bT0vMuJkBcAzGQ5+bMHH4NkDoNVjQ26Yj/x+LrLRqqV7dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767080362; c=relaxed/simple;
	bh=NTn6YbPV27Pkf9sCKwRoN0qQ6Sjwzp7wJfPziB96wFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXkwyJaa7YvWR/i72krsi9OMb2axtiy1Fjzec08s3G5yebFIWGwUmBigrs01I8wl01tMt3XLkQ2Yaj+d2v1xZgCgrz33tD3G+3gZKersYZEkZZjUYlWkIcXIbqG/cgNInQtJCXHBKefD334sHu6e1WjHyKESlKhISd/0ucciEQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgdQZZSV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7842AC4CEFB;
	Tue, 30 Dec 2025 07:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767080362;
	bh=NTn6YbPV27Pkf9sCKwRoN0qQ6Sjwzp7wJfPziB96wFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WgdQZZSVtmZrgfCC6G7YCWLQ/AgOUEYi6rhu6clLLfExDiPa2HuXymjjSe2QKZu0a
	 Hz8k6Qo7woeP3pXKnLC+fy72wwASn6goEou5PZIfc286nHKpavx7bN61WNiVPSq9sp
	 ELA/evwPj0q7dvJoiTKaIWzUIPcnsOx10d0hyhMgnbpuaiw71hC54j2iptx+dcK0c+
	 q9beQj8vNZDK1Iw8xsIgLQprna1JO69uQliMrc0TjkMim9jUL4GYpA5w2d6Iz4ErFX
	 MwDI96/jhAZ+fbuukpau2jfoGjhn7R7BTHyhxAflM9o4UEQ4K2BRn4B0SUDekW96+l
	 g9z6LdaG/n2RA==
Date: Tue, 30 Dec 2025 08:39:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: conor@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	neil.armstrong@linaro.org, krzk+dt@kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: soc: canaan: Add top syscon for Canaan
 K230 SoC
Message-ID: <20251230-jumping-visionary-coyote-c0be31@quoll>
References: <20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20251230023725.15966-3-jiayu.riscv@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251230023725.15966-3-jiayu.riscv@isrc.iscas.ac.cn>

On Tue, Dec 30, 2025 at 10:37:21AM +0800, Jiayu Du wrote:
> The Canaan K230 SoC top system controller provides register access
> to configure related modules. It includes a USB2 PHY and eMMC/SDIO PHY.
> 
> Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> ---
>  .../soc/canaan/canaan,k230-hisys-cfg.yaml     | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/canaan/canaan,k230-hisys-cfg.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/canaan/canaan,k230-hisys-cfg.yaml b/Documentation/devicetree/bindings/soc/canaan/canaan,k230-hisys-cfg.yaml
> new file mode 100644
> index 000000000000..77875f2d4f48
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/canaan/canaan,k230-hisys-cfg.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/canaan/canaan,k230-hisys-cfg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Canaan K230 HiSysConfig system controller
> +
> +maintainers:
> +  - Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> +
> +description:
> +  The Canaan K230 HiSysConfig system controller provides register access to
> +  configure high-speed peripherals (e.g. eMMC/SDIO PHY tuning) and USB PHY
> +  configuration.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: canaan,k230-hisys-cfg
> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  usb-phy@70:
> +    $ref: schemas/phy/canaan,k230-usb-phy.yaml#

So that's why you did not have example there? But where did you explain
merging strategy/constraints/dependencies? How maintainers can now they
can apply this or not?


> +    unevaluatedProperties: false
> +
> +  usb-phy@90:
> +    $ref: schemas/phy/canaan,k230-usb-phy.yaml#
> +    unevaluatedProperties: false

Anyway, these are not really real children. Defining child per phy,
where each such phy is just few registers, is way too granular. Instead
define one phy with phy-cells=2.

You also MUST make this device - hisys - binding complete. If you do
not, then my review is: fold the children here, because you do not have
any other resources for the parent.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    hi_sys_config: syscon@91585000 {
> +        compatible = "canaan,k230-hisys-cfg", "syscon", "simple-mfd";
> +        reg = <0x91585000 0x400>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        usbphy0: usb-phy@70 {
> +            compatible = "canaan,k230-usb-phy";
> +            reg = <0x70 0x1C>, <0xb0 0x8>;
> +            clocks = <&sysclk K230_HS_USB0_AHB_GATE>;

You never bothered to test your code. Community is not a testing
service. It's your job to TEST IT before sending.

Best regards,
Krzysztof



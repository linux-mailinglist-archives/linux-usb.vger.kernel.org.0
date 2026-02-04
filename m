Return-Path: <linux-usb+bounces-33102-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OZKJiROg2lrlAMAu9opvQ
	(envelope-from <linux-usb+bounces-33102-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 14:48:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49ED6E6A51
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 14:48:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C35CE300D152
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 13:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA40279DC0;
	Wed,  4 Feb 2026 13:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BN55b8y8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E4830FC29
	for <linux-usb@vger.kernel.org>; Wed,  4 Feb 2026 13:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770212785; cv=none; b=LoA5BvS+QQ0nvOkbaFG9D1XN6gxIYLJ1qwV6U4qJlHBdJfB/LAZgDWykBJib672VnajQS+YpAhJhmXH2b3AI4ilvTTAZ8S3cDCVm1qiIvYpeXu2kYCX1136b1JtSUw5q+6+QrsRAX6VjQo6jHnThk5HqlumIY41YwhF33LT8K9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770212785; c=relaxed/simple;
	bh=FeNff6zrjmWciUFlh0FSiM0w5E8BMY8phPcL5rje6kU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mJb0YdzWBYjziz5M3uBHJZADV+3AdU/ndd4n8j/5B2QoOfCzrd6nuhyYI2XcRm0eA443uEnJfjUpgChT4DVp+BlNHDwvqnbjGaAAeltq5FyMSwi2fFBWvEFiClBjiemd48hSC+Jk6VFwN3/I8BRSfgXSxkd6XZSo38Te9kbgY/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BN55b8y8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E21AC4AF09
	for <linux-usb@vger.kernel.org>; Wed,  4 Feb 2026 13:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770212785;
	bh=FeNff6zrjmWciUFlh0FSiM0w5E8BMY8phPcL5rje6kU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BN55b8y8vF/yHrrykpQ43Zn0LHvDzf2+bGJNgcy6WXsqL4Kpv1QojF89LlTyE93bE
	 njQmmPFPEuUm2wamRAPJCprkjdqXLHEev03w5hsMDeYoOdk2ebeDC41AhsuOOSJ+Bq
	 ffj/zE1iT4/bd9826iLY+1XyCs4BXnpptBMJaeUQC0pfDLL3CSQ1+AuxBx4oay0Uxl
	 GH3CHfp0B0M1rGxCZMrwc0XlmfO0KyDX3WfKw61mVghM/QZMe+xMkZrNqPZ0Rpf8O5
	 0tjqJpkOxRcyKY1bvpBVOk852tpdUVo8d8aVCLmsvM2/dkHkg/TQ8W5GKGvMqvyh0f
	 W3YlP0Bfbn4Tg==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64c893f3a94so1462147a12.0
        for <linux-usb@vger.kernel.org>; Wed, 04 Feb 2026 05:46:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUTnxrd+gJwXI7RQxyeuf/KRbOevcJCSQ5ZRbf8Q23Ohg9oMrawy7udq1uQ7g5fnW7jDX+NnOvasoo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwylsrSCTeavwvJ4HEiq9QM/08FUBmw2OXa7/zJqHAIyghUmHs3
	CBCaZx5vqgLbB2x7LfpvtP0/6VcrkAg25B3fGiqHgmOCby2DiqrWcR8Z2ch3ydU2ZsuD5w5q6VL
	+Y3GDUOMThy7BA1G24vDSQoe/t5NACA==
X-Received: by 2002:a17:907:7ba1:b0:b88:440b:65c4 with SMTP id
 a640c23a62f3a-b8e838d36e3mr446539666b.25.1770212783590; Wed, 04 Feb 2026
 05:46:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260204-add-flatten-dts-based-dwc3-imx-driver-v2-0-d2c9b5a58c01@nxp.com>
 <20260204-add-flatten-dts-based-dwc3-imx-driver-v2-1-d2c9b5a58c01@nxp.com>
In-Reply-To: <20260204-add-flatten-dts-based-dwc3-imx-driver-v2-1-d2c9b5a58c01@nxp.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 4 Feb 2026 07:46:11 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLcqSKgNjx2nejwjSsNPwqAmEsRHX-6YwE-8r_32C4=ZQ@mail.gmail.com>
X-Gm-Features: AZwV_QjSgm66I4Qb-FM5KDeDvEBpAt3nGOL-hi0EvlGrPlxaGX84UJJRpnPN54o
Message-ID: <CAL_JsqLcqSKgNjx2nejwjSsNPwqAmEsRHX-6YwE-8r_32C4=ZQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: introduce fsl,imx-dwc3
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, Li Jun <jun.li@nxp.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33102-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,nxp.com,synopsys.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,devicetree.org:url,nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,4c100000:email]
X-Rspamd-Queue-Id: 49ED6E6A51
X-Rspamd-Action: no action

On Wed, Feb 4, 2026 at 5:05=E2=80=AFAM Xu Yang <xu.yang_2@nxp.com> wrote:
>
> The i.MX USB glue and DWC3 core are closely coupled. Describe the i.MX
> USB block in a single block will bring more benefits than a parent-
> child relation. The new binding is a copy of fsl,imx8mp-dwc3.yaml with
> the needed modifications.
>
> Add the common compatible string "fsl,imx-dwc3" to indicate that the
> flattened module should be selected. This compatible is also used by
> "select" to inform the DeviceTree validator to apply this binding.
>
> To avoid redefining all the platform-specific compatibles, "select" is
> used to tell the DeviceTree validator which binding to use solely on the
> generic compatible.
>
> Mark fsl,imx8mp-dwc3 deprecated, to favor expressing future platforms
> using the new combined binding.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>
> ---
> Changes in v2:
>  - reorder compatible property
> ---
>  .../devicetree/bindings/usb/fsl,imx-dwc3.yaml      | 131 +++++++++++++++=
++++++
>  .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   |  13 ++
>  2 files changed, 144 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/fsl,imx-dwc3.yaml b/Do=
cumentation/devicetree/bindings/usb/fsl,imx-dwc3.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..6932804516948bc0f8457553e=
ee7e5ee704237f0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/fsl,imx-dwc3.yaml
> @@ -0,0 +1,131 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2026 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/fsl,imx-dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX Soc USB Controller
> +
> +maintainers:
> +  - Xu Yang <xu.yang_2@nxp.com>
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: fsl,imx-dwc3
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,imx8mp-dwc3

You can't reuse the same compatible for a new binding.

> +          - fsl,imx94-dwc3
> +          - fsl,imx95-dwc3
> +      - const: fsl,imx-dwc3

Drop. If you want a fallback, use the 1st SoC's compatible.

> +
> +  reg:
> +    items:
> +      - description: DWC3 core registers
> +      - description: HSIO Block Control registers
> +      - description: Wrapper registers of dwc3 core
> +
> +  reg-names:
> +    items:
> +      - const: core
> +      - const: blkctl
> +      - const: glue
> +
> +  interrupts:
> +    items:
> +      - description: DWC3 controller interrupt
> +      - description: Wakeup interrupt from glue logic
> +
> +  interrupt-names:
> +    items:
> +      - const: dwc_usb3
> +      - const: wakeup
> +
> +  iommus:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: System hsio root clock
> +      - description: SoC Bus Clock for AHB/AXI/Native
> +      - description: Reference clock for generating ITP when UTMI/ULPI P=
HY is suspended
> +      - description: Suspend clock used for usb wakeup logic
> +
> +  clock-names:
> +    items:
> +      - const: hsio
> +      - const: bus_early
> +      - const: ref
> +      - const: suspend
> +
> +  fsl,permanently-attached:
> +    type: boolean
> +    description:
> +      Indicates if the device attached to a downstream port is
> +      permanently attached
> +
> +  fsl,disable-port-power-control:
> +    type: boolean
> +    description:
> +      Indicates whether the host controller implementation includes port
> +      power control. Defines Bit 3 in capability register (HCCPARAMS)
> +
> +  fsl,over-current-active-low:
> +    type: boolean
> +    description:
> +      Over current signal polarity is active low
> +
> +  fsl,power-active-low:
> +    type: boolean
> +    description:
> +      Power pad (PWR) polarity is active low
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - power-domains
> +
> +allOf:
> +  - $ref: snps,dwc3-common.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    usb@4c100000 {
> +      compatible =3D "fsl,imx943-dwc3", "fsl,imx-dwc3";
> +      reg =3D <0x4c100000 0x10000>,
> +            <0x4c010010 0x04>,
> +            <0x4c1f0000 0x20>;
> +      reg-names =3D "core", "blkctl", "glue";
> +      clocks =3D <&scmi_clk 74>,    //IMX94_CLK_HSIO
> +               <&scmi_clk 74>,    //IMX94_CLK_HSIO
> +               <&scmi_clk 2>,     //IMX94_CLK_24M
> +               <&scmi_clk 1>;     //IMX94_CLK_32K
> +      clock-names =3D "hsio", "bus_early", "ref", "suspend";
> +      interrupts =3D <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>;
> +      interrupt-names =3D "dwc_usb3", "wakeup";
> +      power-domains =3D <&scmi_devpd 13>;   //IMX94_PD_HSIO_TOP
> +      phys =3D <&usb3_phy>, <&usb3_phy>;
> +      phy-names =3D "usb2-phy", "usb3-phy";
> +      snps,gfladj-refclk-lpm-sel-quirk;
> +      snps,parkmode-disable-ss-quirk;
> +      status =3D "disabled";

Examples should be enabled.

> +    };
> diff --git a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml b=
/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
> index 73e7a60a0060dee6417b9469251e121704b7a148..fd23c345149e0dba1ed3919a2=
5195edf247cfc08 100644
> --- a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
> @@ -10,6 +10,19 @@ title: NXP iMX8MP Soc USB Controller
>  maintainers:
>    - Li Jun <jun.li@nxp.com>
>
> +deprecated: true
> +
> +select:
> +  properties:
> +    compatible:
> +      oneOf:
> +        - items:
> +            - const: fsl,imx95-dwc3
> +            - const: fsl,imx8mp-dwc3
> +        - const: fsl,imx8mp-dwc3
> +  required:
> +    - compatible
> +
>  properties:
>    compatible:
>      oneOf:
>
> --
> 2.34.1
>
>


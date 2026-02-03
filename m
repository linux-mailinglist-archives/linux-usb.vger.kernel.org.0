Return-Path: <linux-usb+bounces-33030-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Xeq9K6ahgWmJIAMAu9opvQ
	(envelope-from <linux-usb+bounces-33030-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 08:20:06 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0FAD5A66
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 08:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15509304E800
	for <lists+linux-usb@lfdr.de>; Tue,  3 Feb 2026 07:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C69643921F8;
	Tue,  3 Feb 2026 07:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="FXwNUbZW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0014C29E11D
	for <linux-usb@vger.kernel.org>; Tue,  3 Feb 2026 07:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770103198; cv=pass; b=jgF64C1toehjXojAs9V48sB+d0jwiAWYJo72j5VU+/98wg/hir93P2+aPCqRegWGcI7eRGtEepAxSE1/jDQhmp7bGlbESwpCprzA5YDFOL/oe4RoO6yjqOcuK6cOryf8GsyRb02+e8WQdq9SDXnaD6CAZQYm36QpZZbtwHJ3V3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770103198; c=relaxed/simple;
	bh=F1EYsNIFPWWyyxdg6FY67rvu4jrkAqdIv5FfPKOhgOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T9+uJAlbRlVS09qWQHl3doQc9Bj9IkPA/VeWxBib5u6cji+RW+7RIMpI8WbUgYr5sRqZIon+w8vM8ODSs/uACxNHqalI9ga+g+pQ+SOtv+8R7uAqJ9UAKYk2FG3jnL68opYGlmFYRz2KNVa04bbRZ6EhzPK+lS80A2JB0JvmvgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=FXwNUbZW; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=QNR5RxTwzTtZsop8+J+WBmJB6mqTYo7/2/cKx2YLwz8=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770103177;
 b=OKhQ79NSqa011NYiQWHl9H2+tX4zCKlydZeDpASaKyyHNF4doyktZiTlUhbYquyCl0SAqDIG
 z1ocZsDuToS79jpjnnwMiQwnrsUYW3MMFscw1nfTqhyx57YLvN5xf9PUSM66BdxEKBlKW0v4pBX
 8tHq1dvl+Ui78kgJ6lOeRzJGKeqts0/fJen1OccP+0E01ypKB4UYAPCOQi8s8r16SbdsZnqBpr3
 QGuu9/9CM0qH9bpBcqUCD74V2W0Y6zzcWf9aSoim7qAd5WEr0cWNgCAP0+ERrEB6yhKp43QHQeC
 LeYjgsjg4uyNapw0mLe8KcJXPErQljICshM2a+Sa4SvMg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770103177;
 b=Mv0mkmtVx9dBv+Jvy5Em8qHOmC8D6RF2XiG4yzW5XjkVlNcjwHo+ouA+2YS6hBUPAM3TogCh
 bTA+FKscxVEVr/cHGgPalYlBQo4WcSBHfjhKfm7xUXify6/RqjbbeDwr60KULmVjNuOjDrLq/fB
 oWRm7WvSbpEhIyk28Pt/XzcqV+clkXqCKFF9aICFqKFBpGs6M487FQ7q6iCbsKifsB/Q5Bd0fH2
 qQLga2g0Klnw8MQJ9abR94iLe0oAbvw+p8v6Cj5LzGQ66bFfAiG22rJN17wEQ1VWh7axElG/Sks
 9k+JSjC5oJu2Ymd05o0X8hhNBUly4mz8aWx/xXu+SrIBw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Tue, 03 Feb 2026 08:19:37 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 36261A41052;
	Tue,  3 Feb 2026 08:19:14 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
 Li Jun <jun.li@nxp.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Xu Yang <xu.yang_2@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH 1/3] dt-bindings: usb: introduce fsl,imx-dwc3
Date: Tue, 03 Feb 2026 08:19:13 +0100
Message-ID: <2820312.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To:
 <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-1-c44a5e919380@nxp.com>
References:
 <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-0-c44a5e919380@nxp.com>
 <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-1-c44a5e919380@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-usb@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4f4vxH13xBz3ybHd
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:b6b042cd698d2248267929566eccc0fd
X-cloud-security:scantime:2.015
DKIM-Signature: a=rsa-sha256;
 bh=QNR5RxTwzTtZsop8+J+WBmJB6mqTYo7/2/cKx2YLwz8=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770103176; v=1;
 b=FXwNUbZWSGUQTgkO4h0o/3UyjCWhiIFCTgH5l9blAgAmjX0gC+IajTs45eGn0vNDOY8y2jO1
 wS1IgQrrXDIT/0Wfk0vQhPaTcV7Hb2dcmJZywydcdEHkZIxBPTumOpFDYa0KYdv4oQcd/U54Y7s
 1VlKJ2twCxYRlY/Lk6MZJu3+12BeH/76Y5Q4c6NfpzziGJnYOMsO/09Ie1WAeMZvhttIi34u8Pk
 pkY5seXFCK2eqMZgxEMVtwpwE8GUCQm77Omzv5aiErPAi4t09zuwhgqtXHU9HQY6fkHcPDgs2Ax
 Cylw4iK8iF1WooCr1NxDnguca6BAFgzE3XttksTFVTsBg==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,reject];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=hse1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33030-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,nxp.com,synopsys.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[i.mx:url,tq-group.com:url,devicetree.org:url,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BC0FAD5A66
X-Rspamd-Action: no action

Am Montag, 2. Februar 2026, 11:27:45 CET schrieb Xu Yang:
> The i.MX USB glue and DWC3 core are closely coupled. Describe the i.MX
> USB block in a single block will bring more benefits than a parent-
> child relation. The new binding is a copy of fsl,imx8mp-dwc3.yaml with
> the needed modifications.
>=20
> Add the common compatible string "fsl,imx-dwc3" to indicate that the
> flattened module should be selected. This compatible is also used by
> "select" to inform the DeviceTree validator to apply this binding.
>=20
> To avoid redefining all the platform-specific compatibles, "select" is
> used to tell the DeviceTree validator which binding to use solely on the
> generic compatible.
>=20
> Mark fsl,imx8mp-dwc3 deprecated, to favor expressing future platforms
> using the new combined binding.
>=20
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  .../devicetree/bindings/usb/fsl,imx-dwc3.yaml      | 131 +++++++++++++++=
++++++
>  .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   |  13 ++
>  2 files changed, 144 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/fsl,imx-dwc3.yaml b/Do=
cumentation/devicetree/bindings/usb/fsl,imx-dwc3.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..bc6b9743396e8f6b698706caa=
e71241b0512ce8b
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
> +          - fsl,imx95-dwc3
> +          - fsl,imx943-dwc3
> +          - fsl,imx8mp-dwc3

Can you please sort this? I would have expected the exact reverse ordering.

> +      - const: fsl,imx-dwc3
> +
> +  reg:
> +    items:
> +      - description: DWC3 core registers.
> +      - description: HSIO Block Control registers.
> +      - description: Wrapper registers of dwc3 core.
> +
> +  reg-names:
> +    items:
> +      - const: core
> +      - const: blkctl
> +      - const: glue
> +
> +  interrupts:
> +    items:
> +      - description: DWC3 controller interrupt.
> +      - description: Wakeup interrupt from glue logic.
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
> +      - description: Suspend clock used for usb wakeup logic.
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
> +      permanently attached.
> +
> +  fsl,disable-port-power-control:
> +    type: boolean
> +    description:
> +      Indicates whether the host controller implementation includes port
> +      power control. Defines Bit 3 in capability register (HCCPARAMS).
> +
> +  fsl,over-current-active-low:
> +    type: boolean
> +    description:
> +      Over current signal polarity is active low.
> +
> +  fsl,power-active-low:
> +    type: boolean
> +    description:
> +      Power pad (PWR) polarity is active low.
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
> =20
> +deprecated: true
> +
> +select:
> +  properties:
> +    compatible:
> +      oneOf:
> +        - items:
> +            - const: fsl,imx95-dwc3
> +            - const: fsl,imx8mp-dwc3

Same here.

Best regards,
Alexander

> +        - const: fsl,imx8mp-dwc3
> +  required:
> +    - compatible
> +
>  properties:
>    compatible:
>      oneOf:
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/




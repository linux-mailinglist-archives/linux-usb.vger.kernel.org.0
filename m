Return-Path: <linux-usb+bounces-2863-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D047EAD7F
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 11:02:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 907CA1F24242
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 10:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E164182D1;
	Tue, 14 Nov 2023 10:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dhtfD1f+"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997FF1803D;
	Tue, 14 Nov 2023 10:02:08 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 428D8191;
	Tue, 14 Nov 2023 02:02:03 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E62F920011;
	Tue, 14 Nov 2023 10:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699956121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1lnq+WegjgapWVtw6ANN/5vC9p0PJaSZ3zKf7qrNvjU=;
	b=dhtfD1f+VCI1J5EjE6P+5EQj/6WvGKBcBWpBLhsKnokMDHowszRitrJYBCniWoswNtR5r3
	D7PmJQeF88qog6nkkqo2a6vxUVJ9LUrlJnc+ji3L5dlGwP4nRRdY61hva5VZNhnY2ja+jh
	51Pjhu1nKEjVY0VBzwTiX+21k1Ep0GsfveVIrbepJ9L9fx/yeOvlD0/FjPU92UAUwt8XF9
	mLlARSGPBEAevbw2Idkao2+7hiovlt9GMsjV3wgjryuGFogGKaMJXYROnjeBKlj488LC9R
	w8wUlneRLGrvx/qliscN5TazNDoTSDnb53yZIpPDWEKjNQuIzWRSmwnbnUz6TQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: =?utf-8?Q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Greg
 Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Roger Quadros <rogerq@kernel.org>, Peter Chen
 <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, Nishanth
 Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo
 <kristo@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 =?utf-8?Q?Th=C3=A9o?=
 Lebrun <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 6/6] arm64: dts: ti: k3-j7200: use J7200-specific USB
 compatible
In-Reply-To: <20231113-j7200-usb-suspend-v1-6-ad1ee714835c@bootlin.com>
References: <20231113-j7200-usb-suspend-v1-0-ad1ee714835c@bootlin.com>
 <20231113-j7200-usb-suspend-v1-6-ad1ee714835c@bootlin.com>
Date: Tue, 14 Nov 2023 11:01:59 +0100
Message-ID: <87wmuk64bs.fsf@BL-laptop>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Hello Th=C3=A9o,

> On our platform, suspend-to-idle or suspend-to-RAM turn the controller
> off thanks to a power-domain. This compatible triggers reset on resume
> behavior to reconfigure the hardware.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---
>  arch/arm64/boot/dts/ti/k3-j7200-main.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi b/arch/arm64/boot/=
dts/ti/k3-j7200-main.dtsi
> index 709081cd1e7f..581905d9199e 100644
> --- a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
> @@ -788,7 +788,7 @@ pcie1_ep: pcie-ep@2910000 {
>  	};
>=20=20
>  	usbss0: cdns-usb@4104000 {
> -		compatible =3D "ti,j721e-usb";
> +		compatible =3D "ti,j7200-usb";

What about keeping the old compatible as fallback in the unlikley case
we have a new dtb with an old kernel ?

Gregory

>  		reg =3D <0x00 0x4104000 0x00 0x100>;
>  		dma-coherent;
>  		power-domains =3D <&k3_pds 288 TI_SCI_PD_EXCLUSIVE>;
>
> --=20
> 2.41.0
>
>

--=20
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com


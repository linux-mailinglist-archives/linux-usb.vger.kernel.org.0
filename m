Return-Path: <linux-usb+bounces-2870-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 712097EAEAE
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 12:14:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 066ED1F24516
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 11:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5527623741;
	Tue, 14 Nov 2023 11:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ahq+dCJ+"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E71224D3;
	Tue, 14 Nov 2023 11:14:42 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1913189;
	Tue, 14 Nov 2023 03:14:40 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA38BC000B;
	Tue, 14 Nov 2023 11:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699960479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KIj6F7OlqwB7D0mHoxTDr4C4+/7gqjpgDdXihBuie7M=;
	b=Ahq+dCJ+kduDb9wvVwE2uEP9YOa1fPXt9ey9m5AFeSC0hpluXGehgt+K8RVxQfoYNBDGSr
	B5VIoNy6HnRB5ZuwyCMduwhoCHzgWrEaGCiGMKypC7yMQtvecoOqHFIVba7y3VBCJI0zlF
	VeqfFPYxn9WZcIrOLLPf7tWHOf6uO8z9WPrrNxb/8DJ84c45IF/GVgYKZCmHR698I3v926
	h554ku6bZdxxJ2Ic8wMJNx2id/ksbSiavOiZCiqjRng8g2bLfHtrgPWOJ5CLtCg8WNvy3n
	C/qBkZ43t/y0agpEAuq+qwpa2hi+qjHbC8K06EPmZCOfKjtbtuorKddPmP4Iqg==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Nov 2023 12:14:38 +0100
Message-Id: <CWYHP2PTNVNT.316KO84HP5CZV@tleb-bootlin-xps13-01>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 6/6] arm64: dts: ti: k3-j7200: use J7200-specific USB
 compatible
Cc: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
To: "Gregory CLEMENT" <gregory.clement@bootlin.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Roger Quadros" <rogerq@kernel.org>, "Peter Chen"
 <peter.chen@kernel.org>, "Pawel Laszczak" <pawell@cadence.com>, "Nishanth
 Menon" <nm@ti.com>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Tero Kristo"
 <kristo@kernel.org>
X-Mailer: aerc 0.15.2
References: <20231113-j7200-usb-suspend-v1-0-ad1ee714835c@bootlin.com>
 <20231113-j7200-usb-suspend-v1-6-ad1ee714835c@bootlin.com>
 <87wmuk64bs.fsf@BL-laptop>
In-Reply-To: <87wmuk64bs.fsf@BL-laptop>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Tue Nov 14, 2023 at 11:01 AM CET, Gregory CLEMENT wrote:
> > ---
> > diff --git a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi b/arch/arm64/boo=
t/dts/ti/k3-j7200-main.dtsi
> > index 709081cd1e7f..581905d9199e 100644
> > --- a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
> > +++ b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
> > @@ -788,7 +788,7 @@ pcie1_ep: pcie-ep@2910000 {
> >  	};
> > =20
> >  	usbss0: cdns-usb@4104000 {
> > -		compatible =3D "ti,j721e-usb";
> > +		compatible =3D "ti,j7200-usb";
>
> What about keeping the old compatible as fallback in the unlikley case
> we have a new dtb with an old kernel ?

I see the usecase; that will be done in V2.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


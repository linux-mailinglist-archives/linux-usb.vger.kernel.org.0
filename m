Return-Path: <linux-usb+bounces-3118-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B49357F3446
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 17:53:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ED4F282F9D
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 16:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7829A55C35;
	Tue, 21 Nov 2023 16:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iqdm9xd8"
X-Original-To: linux-usb@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFE39113;
	Tue, 21 Nov 2023 08:53:35 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4CE3C6000B;
	Tue, 21 Nov 2023 16:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700585614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n02adsIvyblEozYaL9kieTrZl/WHapBpg8ySkC5Rsmo=;
	b=iqdm9xd88QUoCRBrFpluE/q44QmcnEPu0yhe/WVswF6dVuLGela12+s0emF5H4mYpLynIy
	s0yZfQL3IKnUZh+hBRCCF9elHteEPEKsDgrGH7PvItYqYQzh5lb67lIiKJhhCyztZA64MW
	15Mt9HDl1umMGmiDi/Ad9jdiiGgnt9aq1Au4vgb/Pgb+aARJPTIWoLVlNRCWcj0+lgMdDg
	y0iuv9chCqQN7Z0sIo/++nymEIxNqLAlbDIG8oT1Rqf5XY6zTMFlEPQfbsRNWf+Xh7Eiaq
	7UK0500YQMzyNMiHQRDsEshFGKh7YF5nDTtU+6h5xalvcxCbBBKfKiqyEjnFcw==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Nov 2023 17:53:32 +0100
Message-Id: <CX4NADEZZEO1.3TXPVNOONKBCF@tleb-bootlin-xps13-01>
Subject: Re: [PATCH v2 1/7] dt-bindings: usb: ti,j721e-usb: add ti,j7200-usb
 compatible
Cc: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Conor
 Dooley" <conor.dooley@microchip.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rob Herring"
 <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Roger Quadros" <rogerq@kernel.org>, "Peter Chen" <peter.chen@kernel.org>,
 "Pawel Laszczak" <pawell@cadence.com>, "Nishanth Menon" <nm@ti.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.15.2
References: <20231120-j7200-usb-suspend-v2-0-038c7e4a3df4@bootlin.com>
 <20231120-j7200-usb-suspend-v2-1-038c7e4a3df4@bootlin.com>
 <6f0da181-717c-4b14-ba3f-d287efe4105b@linaro.org>
In-Reply-To: <6f0da181-717c-4b14-ba3f-d287efe4105b@linaro.org>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Mon Nov 20, 2023 at 6:32 PM CET, Krzysztof Kozlowski wrote:
> On 20/11/2023 18:06, Th=C3=A9o Lebrun wrote:
> > On this platform, the controller & its wrapper are reset on resume. Thi=
s
> > makes it have a different behavior from other platforms.
> >=20
> > We allow using the new compatible with a fallback onto the original
> > ti,j721e-usb compatible. We therefore allow using an older kernel with
>
> Where is fallback ti,j721e-usb used? Please point me to the code.

No fallback is implemented in code. Using a kernel that doesn't have
this patch series but a more recent devicetree: DT has both
devicetrees & the kernel will know which driver to use.

That is opposed to having only compatible =3D "ti,j7200-usb". If using an
old kernel, it would not know what driver to match it to.

[...]

> > --- a/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
> > +++ b/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
> > @@ -12,11 +12,15 @@ maintainers:
> >  properties:
> >    compatible:
> >      oneOf:
> > +      - const: ti,j7200-usb
> >        - const: ti,j721e-usb
> >        - const: ti,am64-usb
> >        - items:
> >            - const: ti,j721e-usb
> >            - const: ti,am64-usb
> > +      - items:
> > +          - const: ti,j721e-usb
>
> This makes little sense. It's already on the list. Twice! Don't add it
> third time.
>
> I am sorry, but this binding makes no sense. I mean, existing binding
> makes no sense, but your change is not making it anyhow better.

The goal of the DT schema pre-patch was to allow all three:

   compatible =3D "ti,j721e-usb";
   compatible =3D "ti,am64-usb";
   compatible =3D "ti,j721e-usb", "ti,am64-usb";

I've followed the same scheme & added both of those:

   compatible =3D "ti,j7200-usb";
   compatible =3D "ti,j7200-usb", "ti,j721e-usb";

I messed up the ordering in the added 'items' options, but the logic
seems right to me. And dtbs_check agrees. Am I missing something?

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


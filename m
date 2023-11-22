Return-Path: <linux-usb+bounces-3174-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 132F07F4443
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 11:46:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9F2728149C
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 10:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F2B94AF71;
	Wed, 22 Nov 2023 10:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="p3kX9wa7"
X-Original-To: linux-usb@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49784198;
	Wed, 22 Nov 2023 02:46:21 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E266360006;
	Wed, 22 Nov 2023 10:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700649980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wsLp5fNBZJG71eNfXxaG4gNoXfOWnqSgaEfLQGOpsAc=;
	b=p3kX9wa7/tIpef5pLKlwC0v7uuLxigBoxCHcCocVKJbwnNnYmdVta1zjtahXDNpH5JwEa0
	IbhMKmgT/20IyKNZZrTttEPhDmjjKjzOo/WrzehtlJsXyr+6B3kIiwQfbuMUXsJMPEq494
	NEa54Gs0SxZWB1htKRCC2SlDXimQ0XpPlrik887YAEr5yP4W3fi8rN2zaZ5n2ciEW+11Af
	vNqXerTqkB/LbdGhjTbYnhF0E5wMfjcz+7In3bA9vmOzc9IOLUlID1Ish3AM4wgMDZXprH
	GN+46dEC/0GtdiQdB0kYCEZjuSou1yYkAZ3zmGt/szQXZudKCU8lZG6JB1K8Qg==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Nov 2023 11:46:14 +0100
Message-Id: <CX5A3OSPKM1Q.1CPN17KI0PD7A@tleb-bootlin-xps13-01>
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
 <CX4NADEZZEO1.3TXPVNOONKBCF@tleb-bootlin-xps13-01>
 <d0cc33d4-2b1a-43cd-8cd9-6b58d6c71c85@linaro.org>
In-Reply-To: <d0cc33d4-2b1a-43cd-8cd9-6b58d6c71c85@linaro.org>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Tue Nov 21, 2023 at 6:11 PM CET, Krzysztof Kozlowski wrote:
> On 21/11/2023 17:53, Th=C3=A9o Lebrun wrote:
> > On Mon Nov 20, 2023 at 6:32 PM CET, Krzysztof Kozlowski wrote:
> >> On 20/11/2023 18:06, Th=C3=A9o Lebrun wrote:
> >>> On this platform, the controller & its wrapper are reset on resume. T=
his
> >>> makes it have a different behavior from other platforms.
> >>>
> >>> We allow using the new compatible with a fallback onto the original
> >>> ti,j721e-usb compatible. We therefore allow using an older kernel wit=
h
> >>
> >> Where is fallback ti,j721e-usb used? Please point me to the code.
> >=20
> > No fallback is implemented in code. Using a kernel that doesn't have
> > this patch series but a more recent devicetree: DT has both
> > devicetrees & the kernel will know which driver to use.
>
> I meant your bindings. You said - with fallback to ti,j721e-usb. I do
> not see it. To me the commit description is not accurate.

I see your point, I'll remove that aspect.

> > That is opposed to having only compatible =3D "ti,j7200-usb". If using =
an
> > old kernel, it would not know what driver to match it to.
> >=20
> > [...]
> >=20
> >>> --- a/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
> >>> +++ b/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
> >>> @@ -12,11 +12,15 @@ maintainers:
> >>>  properties:
> >>>    compatible:
> >>>      oneOf:
> >>> +      - const: ti,j7200-usb
> >>>        - const: ti,j721e-usb
> >>>        - const: ti,am64-usb
> >>>        - items:
> >>>            - const: ti,j721e-usb
> >>>            - const: ti,am64-usb
> >>> +      - items:
> >>> +          - const: ti,j721e-usb
> >>
> >> This makes little sense. It's already on the list. Twice! Don't add it
> >> third time.
> >>
> >> I am sorry, but this binding makes no sense. I mean, existing binding
> >> makes no sense, but your change is not making it anyhow better.
> >=20
> > The goal of the DT schema pre-patch was to allow all three:
> >=20
> >    compatible =3D "ti,j721e-usb";
> >    compatible =3D "ti,am64-usb";
> >    compatible =3D "ti,j721e-usb", "ti,am64-usb";
>
> Which does not make sense.
>
> How ti,j721e-usb can be and cannot be compatible with am64 in the same ti=
me?

The code tells us that there is no difference between ti,j721e-usb &
ti,am64-usb. And the commit adding the of_device_id entry agrees, see
4f30b9d2315f (usb: cdns3: Add support for TI's AM64 SoC, 2021-01-19).
Here is the entire patch because it is so small:

   diff --git a/drivers/usb/cdns3/cdns3-ti.c b/drivers/usb/cdns3/cdns3-ti.c
   index 90e246601537..eccb1c766bba 100644
   --- a/drivers/usb/cdns3/cdns3-ti.c
   +++ b/drivers/usb/cdns3/cdns3-ti.c
   @@ -214,6 +214,7 @@ static int cdns_ti_remove(struct platform_device *pd=
ev)

    static const struct of_device_id cdns_ti_of_match[] =3D {
      { .compatible =3D "ti,j721e-usb", },
   +  { .compatible =3D "ti,am64-usb", },
      {},
    };
    MODULE_DEVICE_TABLE(of, cdns_ti_of_match);

> > I've followed the same scheme & added both of those:
> >=20
> >    compatible =3D "ti,j7200-usb";
> >    compatible =3D "ti,j7200-usb", "ti,j721e-usb";
> >=20
> > I messed up the ordering in the added 'items' options, but the logic
> > seems right to me. And dtbs_check agrees. Am I missing something?
>
> Logic is wrong. Device either is or is not compatible with something. At
> least usually. We have some exceptions like SMMU for Adreno. Is this the
> case? Why the device is and is not compatible with some other variant?

My understanding is this: j721e & am64 are strictly equivalent. On our
j7200 we know we reset on resume. I see three ways forward:

 - properties:
     compatible:
       oneOf:
         - const: ti,j7200-usb
         - const: ti,j721e-usb
         - const: ti,am64-usb

   We keep both ti,j721e-usb & ti,am64-usb separate even though they are
   compatible. It makes for simpler changes & it avoids touching
   devicetrees.

 - properties:
   compatible:
     oneOf:
       - const: ti,j7200-usb
       - const: ti,j721e-usb

   AM64 is a duplicate of J721E. Remove it and update upstream
   devicetrees.

 - properties:
   compatible:
     oneOf:
       - const: ti,j7200-usb
       - items:
           - const: ti,j721e-usb
           - const: ti,am64-usb

   J721E & AM64 are compatible, express that & update devicetrees.

Option one is simpler & doesn't change devicetrees so I'd lean in that
direction. What's your opinion?

Regards,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


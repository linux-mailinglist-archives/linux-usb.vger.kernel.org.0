Return-Path: <linux-usb+bounces-3202-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D40E07F4DFD
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 18:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47974B20E62
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 17:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0262957888;
	Wed, 22 Nov 2023 17:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YPVFJTVF"
X-Original-To: linux-usb@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E92583;
	Wed, 22 Nov 2023 09:15:01 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B547B40002;
	Wed, 22 Nov 2023 17:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700673299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AkVswiJ7VPVtZX+F/mFSJMy4cTc8YcymiMChgnVRYnw=;
	b=YPVFJTVFZnnaVhBQtagXSCU0uOltCQ8PaBP/vpt0JIu2EA3Uh7BbmzW4752uw5vV6z0TFz
	GPFuSXlnqFvHwTnUkGwF6GvkuVYCUkimS6hJXQyvgW51IApN8GrG4qbc1qEsPbnNYHgDzT
	fC/ZhiN9fhu7k0o8ySDkh7StR8RvYOpsdZQYHpz1Bb+bE3+n5tqMa+9WOnYAYxqG4WaEow
	oqq4vaW1FpXnNmXUk+j/1h2NdTYKvyu07xycfVkhZiKZ4TjTaJw0to5AhUyDFNBXzYaOHU
	M+eVf7eoIgIEG1FErKH7Rb6n9jyj6QKr6euF3ha9qu/kUquevZlUKchwnhvXCw==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Nov 2023 18:14:57 +0100
Message-Id: <CX5IDB4IPK92.31F1ICOWQSL84@tleb-bootlin-xps13-01>
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
 <CX5A3OSPKM1Q.1CPN17KI0PD7A@tleb-bootlin-xps13-01>
 <e91c2fa3-2cb4-44be-953f-2bfa26db2b4f@linaro.org>
In-Reply-To: <e91c2fa3-2cb4-44be-953f-2bfa26db2b4f@linaro.org>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Wed Nov 22, 2023 at 1:00 PM CET, Krzysztof Kozlowski wrote:
> On 22/11/2023 11:46, Th=C3=A9o Lebrun wrote:
> >  - properties:
> >    compatible:
> >      oneOf:
> >        - const: ti,j7200-usb
> >        - items:
> >            - const: ti,j721e-usb
> >            - const: ti,am64-usb
> >=20
> >    J721E & AM64 are compatible, express that & update devicetrees.
> >=20
> > Option one is simpler & doesn't change devicetrees so I'd lean in that
> > direction. What's your opinion?
>
> This one should be for am64.
>
> For your j7200, it depends whether the fallback to j721e makes sense,
> IOW, if the Linux can use j721e compatible solely to use j7200 device.

All compatibles might be equivalent if the reset-on-resume behavior is
observed on all three platforms. I don't have access to J721E or AM64
to test that.

@Roger Quadros: do you have any news if USB suspend/resume works on
J721E and/or AM64? My testing on the J7200 EVM is (1) boot, (2) put
the "USB2.0_MUX_SEL" GPIO high to have USB devices connected without
plugging anything, then (3) trigger a s2idle. I get a memory bus
exception on resume without my patches.

Regards,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


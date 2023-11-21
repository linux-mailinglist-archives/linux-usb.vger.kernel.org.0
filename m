Return-Path: <linux-usb+bounces-3116-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE98D7F3431
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 17:48:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6A6D28309C
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 16:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4544A9AD;
	Tue, 21 Nov 2023 16:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="O3iE6ZPm"
X-Original-To: linux-usb@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48B34100;
	Tue, 21 Nov 2023 08:48:41 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC225FF813;
	Tue, 21 Nov 2023 16:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700585319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kwcznJ/vPm0Lhw3csLKCSrYXPx6N2BEOWXzBNGHl0I4=;
	b=O3iE6ZPmaJ2IpxNqOoT0BjRwsjcxXbZ5NbZpO+2SeAMwF+upyoqld23ZXBSeKAeoKh5y9j
	0xaldUXNvRdZIB7ZqCfS3DTGL3uHOhIg0AXTSgWVZXIyEk846QIDFFI0DhKWl9uCCoyDFM
	a85kWPb7JpptfNaA9slX5xKeMwite5+GaLwXkbkZD62ZPMYxLX0+V7k60Pgm3IE6amys2q
	TqPB2sk4g0NjzDPv4Y8+t5VSVNu7RNbUO/wFHZwT7tMnBz/JDGbGu5qB1lDFQgHb6qmKVk
	J63PaP2/SVU/FQdcLTB5Zspn8gKA7FMiccQjpTxmBS2sFHaihX/uXOHI8si+0w==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Nov 2023 17:48:37 +0100
Message-Id: <CX4N6LOJQUR0.791161Y74MP8@tleb-bootlin-xps13-01>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH v2 4/7] usb: cdns3-ti: add suspend/resume procedures for
 J7200
Cc: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rob Herring"
 <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Roger Quadros" <rogerq@kernel.org>, "Peter Chen" <peter.chen@kernel.org>,
 "Pawel Laszczak" <pawell@cadence.com>, "Nishanth Menon" <nm@ti.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>
X-Mailer: aerc 0.15.2
References: <20231120-j7200-usb-suspend-v2-0-038c7e4a3df4@bootlin.com>
 <20231120-j7200-usb-suspend-v2-4-038c7e4a3df4@bootlin.com>
 <d84e400d-7f76-4b4d-8960-f1338f37b8ac@linaro.org>
In-Reply-To: <d84e400d-7f76-4b4d-8960-f1338f37b8ac@linaro.org>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello Krzysztof,

On Mon Nov 20, 2023 at 6:31 PM CET, Krzysztof Kozlowski wrote:
> On 20/11/2023 18:06, Th=C3=A9o Lebrun wrote:

[...]

> > --- a/drivers/usb/cdns3/cdns3-ti.c
> > +++ b/drivers/usb/cdns3/cdns3-ti.c
> >  static const int cdns_ti_rate_table[] =3D {	/* in KHZ */
> > @@ -172,6 +173,7 @@ static int cdns_ti_probe(struct platform_device *pd=
ev)
> >  	data->usb2_refclk_rate_code =3D i;
> >  	data->vbus_divider =3D device_property_read_bool(dev, "ti,vbus-divide=
r");
> >  	data->usb2_only =3D device_property_read_bool(dev, "ti,usb2-only");
> > +	data->reset_on_resume =3D of_device_is_compatible(node, "ti,j7200-usb=
");
>
> No, use driver data for this. Don't put compatibles in the code. It
> makes it unmanageable soon.

Fixed for next revision. I hesitated on this patch but I'll know for
next time.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


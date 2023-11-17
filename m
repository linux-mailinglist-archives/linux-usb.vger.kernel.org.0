Return-Path: <linux-usb+bounces-2955-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9847EEF82
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 10:58:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 272B7B20B85
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 09:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16EC017999;
	Fri, 17 Nov 2023 09:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EVJLxhTO"
X-Original-To: linux-usb@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42986CE;
	Fri, 17 Nov 2023 01:58:14 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D1311C000C;
	Fri, 17 Nov 2023 09:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700215093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P4oNQfBYlP0AUFjj519pmqm6CCbxiBl1lNX7nXCCgt0=;
	b=EVJLxhTOOVfvd33Q80JnB+XnSjByT68Q3jMleNJjJUxeIFxwaMM7KtWiP3rhrh17K7hJjl
	sCvVVbITb/hJeupyFUxjrBmn7Xn5shTxVixdaOAQYsm024OTXLKACmyT4/v3eeBoEQOGWz
	jDOUZlj/HXfFA6g3o+wz299a0RVrjBoAIrPXiqAzpTsRkS1e0vjhkmot05yXW43PhSclBr
	qSc2HZ0daoGKLuTZ7371FKP5/6qFozzliywTaE3KPTLI/NvIJ8wK2LQywM8W9k1AXLJ7bD
	EnGKye/pSQG8peGAvI9WQSCJGBiUXsZGcOs6E6WQNwWUOICxwo9fxfK2LMOxdA==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Nov 2023 10:58:12 +0100
Message-Id: <CX0ZY6JPH6HP.3JWUAN8KZ2SZB@tleb-bootlin-xps13-01>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rob Herring"
 <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Roger Quadros" <rogerq@kernel.org>, "Pawel Laszczak" <pawell@cadence.com>,
 "Nishanth Menon" <nm@ti.com>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Tero Kristo" <kristo@kernel.org>, <linux-usb@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
To: "Peter Chen" <peter.chen@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 4/6] usb: cdns3: support power-off of controller when in
 host role
X-Mailer: aerc 0.15.2
References: <20231113-j7200-usb-suspend-v1-0-ad1ee714835c@bootlin.com>
 <20231113-j7200-usb-suspend-v1-4-ad1ee714835c@bootlin.com>
 <20231114083838.GC64573@nchen-desktop>
 <CWYHLRBFE1X1.15330WETL2R7U@tleb-bootlin-xps13-01>
 <20231117033814.GA485583@nchen-desktop>
In-Reply-To: <20231117033814.GA485583@nchen-desktop>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Fri Nov 17, 2023 at 4:38 AM CET, Peter Chen wrote:
> On 23-11-14 12:10:18, Th=C3=A9o Lebrun wrote:
> > Hello,
> >=20
> > On Tue Nov 14, 2023 at 9:38 AM CET, Peter Chen wrote:
> > > > +	if (cdns->pdata && cdns->pdata->quirks & CDNS3_RESET_ON_RESUME)
> > > > +		cdns->xhci_plat_data->quirks |=3D XHCI_RESET_ON_RESUME | XHCI_SU=
SPEND_RESUME_CLKS;
> > > > +
> > >
> > > If you set this flag, how could you support the USB remote wakeup
> > > request? In that case, the USB bus does not expect re-enumeration.
> >=20
> > We didn't support remote USB wakeup. Only S2R mattered in our case and
> > USB remote wakeup wasn't a possibility.
>
> Without this patch, will below be hit for your platform:
>
> 	/* re-initialize the HC on Restore Error, or Host Controller Error */
> 	if (temp & (STS_SRE | STS_HCE)) {
> 		reinit_xhc =3D true;
> 		if (!xhci->broken_suspend)
> 			xhci_warn(xhci, "xHC error in resume, USBSTS 0x%x, Reinit\n", temp);
> 	}

Yes it hits. The warning as well. How big of an issue is that?

My understanding is that this is the expected behavior with reset on
resume if we don't explicitely pass the flag XHCI_RESET_ON_RESUME. I
don't think we should be having the broken_suspend bit set as its
mentioning some specific quirk on AMD hardware.

Is the only expected difference inbetween having CDNS3_RESET_ON_RESUME &
not having it is resume time? For reference, the status read is 0x411
ie STS_HALT | STS_PCD | STS_SRE. xhc_state is zero.

Regards,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


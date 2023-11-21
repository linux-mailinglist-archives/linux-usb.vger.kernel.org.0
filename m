Return-Path: <linux-usb+bounces-3078-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D057F294F
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 10:49:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9EA4BB217DE
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 09:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352233C07E;
	Tue, 21 Nov 2023 09:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JmBUpE9u"
X-Original-To: linux-usb@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E1210FA;
	Tue, 21 Nov 2023 01:49:19 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EBD971C0018;
	Tue, 21 Nov 2023 09:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700560158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VVEkp3Bfnnrh5RJDI1Xlb1Qdj4wYUKQF4xGHxqUM4cQ=;
	b=JmBUpE9uq6PZ+X/WdiEJxaNOlOT8Fqf1XyntNBFDTBO7n8bYWBZVQ9NmcCr9dcUNnlzU3y
	lM5xsFAHAi/WN7P//bc7ThdqCIJDrAaOJR7N4p7FzT01P7hJrU0gw7jyz8OyK/ALnBVvOC
	8tLbZxeMID73FdYMAG55Ps5UERQgLPzQPbiDMa22dScue550yU1zAapvMgsuD7Buofw5FN
	kwV+8N/JOjcUutaNpe+2JCgSR3m7BPX6zO+Rvk7r+vbnUgYB9BChLCdmagG4o8IKiD9aOZ
	Ik1HIxwRxiumBRKQAve8v1CHCdKXsRRVCZlAMHWOEHXYlM2n1RrrZicYg8L6jg==
Date: Tue, 21 Nov 2023 10:49:17 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Lu jicong <jiconglu58@gmail.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] usb: dwc3: don't reset device side if dwc3 was
 configured as host-only
Message-ID: <20231121104917.0fd67952@kmaincent-XPS-13-7390>
In-Reply-To: <20231117015527.jqoh6i3n4ywg7qui@synopsys.com>
References: <20231116174206.1a823aa3@kmaincent-XPS-13-7390>
	<20231116175959.71f5d060@kmaincent-XPS-13-7390>
	<20231117014038.kbcfnpiefferqomk@synopsys.com>
	<20231117015527.jqoh6i3n4ywg7qui@synopsys.com>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: kory.maincent@bootlin.com

Hello Thinh,

On Fri, 17 Nov 2023 01:55:30 +0000
Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:

> > How many ports do you use? Can you try this:
> >=20
> > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> > index 0328c86ef806..9921c2737829 100644
> > --- a/drivers/usb/dwc3/core.c
> > +++ b/drivers/usb/dwc3/core.c
> > @@ -296,23 +296,28 @@ int dwc3_core_soft_reset(struct dwc3 *dwc)
> >  	if (dwc->dr_mode =3D=3D USB_DR_MODE_HOST) {
> >  		u32 usb3_port;
> >  		u32 usb2_port;
> > +		int i;
> > =20
> > -		usb3_port =3D dwc3_readl(dwc->regs, DWC3_GUSB3PIPECTL(0));
> > -		usb3_port |=3D DWC3_GUSB3PIPECTL_PHYSOFTRST;
> > -		dwc3_writel(dwc->regs, DWC3_GUSB3PIPECTL(0), usb3_port);
> > +		for (i =3D 0; i < 16; i++) {
> > +			usb3_port =3D dwc3_readl(dwc->regs,
> > DWC3_GUSB3PIPECTL(i));
> > +			usb3_port |=3D DWC3_GUSB3PIPECTL_PHYSOFTRST;
> > +			dwc3_writel(dwc->regs, DWC3_GUSB3PIPECTL(i),
> > usb3_port);=20
> > -		usb2_port =3D dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0));
> > -		usb2_port |=3D DWC3_GUSB2PHYCFG_PHYSOFTRST;
> > -		dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(0), usb2_port);
> > +			usb2_port =3D dwc3_readl(dwc->regs,
> > DWC3_GUSB2PHYCFG(i));
> > +			usb2_port |=3D DWC3_GUSB2PHYCFG_PHYSOFTRST;
> > +			dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(i),
> > usb2_port);
> > +		}
> > =20
> >  		/* Small delay for phy reset assertion */
> >  		usleep_range(1000, 2000);
> > =20
> > -		usb3_port &=3D ~DWC3_GUSB3PIPECTL_PHYSOFTRST;
> > -		dwc3_writel(dwc->regs, DWC3_GUSB3PIPECTL(0), usb3_port);
> > +		for (i =3D 0; i < 16; i++) {
> > +			usb3_port &=3D ~DWC3_GUSB3PIPECTL_PHYSOFTRST;
> > +			dwc3_writel(dwc->regs, DWC3_GUSB3PIPECTL(i),
> > usb3_port);=20
> > -		usb2_port &=3D ~DWC3_GUSB2PHYCFG_PHYSOFTRST;
> > -		dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(0), usb2_port);
> > +			usb2_port &=3D ~DWC3_GUSB2PHYCFG_PHYSOFTRST;
> > +			dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(i),
> > usb2_port);
> > +		}
> > =20
> >  		/* Wait for clock synchronization */
> >  		msleep(50);
> > -- =20

Still not working on my side.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


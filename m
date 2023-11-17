Return-Path: <linux-usb+bounces-2954-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ADD7EEE62
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 10:22:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 627791C20992
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 09:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC0AE12E4F;
	Fri, 17 Nov 2023 09:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oDXdhePa"
X-Original-To: linux-usb@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6450D4F;
	Fri, 17 Nov 2023 01:22:11 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65A161BF204;
	Fri, 17 Nov 2023 09:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700212929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wcSMTVB65o0CxA6LAXq51wxe965CmzOoRMyEDRoNDwc=;
	b=oDXdhePaO7wWX8F93nJ220tXSO0PAnWJjCQXdgsljT6UenIxwl0SCHqosxQk1iqgDoajfk
	9hr9TMOK0OP/aoIFj0H1vNVPBf1g+StIMk8UEAVg8EHDy21D1l2cJt7fMUuFU3+yMFYiTz
	33dZxDzu13Dg8X/hjDFJFhJF3B7FeeB0nirLAZQ9v0L4QwDHBQxRHcaglAqOSR2dDUdll1
	iEqgkBpelCoCeVpUAuRGnkt3YPGDvO0hM75voX3OA9+BOSxw8yN8Hml2f+ERbltwJq3RXu
	Hfm8BXklFg1Rzgf2Oop0Pn9knC6cPfpbPBmUc98JyaSjBdcptOK1Tu9jRxJSRw==
Date: Fri, 17 Nov 2023 10:22:08 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Lu jicong <jiconglu58@gmail.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] usb: dwc3: don't reset device side if dwc3 was
 configured as host-only
Message-ID: <20231117102125.44995ad7@kmaincent-XPS-13-7390>
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

> Hi,
>=20
> Sorry, email client issue with your email. Attempt to resend:

Thanks for your quick reply.

>=20
> On Fri, Nov 17, 2023, Thinh Nguyen wrote:
> > Hi,
> >=20
> > On Thu, Nov 16, 2023, K=C3=B6ry Maincent wrote: =20
> > > On Thu, 16 Nov 2023 17:42:06 +0100
> > > K=C3=B6ry Maincent <kory.maincent@bootlin.com> wrote:
> > >  =20
> > > > Hello,
> > > >=20
> > > > Similar issue with ZynqMP board related to that patch:
> > > >=20
> > > > xilinx-psgtr fd400000.phy: lane 3 (type 1, protocol 3): PLL lock ti=
meout
> > > > phy phy-fd400000.phy.3: phy poweron failed --> -110
> > > > dwc3 fe300000.usb: error -ETIMEDOUT: failed to initialize core
> > > >=20
> > > > With CONFIG_USB_DWC3_DUAL_ROLE and dr_mode =3D "host";
> > > >=20
> > > > It may not be the correct fix. =20
> > >=20
> > > Just figured out there was a patch (357191036889 usb: dwc3: Soft reset
> > > phy on probe for host) from Thinh aimed to fix it but the issue is st=
ill
> > > here on ZynqMP.
> > >  =20
> >=20
> > How many ports do you use? Can you try this:

I am using 2 ports.
I will test it out next week as I don't have access to the board until then.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


Return-Path: <linux-usb+bounces-3740-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C97805713
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 15:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 679D2B20FE1
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 14:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B28F865EA8;
	Tue,  5 Dec 2023 14:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="owdQ0/CE"
X-Original-To: linux-usb@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 210BDB9;
	Tue,  5 Dec 2023 06:20:01 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 57F78FF81B;
	Tue,  5 Dec 2023 14:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701786000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lwuiW0STsSMaPhGuAH3x8TpmoKmRnPd9Iuz61of3lF4=;
	b=owdQ0/CE5DFSPIrWuyNxaLrHPOYLgnH9iV1zma4QRazr50vS+SSGKQnYHQe41EJCcj1CC1
	ZWvBgoVH9Ex5P358tWGilWr5tp5+C2WPBWWfrpzx6kXl/e2yx8Qghk+TOJt4cH31PxAM7G
	/n0QRlFUoUM1ziOlqgNfiSVQ/oqcSTZOrzgVUv+4BsNp7uva7AtOzg4QPXaGVzsYuyxpf/
	+eQ2Cr/h7bqBolsTvC4tnMPJissHl8ZwgNU+xvw9pEtQzQIzCktPBiCVQV3h3HIge4zUCX
	bHuAmMSb5EIfmKh1k/1e8VmVaYqvwMIg3WXW2lghdyrW5UvEHnXOInhlm5dhYA==
Date: Tue, 5 Dec 2023 15:19:59 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Lu jicong <jiconglu58@gmail.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] usb: dwc3: don't reset device side if dwc3 was
 configured as host-only
Message-ID: <20231205151959.5236c231@kmaincent-XPS-13-7390>
In-Reply-To: <20231202002625.ujvqghwm42aabc2f@synopsys.com>
References: <20231116174206.1a823aa3@kmaincent-XPS-13-7390>
	<20231116175959.71f5d060@kmaincent-XPS-13-7390>
	<20231117014038.kbcfnpiefferqomk@synopsys.com>
	<20231117015527.jqoh6i3n4ywg7qui@synopsys.com>
	<20231121104917.0fd67952@kmaincent-XPS-13-7390>
	<20231201100954.597bb6de@kmaincent-XPS-13-7390>
	<20231202002625.ujvqghwm42aabc2f@synopsys.com>
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

On Sat, 2 Dec 2023 00:26:34 +0000
Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:

> Hi,
>=20
> On Fri, Dec 01, 2023, K=C3=B6ry Maincent wrote:
> > On Tue, 21 Nov 2023 10:49:17 +0100
> > K=C3=B6ry Maincent <kory.maincent@bootlin.com> wrote:
> >  =20
> > > Hello Thinh,
> > >=20
> > > On Fri, 17 Nov 2023 01:55:30 +0000
> > > Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote: =20
> >  =20
> > > Still not working on my side. =20
> >=20
> > Hello,
> >=20
> > Just wondering if you have received my email as you said having client =
mail
> > issue.
> >  =20
>=20
> Sorry for the delay. Things got busy for me recently.
>=20
> So your platform has multiple ports. Do you use UTMI or ULPI phy?

It uses USB3220 ULPI phy.

> I forgot another thing, the phy reset we're doing now doesn't apply to
> ULPI phys. We may need to teach HCRST to dwc3, this may not look clean.

So that is the reason it does not apply for my case.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


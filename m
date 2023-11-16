Return-Path: <linux-usb+bounces-2933-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 160497EE59F
	for <lists+linux-usb@lfdr.de>; Thu, 16 Nov 2023 18:00:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 462462810E4
	for <lists+linux-usb@lfdr.de>; Thu, 16 Nov 2023 17:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 213043D3A3;
	Thu, 16 Nov 2023 17:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GusDHi9c"
X-Original-To: linux-usb@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3575B7;
	Thu, 16 Nov 2023 09:00:03 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B08EC60015;
	Thu, 16 Nov 2023 17:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700154001; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cCQ0/IarjDk2AeSz5GEPu6ZBFQqxgtxl4OGZFmQ1JMI=;
	b=GusDHi9c1etlEU5WZ31CKGha3ApAmSNGxsRGG5w/l6YOITjb9+5n4XY34/4D1hSXIya7pA
	v8hWUKeLhYphzOILobnv+JUHhtvMRmu/9mewnwI+nc6GHa+gN1j4hqDjA+9vV+hyqFnkFo
	G+YNLrNm/9i6xKaHmpubxQiDZmMTwADkhrL2WYDplLj4GfDtc8qgQGIqD6XJuuBJiHR8wS
	ls0kAq9BVde01GzQXuWnjsj0CCPBYAFQP+7fE9M0i4wgNjajx8u+b9X/oryNRy97osvbak
	K0M0VU1ou+NfIHxJL9D6ZFPhEcfLkVk/q9WyAKLRH7UbPG3epOziMQ1hydgSoA==
Date: Thu, 16 Nov 2023 17:59:59 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Jisheng Zhang <jszhang@kernel.org>, Thinh Nguyen
 <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Lu jicong <jiconglu58@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] usb: dwc3: don't reset device side if dwc3 was
 configured as host-only
Message-ID: <20231116175959.71f5d060@kmaincent-XPS-13-7390>
In-Reply-To: <20231116174206.1a823aa3@kmaincent-XPS-13-7390>
References: <20231116174206.1a823aa3@kmaincent-XPS-13-7390>
Reply-To: <20231116174206.1a823aa3@kmaincent-XPS-13-7390.smtp.subspace.kernel.org>
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

On Thu, 16 Nov 2023 17:42:06 +0100
K=C3=B6ry Maincent <kory.maincent@bootlin.com> wrote:

> Hello,
>=20
> Similar issue with ZynqMP board related to that patch:
>=20
> xilinx-psgtr fd400000.phy: lane 3 (type 1, protocol 3): PLL lock timeout
> phy phy-fd400000.phy.3: phy poweron failed --> -110
> dwc3 fe300000.usb: error -ETIMEDOUT: failed to initialize core
>=20
> With CONFIG_USB_DWC3_DUAL_ROLE and dr_mode =3D "host";
>=20
> It may not be the correct fix.

Just figured out there was a patch (357191036889 usb: dwc3: Soft reset phy =
on
probe for host) from Thinh aimed to fix it but the issue is still here on
ZynqMP.

Regards,

--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


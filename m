Return-Path: <linux-usb+bounces-2902-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4074A7EC693
	for <lists+linux-usb@lfdr.de>; Wed, 15 Nov 2023 16:02:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEFFB28145A
	for <lists+linux-usb@lfdr.de>; Wed, 15 Nov 2023 15:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295EF35F14;
	Wed, 15 Nov 2023 15:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="E+3jtFmS"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A07333CE9;
	Wed, 15 Nov 2023 15:02:44 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58E20101;
	Wed, 15 Nov 2023 07:02:41 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 38517C0009;
	Wed, 15 Nov 2023 15:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700060559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JuMmHRU7WxSl23gr7fM2+35JqsdaCo5TTlvcuNRvn+w=;
	b=E+3jtFmSUSOE6YViMZPusjln94T3SXtiCEd0IMzxKpVCKzYmSPkHnbXxf719uI263jg3fU
	kDJxKA55BPe/Mpfr/ytIS3ce4a3eG7ys9iJ5RbpWzM5jJv7A/3O0ZA4afvz1R8C6oXxdTi
	2Mbi1gq526IQDVFX5Wy76aPo5sAuZ/lDIpNuyKWj6n6w1OBQp6cNfMBHCGiH/zpyKuMX3D
	xwhqarEViBVHku3IGueJo0lUNKFjOTsJW/fn8c3SZ4m4Iym+ICYDlEAOSvcE9BSuZp5TQA
	VOUnhv0tDDzC86GUmc6HafYMofWZHAeGe50PL/OWuoIyBOahYOd2CDA9D5wZ4w==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Nov 2023 16:02:37 +0100
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 3/6] usb: cdns3-ti: add suspend/resume procedures for
 J7200
Cc: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
To: "Roger Quadros" <rogerq@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Peter Chen" <peter.chen@kernel.org>, "Pawel
 Laszczak" <pawell@cadence.com>, "Nishanth Menon" <nm@ti.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>
Message-Id: <CWZH66HQZNYM.T623ZOEEE0BK@tleb-bootlin-xps13-01>
X-Mailer: aerc 0.15.2
References: <20231113-j7200-usb-suspend-v1-0-ad1ee714835c@bootlin.com>
 <20231113-j7200-usb-suspend-v1-3-ad1ee714835c@bootlin.com>
 <5080372b-1f48-4cbc-a6c4-8689c28983cb@kernel.org>
In-Reply-To: <5080372b-1f48-4cbc-a6c4-8689c28983cb@kernel.org>
X-GND-Sasl: theo.lebrun@bootlin.com

Hi Roger,

On Wed Nov 15, 2023 at 12:37 PM CET, Roger Quadros wrote:
> On 13/11/2023 16:26, Th=C3=A9o Lebrun wrote:
> > Hardware initialisation is only done at probe. The J7200 USB controller
> > is reset at resume because of power-domains toggling off & on. We
> > therefore (1) toggle PM runtime at suspend/resume & (2) reconfigure the
> > hardware at resume.
>
> at probe we are doing a pm_runtime_get() and never doing a put thus
> preventing any runtime PM.

Indeed. The get() from probe/resume are in symmetry with the put() from
suspend. Is this wrong in some manner?

> > index c331bcd2faeb..50b38c4b9c87 100644
> > --- a/drivers/usb/cdns3/cdns3-ti.c
> > +++ b/drivers/usb/cdns3/cdns3-ti.c
> > @@ -197,6 +197,50 @@ static int cdns_ti_probe(struct platform_device *p=
dev)
> >  	return error;
> >  }
> > =20
> > +#ifdef CONFIG_PM
> > +
> > +static int cdns_ti_suspend(struct device *dev)
> > +{
> > +	struct cdns_ti *data =3D dev_get_drvdata(dev);
> > +
> > +	if (!of_device_is_compatible(dev_of_node(dev), "ti,j7200-usb"))
> > +		return 0;
> > +
> > +	pm_runtime_put_sync(data->dev);
> > +
> > +	return 0;
>
> You might want to check suspend/resume ops in cdns3-plat and
> do something similar here.

I'm unsure what you are referring to specifically in cdns3-plat?

 - Using pm_runtime_status_suspended() to get the current PM runtime
   state & act on it? I don't see why because we know the pm_runtime
   state is a single put() at probe.

 - Having a `in_lpm` flag to track low-power mode state? I wouldn't see
   why we'd want that as we don't register runtime_suspend &
   runtime_resume callbacks and system syspend/resume can be assumed to
   be called in the right order.

 - Checking the `device_may_wakeup()`? That doesn't apply to this driver
   which cannot be a wakeup source.

Thanks for your review!
Regards,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

------------------------------------------------------------------------



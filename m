Return-Path: <linux-usb+bounces-2936-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF24B7EE70E
	for <lists+linux-usb@lfdr.de>; Thu, 16 Nov 2023 19:56:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3472A281126
	for <lists+linux-usb@lfdr.de>; Thu, 16 Nov 2023 18:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57A53328B6;
	Thu, 16 Nov 2023 18:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Axli57Y0"
X-Original-To: linux-usb@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 464FC181;
	Thu, 16 Nov 2023 10:56:25 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92CCA240005;
	Thu, 16 Nov 2023 18:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700160983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dvolxHvO6BKwJ4vR7RsyEZFAGupNxMo4pjITWoD7r7g=;
	b=Axli57Y07qsWySxQZfDgCSL2+rNtRWyQKDEm1hAO+S4sliiRJ5TPONqbGzf3kyCHxbxkrZ
	1mE4LRhSJDU58pHTuVLcZdcysj7ISVbrgCvWKyM0RxHpK8QYxDnJ5SOh0msW/o4Yqmq67x
	RSsKZyjUi6XHn/wYrNafnrZjvI0HvbZrXSFsqRlzh63pS0ELzV0ii2Iojy4FZM3ltO63At
	DIteCQfycWL+Ifhs89M8pojMdTqGdo1fXGgrzIFhDTUjYs2072KM97xkx7Fqj+AAZScTuO
	7rekoehYzNV6v9fMgYZmwlCdEJ99T9ExywvHNy9FkZPl6yKZz40QaF8lyxIdVg==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Nov 2023 19:56:22 +0100
Subject: Re: [PATCH 3/6] usb: cdns3-ti: add suspend/resume procedures for
 J7200
Cc: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
To: "Roger Quadros" <rogerq@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Peter Chen" <peter.chen@kernel.org>, "Pawel
 Laszczak" <pawell@cadence.com>, "Nishanth Menon" <nm@ti.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Message-Id: <CX0GOP07I40N.198G7LJ0HYDBG@tleb-bootlin-xps13-01>
X-Mailer: aerc 0.15.2
References: <20231113-j7200-usb-suspend-v1-0-ad1ee714835c@bootlin.com>
 <20231113-j7200-usb-suspend-v1-3-ad1ee714835c@bootlin.com>
 <5080372b-1f48-4cbc-a6c4-8689c28983cb@kernel.org>
 <CWZH66HQZNYM.T623ZOEEE0BK@tleb-bootlin-xps13-01>
 <dad980f3-e032-41e4-a1e4-a16a7f45ff95@kernel.org>
In-Reply-To: <dad980f3-e032-41e4-a1e4-a16a7f45ff95@kernel.org>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello Roger,

On Thu Nov 16, 2023 at 1:40 PM CET, Roger Quadros wrote:
> On 15/11/2023 17:02, Th=C3=A9o Lebrun wrote:
> > On Wed Nov 15, 2023 at 12:37 PM CET, Roger Quadros wrote:
> >> On 13/11/2023 16:26, Th=C3=A9o Lebrun wrote:
> >>> Hardware initialisation is only done at probe. The J7200 USB controll=
er
> >>> is reset at resume because of power-domains toggling off & on. We
> >>> therefore (1) toggle PM runtime at suspend/resume & (2) reconfigure t=
he
> >>> hardware at resume.
> >>
> >> at probe we are doing a pm_runtime_get() and never doing a put thus
> >> preventing any runtime PM.
> >=20
> > Indeed. The get() from probe/resume are in symmetry with the put() from
> > suspend. Is this wrong in some manner?
> >=20
> >>> index c331bcd2faeb..50b38c4b9c87 100644
> >>> --- a/drivers/usb/cdns3/cdns3-ti.c
> >>> +++ b/drivers/usb/cdns3/cdns3-ti.c
> >>> @@ -197,6 +197,50 @@ static int cdns_ti_probe(struct platform_device =
*pdev)
> >>>  	return error;
> >>>  }
> >>> =20
> >>> +#ifdef CONFIG_PM
> >>> +
> >>> +static int cdns_ti_suspend(struct device *dev)
> >>> +{
> >>> +	struct cdns_ti *data =3D dev_get_drvdata(dev);
> >>> +
> >>> +	if (!of_device_is_compatible(dev_of_node(dev), "ti,j7200-usb"))
> >>> +		return 0;
> >>> +
> >>> +	pm_runtime_put_sync(data->dev);
> >>> +
> >>> +	return 0;
> >>
> >> You might want to check suspend/resume ops in cdns3-plat and
> >> do something similar here.
> >=20
> > I'm unsure what you are referring to specifically in cdns3-plat?
>
> What I meant is, calling pm_runtime_get/put() from system suspend/resume
> hooks doesn't seem right.
>
> How about using something like pm_runtime_forbid(dev) on devices which
> loose USB context on runtime suspend e.g. J7200.
> So at probe we can get rid of the pm_runtime_get_sync() call.

What is the goal of enabling PM runtime to then block (ie forbid) it in
its enabled state until system suspend?

Thinking some more about it and having read parts of the genpd source,
it's unclear to me why there even is some PM runtime calls in this
driver. No runtime_suspend/runtime_resume callbacks are registered.
Also, power-domains work as expected without any PM runtime calls.

The power domain is turned on when attached to a device
(see genpd_dev_pm_attach). It gets turned off automatically at
suspend_noirq (taking into account the many things that make genpd
complex: multiple devices per PD, subdomains, flags to customise the
behavior, etc.). Removing calls to PM runtime at probe keeps the driver
working.

So my new proposal would be: remove all all PM runtime calls from this
driver. Anything wrong with this approach?

Only possible reason I see for having PM runtime in this wrapper driver
would be cut the full power-domain when USB isn't used, with some PM
runtime interaction with the children node. But that cannot work
currently as we don't register a runtime_resume to init the hardware,
so this cannot be the current expected behavior.

> e.g.
>
>         pm_runtime_set_active(dev);
>         pm_runtime_enable(dev);
>         if (cnds_ti->can_loose_context)
>                 pm_runtime_forbid(dev);
>
>         pm_runtime_set_autosuspend_delay(dev, CNDS_TI_AUTOSUSPEND_DELAY);=
	/* could be 20ms? */

Why mention autosuspend in this driver? This will turn the device off in
CNDS_TI_AUTOSUSPEND_DELAY then nothing enables it back using
pm_runtime_get. We have nothing to reconfigure the device, ie no
runtime_resume, so we must not go into runtime suspend.

>         pm_runtime_mark_last_busy(dev);
>         pm_runtime_use_autosuspend(dev);
>
> You will need to modify the suspend/resume handlers accordingly.
> https://docs.kernel.org/power/runtime_pm.html#runtime-pm-and-system-sleep
>
> What I'm not sure of is if there are any TI platforms that retain USB con=
text
> on power domain off. Let me get back on this. Till then we can assume tha=
t
> all platforms loose USB context on power domain off.

Good question indeed! Thanks for looking into it. From what I see all 5
DT nodes which use this driver in upstream devicetrees have a
power-domain configured. So if the behavior is the same on all three TI
platforms (which would be the logical thing to assume) it would make
sense that all controllers lose power at suspend.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


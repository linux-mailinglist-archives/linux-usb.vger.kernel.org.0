Return-Path: <linux-usb+bounces-2956-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCDC7EEFF0
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 11:18:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CAC83B20A42
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 10:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751E918B1D;
	Fri, 17 Nov 2023 10:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YJVEvi2f"
X-Original-To: linux-usb@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC85BC1;
	Fri, 17 Nov 2023 02:17:57 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68BD7C0003;
	Fri, 17 Nov 2023 10:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700216276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NrnMvNkij+pm+ptSQQPTR3DS11MmkWMm02wu6vVa9G4=;
	b=YJVEvi2fbCzXl6yb1+NDpyTGrjd0huD9Rht0w8qWS9fKDB12gcR8pk4cO1A/9fcw41VC77
	OsqS2dR7/gTpQp0ZeoluEt4UE5WeNfdEKRSx96PBSTq0lG5cN0YBeAHlXVWRdGbGU6bCe9
	pRdyqJmYSv1rvwa72r7kJycr6qW5nx4JPOD8s6avtasNVZMSsUgNIVOhuHc334El06L3Vz
	+JtHZshd7pczvusNmBl+vGb9uCmJkYU3Z2Gwf7osEISYtnB0HMGopNj5zL1z0t7GOsPykG
	n9s/CkcyQ1KhU8Gkcnb0qca29Jnfu3/wL/BfSf49zWxIWlaZWO9uvX0EPQ43XA==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Nov 2023 11:17:55 +0100
Cc: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
To: "Roger Quadros" <rogerq@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Peter Chen" <peter.chen@kernel.org>, "Pawel
 Laszczak" <pawell@cadence.com>, "Nishanth Menon" <nm@ti.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>,
 "Vardhan, Vibhore" <vibhore@ti.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 3/6] usb: cdns3-ti: add suspend/resume procedures for
 J7200
Message-Id: <CX10D9YX1O1C.30PF317AG065N@tleb-bootlin-xps13-01>
X-Mailer: aerc 0.15.2
References: <20231113-j7200-usb-suspend-v1-0-ad1ee714835c@bootlin.com>
 <20231113-j7200-usb-suspend-v1-3-ad1ee714835c@bootlin.com>
 <5080372b-1f48-4cbc-a6c4-8689c28983cb@kernel.org>
 <CWZH66HQZNYM.T623ZOEEE0BK@tleb-bootlin-xps13-01>
 <dad980f3-e032-41e4-a1e4-a16a7f45ff95@kernel.org>
 <CX0GOP07I40N.198G7LJ0HYDBG@tleb-bootlin-xps13-01>
 <bdea68ad-7523-4738-8fa1-b670d81a6b93@kernel.org>
In-Reply-To: <bdea68ad-7523-4738-8fa1-b670d81a6b93@kernel.org>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Thu Nov 16, 2023 at 10:44 PM CET, Roger Quadros wrote:
> On 16/11/2023 20:56, Th=C3=A9o Lebrun wrote:
> > On Thu Nov 16, 2023 at 1:40 PM CET, Roger Quadros wrote:
> >> On 15/11/2023 17:02, Th=C3=A9o Lebrun wrote:
> >>> On Wed Nov 15, 2023 at 12:37 PM CET, Roger Quadros wrote:
> >>>> You might want to check suspend/resume ops in cdns3-plat and
> >>>> do something similar here.
> >>>
> >>> I'm unsure what you are referring to specifically in cdns3-plat?
> >>
> >> What I meant is, calling pm_runtime_get/put() from system suspend/resu=
me
> >> hooks doesn't seem right.
> >>
> >> How about using something like pm_runtime_forbid(dev) on devices which
> >> loose USB context on runtime suspend e.g. J7200.
> >> So at probe we can get rid of the pm_runtime_get_sync() call.
> >=20
> > What is the goal of enabling PM runtime to then block (ie forbid) it in
> > its enabled state until system suspend?
>
> If USB controller retains context on runtime_suspend on some platforms
> then we don't want to forbid PM runtime.

What's the point of runtime PM if nothing is done based on it? This is
the current behavior of the driver.

> > Thinking some more about it and having read parts of the genpd source,
> > it's unclear to me why there even is some PM runtime calls in this
> > driver. No runtime_suspend/runtime_resume callbacks are registered.
> > Also, power-domains work as expected without any PM runtime calls.
>
> Probably it was required when the driver was introduced.

I'm not seeing any behavior change in cdns3-ti since its addition in Oct
2019.

> > The power domain is turned on when attached to a device
> > (see genpd_dev_pm_attach). It gets turned off automatically at
> > suspend_noirq (taking into account the many things that make genpd
> > complex: multiple devices per PD, subdomains, flags to customise the
> > behavior, etc.). Removing calls to PM runtime at probe keeps the driver
> > working.
> >=20
> > So my new proposal would be: remove all all PM runtime calls from this
> > driver. Anything wrong with this approach?
>
> Nothing wrong if we don't expect runtime_pm to work with this driver.
>
> >=20
> > Only possible reason I see for having PM runtime in this wrapper driver
> > would be cut the full power-domain when USB isn't used, with some PM
> > runtime interaction with the children node. But that cannot work
> > currently as we don't register a runtime_resume to init the hardware,
> > so this cannot be the current expected behavior.
> >=20
> >> e.g.
> >>
> >>         pm_runtime_set_active(dev);
> >>         pm_runtime_enable(dev);
> >>         if (cnds_ti->can_loose_context)
> >>                 pm_runtime_forbid(dev);
> >>
> >>         pm_runtime_set_autosuspend_delay(dev, CNDS_TI_AUTOSUSPEND_DELA=
Y);	/* could be 20ms? */
> >=20
> > Why mention autosuspend in this driver? This will turn the device off i=
n
> > CNDS_TI_AUTOSUSPEND_DELAY then nothing enables it back using
> > pm_runtime_get. We have nothing to reconfigure the device, ie no
> > runtime_resume, so we must not go into runtime suspend.
>
> It would be enabled/disabled based on when the child "cdns3,usb"
> does runtime_resume/suspend.

Why care about being enabled or disabled if we don't do anything based
on that? Children does do runtime PM stuff but I don't understand how
that could influence us.

Regards,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


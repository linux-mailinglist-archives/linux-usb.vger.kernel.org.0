Return-Path: <linux-usb+bounces-2963-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB847EF455
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 15:21:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B11371F2634B
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 14:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB48321B8;
	Fri, 17 Nov 2023 14:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AY3jmh9h"
X-Original-To: linux-usb@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1935DD63;
	Fri, 17 Nov 2023 06:20:47 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45106C0005;
	Fri, 17 Nov 2023 14:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700230846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A7DGBR0dkS+OrVfnBIKiOX0inpfDHFx2Yamqr04yBT8=;
	b=AY3jmh9h98qwoUR+Hqo7x9nmLegoG7h9iwphY783CZ6nJnE0zvCSGVp3HL1s5aNewLRO6+
	EsB72lNlzT7C5GDQXUcwyGk6tc8gibBCQDmcnYXBnMpatGc1q3h2sk70PafLsPdUgF6FvB
	rQa7JYrfm7P4b135D8rQCS8HwarDOQXLpECUfW/ID72q6pL3p1kJdf30yNyMo0eI+SyOa2
	3UNCNyxlK8eCkIQWMG909DcAMTqQLLHGj8xZP1yYoNq+yTko5I0NL+BHgZnTTaWrN4rW9B
	CDcD9OTEdqm9JH1E5X6WO5oo+ZTGF+ss7VGaCSVvOQ8HrdUHGpnBLBKKY+hSFg==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Nov 2023 15:20:44 +0100
Message-Id: <CX15J7B8F8HH.1WZ10OOW31X1H@tleb-bootlin-xps13-01>
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
 Raghavendra" <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>,
 "Vardhan, Vibhore" <vibhore@ti.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.15.2
References: <20231113-j7200-usb-suspend-v1-0-ad1ee714835c@bootlin.com>
 <20231113-j7200-usb-suspend-v1-3-ad1ee714835c@bootlin.com>
 <5080372b-1f48-4cbc-a6c4-8689c28983cb@kernel.org>
 <CWZH66HQZNYM.T623ZOEEE0BK@tleb-bootlin-xps13-01>
 <dad980f3-e032-41e4-a1e4-a16a7f45ff95@kernel.org>
 <CX0GOP07I40N.198G7LJ0HYDBG@tleb-bootlin-xps13-01>
 <bdea68ad-7523-4738-8fa1-b670d81a6b93@kernel.org>
 <CX10D9YX1O1C.30PF317AG065N@tleb-bootlin-xps13-01>
 <3e00b2ad-b58f-4b09-9230-683c58d3bb92@kernel.org>
In-Reply-To: <3e00b2ad-b58f-4b09-9230-683c58d3bb92@kernel.org>
X-GND-Sasl: theo.lebrun@bootlin.com

Hi Roger,

On Fri Nov 17, 2023 at 12:51 PM CET, Roger Quadros wrote:
> On 17/11/2023 12:17, Th=C3=A9o Lebrun wrote:
> > On Thu Nov 16, 2023 at 10:44 PM CET, Roger Quadros wrote:
> >> On 16/11/2023 20:56, Th=C3=A9o Lebrun wrote:
> >>> On Thu Nov 16, 2023 at 1:40 PM CET, Roger Quadros wrote:
> >>>> On 15/11/2023 17:02, Th=C3=A9o Lebrun wrote:
> >>>>> On Wed Nov 15, 2023 at 12:37 PM CET, Roger Quadros wrote:
> >>>>>> You might want to check suspend/resume ops in cdns3-plat and
> >>>>>> do something similar here.
> >>>>>
> >>>>> I'm unsure what you are referring to specifically in cdns3-plat?
> >>>>
> >>>> What I meant is, calling pm_runtime_get/put() from system suspend/re=
sume
> >>>> hooks doesn't seem right.
> >>>>
> >>>> How about using something like pm_runtime_forbid(dev) on devices whi=
ch
> >>>> loose USB context on runtime suspend e.g. J7200.
> >>>> So at probe we can get rid of the pm_runtime_get_sync() call.
> >>>
> >>> What is the goal of enabling PM runtime to then block (ie forbid) it =
in
> >>> its enabled state until system suspend?
> >>
> >> If USB controller retains context on runtime_suspend on some platforms
> >> then we don't want to forbid PM runtime.
> >=20
> > What's the point of runtime PM if nothing is done based on it? This is
> > the current behavior of the driver.
>
> Even if driver doesn't have runtime_suspend/resume hooks, wouldn't=20
> the USB Power domain turn off if we enable runtime PM and allow runtime
> autosuspend and all children have runtime suspended?

That cannot be the currently desired behavior as it would require a
runtime_resume implementation that restores this wrapper to its desired
state.

It could however be something that could be implemented. It would be a
matter of enabling PM runtime and that is it in the probe. No need to
even init the hardware in the probe. Then the runtime_resume
implementation would call the new cdns_ti_init_hw.

This is what the cdns3-imx wrapper is doing in a way, though what they
need is clocks rather than some registers to be written.

That all feels like outside the scope of the current patch series
though.

My suggestion for V2 would still therefore be to remove all PM runtime
as it has no impact. It could be added later down the road if cutting
the power-domain is a goal of yours.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


Return-Path: <linux-usb+bounces-3240-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 346CF7F5BAE
	for <lists+linux-usb@lfdr.de>; Thu, 23 Nov 2023 10:52:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 579851C20D62
	for <lists+linux-usb@lfdr.de>; Thu, 23 Nov 2023 09:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F96722313;
	Thu, 23 Nov 2023 09:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Bz0ugCia"
X-Original-To: linux-usb@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11C5CD42;
	Thu, 23 Nov 2023 01:52:02 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C89B5240006;
	Thu, 23 Nov 2023 09:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700733121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zyMutEOmdJnz3l88DBLyC6gJz9PpV2Ji4qEz2+3eg9Y=;
	b=Bz0ugCiaTYRdqPGr5TrGuDA3SRxmy55Apb7lAKLIX4v19SIV71sBWSiKs+0G94SYZ+r+I9
	utGEzx6CdRshIaI0Zhs0jLuq7QoXyWsR2AtLtmuAtewZ8FS+IAnnQfRmnYkLr4ktgxJxW3
	RlzsCA9cs2Ka10S635ihrSh0hQkUUv/eUAKcBFZNnovIWGphYExvR3IMsCSZ983rppK57b
	2SXZn3+RMsVymY8o9J6gy/1NSk96SpG7bsQSceX84pE53D8R9R2/lLe5kDNJMdEw4diKf2
	SP5ePcA2FToPEGaCdVbEm/SHbpRuQwSb2rbA7I+POpzSj7OZAwlhkLW/TetIRQ==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Nov 2023 10:51:59 +0100
Subject: Re: [PATCH 3/6] usb: cdns3-ti: add suspend/resume procedures for
 J7200
Cc: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
To: "Kevin Hilman" <khilman@kernel.org>, "Roger Quadros"
 <rogerq@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rob Herring" <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Peter Chen" <peter.chen@kernel.org>, "Pawel Laszczak"
 <pawell@cadence.com>, "Nishanth Menon" <nm@ti.com>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>, "Vardhan, Vibhore"
 <vibhore@ti.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Message-Id: <CX63KP2UPL1N.J9Q344Q06IGP@tleb-bootlin-xps13-01>
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
 <CX15J7B8F8HH.1WZ10OOW31X1H@tleb-bootlin-xps13-01>
 <7h34wxfmwn.fsf@baylibre.com>
In-Reply-To: <7h34wxfmwn.fsf@baylibre.com>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Wed Nov 22, 2023 at 11:23 PM CET, Kevin Hilman wrote:
> Th=C3=A9o Lebrun <theo.lebrun@bootlin.com> writes:
> > On Fri Nov 17, 2023 at 12:51 PM CET, Roger Quadros wrote:
> >> On 17/11/2023 12:17, Th=C3=A9o Lebrun wrote:
> >> > On Thu Nov 16, 2023 at 10:44 PM CET, Roger Quadros wrote:
> >> >> On 16/11/2023 20:56, Th=C3=A9o Lebrun wrote:
> >> >>> On Thu Nov 16, 2023 at 1:40 PM CET, Roger Quadros wrote:
> >> >>>> On 15/11/2023 17:02, Th=C3=A9o Lebrun wrote:
> >> >>>>> On Wed Nov 15, 2023 at 12:37 PM CET, Roger Quadros wrote:
> >> >>>>>> You might want to check suspend/resume ops in cdns3-plat and
> >> >>>>>> do something similar here.
> >> >>>>>
> >> >>>>> I'm unsure what you are referring to specifically in cdns3-plat?
> >> >>>>
> >> >>>> What I meant is, calling pm_runtime_get/put() from system suspend=
/resume
> >> >>>> hooks doesn't seem right.
> >> >>>>
> >> >>>> How about using something like pm_runtime_forbid(dev) on devices =
which
> >> >>>> loose USB context on runtime suspend e.g. J7200.
> >> >>>> So at probe we can get rid of the pm_runtime_get_sync() call.
> >> >>>
> >> >>> What is the goal of enabling PM runtime to then block (ie forbid) =
it in
> >> >>> its enabled state until system suspend?
> >> >>
> >> >> If USB controller retains context on runtime_suspend on some platfo=
rms
> >> >> then we don't want to forbid PM runtime.
> >> >=20
> >> > What's the point of runtime PM if nothing is done based on it? This =
is
> >> > the current behavior of the driver.
>
> The point is to signal to the power domain the device is in that it can
> power on/off.  These IP blocks are (re)used on many different SoCs, so
> the driver should not make any assumptions about what power domain it is
> in (if any.)

On my platform, when the device is attached to the PD it gets turned on.
That feels logical to me: if a driver is not RPM aware it "just works".
Are there platforms where RPM must get enabled for the attached
power-domains to be turned on?

The call chain that attaches & enables PD is platform_probe ->
dev_pm_domain_attach. That function takes a bool power_on which is
always true. In the genpd case, genpd_dev_pm_attach
calls __genpd_dev_pm_attach which does a genpd_power_on.

Things I've not accounted for:

 - ACPI looks like it does the same but I've not checked. It gets passed
   the power_on bool argument.

 - genpd_dev_pm_attach early returns with no error if there are multiple
   PM domains attached to the device. There are many platforms in the
   case according to some devicetree grepping. I can imagine a behavior
   difference where dev_pm_domain callpaths handle that differently in
   the RPM case. Is that what we are discussing?

> >> Even if driver doesn't have runtime_suspend/resume hooks, wouldn't=20
> >> the USB Power domain turn off if we enable runtime PM and allow runtim=
e
> >> autosuspend and all children have runtime suspended?
> >
> > That cannot be the currently desired behavior as it would require a
> > runtime_resume implementation that restores this wrapper to its desired
> > state.
>
> Or, for this USB IP block to be in a power domain that has memory
> retention, in which case the power domain can still go off to save
> power, but not lose context.
>
> > It could however be something that could be implemented. It would be a
> > matter of enabling PM runtime and that is it in the probe. No need to
> > even init the hardware in the probe. Then the runtime_resume
> > implementation would call the new cdns_ti_init_hw.
>
> This is the way.

I agree & I have a prototype, but that requires some work on the child
devices as from what I remember they are not eager to go to runtime
suspend (ie a driver might be holding a reference).

I feel this leans outside the scope of this patch series though.

Regards,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


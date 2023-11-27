Return-Path: <linux-usb+bounces-3360-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A097FA102
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 14:26:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56B3E1C20D1A
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 13:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C122E654;
	Mon, 27 Nov 2023 13:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eY5eglF9"
X-Original-To: linux-usb@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E65485;
	Mon, 27 Nov 2023 05:26:01 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 608B7C000D;
	Mon, 27 Nov 2023 13:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701091560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A2YChlyfbMPmIhM4ZAtNvRzQpOjcTZdxdAoI6XnzuAM=;
	b=eY5eglF9GmoTKCK3yOrebScc9pb2iRDEQFN2aINDLK4+baN8wZ41yC4OrCcEpBqUHqG2qJ
	CMIPi8PMAIl5AsfSZiEKZC7Je3gUH+B6tak719ivTd3DCtml+YoMscAw7XPAK5wHJCnu4o
	uo0a9lPsRwfdFzR5kg1hmTTF/M1+NALjQjcY1KzX2uBxJgyxnx7GqmZt8FjLlv2e6Ytr4F
	PPeq95Qb69Jb33tuyNXQ7qJ1DPFXjuQeDxlaS+a42yaHxVGVtTRIpMuOI1tFkhT8qY/I+B
	SGavC6PPR1ICEe7NgXliY+GHENhMQWXlhkvAPJQ/8oNgY+Kt76754c780+9bqg==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Nov 2023 14:25:58 +0100
Message-Id: <CX9MMPFL7HAY.NGULD1FN5WPN@tleb-bootlin-xps13-01>
To: "Kevin Hilman" <khilman@kernel.org>, "Roger Quadros"
 <rogerq@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rob Herring" <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Peter Chen" <peter.chen@kernel.org>, "Pawel Laszczak"
 <pawell@cadence.com>, "Nishanth Menon" <nm@ti.com>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>, "Vardhan, Vibhore"
 <vibhore@ti.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 3/6] usb: cdns3-ti: add suspend/resume procedures for
 J7200
Cc: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
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
 <CX63KP2UPL1N.J9Q344Q06IGP@tleb-bootlin-xps13-01>
 <7hil5odtwl.fsf@baylibre.com>
In-Reply-To: <7hil5odtwl.fsf@baylibre.com>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Sun Nov 26, 2023 at 11:36 PM CET, Kevin Hilman wrote:
> Th=C3=A9o Lebrun <theo.lebrun@bootlin.com> writes:
> > On Wed Nov 22, 2023 at 11:23 PM CET, Kevin Hilman wrote:
> >> Th=C3=A9o Lebrun <theo.lebrun@bootlin.com> writes:
> >> The point is to signal to the power domain the device is in that it ca=
n
> >> power on/off.  These IP blocks are (re)used on many different SoCs, so
> >> the driver should not make any assumptions about what power domain it =
is
> >> in (if any.)
> >
> > On my platform, when the device is attached to the PD it gets turned on=
.
> > That feels logical to me: if a driver is not RPM aware it "just works".
>
> It "just works"... until the domain gets turned off.
>
> > Are there platforms where RPM must get enabled for the attached
> > power-domains to be turned on?
>
> Yes, but but more importantly, there are platforms where RPM must get
> enabled for the power domain to *stay* on.  For example, the power
> domain might get turned on due to devices probing etc, but as soon as
> all the RPM-enabled drivers drop their refcount, the domain will turn
> off.  If there is a device in that domain with a non-RPM enabled driver,
> that device will be powered off anc cause a crash.

OK, that makes sense, thanks for taking the time to explain. This topic
makes me see two things that I feel are close to being bugs. I'd be
curious to get your view on both.

 - If a device does not use RPM but its children do, it might get its
   associated power-domain turned off. That forces every single driver
   that want to stay alive to enable & increment RPM.

   What I naively expect: a genpd with a device attached to it that is
   not using RPM should mean that it should not be powered off at
   runtime_suspend. Benefit: no RPM calls in drivers that do not use
   it, and the behavior is that the genpd associated stays alive "as
   expected".

 - If a device uses RPM & has a refcount strictly positive, its
   associated power-domain gets turned off either way at suspend_noirq.
   That feels non-intuitive as well.

   What I naively expect: check for RPM refcounts of attached devices
   when doing suspend_noirq of power-domains. Benefit: control of what
   power-domains do from attached devices is done through the RPM API.

Regards,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


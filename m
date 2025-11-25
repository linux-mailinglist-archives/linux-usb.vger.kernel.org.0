Return-Path: <linux-usb+bounces-30919-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 78474C85CDC
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 16:39:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3B4D64E1B7B
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 15:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B00328B66;
	Tue, 25 Nov 2025 15:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MCc+hhdC"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695852C0F68;
	Tue, 25 Nov 2025 15:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764085151; cv=none; b=hO9tb57daU1W11lu4rduCWKUuWKyv9uwqPnH3DK+V167TfWzwPfl59HstOg+t2YtBlvfYy2MYgjIkws54+1X/uSQrsfgDxlVIS+5pB2jyUUAaunqtT4+7rJrod5ivnjtTvlOQdL6tO4p4GCRsFzGybgKPmrjrpE3ZhI4vcx1EVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764085151; c=relaxed/simple;
	bh=bL6F9BP19l720jazLGjPDESOU5kH/67G9R7w1MrskIc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=Av0cOTdzKPx2NGxBYvkEFfT3ydbn40axuGH2YfADWEBGbsLoQ3nFfT0EMjO/FrD/JCqV8n2Ml0k0tmaJ6v0ylJy0MtzkjrzGLp4j0LNyJ/lpX0LrLqequfgIUEWbK5Fcs/IDHv6x99aBysiNnYu9P45djfJUktnXuARD+nMo3I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MCc+hhdC; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D9129C15D58;
	Tue, 25 Nov 2025 15:38:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6C868606A1;
	Tue, 25 Nov 2025 15:39:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8395D102F0882;
	Tue, 25 Nov 2025 16:39:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764085145; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OfcHT/mK9zrCHFG5SR4twzWED90UElK1Zz1lJ4jB21M=;
	b=MCc+hhdCUummg+ORkxsbfOLCaUWnZ+IKmgYF9CVQXRhM47JunkywIVzvC+WmPHBzjp0fiF
	Va+jLUlOrqKX8D/nKEg2U1V/6BRHfwWsSzb/YlQyIvpEavZPcjE2EWhIKa5OTwv0ZI9agE
	k0ezSJ+sH8TkXVzCHwI9rE1yTqsyYejtKNicD29M7xTTf4JXgNQRrpM+23HRHldMlbwiuS
	qOeVOSbg4dLRLEh2PTMgEX33jDMzeJdivV34C/G1G5094VHkI/Njg3ExDi15yO88W+7U1n
	WSzZQqJiWiOttT4RzeCu5naeGTm7Nt77uOrxMwqcLN2RrH5jZjCFEFoWZzg7rQ==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Nov 2025 16:39:01 +0100
Message-Id: <DEHVZPZVWVTR.314J3P86OLG6X@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 2/2] phy: rockchip: inno-usb2: fix communication
 disruption in gadget mode
Cc: "Kever Yang" <kever.yang@rock-chips.com>, "Minas Harutyunyan"
 <Minas.Harutyunyan@synopsys.com>, "Alan Stern" <stern@rowland.harvard.edu>,
 "Louis Chauvet" <louis.chauvet@bootlin.com>, =?utf-8?q?Herv=C3=A9_Codina?=
 <herve.codina@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <linux-phy@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Vinod Koul"
 <vkoul@kernel.org>, "Kishon Vijay Abraham I" <kishon@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "William Wu" <wulf@rock-chips.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-0-239872f05f17@bootlin.com> <20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-2-239872f05f17@bootlin.com>
In-Reply-To: <20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-2-239872f05f17@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Luca,

On Tue Jul 22, 2025 at 10:43 AM CEST, Luca Ceresoli wrote:
> When the OTG USB port is used to power to SoC, configured as peripheral a=
nd
> used in gadget mode, communication stops without notice about 6 seconds
> after the gadget is configured and enumerated.
>
> The problem was observed on a Radxa Rock Pi S board, which can only be
> powered by the only USB-C connector. That connector is the only one usabl=
e
> in gadget mode. This implies the USB cable is connected from before boot
> and never disconnects while the kernel runs.
>
> The related code flow in the PHY driver code can be summarized as:
>
>  * UDC start code (triggered via configfs at any time after boot)
>    -> phy_init
>        -> rockchip_usb2phy_init
>            -> schedule_delayed_work(otg_sm_work [A], 6 sec)
>    -> phy_power_on
>        -> rockchip_usb2phy_power_on
>            -> enable clock
>            -> rockchip_usb2phy_reset

The above code flow summary was important for [PATCH 1/2] but it feels
like not as important for [PATCH 2/2], could you drop or summarise it?
The key point is that the below DCD sequence has invalid assumptions
and does side effects that don't fit if VBUS is already present. I feel
like it distracted me from the main point that is chg_det.opmode
writes.

>  * Now the gadget interface is up and running.
>
>  * 6 seconds later otg_sm_work starts [A]
>    -> rockchip_usb2phy_otg_sm_work():
>        if (B_IDLE state && VBUS present && ...):
>            schedule_delayed_work(&rport->chg_work [B], 0);
>
>  * immediately the chg_detect_work starts [B]
>    -> rockchip_chg_detect_work():
>        if chg_state is UNDEFINED:
>             property_enable(base, &rphy->phy_cfg->chg_det.opmode, false);=
 [Y]
>
>  * rockchip_chg_detect_work() changes state and re-triggers itself a few
>    times until it reached the DETECTED state:
>    -> rockchip_chg_detect_work():
>        if chg_state is DETECTED:
>             property_enable(base, &rphy->phy_cfg->chg_det.opmode, true); =
[Z]
>
> At [Y] there is no disconnection and the USB device appears still present
> to userspace, but all existing communications stop. E.g. using a CDC seri=
al
> gadget, the /dev/tty* devices are still present on both host and device,
> but no data is transferred anymore. The later call with a 'true' argument
> at [Z] does not restore it.

You mention "there is no disconnection" but that sounds irrelevant to
this precise commit. The issue at hand is a communication halt.

> Due to the lack of documentation, what chg_det.opmode does exactly is not
> clear, however by code inspection it seems reasonable that is disables
> something needed to keep the communication working, and testing proves th=
at
> disabling these lines lefs gadget mode keep working. So prevent changes t=
o
> chg_det.opmode when there is a cable connected (VBUS present).

"lefs" -> "let's", I think

With those nits

Reviewed-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



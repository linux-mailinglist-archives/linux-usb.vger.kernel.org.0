Return-Path: <linux-usb+bounces-30918-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 055D8C85C5B
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 16:28:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF37A3B1799
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 15:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374B3328611;
	Tue, 25 Nov 2025 15:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="K/Fp02xZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80939328270
	for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 15:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764084499; cv=none; b=oplzm/P4H8SuowLmOLArk3XjtWqVAU9gDVNWzTQTSq21VyGoc7CzNzBo8IkA+31vYP2AvmScHSZTFyF34NUiOCe/ptnoCuNnQ1Em7Xe6SuqEUkPSEkI6Ch2eT7YUr6AdN4Hq75WARiqZR5acOg9Wik/I0Lba4fcb+z69q/Pr7Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764084499; c=relaxed/simple;
	bh=8fYEhqwjtL0SpYOBHBwg8VU9hDJ6wtd6dNewyrP9amA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=rwbIdzxE6UMO28FCvgmfMwAdV+awae39dydXV9lyBtvG6wtFKxklMrwizkrUj1dAdZFC4xlDmkn/QpI6s+3LMyQtQbUE7jhlNgaBSVBD710gIiYzGo5bbom/kQu9ERjMS0dtkB973XvB12tzwKcenfItRp/naRHY0R7iGOjKKJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=K/Fp02xZ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 865891A1D45;
	Tue, 25 Nov 2025 15:28:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 59A4C606A1;
	Tue, 25 Nov 2025 15:28:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D30E1102F07FE;
	Tue, 25 Nov 2025 16:28:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764084489; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HgxEQ0f8MNjzesLOK80vetYWR3YMKzv8RvyUGva3XLk=;
	b=K/Fp02xZ1WhDXcE/vwFa8uDqUxs4cBpya3Uwrcrop9bEq7pfenZOXIQyIXmx2DHkO7Vgru
	QqSq4h0+JFNQ4AA67Sn0cYZHfB1XsjSR1ooUUoj8w1JL9dwGdr5FK/bNugHt3wAJe41uYr
	uAX2fsP/UxHVQy6Cp+qpfCDuelKkDjEso0lEUbKRDvXz3BX5Oo6QQjoSWTQ/RBxJyF4tNg
	aiVyQt7GC6EQJPS67xcwL2bBmQY3GHV8dd9afsLEylbbo+dcisEEf93H8jk/AzarBLOuX9
	3d+Hht7rhKBAo9weo3A/zJ1cvtKmN9Mkk5o3USEarkGCBY+ykGchBqPb5EvKaw==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Nov 2025 16:28:04 +0100
Message-Id: <DEHVRC8CY12S.3LSC6UVSMU0C1@bootlin.com>
Subject: Re: [PATCH 1/2] phy: rockchip: inno-usb2: fix disconnection in
 gadget mode
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
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-0-239872f05f17@bootlin.com> <20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-1-239872f05f17@bootlin.com>
In-Reply-To: <20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-1-239872f05f17@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Luca,

On Tue Jul 22, 2025 at 10:43 AM CEST, Luca Ceresoli wrote:
> From: Louis Chauvet <louis.chauvet@bootlin.com>
>
> When the OTG USB port is used to power to SoC, configured as peripheral a=
nd

typo: is used to power *the* SoC

> used in gadget mode, there is a disconnection about 6 seconds after the
> gadget is configured and enumerated.
>
> The problem was observed on a Radxa Rock Pi S board, which can only be
> powered by the only USB-C connector. That connector is the only one usabl=
e

"which can only be powered by the only USB-C connector"
double "only" makes it a super exclusive connector!

> in gadget mode. This implies the USB cable is connected from before boot
> and never disconnects while the kernel runs.
>
> The problem happens because of the PHY driver code flow, summarized as:
>
>  * UDC start code (triggered via configfs at any time after boot)
>    -> phy_init
>        -> rockchip_usb2phy_init
>            -> schedule_delayed_work(otg_sm_work [A], 6 sec)
>    -> phy_power_on
>        -> rockchip_usb2phy_power_on
>            -> enable clock
>            -> rockchip_usb2phy_reset
>
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
>            if (!rport->suspended):
>                rockchip_usb2phy_power_off() <--- [X]
>
> At [X], the PHY is powered off, causing a disconnection. This quickly
> triggers a new connection and following re-enumeration, but any connectio=
n
> that had been established during the 6 seconds is broken.
>
> The code already checks for !rport->suspended, so add a guard for VBUS as
> well to avoid a disconnection when a cable is connected.

Your commit message was clear but I was missing one key point: what
rport->suspended means. It isn't what I first thought. Instead it means
phy is powered off. Naming is bad but unrelated to your series. Maybe
add a comment to your commit message like the following?

  The code already checks for !rport->suspended (PHY is powered on), ...

> Fixes: 98898f3bc83c ("phy: rockchip-inno-usb2: support otg-port for rk339=
9")
> Closes: https://lore.kernel.org/lkml/20250414185458.7767aabc@booty/
> Co-developed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

I believe there is an issue with your SoB ordering. It is meant to
signal the path's route from author into the kernel tree. In that
sense, it should start with author followed by you as submitter. Then
the maintainer will append its own.

Documentation/process/submitting-patches.rst is semi-explicitly writing
that out:
> Any further SoBs [...] following the author's SoB [...]
https://elixir.bootlin.com/linux/v6.17.9/source/Documentation/process/submi=
tting-patches.rst#L449-L453

One good way to check is that all maintainers always append their SoB
rather than prepend.

With that,

Reviewed-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



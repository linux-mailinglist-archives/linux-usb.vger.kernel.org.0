Return-Path: <linux-usb+bounces-30993-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D86C8DB8D
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 11:18:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E490A34CE7C
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 10:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55598328B61;
	Thu, 27 Nov 2025 10:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YrQfQhb+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69C7319879
	for <linux-usb@vger.kernel.org>; Thu, 27 Nov 2025 10:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764238734; cv=none; b=uj1m3KZ4/hjjCQNaTACs27PSTwfpfd16rwXxUT5/BLBEjx31/pcgHSR0FU3nn9ojEAbnxTHNY8UvqZnAawd3GxfTjr7ARAqTVy6ZW1/PVyihnvrjASrmNgdcI+bZNHyfZEhOfvjuT8yIEgY/AIp4CbfBFgXEbgoXWYXV5V+unIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764238734; c=relaxed/simple;
	bh=DCmLa5t7ufZn9BnDZV/wdhgLibXWoZNWmJGzXmgcQqY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=qvcUGty+j1ok8H/pP34bOJr0j3RoLT0huceKUqzlG7VqQEP1zOdikA9LpqEwKHt1jfIWiyf17O4Ng0fHSHFGJO371ag+oZxzn2a+jqIIqV/0WKi8oBNL81mCcjpAu+5yjR4D6WB/axS1+rPd9NhQUloyLZf6cKDeONn/0gnPoJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YrQfQhb+; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3209B4E4191D;
	Thu, 27 Nov 2025 10:18:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0474D6068C;
	Thu, 27 Nov 2025 10:18:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0A079102F08C5;
	Thu, 27 Nov 2025 11:18:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764238730; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LgG9gPlkIJWvQG8qqwMiPTiG2WAG9DKgMroYDQ2bIs4=;
	b=YrQfQhb+6aDx5eS3gn6+AMkY79V3G5HwUWsG48DP7Ih/mZrx7WTptzXRO827bZSdUtZllW
	kEUg5cJcFYjDa8na85/pJT2Pfw/MIOpVY/Tb9RJ7joAiKOugYhzu9Lu0s6AfmFvS2aFTsd
	fTG30Dvk6BijXC7uKs901C/NK3KqDw7AG6N2qSsZ02TBvgPr2+du1ZfwHQMKHVvCHmqCy9
	nBZZsUcQmH2ycbgM3mzVBeGTtroQY9IJEREPP4Gvg+OebLRWeFj0P0btFjtvy5EyFEMoOi
	B2moEm7ez2lAOSdFt18NQ2Ek/LaVAov9so6PXi6rAOPAzdCzKX2wpoWmmimRHg==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Nov 2025 11:18:45 +0100
Message-Id: <DEJEFLKA9IJR.237ZLV8HBD2VS@bootlin.com>
Cc: "Kever Yang" <kever.yang@rock-chips.com>, "Minas Harutyunyan"
 <Minas.Harutyunyan@synopsys.com>, "Alan Stern" <stern@rowland.harvard.edu>,
 "Louis Chauvet" <louis.chauvet@bootlin.com>, =?utf-8?q?Herv=C3=A9_Codina?=
 <herve.codina@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <linux-phy@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, "Vinod Koul"
 <vkoul@kernel.org>, "Kishon Vijay Abraham I" <kishon@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "William Wu" <wulf@rock-chips.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 1/2] phy: rockchip: inno-usb2: fix disconnection in
 gadget mode
X-Mailer: aerc 0.20.1
References: <20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-0-239872f05f17@bootlin.com> <20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-1-239872f05f17@bootlin.com> <DEHVRC8CY12S.3LSC6UVSMU0C1@bootlin.com> <DEJD8DJZFNZO.11B1UBXJBN7MO@bootlin.com> <DEJDSE73CJES.2AB8YSKLW6VE1@bootlin.com>
In-Reply-To: <DEJDSE73CJES.2AB8YSKLW6VE1@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

Hi Th=C3=A9o,

On Thu Nov 27, 2025 at 10:48 AM CET, Th=C3=A9o Lebrun wrote:
> On Thu Nov 27, 2025 at 10:22 AM CET, Luca Ceresoli wrote:
>> On Tue Nov 25, 2025 at 4:28 PM CET, Th=C3=A9o Lebrun wrote:
>>>> The code already checks for !rport->suspended, so add a guard for VBUS=
 as
>>>> well to avoid a disconnection when a cable is connected.
>>>
>>> Your commit message was clear but I was missing one key point: what
>>> rport->suspended means. It isn't what I first thought. Instead it means
>>> phy is powered off. Naming is bad but unrelated to your series. Maybe
>>> add a comment to your commit message like the following?
>>>
>>>   The code already checks for !rport->suspended (PHY is powered on), ..=
.
>>
>> You are right. I have added a slightly longer text:
>>
>>   The code already checks for !rport->suspended (which, somewhat
>>   counter-intuitively, means the PHY is powered on), ...
>>
>> Still worth your Reviewed-by?
>
> Even more so.

Thanks, v2 on its way.

>> I also added the Cc: stable@vger.kernel.org line, which I noticed being
>> missing.
>
> I never add that Cc trailer and only rely on `Fixes:`. I thought it
> used to be documented as an alternative to that Cc trailer but it does
> not show up in `git log -p Documentation/process/stable-kernel-rules.rst`
>
> There is one indirect mention of "scripts that look for commits
> containing a 'Fixes:' tag":
> https://elixir.bootlin.com/linux/v6.17.9/source/Documentation/process/sta=
ble-kernel-rules.rst#L132-L134
>
> Anyway, you do right by explicitly tagging `Cc: stable@...`.

Theory says Cc: is needed:

> Note: Attaching a Fixes: tag does not subvert the stable kernel rules
> process nor the requirement to Cc: stable@vger.kernel.org on all stable
> patch candidates.
(https://docs.kernel.org/process/submitting-patches.html#reviewer-s-stateme=
nt-of-oversight)

But in the practice I happened to forget Cc: stable in the past, the patch
got applied and the Fixes: tag was enough for correct cherry-pick in stable
branches.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


Return-Path: <linux-usb+bounces-30992-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3F6C8DA18
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 10:48:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4A31934BA1A
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 09:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BEFF31771B;
	Thu, 27 Nov 2025 09:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gMSaUZeL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDD02FD7D8
	for <linux-usb@vger.kernel.org>; Thu, 27 Nov 2025 09:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764236918; cv=none; b=nv95iT7e9lY/pGwvZFedYlZleoWJyVFn5W6rwIePd4zfaz8rZz7JyGUiColqDGekUIgYWf4iwBtpFgKg2CnAFFlQ2vQ7b8Qz7jhG10hAxzSGDEDac/HkGNB4bybknGCHCRTC7f/tQH/CYOP4zynMaZ+7CxB0lmEIpa9jNp1Z4FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764236918; c=relaxed/simple;
	bh=XStMOL+VsHB2jWB5eK8Pq7V5pb9ctUX/K4NE+dlDNlU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=Imk7OrTgVjtn1U8FoFrdfxJ/YpS/2/dbP4g9NbLmDNilWaAYxYZISx5U/5GUhiMTCUqXAfbJd4sJSxGfFo1baUF/kH/fS7XyT8poTRAPZ4FkHS5XGB8gP+DaUqVxVIK4y6tqE94F9m9MgUDvOm5GicNkVJhbgmHYaFtyPo03Gdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gMSaUZeL; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 129B11A1DC2;
	Thu, 27 Nov 2025 09:48:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D85086068C;
	Thu, 27 Nov 2025 09:48:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3FF99102F2343;
	Thu, 27 Nov 2025 10:48:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764236913; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BAZLhFiggp3ISn2IlMvvHN2Lj6HBhB4JUomxmoaFyVk=;
	b=gMSaUZeLDRdv7XorMV0FKyzctA/4ZSOlfHUNmQrVCZ+WM3vgTMDTAzCIWb21ezNRx4QYJv
	iwN7ZWp9YPgZVjsmhYZAtipIhD6LRAAeFtP3YsTnGJTfeLLM/FJDqc9twcVfL2ekMnIE5F
	YYuFFO7zSmMsyeumbEcnqxTOP/JEF+yYjFqviylqeP9fxQaSeGpA6/4T6pNMMAcvJRjl+r
	q/PQSQdH+7DnYQhMwzXCN2xdbMyxWN4zSYaGmrQ36SKtfFpvzsgum0qiYcjcqE69ftmTn1
	ivwmnZKJjCz67sul0Q4lbrdcQLshTZJuxBUgW/CRzkd6w6chphh3z6T3QBm9Cw==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Nov 2025 10:48:26 +0100
Message-Id: <DEJDSE73CJES.2AB8YSKLW6VE1@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 1/2] phy: rockchip: inno-usb2: fix disconnection in
 gadget mode
Cc: "Kever Yang" <kever.yang@rock-chips.com>, "Minas Harutyunyan"
 <Minas.Harutyunyan@synopsys.com>, "Alan Stern" <stern@rowland.harvard.edu>,
 "Louis Chauvet" <louis.chauvet@bootlin.com>, =?utf-8?q?Herv=C3=A9_Codina?=
 <herve.codina@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <linux-phy@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>,
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, "Vinod Koul"
 <vkoul@kernel.org>, "Kishon Vijay Abraham I" <kishon@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "William Wu" <wulf@rock-chips.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-0-239872f05f17@bootlin.com> <20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-1-239872f05f17@bootlin.com> <DEHVRC8CY12S.3LSC6UVSMU0C1@bootlin.com> <DEJD8DJZFNZO.11B1UBXJBN7MO@bootlin.com>
In-Reply-To: <DEJD8DJZFNZO.11B1UBXJBN7MO@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Nov 27, 2025 at 10:22 AM CET, Luca Ceresoli wrote:
> On Tue Nov 25, 2025 at 4:28 PM CET, Th=C3=A9o Lebrun wrote:
>>> The code already checks for !rport->suspended, so add a guard for VBUS =
as
>>> well to avoid a disconnection when a cable is connected.
>>
>> Your commit message was clear but I was missing one key point: what
>> rport->suspended means. It isn't what I first thought. Instead it means
>> phy is powered off. Naming is bad but unrelated to your series. Maybe
>> add a comment to your commit message like the following?
>>
>>   The code already checks for !rport->suspended (PHY is powered on), ...
>
> You are right. I have added a slightly longer text:
>
>   The code already checks for !rport->suspended (which, somewhat
>   counter-intuitively, means the PHY is powered on), ...
>
> Still worth your Reviewed-by?

Even more so.

> I fixed the other issues you have reported, for patch 2 as well.
>
> I also added the Cc: stable@vger.kernel.org line, which I noticed being
> missing.

I never add that Cc trailer and only rely on `Fixes:`. I thought it
used to be documented as an alternative to that Cc trailer but it does
not show up in `git log -p Documentation/process/stable-kernel-rules.rst`

There is one indirect mention of "scripts that look for commits
containing a 'Fixes:' tag":
https://elixir.bootlin.com/linux/v6.17.9/source/Documentation/process/stabl=
e-kernel-rules.rst#L132-L134

Anyway, you do right by explicitly tagging `Cc: stable@...`.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



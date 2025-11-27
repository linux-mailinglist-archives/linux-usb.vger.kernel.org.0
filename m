Return-Path: <linux-usb+bounces-30991-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 288A0C8D80A
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 10:22:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C874E34D588
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 09:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97578327214;
	Thu, 27 Nov 2025 09:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eqhjdvXZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDB31CEAA3
	for <linux-usb@vger.kernel.org>; Thu, 27 Nov 2025 09:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764235350; cv=none; b=gI89zkfo/LJu3LfEa8Iafh1qEsDBvBLhgyU+BsaXqe4Y7qt/JDmEzgBqN04g07WeEwiYHsBIyEItBQbQx7ER84wZR1JlfYGT/ZcQLdhy5Ca/UbNfF14FF6865VfiFzoDV7XipOUTvDOwnfef+59/TA+R3MdQY42ngaDwbX31p6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764235350; c=relaxed/simple;
	bh=lDBqaIbhMwy6P6aIERX8kLGgWBBzsmRenHXKb3UXTnM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=YdQjCkjUNpsnBHznYLHSOBqfcVTK5wqDtobr/hHVZMwGFpZh54ReojUWCTy0jkdZ/nkpvwd9mY/rjWWmThUNxQuON6v/ePBsl58ilZzkohokmPr6zSr03AlzWyw9fEL72gMhyEUFZBnRkYcEnRhhpHL5XKOsOK7puKly8ztLtac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eqhjdvXZ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DAAC71A1DBD;
	Thu, 27 Nov 2025 09:22:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AE8DB6068C;
	Thu, 27 Nov 2025 09:22:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 20965102F260E;
	Thu, 27 Nov 2025 10:22:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764235344; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LUO1z9qwbt9OCCzyz5bCMm+KUuBCR4sEqoSJH822mh0=;
	b=eqhjdvXZnUp9AmLT5/lJ7M6Z4Pq+LxgKF4WrneIblNx6/isXh+q272Pc5de5vlJP67QIod
	DFU8sAzqbvx7hYfQIAbxZVtXu5ur9wHEeKdpDjlOODOwNrqUFrd3NmrdHOyDFH08bQws28
	0oLC85B8sKuwjnU33G0LkCCYE42UpG3pbGxxAUin2woUQAZxEkAGHk0HQgTVF5nClGO32d
	16vRV1tKmrJLnQ1GKHdAQLyB0ZtTKbK6YgHVIn3JqX/QN3dtxuQjA8uddrokH/SyRy3IqM
	sauT/xOWlNe3hehmB09YO5g+IYyiYJ4hsc4uYwaNdNjVN4EZhQAykkYYebXKnA==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Nov 2025 10:22:18 +0100
Message-Id: <DEJD8DJZFNZO.11B1UBXJBN7MO@bootlin.com>
Subject: Re: [PATCH 1/2] phy: rockchip: inno-usb2: fix disconnection in
 gadget mode
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
X-Mailer: aerc 0.20.1
References: <20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-0-239872f05f17@bootlin.com> <20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-1-239872f05f17@bootlin.com> <DEHVRC8CY12S.3LSC6UVSMU0C1@bootlin.com>
In-Reply-To: <DEHVRC8CY12S.3LSC6UVSMU0C1@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

Hi Th=C3=A9o,

thanks for reviewing this series!

On Tue Nov 25, 2025 at 4:28 PM CET, Th=C3=A9o Lebrun wrote:
[...]
>> The problem was observed on a Radxa Rock Pi S board, which can only be
>> powered by the only USB-C connector. That connector is the only one usab=
le
>
> "which can only be powered by the only USB-C connector"
> double "only" makes it a super exclusive connector!

Hehe, indeed! :-)

>> The code already checks for !rport->suspended, so add a guard for VBUS a=
s
>> well to avoid a disconnection when a cable is connected.
>
> Your commit message was clear but I was missing one key point: what
> rport->suspended means. It isn't what I first thought. Instead it means
> phy is powered off. Naming is bad but unrelated to your series. Maybe
> add a comment to your commit message like the following?
>
>   The code already checks for !rport->suspended (PHY is powered on), ...

You are right. I have added a slightly longer text:

  The code already checks for !rport->suspended (which, somewhat
  counter-intuitively, means the PHY is powered on), ...

Still worth your Reviewed-by?

I fixed the other issues you have reported, for patch 2 as well.

I also added the Cc: stable@vger.kernel.org line, which I noticed being
missing.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


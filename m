Return-Path: <linux-usb+bounces-29486-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70236BF665B
	for <lists+linux-usb@lfdr.de>; Tue, 21 Oct 2025 14:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E034A3B9C8E
	for <lists+linux-usb@lfdr.de>; Tue, 21 Oct 2025 12:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C463B334C13;
	Tue, 21 Oct 2025 12:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AZ06nvrf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484592F49F2
	for <linux-usb@vger.kernel.org>; Tue, 21 Oct 2025 12:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761048599; cv=none; b=kC6nKyYOXEc0NypQxl0B2PDhqtmtKPPlJ4VfUbsqopjKEoTdDxVxz5Fua2v5RjotpPCdG/hzD7Quq1+MUN2jpWmt58m7BY4jHl8njGdZmraJiLKG62KKRJM49XCUK0SLERmo8+4Z0C1Ywon/jNfoOFQTxqxZ/HpLfILJBXhQYlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761048599; c=relaxed/simple;
	bh=zcEo0Y4iHlgKicyWC/0hBnTrN4iw7wQjBd6lUgzbPGI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=uMZRc3BE5VjwYM7mFlBptbCIGrnZNx8olyVuEaajNlXic2MvhUKJ/wG2Y1wel4p/bsUkjfoYHkrCFHHNqFKDavJ+0UlcnbYM2EBR4lat3O2A/Dzf3vMAlp5eEXvooqKPgE04XFh+cUo6rkWlUax/ABm639cWd69Wx/h7UlRKm44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AZ06nvrf; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7934E4E41226;
	Tue, 21 Oct 2025 12:09:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3731360680;
	Tue, 21 Oct 2025 12:09:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9E336102F23E9;
	Tue, 21 Oct 2025 14:09:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761048593; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jYftyPWe3cSDHOa3crBNXagLfu5+YLZP87koZDXEKHE=;
	b=AZ06nvrfdkt65l4E235uJTkuujLAFE0Xkr8yMlv8YGs+4Wjxl3cDNrgnC2wekfhdFKRJbx
	p978H1NRdxMUpJOiFKTjCdI2um+XRjTW5kiMLUBqR8J0FIKF/0630noMdkQ5tTxG2+A3iG
	5z+SYTF9YQI2Kqf5cFY5J7mxrPj7RJGbY7dzFj2hWOIjY+oL8pIl7gsj2ke1a4Gbrc/VfF
	jlZMh+iIoacYmLgyB4ovjesL8k3qgXAxwHguAQanDz0WhDnNO7IDoGaAnG34IFTBjEpU0W
	sAoLDPQEgCpOCHULSukUf3kb/HqaPCJuyQye8KRi/jTHKU1fRYNuNPbOB6YXLg==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Oct 2025 14:09:39 +0200
Message-Id: <DDNZMD1M6G49.1M47TZR3DVYQI@bootlin.com>
Cc: "Kever Yang" <kever.yang@rock-chips.com>, "Minas Harutyunyan"
 <Minas.Harutyunyan@synopsys.com>, "Alan Stern" <stern@rowland.harvard.edu>,
 "Louis Chauvet" <louis.chauvet@bootlin.com>, =?utf-8?q?Herv=C3=A9_Codina?=
 <herve.codina@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <linux-phy@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "linux-phy" <linux-phy-bounces@lists.infradead.org>
Subject: Re: [PATCH 0/2] phy: rockchip: inno-usb2: fix gadget mode
 disconnection after 6 seconds
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Vinod Koul"
 <vkoul@kernel.org>, "Kishon Vijay Abraham I" <kishon@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "William Wu" <wulf@rock-chips.com>
X-Mailer: aerc 0.20.1
References: <20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-0-239872f05f17@bootlin.com>
In-Reply-To: <20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-0-239872f05f17@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On Tue Jul 22, 2025 at 10:43 AM CEST, Luca Ceresoli wrote:
> The USB OTG port of the RK3308 exibits a bug when:
>
>  - configured as peripheral, and
>  - used in gadget mode, and
>  - the USB cable is connected since before booting
>
> The symptom is: about 6 seconds after configuring gadget mode the device =
is
> disconnected and then re-enumerated. This happens only once per boot.
>
> Investigation showed that in this configuration the charger detection cod=
e
> turns off the PHY after 6 seconds. Patch 1 avoids this when a cable is
> connected (VBUS present).
>
> After patch 1 the connection is stable but communication stops after 6
> seconds. this is addressed by patch 2.
>
> The topic had been discussed in [0]. Thanks Alan and Minas for the
> discussion and Louis for having found the 1st issue, leading to patch 1.
>
> [0] https://lore.kernel.org/lkml/20250414185458.7767aabc@booty/
>
> Luca
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Anything I should do to move forward with this work?

These two few-liner patches solve real-world bugs, there is no complaint
about them, and both the bug and the solution is explained as clearly as
the public documentation allows.

FWIW, this series applied cleany on current master
(v6.18-rc2-8-g6548d364a3e8).

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


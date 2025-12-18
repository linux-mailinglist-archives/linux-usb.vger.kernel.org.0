Return-Path: <linux-usb+bounces-31593-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 686B3CCCA1B
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 17:07:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB008308C49E
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 16:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75EC234F499;
	Thu, 18 Dec 2025 15:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PEZ8TlEL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C5134F251;
	Thu, 18 Dec 2025 15:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766072244; cv=none; b=INAl6v5D5KgbdL7qWdUWVe5elbJEJjSNzfztZHIHf3WU4SfvqYxi2VBhvZlP2hrC4tHAB3MLECegX/nP6NYPhz/59Tr9h2C9PPGxUBHzwt36uie9lOwqtZZ/NGOHliHGjNTTCwonLhjUz89WRqmhLIWgEa/swNe+OgEQ+s4pRt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766072244; c=relaxed/simple;
	bh=XvAveT45poaNBzrzZtdu1wW74znt4WRG69YbQIp2mVs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qdLt9maRxaXOLDR9AqYw69E0g3l7UXHJTeiHFG+5a4rmFaS7uYC+PaC/YjGZMuxCSXqmOb/cvC6ZY7FJGFrx/f1LPBKAPp4w/d7BLARgzi1p19j+LX/az4PtIjOXub8rVmD/vHWXxPT+/CaEIonAw4TPF/ZewmCHiysVYdmOssc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PEZ8TlEL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DF9BC116D0;
	Thu, 18 Dec 2025 15:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766072244;
	bh=XvAveT45poaNBzrzZtdu1wW74znt4WRG69YbQIp2mVs=;
	h=From:To:Cc:Subject:Date:From;
	b=PEZ8TlEL8jAhaOfEKiZ6Ta4lh72R4u9KNLh18kJ3Ih8aRpjpwVreOsf0rbyD10j6F
	 kv2F7ZRFXeRepUsxxz+7kf3xaCS33XKfbMcceuG9openzwaxsyYfiQf+Pcr2cNsVAk
	 wYqlUYk3uAkkpPOjd2zeFa1GMg29tfT9kYlF3vRIQyYoHBfzqWSLEfpmYw+YBuYoDS
	 oKWUC5RCQW2qGxE9DaDT0tzYeyQ11569fBCv1HlRXpGvsJ+2mB9NaBl4Xk4WO6fP/0
	 YUn5ETe6AbxRbZ6x4n6YVBr2tpEYkJsh8070VnNGzQX97Sokv9CJhFxsIwXlLfGY1c
	 bIHd2ZJ0e5Rgg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vWG4A-00000000564-0nTi;
	Thu, 18 Dec 2025 16:37:22 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Ma Ke <make24@iscas.ac.cn>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 0/5] USB: lpc32xx: fix error handling
Date: Thu, 18 Dec 2025 16:35:14 +0100
Message-ID: <20251218153519.19453-1-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent change fixing a device reference leak introduced a clock
imbalance by reusing an error path so that the clock may be disabled
before having been enabled.

The very same change could also lead to a use-after-free in case the
driver is used with non-OF probing.

This series fixes the resulting mess as well as the related device leak
in the NXP OHCI driver.

Included are also two related cleanups.

Johan


Changes in v2:
 - defer an ohci error label rename to the clean up patch


Johan Hovold (5):
  usb: gadget: lpc32xx_udc: fix clock imbalance in error path
  usb: phy: isp1301: fix non-OF device reference imbalance
  usb: ohci-nxp: fix device leak on probe failure
  usb: gadget: lpc32xx_udc: clean up probe error labels
  usb: ohci-nxp: clean up probe error labels

 drivers/usb/gadget/udc/lpc32xx_udc.c | 41 ++++++++++++++--------------
 drivers/usb/host/ohci-nxp.c          | 18 ++++++------
 drivers/usb/phy/phy-isp1301.c        |  7 ++++-
 3 files changed, 36 insertions(+), 30 deletions(-)

-- 
2.51.2



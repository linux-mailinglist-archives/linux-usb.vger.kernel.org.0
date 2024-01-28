Return-Path: <linux-usb+bounces-5562-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4A183F4A6
	for <lists+linux-usb@lfdr.de>; Sun, 28 Jan 2024 09:48:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 228451C21616
	for <lists+linux-usb@lfdr.de>; Sun, 28 Jan 2024 08:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED748DF43;
	Sun, 28 Jan 2024 08:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="W+py6fgA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr [80.12.242.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3135DDA5
	for <linux-usb@vger.kernel.org>; Sun, 28 Jan 2024 08:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706431677; cv=none; b=HEK5KCiaXdYyd6cGh/rw3HXdfs7ekt9fV1kovRI5t1dMjEhOESbldHT7Hb1pvwPOspXYl9OpOa8vwkL5gwjXgf4hAeim9SAtinLQVGI61jJpdOeYQ21jLXc9Yj5nsn18m/4TiFKLBWdsXUmhs7WaBqKkwCnPr4wDsrNrsX3Ho4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706431677; c=relaxed/simple;
	bh=aJw6AqhVkV5H+6qkrHrVvQkMiGIYDaRTkcVg98CSjFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DRpe0ssOpaIEO/qkMIEA2/VCSAeHrTO6X7aySzUhwWBc4vrW6dJ6wlnB48H90r7Fkc0Boejv+x6LQWK82OYDpSsshsSkm7pKRIMLpdcRg/PVKoZY8ZuDubZnddheZolbNI2V3ysVaL1Rtqjtft/7+rkfSJNmGiorkzRuThyou6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=W+py6fgA; arc=none smtp.client-ip=80.12.242.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id U0pVr3FypwnxGU0pVrvuNg; Sun, 28 Jan 2024 09:47:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1706431674;
	bh=PvDm6o18p5eO0SWxCbyfOmNYdKnWHShtEZV/Rr+hpA0=;
	h=From:To:Cc:Subject:Date;
	b=W+py6fgAl++QyAGnzSJQDzXdfdUMFcFYkCcv8rH5F4Eg4+VXXpMT3kYKQ3mfhJEjS
	 TaOSsATcd+8sYIuP+u+qulReV4NmA9genmKpQUU9DFEHDCk7mmr5gppFKDyRLZwOmB
	 Jww+7z0j3FpXmbKGfgZ8Uy/oibBSwsoydYaL1OlRm0E13wUo1EoG3ApS5Iq4a9fR+T
	 3ff52tj4Liw18qCZqo1o5pweEvls3R8mJNcF3rOc4Vt43YpDHmFIx3QFhTx0r3nuQC
	 IVRNADMv7qp6c0F2ANawb1j1jeNXC/+noCFxYTHTyhZ9zBzNvLv01BPFETpMiUgo7G
	 nmBceHbN0Ez6g==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 28 Jan 2024 09:47:54 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Vincent Shih <vincent.sunplus@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH] phy: sunplus: Fix a memory leak in update_disc_vol()
Date: Sun, 28 Jan 2024 09:47:50 +0100
Message-ID: <451016052782f18c8b52ed0f836d7ab5c69bac3d.1706431643.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'otp_v', allocated by nvmem_cell_read(), is leaking.
It must be freed before leaving the function to avoid a leak.

Fixes: 99d9ccd97385 ("phy: usb: Add USB2.0 phy driver for Sunplus SP7021")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is speculative and based on comparison on the usage of
nvmem_cell_read() in other driver.

Review with care.
---
 drivers/phy/sunplus/phy-sunplus-usb2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/sunplus/phy-sunplus-usb2.c b/drivers/phy/sunplus/phy-sunplus-usb2.c
index 637a5fbae6d9..50f1f91ac052 100644
--- a/drivers/phy/sunplus/phy-sunplus-usb2.c
+++ b/drivers/phy/sunplus/phy-sunplus-usb2.c
@@ -105,6 +105,8 @@ static int update_disc_vol(struct sp_usbphy *usbphy)
 	val = (val & ~J_DISC) | set;
 	writel(val, usbphy->phy_regs + CONFIG7);
 
+	kfree(otp_v);
+
 	return 0;
 }
 
-- 
2.43.0



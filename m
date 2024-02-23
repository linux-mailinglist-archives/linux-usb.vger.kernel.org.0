Return-Path: <linux-usb+bounces-6974-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F35A28619FC
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 18:38:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD889288652
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 17:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F116134729;
	Fri, 23 Feb 2024 17:33:30 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C293E12F37C
	for <linux-usb@vger.kernel.org>; Fri, 23 Feb 2024 17:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708709610; cv=none; b=Jvofjrs24Jqe6MOMtdVqmirSPm8++at2ZVtx0aBg5AbsDVvK0gJc/3oEeZ7ZT3504ze7Ikt2/kW1pBAzh0HPtDkFPSMhxU31iThdS7eJsoIC7VO3Zgz9sSZwHoUVvPzJEM55RGc7tMqFUNpumeu4s73YudwS5J5OTF7MifiC1q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708709610; c=relaxed/simple;
	bh=PLX+hdp+BdIs151kSIpgAK1UkcilNhF+mhdP7FGTVmE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K5UWJ8NZVKF2RzQKxZzv9wZyuBvhY6P3Agdew01fvhnfEZRAkxtqTkyPfdM3Qqp9pg9RnuoJkezmOYefDsdYPSKeTDR6cDaCfJanCXNl2YahpOL0uR99CYml/WkM/LvTfwe9c6muU1kQdwy7tFtmPfPdyUqLDTX0GKOczpm9Bsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdZQH-0000QF-AC; Fri, 23 Feb 2024 18:33:21 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdZQG-002Sz9-92; Fri, 23 Feb 2024 18:33:20 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdZQG-00AWsZ-0b;
	Fri, 23 Feb 2024 18:33:20 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Li Yang <leoyang.li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kernel@pengutronix.de
Subject: [PATCH 0/2] usb: gadget: fsl: Two improvements
Date: Fri, 23 Feb 2024 18:33:14 +0100
Message-ID: <cover.1708709120.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=458; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=PLX+hdp+BdIs151kSIpgAK1UkcilNhF+mhdP7FGTVmE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl2NbaST6Q41NfBJbFNIvBJOHHuZD4moZJp4OSs beOGlG9xN2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZdjW2gAKCRCPgPtYfRL+ TupoCAC2JTcvzjnj9HAUWAvyo1YgoaKKUbsOb7UvaCKwDCyrvlUxuwh6bWGGtHR0G8Jyst6QzDX nqWDmBnVH5jPMMx8Pown97Brzf0X1HSznsXugbkZiLUydq+QznBpZb8pFPIyUGWvxqzvhC/2i8R Pnaj9tSfNNJaWOXvyb3FZXrVU4O1hbFodl21XaVIRd6lJUGQo/zjDzsaLXhpUbuGlDyMLGW8cq9 z0BlqdflLmZcDf3iPRtOInPeTQlesEab3vFABvwkQGnV+p1M3pH89d2pAsg/qIjpCr09K2Ppce8 Xa1lCZW/whaKw+Xjg5VN7QIuUbz2qO2B5REQGTzQy/wiYRLm
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

Hello,

here come two patches that I created while debugging an issue around USB
on MPC8313.

Best regards
Uwe

Uwe Kleine-König (2):
  usb: gadget: fsl: Add of device table to enable module autoloading
  usb: gadget: fsl: Increase size of name buffer for endpoints

 drivers/usb/gadget/udc/fsl_udc_core.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

base-commit: 33e1d31873f87d119e5120b88cd350efa68ef276
-- 
2.43.0



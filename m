Return-Path: <linux-usb+bounces-13195-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F15E94A977
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2024 16:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE8D52870D1
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2024 14:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352DB5914C;
	Wed,  7 Aug 2024 14:09:01 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D60739FFE
	for <linux-usb@vger.kernel.org>; Wed,  7 Aug 2024 14:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723039740; cv=none; b=QgyqGhQGAEDEVar6Nz7HZ/leV3XF9Ys6VNK9pgFWVGMpSKXErY1rOR6cQw9AtHHnzsabYZ4Y3Cl9a4IgFXuI7JC+s8lPwM/whyCbeUju4jH726UIg6PrF3mnpsIUfz0LSUyKG/c39BFYeQ2vMBXopJoonHetK8OLtZ4AexLCWP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723039740; c=relaxed/simple;
	bh=MVVntXK62hacBsCloC4VuYF1/PJRtCaKzPq6C9YFjvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tAQ3baemxp1a1KT9ZGxoy/DwuV674rf3DgM3jVcKf1B/WJK+a+w0Ru05ftaJLM5nYa03JPM8eZA1PQXdokaM5Ci7QWqXa9fhlfIyxUfmz++O+x2rgVvAbkBNcK/oBgObZOycIiDKm9x2QYJce/Y/GfY4JlpkA/x33Ewp5kF6Pk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1sbhLQ-0002E5-Pu; Wed, 07 Aug 2024 16:08:52 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Wed, 07 Aug 2024 16:08:48 +0200
Subject: [PATCH 1/3] serdev: ttyport: make use of tty_kopen_exclusive
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-v6-10-topic-usb-serial-serdev-v1-1-ed2cc5da591f@pengutronix.de>
References: <20240807-v6-10-topic-usb-serial-serdev-v1-0-ed2cc5da591f@pengutronix.de>
In-Reply-To: <20240807-v6-10-topic-usb-serial-serdev-v1-0-ed2cc5da591f@pengutronix.de>
To: Rob Herring <robh@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

The purpose of serdev is to provide kernel drivers for particular serial
device, serdev-ttyport is no exception here. Make use of the
tty_kopen_exclusive() funciton to mark this tty device as kernel
internal device.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/tty/serdev/serdev-ttyport.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serdev/serdev-ttyport.c b/drivers/tty/serdev/serdev-ttyport.c
index 3d7ae7fa5018..94c43d25ddbe 100644
--- a/drivers/tty/serdev/serdev-ttyport.c
+++ b/drivers/tty/serdev/serdev-ttyport.c
@@ -103,11 +103,14 @@ static int ttyport_write_room(struct serdev_controller *ctrl)
 static int ttyport_open(struct serdev_controller *ctrl)
 {
 	struct serport *serport = serdev_controller_get_drvdata(ctrl);
+	struct tty_driver *tty_drv = serport->tty_drv;
 	struct tty_struct *tty;
 	struct ktermios ktermios;
+	dev_t dev;
 	int ret;
 
-	tty = tty_init_dev(serport->tty_drv, serport->tty_idx);
+	dev = MKDEV(tty_drv->major, tty_drv->minor_start + serport->tty_idx);
+	tty = tty_kopen_exclusive(dev);
 	if (IS_ERR(tty))
 		return PTR_ERR(tty);
 	serport->tty = tty;
@@ -144,7 +147,7 @@ static int ttyport_open(struct serdev_controller *ctrl)
 	tty->ops->close(tty, NULL);
 err_unlock:
 	tty_unlock(tty);
-	tty_release_struct(tty, serport->tty_idx);
+	tty_kclose(tty);
 
 	return ret;
 }
@@ -161,7 +164,7 @@ static void ttyport_close(struct serdev_controller *ctrl)
 		tty->ops->close(tty, NULL);
 	tty_unlock(tty);
 
-	tty_release_struct(tty, serport->tty_idx);
+	tty_kclose(tty);
 }
 
 static unsigned int ttyport_set_baudrate(struct serdev_controller *ctrl, unsigned int speed)

-- 
2.39.2



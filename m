Return-Path: <linux-usb+bounces-24182-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 244EEABF664
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 15:41:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D49E150065D
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 13:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573DC27C151;
	Wed, 21 May 2025 13:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yFFtm8la"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2AF1DA21
	for <linux-usb@vger.kernel.org>; Wed, 21 May 2025 13:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747834897; cv=none; b=DLMVlEruhUWktkiH4WSPln9l/tMGI8vAHtmuVO6RZckb5UaKUcebbIZSdDnCKowpM1I9qt5iemWe1Y+WBomak/4XRk3YLRGXLzU9++8TOmwlsvuHxbNRWk+jaLwqHtneKCrh3zNXIzBTy1/Qo1/+z/jofs7npiWK7GR7H1nNTlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747834897; c=relaxed/simple;
	bh=CFLDwPNOjcFy5WNxCHA6WZyZ8k9LV864523R6gyL97A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uOqtRGUaeNDv4+zr255o1S6zLtOwEf/W8OEb55ipiPzaVElEXFGBPkYpn1orAzbJ73bA/6EcbVfuZZnsOJxOApQp0e3H1kmFcaTUo7P17YRTKVGCepYUCJ2d+c93uKVYF9EIUwgPa4QIbDT54YihHKFEEhmBC7Co0x+WNSVJp0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yFFtm8la; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31DA7C4CEE4;
	Wed, 21 May 2025 13:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747834897;
	bh=CFLDwPNOjcFy5WNxCHA6WZyZ8k9LV864523R6gyL97A=;
	h=From:To:Cc:Subject:Date:From;
	b=yFFtm8la/4iPtqgNH8Z44PCUbBwrm7U42wRodsDgYupgMi6ogQF/VaNor1Ec2TZar
	 gYhj674YFUU58Ulb/L2Q7fdG2b8xDvbep0xcr0JwP8NBxprqcZiWnNi2qnUqtae8fd
	 KB78W7jk58fk9LQqNjhdau/3SjwpeyKd2cbyg5ZI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] USB: serial: bus: fix const issue in usb_serial_device_match()
Date: Wed, 21 May 2025 15:41:34 +0200
Message-ID: <2025052133-recreate-attitude-c564@gregkh>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Lines: 26
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=CFLDwPNOjcFy5WNxCHA6WZyZ8k9LV864523R6gyL97A=; b=owGbwMvMwCRo6H6F97bub03G02pJDBm6N3hjzKqeaV6zvHvc1fCXplevrX71/JgjQbPUj/K93 BxV0LW0I5aFQZCJQVZMkeXLNp6j+ysOKXoZ2p6GmcPKBDKEgYtTACYiJMowP3xexcrY7ntadYYb J5/MnSu95ffmZQwLGu0XuBa/Za99LaNpeU5Tq7V4nq0EAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

usb_serial_device_match() takes a const pointer, and then decides to
cast it away into a non-const one, which is not a good thing to do
overall.  Fix this up by properly setting the pointers to be const to
preserve that attribute.

Cc: Johan Hovold <johan@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/serial/bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/serial/bus.c b/drivers/usb/serial/bus.c
index 2fea1b1db4a2..9e2a18c0b218 100644
--- a/drivers/usb/serial/bus.c
+++ b/drivers/usb/serial/bus.c
@@ -17,7 +17,7 @@ static int usb_serial_device_match(struct device *dev,
 				   const struct device_driver *drv)
 {
 	const struct usb_serial_port *port = to_usb_serial_port(dev);
-	struct usb_serial_driver *driver = to_usb_serial_driver(drv);
+	const struct usb_serial_driver *driver = to_usb_serial_driver(drv);
 
 	/*
 	 * drivers are already assigned to ports in serial_probe so it's
-- 
2.49.0



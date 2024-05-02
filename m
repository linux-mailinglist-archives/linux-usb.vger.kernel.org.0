Return-Path: <linux-usb+bounces-9969-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D20A8B987B
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2024 12:07:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F8312810D8
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2024 10:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7434857330;
	Thu,  2 May 2024 10:07:47 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from unicorn.mansr.com (unicorn.mansr.com [81.2.72.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7021A5677C
	for <linux-usb@vger.kernel.org>; Thu,  2 May 2024 10:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.2.72.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714644467; cv=none; b=rb1Z7MNuti4iRKdR2bmV/lKGjIJUqNjMT9fvAZ/LBBvIDR1AfDQ19+/NhlmDLxOWh85Pc6K/BJTdZ7lesOasMEqyZ2NNUz4hQKpWmkiM9fKu8QzEB2t1Js708ItmSdsycRjIatFLo/Je0dPyvub/ID7Ma7DRX41tXcpnP8XOvDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714644467; c=relaxed/simple;
	bh=adp8z7FaGesa3Ai5pNlmIHHn48v0TbSqQ4FYPkLFIQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bzcP/i2LjYK016ShVglh6k66VLowqQH1BtJPfJ5qUQ2KrJScFKGjW8yZdN7tNLhH1pggqcP2fRei7fILCHW+SBHda7b+szHcBEYJRsaO5LZlvTneVSITdrlLCZkDvn9xUiQyr3eghcn1N8Cezp0yZsYzfFqsBG236tHzOf2dWT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mansr.com; spf=pass smtp.mailfrom=mansr.com; arc=none smtp.client-ip=81.2.72.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mansr.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mansr.com
Received: from raven.mansr.com (raven.mansr.com [81.2.72.235])
	by unicorn.mansr.com (Postfix) with ESMTPS id AC3D815360;
	Thu,  2 May 2024 11:07:36 +0100 (BST)
Received: by raven.mansr.com (Postfix, from userid 51770)
	id 2A12221339E; Thu,  2 May 2024 11:07:36 +0100 (BST)
From: Mans Rullgard <mans@mansr.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH] USB: serial: use tty_port_register_device_serdev
Date: Thu,  2 May 2024 11:07:28 +0100
Message-ID: <20240502100728.7914-1-mans@mansr.com>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use tty_port_register_device_serdev() so that usb-serial devices
can be used as serdev controllers.

Signed-off-by: Mans Rullgard <mans@mansr.com>
---
 drivers/usb/serial/bus.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/bus.c b/drivers/usb/serial/bus.c
index 6c812d01b37d..34a1f355f17f 100644
--- a/drivers/usb/serial/bus.c
+++ b/drivers/usb/serial/bus.c
@@ -50,8 +50,9 @@ static int usb_serial_device_probe(struct device *dev)
 	}
 
 	minor = port->minor;
-	tty_dev = tty_port_register_device(&port->port, usb_serial_tty_driver,
-					   minor, dev);
+	tty_dev = tty_port_register_device_serdev(&port->port,
+						  usb_serial_tty_driver,
+						  minor, dev);
 	if (IS_ERR(tty_dev)) {
 		retval = PTR_ERR(tty_dev);
 		goto err_port_remove;
-- 
2.45.0



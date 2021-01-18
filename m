Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 262852FAAF6
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jan 2021 21:08:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389179AbhARUHU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 15:07:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:56318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389972AbhARLOU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Jan 2021 06:14:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C1C2C229C6;
        Mon, 18 Jan 2021 11:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610968419;
        bh=J2YsekzpW29kxoTz9MkMUaODOQ7MYOALSTt4K9PoRVs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Vtf957s1eLR0KOkV6JgklLrJCZT+GJTD3y1A+IyfYdJ5jcPNFnuGdK3OEEfECSWT8
         ABtLELY3b/FqXEDFQFFKX2gETIb4KPJgvy8+Zj3yAFEbIpn2YhxVMdhRvumW+7LfZF
         Ms/e5q1scQtPjplCV33yEumo7/ARfCMUqOPSgj4bdVIEhggtGjswwd1allzWqHx9V2
         2cDuDguNqkk2C4CV5OVTemInsgrqe3FlMRkL6xvLmz4TliPKXbnqf2pr5Y0uw3UgN/
         OuOTrUOEf7NvyUguXR/pblAU4ly+UncqZHiSNd8FHWipMfheqeqtjtLhEs8NCMdvq4
         4b5SYo79QOC7Q==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1l1STi-0001KX-96; Mon, 18 Jan 2021 12:13:46 +0100
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Sheng Long Wang <china_shenglong@163.com>,
        Wang Sheng Long <shenglong.wang.ext@siemens.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 4/6] USB: serial: cp210x: drop short control-transfer checks
Date:   Mon, 18 Jan 2021 12:13:29 +0100
Message-Id: <20210118111331.5048-5-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210118111331.5048-1-johan@kernel.org>
References: <20210118111331.5048-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There's no need to check for short control transfers when sending data
so remove the redundant sanity checks.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/cp210x.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index 4f90573c0d2b..360398665c17 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -674,16 +674,13 @@ static int cp210x_write_reg_block(struct usb_serial_port *port, u8 req,
 
 	kfree(dmabuf);
 
-	if (result == bufsize) {
-		result = 0;
-	} else {
+	if (result < 0) {
 		dev_err(&port->dev, "failed set req 0x%x size %d status: %d\n",
 				req, bufsize, result);
-		if (result >= 0)
-			result = -EIO;
+		return result;
 	}
 
-	return result;
+	return 0;
 }
 
 /*
@@ -720,17 +717,14 @@ static int cp210x_write_vendor_block(struct usb_serial *serial, u8 type,
 
 	kfree(dmabuf);
 
-	if (result == bufsize) {
-		result = 0;
-	} else {
+	if (result < 0) {
 		dev_err(&serial->interface->dev,
 			"failed to set vendor val 0x%04x size %d: %d\n", val,
 			bufsize, result);
-		if (result >= 0)
-			result = -EIO;
+		return result;
 	}
 
-	return result;
+	return 0;
 }
 #endif
 
-- 
2.26.2


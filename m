Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3ACE5F9513
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2019 17:05:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbfKLQFv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Nov 2019 11:05:51 -0500
Received: from mx2.suse.de ([195.135.220.15]:32862 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725954AbfKLQFv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 12 Nov 2019 11:05:51 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 0358DB281;
        Tue, 12 Nov 2019 16:05:50 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     valentina.manea.m@gmail.com, shuah@kernel.org,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] USBIP: add config dependency for SGL_ALLOC
Date:   Tue, 12 Nov 2019 16:49:39 +0100
Message-Id: <20191112154939.21217-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

USBIP uses lib/scatterlist.h
Hence it needs to set CONFIG_SGL_ALLOC

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/usbip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/usbip/Kconfig b/drivers/usb/usbip/Kconfig
index 2f86b28fa3da..7bbae7a08642 100644
--- a/drivers/usb/usbip/Kconfig
+++ b/drivers/usb/usbip/Kconfig
@@ -4,6 +4,7 @@ config USBIP_CORE
 	tristate "USB/IP support"
 	depends on NET
 	select USB_COMMON
+	select SGL_ALLOC
 	---help---
 	  This enables pushing USB packets over IP to allow remote
 	  machines direct access to USB devices. It provides the
-- 
2.16.4


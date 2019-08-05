Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6200B81EF7
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 16:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729100AbfHEOYS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Aug 2019 10:24:18 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:37159 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728028AbfHEOYS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Aug 2019 10:24:18 -0400
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1huduJ-0003js-F8; Mon, 05 Aug 2019 14:24:15 +0000
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
To:     gregkh@linuxfoundation.org
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: [RESEND] [PATCH v2] USB: Disable USB2 LPM at shutdown
Date:   Mon,  5 Aug 2019 22:24:12 +0800
Message-Id: <20190805142412.23965-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The QCA Rome USB Bluetooth controller has several issues once LPM gets
enabled:
- Fails to get enumerated in coldboot. [1]
- Drains more power (~ 0.2W) when the system is in S5. [2]
- Disappears after a warmboot. [2]

The issue happens because the device lingers at LPM L1 in S5, so device
can't get enumerated even after a reboot.

Disable LPM at shutdown to solve the issue.

[1] https://bugs.launchpad.net/bugs/1757218
[2] https://patchwork.kernel.org/patch/10607097/

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
v2: Use new LPM helpers.

 drivers/usb/core/port.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index 1a06a4b5fbb1..bbbb35fa639f 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -285,6 +285,14 @@ static int usb_port_runtime_suspend(struct device *dev)
 }
 #endif
 
+static void usb_port_shutdown(struct device *dev)
+{
+	struct usb_port *port_dev = to_usb_port(dev);
+
+	if (port_dev->child)
+		usb_disable_usb2_hardware_lpm(port_dev->child);
+}
+
 static const struct dev_pm_ops usb_port_pm_ops = {
 #ifdef CONFIG_PM
 	.runtime_suspend =	usb_port_runtime_suspend,
@@ -301,6 +309,7 @@ struct device_type usb_port_device_type = {
 static struct device_driver usb_port_driver = {
 	.name = "usb",
 	.owner = THIS_MODULE,
+	.shutdown = usb_port_shutdown,
 };
 
 static int link_peers(struct usb_port *left, struct usb_port *right)
-- 
2.17.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59CE425BEC6
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 12:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727908AbgICKDg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Sep 2020 06:03:36 -0400
Received: from lucky1.263xmail.com ([211.157.147.133]:50406 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726025AbgICKDg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Sep 2020 06:03:36 -0400
Received: from localhost (unknown [192.168.167.235])
        by lucky1.263xmail.com (Postfix) with ESMTP id 27337C6E63;
        Thu,  3 Sep 2020 18:03:30 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (250.19.126.124.broad.bjtelecom.net [124.126.19.250])
        by smtp.263.net (postfix) whith ESMTP id P22908T140608607864576S1599127410358437_;
        Thu, 03 Sep 2020 18:03:30 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <246953d51479d280e46a58aa75ab4c0f>
X-RL-SENDER: penghao@uniontech.com
X-SENDER: penghao@uniontech.com
X-LOGIN-NAME: penghao@uniontech.com
X-FST-TO: gregkh@linuxfoundation.org
X-SENDER-IP: 124.126.19.250
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 5
X-System-Flag: 0
From:   Penghao <penghao@uniontech.com>
To:     gregkh@linuxfoundation.org
Cc:     johan@kernel.org, hdegoede@redhat.com, dlaz@chromium.org,
        stern@rowland.harvard.edu, kerneldev@karsmulder.nl,
        penghao@uniontech.com, jonathan@jdcox.net, tomasz@meresinski.eu,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: quirks: Add USB_QUIRK_IGNORE_REMOTE_WAKEUP quirk for BYD zhaoxin notebook
Date:   Thu,  3 Sep 2020 18:03:26 +0800
Message-Id: <20200903100326.5327-1-penghao@uniontech.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a USB_QUIRK_IGNORE_REMOTE_WAKEUP quirk for the BYD zhaoxin notebook.
This notebook come with usb touchpad. And we would like to disable touchpad
wakeup on this notebook by default.

Signed-off-by: Penghao <penghao@uniontech.com>
---
 drivers/usb/core/quirks.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 7c1198f80c23..5fa3f2416967 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -387,6 +387,10 @@ static const struct usb_device_id usb_quirk_list[] = {
 	{ USB_DEVICE(0x0b05, 0x17e0), .driver_info =
 			USB_QUIRK_IGNORE_REMOTE_WAKEUP },
 
+	/* SONiX USB DEVICE Touchpad */
+	{ USB_DEVICE(0x0c45, 0x7056), .driver_info =
+			USB_QUIRK_IGNORE_REMOTE_WAKEUP },
+
 	/* Realtek hub in Dell WD19 (Type-C) */
 	{ USB_DEVICE(0x0bda, 0x0487), .driver_info = USB_QUIRK_NO_LPM },
 
-- 
2.11.0




Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4CB914E6F2
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jan 2020 03:08:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727817AbgAaCI0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jan 2020 21:08:26 -0500
Received: from inva020.nxp.com ([92.121.34.13]:53328 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727722AbgAaCIZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 30 Jan 2020 21:08:25 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 300E81A6949;
        Fri, 31 Jan 2020 03:08:24 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5E8671A693C;
        Fri, 31 Jan 2020 03:08:21 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 0AB5240307;
        Fri, 31 Jan 2020 10:08:17 +0800 (SGT)
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/1] usb: charger: assign specific number for enum value
Date:   Fri, 31 Jan 2020 10:03:33 +0800
Message-Id: <1580436213-8862-1-git-send-email-peter.chen@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For work properly on every architectures and compilers, the enum value
needs to be specific numbers.

Suggested-by: Greg KH <gregkh@linuxfoundation.org>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 include/uapi/linux/usb/charger.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/uapi/linux/usb/charger.h b/include/uapi/linux/usb/charger.h
index 5f72af35b3ed..ad22079125bf 100644
--- a/include/uapi/linux/usb/charger.h
+++ b/include/uapi/linux/usb/charger.h
@@ -14,18 +14,18 @@
  * ACA (Accessory Charger Adapters)
  */
 enum usb_charger_type {
-	UNKNOWN_TYPE,
-	SDP_TYPE,
-	DCP_TYPE,
-	CDP_TYPE,
-	ACA_TYPE,
+	UNKNOWN_TYPE = 0,
+	SDP_TYPE = 1,
+	DCP_TYPE = 2,
+	CDP_TYPE = 3,
+	ACA_TYPE = 4,
 };
 
 /* USB charger state */
 enum usb_charger_state {
-	USB_CHARGER_DEFAULT,
-	USB_CHARGER_PRESENT,
-	USB_CHARGER_ABSENT,
+	USB_CHARGER_DEFAULT = 0,
+	USB_CHARGER_PRESENT = 1,
+	USB_CHARGER_ABSENT = 2,
 };
 
 #endif /* _UAPI__LINUX_USB_CHARGER_H */
-- 
2.17.1


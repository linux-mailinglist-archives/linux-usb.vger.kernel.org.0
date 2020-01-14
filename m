Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4EE13A405
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2020 10:43:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728899AbgANJnG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jan 2020 04:43:06 -0500
Received: from inva021.nxp.com ([92.121.34.21]:51938 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728819AbgANJnF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 Jan 2020 04:43:05 -0500
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CF1D1201108;
        Tue, 14 Jan 2020 10:43:03 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D375020009C;
        Tue, 14 Jan 2020 10:43:00 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id DF535402B0;
        Tue, 14 Jan 2020 17:42:56 +0800 (SGT)
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v3 2/2] Doc: ABI: add usb charger uevent
Date:   Tue, 14 Jan 2020 17:38:58 +0800
Message-Id: <1578994738-8872-2-git-send-email-peter.chen@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578994738-8872-1-git-send-email-peter.chen@nxp.com>
References: <1578994738-8872-1-git-send-email-peter.chen@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When the USB charger is inserted or removed, the users could get
USB charger state and type through the uevent.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
Changes for v3:
- Change kernel version for 5.6, and delete the kernel printk time

 Documentation/ABI/testing/usb-charger-uevent | 45 ++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/ABI/testing/usb-charger-uevent

diff --git a/Documentation/ABI/testing/usb-charger-uevent b/Documentation/ABI/testing/usb-charger-uevent
new file mode 100644
index 000000000000..94ab16768e49
--- /dev/null
+++ b/Documentation/ABI/testing/usb-charger-uevent
@@ -0,0 +1,45 @@
+What:		Raise a uevent when a USB charger is inserted or removed
+Date:		2020-01-14
+KernelVersion:	5.6
+Contact:	linux-usb@vger.kernel.org
+Description:	There are two USB charger states:
+		USB_CHARGER_ABSENT
+		USB_CHARGER_PRESENT
+		There are five USB charger types:
+		USB_CHARGER_UNKNOWN_TYPE
+		USB_CHARGER_SDP_TYPE
+		USB_CHARGER_CDP_TYPE
+		USB_CHARGER_DCP_TYPE
+		USB_CHARGER_ACA_TYPE
+
+		Here are two examples taken using udevadm monitor -p when
+		USB charger is online:
+		UDEV  change   /devices/soc0/usbphynop1 (platform)
+		ACTION=change
+		DEVPATH=/devices/soc0/usbphynop1
+		DRIVER=usb_phy_generic
+		MODALIAS=of:Nusbphynop1T(null)Cusb-nop-xceiv
+		OF_COMPATIBLE_0=usb-nop-xceiv
+		OF_COMPATIBLE_N=1
+		OF_FULLNAME=/usbphynop1
+		OF_NAME=usbphynop1
+		SEQNUM=2493
+		SUBSYSTEM=platform
+		USB_CHARGER_STATE=USB_CHARGER_PRESENT
+		USB_CHARGER_TYPE=USB_CHARGER_SDP_TYPE
+		USEC_INITIALIZED=227422826
+
+		USB charger is offline:
+		KERNEL change   /devices/soc0/usbphynop1 (platform)
+		ACTION=change
+		DEVPATH=/devices/soc0/usbphynop1
+		DRIVER=usb_phy_generic
+		MODALIAS=of:Nusbphynop1T(null)Cusb-nop-xceiv
+		OF_COMPATIBLE_0=usb-nop-xceiv
+		OF_COMPATIBLE_N=1
+		OF_FULLNAME=/usbphynop1
+		OF_NAME=usbphynop1
+		SEQNUM=2494
+		SUBSYSTEM=platform
+		USB_CHARGER_STATE=USB_CHARGER_ABSENT
+		USB_CHARGER_TYPE=USB_CHARGER_UNKNOWN_TYPE
-- 
2.17.1


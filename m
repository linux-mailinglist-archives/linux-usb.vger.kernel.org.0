Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EBC410F567
	for <lists+linux-usb@lfdr.de>; Tue,  3 Dec 2019 04:06:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbfLCDGB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Dec 2019 22:06:01 -0500
Received: from inva020.nxp.com ([92.121.34.13]:59636 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726251AbfLCDGB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 2 Dec 2019 22:06:01 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C56CF1A1253;
        Tue,  3 Dec 2019 04:05:59 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3A47C1A125D;
        Tue,  3 Dec 2019 04:05:57 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id B098A402BC;
        Tue,  3 Dec 2019 11:05:53 +0800 (SGT)
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH RESEND v2 2/2] Doc: ABI: add usb charger uevent
Date:   Tue,  3 Dec 2019 11:03:55 +0800
Message-Id: <1575342235-14791-2-git-send-email-peter.chen@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575342235-14791-1-git-send-email-peter.chen@nxp.com>
References: <1575342235-14791-1-git-send-email-peter.chen@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When the USB charger is inserted or removed, the users could get
USB charger state and type through the uevent.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 Documentation/ABI/testing/usb-charger-uevent | 45 ++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/ABI/testing/usb-charger-uevent

diff --git a/Documentation/ABI/testing/usb-charger-uevent b/Documentation/ABI/testing/usb-charger-uevent
new file mode 100644
index 000000000000..93ffd3a54a7f
--- /dev/null
+++ b/Documentation/ABI/testing/usb-charger-uevent
@@ -0,0 +1,45 @@
+What:		Raise a uevent when a USB charger is inserted or removed
+Date:		2019-11-11
+KernelVersion:	5.5
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
+		UDEV  [227.425096] change   /devices/soc0/usbphynop1 (platform)
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
+		KERNEL[229.533933] change   /devices/soc0/usbphynop1 (platform)
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


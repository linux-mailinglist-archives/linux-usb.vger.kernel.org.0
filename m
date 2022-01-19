Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C186493DB3
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jan 2022 16:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355972AbiASPwB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jan 2022 10:52:01 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:26250 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355970AbiASPv7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Jan 2022 10:51:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1642607519; x=1674143519;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=XIxmgk0xsE5Ynu3qEoXGiIkU8u/hPZNmziCPdHmNVpI=;
  b=VFSKTKCbqtjxrtoRibbHMjW8YbRaDAaRmzUYCCT8u29+dH/hUH5dwGZW
   xv1taVL4qG2ejXtrSpWZyxNXGcVGF0LTtaG3efWx6W9t7qsSQmGMoZTjJ
   36nzIlyzgpExXp3mwa8cQw1Cq9EaiLe0vFnW8YZc+i8FQ/GjjYbnXNOt+
   8=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 19 Jan 2022 07:51:59 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2022 07:51:59 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 19 Jan 2022 07:51:58 -0800
Received: from ppratap-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 19 Jan 2022 07:51:55 -0800
From:   Pratham Pratap <quic_ppratap@quicinc.com>
To:     <gregkh@linuxfoundation.org>, <mathias.nyman@intel.com>
CC:     <linux-usb@vger.kernel.org>, <quic_pkondeti@quicinc.com>,
        <quic_jackp@quicinc.com>, <quic_mrana@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>
Subject: [PATCH v1] usb: hub: Power cycle root hub if CSC is set during hub_port_reset
Date:   Wed, 19 Jan 2022 21:21:38 +0530
Message-ID: <1642607498-8458-1-git-send-email-quic_ppratap@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When a FS device is following a suspend-reset-enumeration-data
transfer sequence, sometimes it goes back in suspend just after reset
without the link entering L0. This is seen in only when the following
scenarios are met:
- SOF and EOR happens at the same clock cycle
- UTMI line state should transition from SE0 to K at the same clock
cycle(if the UTMI line state transition from SE0 to J at the same
clock cycle then problem is not seen)

Attemting a power cycle of the root hub recovers the problem described.
To identify the issue, PLS goes to disabled state followed by CSC bit
being set(because of CCS status change).

Signed-off-by: Pratham Pratap <quic_ppratap@quicinc.com>
---
v1:
Problem is seen on core emulation setup with eUSB2 PHY test chip.
This failure is seen only in full speed host mode usecase with all
available eUSB2 repeater randomly in 1 out of 5000 to 6000 iterations.
As of now, we don't have any SOC with eUSB2 PHY on which this fix can
be tested.

 drivers/usb/core/hub.c        | 34 ++++++++++++++++++++++++++--------
 drivers/usb/host/xhci-plat.c  |  3 +++
 include/linux/usb/hcd.h       |  1 +
 include/uapi/linux/usb/ch11.h |  1 +
 4 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 47a1c8b..6a65092 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -2834,10 +2834,20 @@ static bool hub_port_warm_reset_required(struct usb_hub *hub, int port1,
 		|| link_state == USB_SS_PORT_LS_COMP_MOD;
 }
 
+static void usb_hub_port_power_cycle(struct usb_device *hdev, struct usb_hub *hub, int port1)
+{
+	dev_info(&hub->ports[port1 - 1]->dev, "attempt power cycle\n");
+	usb_hub_set_port_power(hdev, hub, port1, false);
+	msleep(2 * hub_power_on_good_delay(hub));
+	usb_hub_set_port_power(hdev, hub, port1, true);
+	msleep(hub_power_on_good_delay(hub));
+}
+
 static int hub_port_wait_reset(struct usb_hub *hub, int port1,
 			struct usb_device *udev, unsigned int delay, bool warm)
 {
 	int delay_time, ret;
+	struct usb_hcd *hcd = bus_to_hcd(udev->bus);
 	u16 portstatus;
 	u16 portchange;
 	u32 ext_portstatus = 0;
@@ -2887,8 +2897,21 @@ static int hub_port_wait_reset(struct usb_hub *hub, int port1,
 		return -ENOTCONN;
 
 	/* Device went away? */
-	if (!(portstatus & USB_PORT_STAT_CONNECTION))
+	if (!(portstatus & USB_PORT_STAT_CONNECTION)) {
+		/*
+		 * When a FS device is following a suspend-reset-enumeration-data_transfer
+		 * sequence, sometimes it goes back in suspend just after reset without the
+		 * link entering L0. To fix this when CSC bit is set(because of CCS status
+		 * change) power cycle the root hub.
+		 */
+		if (udev->reset_resume && (!udev->parent && hcd->fs_suspend_reset) &&
+				(portstatus & USB_PORT_STAT_CSC)) {
+			usb_hub_port_power_cycle(hdev, hub, port1);
+			return -EAGAIN;
+		}
+
 		return -ENOTCONN;
+	}
 
 	/* Retry if connect change is set but status is still connected.
 	 * A USB 3.0 connection may bounce if multiple warm resets were issued,
@@ -5393,13 +5416,8 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 			break;
 
 		/* When halfway through our retry count, power-cycle the port */
-		if (i == (PORT_INIT_TRIES - 1) / 2) {
-			dev_info(&port_dev->dev, "attempt power cycle\n");
-			usb_hub_set_port_power(hdev, hub, port1, false);
-			msleep(2 * hub_power_on_good_delay(hub));
-			usb_hub_set_port_power(hdev, hub, port1, true);
-			msleep(hub_power_on_good_delay(hub));
-		}
+		if (i == (PORT_INIT_TRIES - 1) / 2)
+			usb_hub_port_power_cycle(hdev, hub, port1);
 	}
 	if (hub->hdev->parent ||
 			!hcd->driver->port_handed_over ||
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index c1edcc9..607c4f0 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -342,6 +342,9 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	hcd->tpl_support = of_usb_host_tpl_support(sysdev->of_node);
 	xhci->shared_hcd->tpl_support = hcd->tpl_support;
 
+	hcd->fs_suspend_reset = of_property_read_bool(sysdev->of_node, "fs-suspend-reset");
+	xhci->shared_hcd->fs_suspend_reset = hcd->fs_suspend_reset;
+
 	if (priv) {
 		ret = xhci_priv_plat_setup(hcd);
 		if (ret)
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index 548a028..05ccbc8 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -172,6 +172,7 @@ struct usb_hcd {
 	unsigned		tpl_support:1; /* OTG & EH TPL support */
 	unsigned		cant_recv_wakeups:1;
 			/* wakeup requests from downstream aren't received */
+	unsigned		fs_suspend_reset:1; /* fs suspend reset bug */
 
 	unsigned int		irq;		/* irq allocated */
 	void __iomem		*regs;		/* device memory/io */
diff --git a/include/uapi/linux/usb/ch11.h b/include/uapi/linux/usb/ch11.h
index fb0cd24..576bbf9 100644
--- a/include/uapi/linux/usb/ch11.h
+++ b/include/uapi/linux/usb/ch11.h
@@ -135,6 +135,7 @@ struct usb_port_status {
 #define USB_PORT_STAT_TEST              0x0800
 #define USB_PORT_STAT_INDICATOR         0x1000
 /* bits 13 to 15 are reserved */
+#define USB_PORT_STAT_CSC		0x20000
 
 /*
  * Additions to wPortStatus bit field from USB 3.0
-- 
2.7.4


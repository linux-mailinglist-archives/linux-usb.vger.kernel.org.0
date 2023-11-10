Return-Path: <linux-usb+bounces-2763-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C596C7E7906
	for <lists+linux-usb@lfdr.de>; Fri, 10 Nov 2023 07:14:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 797CC281779
	for <lists+linux-usb@lfdr.de>; Fri, 10 Nov 2023 06:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159BD5257;
	Fri, 10 Nov 2023 06:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4655236
	for <linux-usb@vger.kernel.org>; Fri, 10 Nov 2023 06:14:23 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B0965258;
	Thu,  9 Nov 2023 22:14:18 -0800 (PST)
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 3AA5mrXxB2065780, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 3AA5mrXxB2065780
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Nov 2023 13:48:53 +0800
Received: from RTEXMBS06.realtek.com.tw (172.21.6.99) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Fri, 10 Nov 2023 13:48:54 +0800
Received: from RTEXH36505.realtek.com.tw (172.21.6.25) by
 RTEXMBS06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Fri, 10 Nov 2023 13:48:52 +0800
Received: from localhost.localdomain (172.21.252.101) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server id
 15.1.2375.32 via Frontend Transport; Fri, 10 Nov 2023 13:48:52 +0800
From: Stanley Chang <stanley_chang@realtek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Stanley Chang <stanley_chang@realtek.com>, Vinod Koul <vkoul@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Yang Yingliang <yangyingliang@huawei.com>,
        =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?=
	<ricardo.canuelo@collabora.com>,
        Roy Luo <royluo@google.com>,
        Heikki Krogerus
	<heikki.krogerus@linux.intel.com>,
        <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-usb@vger.kernel.org>
Subject: [PATCH v3 4/4] usb: core: add phy notify connect and disconnect
Date: Fri, 10 Nov 2023 13:45:15 +0800
Message-ID: <20231110054738.23515-4-stanley_chang@realtek.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231110054738.23515-1-stanley_chang@realtek.com>
References: <20231110054738.23515-1-stanley_chang@realtek.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-KSE-ServerInfo: RTEXMBS06.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

In Realtek SoC, the parameter of usb phy is designed to can dynamic
tuning base on port status. Therefore, add a notify callback of generic
phy driver when usb device connect and disconnect change.

The Realtek phy driver is designed to dynamically adjust disconnection
level and calibrate phy parameters. When the device connected bit changes
and when the disconnected bit changes, do connection change notification:

Check if portstatus is USB_PORT_STAT_CONNECTION and portchange is
USB_PORT_STAT_C_CONNECTION.
1. The device is connected, the driver lowers the disconnection level and
   calibrates the phy parameters.
2. The device disconnects, the driver increases the disconnect level and
   calibrates the phy parameters.

Generic phy driver in usb core framework does not support device connect
and disconnect notifications. Therefore, we add an api to notify phy
the connection changes.

Additionally, the generic phy only specifies primary_hcd in the original
design. Added specific "usb2-phy" on primary_hcd and "usb3-phy" on
shared_hcd.

Signed-off-by: Stanley Chang <stanley_chang@realtek.com>
---
v1 to v2 change:
    rebase the driver to remove the part of usb phy notify API
v2 to v3:
    No change
---
 drivers/usb/core/hcd.c | 14 +++++--
 drivers/usb/core/hub.c | 29 +++++++++++++
 drivers/usb/core/phy.c | 94 ++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/core/phy.h |  3 ++
 4 files changed, 136 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 12b6dfeaf658..992284461ad8 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -2794,10 +2794,16 @@ int usb_add_hcd(struct usb_hcd *hcd,
 	struct usb_device *rhdev;
 	struct usb_hcd *shared_hcd;
 
-	if (!hcd->skip_phy_initialization && usb_hcd_is_primary_hcd(hcd)) {
-		hcd->phy_roothub = usb_phy_roothub_alloc(hcd->self.sysdev);
-		if (IS_ERR(hcd->phy_roothub))
-			return PTR_ERR(hcd->phy_roothub);
+	if (!hcd->skip_phy_initialization) {
+		if (usb_hcd_is_primary_hcd(hcd)) {
+			hcd->phy_roothub = usb_phy_roothub_alloc(hcd->self.sysdev);
+			if (IS_ERR(hcd->phy_roothub))
+				return PTR_ERR(hcd->phy_roothub);
+		} else {
+			hcd->phy_roothub = usb_phy_roothub_alloc_usb3_phy(hcd->self.sysdev);
+			if (IS_ERR(hcd->phy_roothub))
+				return PTR_ERR(hcd->phy_roothub);
+		}
 
 		retval = usb_phy_roothub_init(hcd->phy_roothub);
 		if (retval)
diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 87480a6e6d93..65c0454ee70a 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -37,6 +37,7 @@
 #include <asm/byteorder.h>
 
 #include "hub.h"
+#include "phy.h"
 #include "otg_productlist.h"
 
 #define USB_VENDOR_GENESYS_LOGIC		0x05e3
@@ -622,6 +623,34 @@ static int hub_ext_port_status(struct usb_hub *hub, int port1, int type,
 		ret = 0;
 	}
 	mutex_unlock(&hub->status_mutex);
+
+	/*
+	 * There is no need to lock status_mutex here, because status_mutex
+	 * protects hub->status, and the phy driver only checks the port
+	 * status without changing the status.
+	 */
+	if (!ret) {
+		struct usb_device *hdev = hub->hdev;
+
+		/*
+		 * Only roothub will be notified of connection changes,
+		 * since the USB PHY only cares about changes at the next
+		 * level.
+		 */
+		if (is_root_hub(hdev)) {
+			struct usb_hcd *hcd = bus_to_hcd(hdev->bus);
+			bool connect;
+			bool connect_change;
+
+			connect_change = *change & USB_PORT_STAT_C_CONNECTION;
+			connect = *status & USB_PORT_STAT_CONNECTION;
+			if (connect_change && connect)
+				usb_phy_roothub_notify_connect(hcd->phy_roothub, port1 - 1);
+			else if (connect_change)
+				usb_phy_roothub_notify_disconnect(hcd->phy_roothub, port1 - 1);
+		}
+	}
+
 	return ret;
 }
 
diff --git a/drivers/usb/core/phy.c b/drivers/usb/core/phy.c
index fb1588e7c282..26585fc1ec32 100644
--- a/drivers/usb/core/phy.c
+++ b/drivers/usb/core/phy.c
@@ -19,6 +19,29 @@ struct usb_phy_roothub {
 	struct list_head	list;
 };
 
+static int usb_phy_roothub_add_phy_by_name(struct device *dev, const char *name,
+					   struct list_head *list)
+{
+	struct usb_phy_roothub *roothub_entry;
+	struct phy *phy;
+
+	phy = devm_of_phy_get(dev, dev->of_node, name);
+	if (IS_ERR(phy))
+		return PTR_ERR(phy);
+
+	roothub_entry = devm_kzalloc(dev, sizeof(*roothub_entry), GFP_KERNEL);
+	if (!roothub_entry)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&roothub_entry->list);
+
+	roothub_entry->phy = phy;
+
+	list_add_tail(&roothub_entry->list, list);
+
+	return 0;
+}
+
 static int usb_phy_roothub_add_phy(struct device *dev, int index,
 				   struct list_head *list)
 {
@@ -65,6 +88,9 @@ struct usb_phy_roothub *usb_phy_roothub_alloc(struct device *dev)
 
 	INIT_LIST_HEAD(&phy_roothub->list);
 
+	if (!usb_phy_roothub_add_phy_by_name(dev, "usb2-phy", &phy_roothub->list))
+		return phy_roothub;
+
 	for (i = 0; i < num_phys; i++) {
 		err = usb_phy_roothub_add_phy(dev, i, &phy_roothub->list);
 		if (err)
@@ -75,6 +101,32 @@ struct usb_phy_roothub *usb_phy_roothub_alloc(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(usb_phy_roothub_alloc);
 
+struct usb_phy_roothub *usb_phy_roothub_alloc_usb3_phy(struct device *dev)
+{
+	struct usb_phy_roothub *phy_roothub;
+	int num_phys;
+
+	if (!IS_ENABLED(CONFIG_GENERIC_PHY))
+		return NULL;
+
+	num_phys = of_count_phandle_with_args(dev->of_node, "phys",
+					      "#phy-cells");
+	if (num_phys <= 0)
+		return NULL;
+
+	phy_roothub = devm_kzalloc(dev, sizeof(*phy_roothub), GFP_KERNEL);
+	if (!phy_roothub)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&phy_roothub->list);
+
+	if (!usb_phy_roothub_add_phy_by_name(dev, "usb3-phy", &phy_roothub->list))
+		return phy_roothub;
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(usb_phy_roothub_alloc_usb3_phy);
+
 int usb_phy_roothub_init(struct usb_phy_roothub *phy_roothub)
 {
 	struct usb_phy_roothub *roothub_entry;
@@ -172,6 +224,48 @@ int usb_phy_roothub_calibrate(struct usb_phy_roothub *phy_roothub)
 }
 EXPORT_SYMBOL_GPL(usb_phy_roothub_calibrate);
 
+int usb_phy_roothub_notify_connect(struct usb_phy_roothub *phy_roothub, int port)
+{
+	struct usb_phy_roothub *roothub_entry;
+	struct list_head *head;
+	int err;
+
+	if (!phy_roothub)
+		return 0;
+
+	head = &phy_roothub->list;
+
+	list_for_each_entry(roothub_entry, head, list) {
+		err = phy_notify_connect(roothub_entry->phy, port);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(usb_phy_roothub_notify_connect);
+
+int usb_phy_roothub_notify_disconnect(struct usb_phy_roothub *phy_roothub, int port)
+{
+	struct usb_phy_roothub *roothub_entry;
+	struct list_head *head;
+	int err;
+
+	if (!phy_roothub)
+		return 0;
+
+	head = &phy_roothub->list;
+
+	list_for_each_entry(roothub_entry, head, list) {
+		err = phy_notify_disconnect(roothub_entry->phy, port);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(usb_phy_roothub_notify_disconnect);
+
 int usb_phy_roothub_power_on(struct usb_phy_roothub *phy_roothub)
 {
 	struct usb_phy_roothub *roothub_entry;
diff --git a/drivers/usb/core/phy.h b/drivers/usb/core/phy.h
index 20a267cd986b..88b49c0ea6b5 100644
--- a/drivers/usb/core/phy.h
+++ b/drivers/usb/core/phy.h
@@ -12,6 +12,7 @@ struct device;
 struct usb_phy_roothub;
 
 struct usb_phy_roothub *usb_phy_roothub_alloc(struct device *dev);
+struct usb_phy_roothub *usb_phy_roothub_alloc_usb3_phy(struct device *dev);
 
 int usb_phy_roothub_init(struct usb_phy_roothub *phy_roothub);
 int usb_phy_roothub_exit(struct usb_phy_roothub *phy_roothub);
@@ -19,6 +20,8 @@ int usb_phy_roothub_exit(struct usb_phy_roothub *phy_roothub);
 int usb_phy_roothub_set_mode(struct usb_phy_roothub *phy_roothub,
 			     enum phy_mode mode);
 int usb_phy_roothub_calibrate(struct usb_phy_roothub *phy_roothub);
+int usb_phy_roothub_notify_connect(struct usb_phy_roothub *phy_roothub, int port);
+int usb_phy_roothub_notify_disconnect(struct usb_phy_roothub *phy_roothub, int port);
 int usb_phy_roothub_power_on(struct usb_phy_roothub *phy_roothub);
 void usb_phy_roothub_power_off(struct usb_phy_roothub *phy_roothub);
 
-- 
2.34.1



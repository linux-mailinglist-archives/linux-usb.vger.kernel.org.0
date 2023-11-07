Return-Path: <linux-usb+bounces-2624-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 988087E36C1
	for <lists+linux-usb@lfdr.de>; Tue,  7 Nov 2023 09:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53EFB280FC5
	for <lists+linux-usb@lfdr.de>; Tue,  7 Nov 2023 08:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E7C52907;
	Tue,  7 Nov 2023 08:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9012906
	for <linux-usb@vger.kernel.org>; Tue,  7 Nov 2023 08:37:13 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6105BD;
	Tue,  7 Nov 2023 00:37:11 -0800 (PST)
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 3A78ZPcxC4084369, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 3A78ZPcxC4084369
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Nov 2023 16:35:26 +0800
Received: from RTEXMBS05.realtek.com.tw (172.21.6.98) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Tue, 7 Nov 2023 16:35:26 +0800
Received: from RTEXH36505.realtek.com.tw (172.21.6.25) by
 RTEXMBS05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Tue, 7 Nov 2023 16:35:25 +0800
Received: from localhost.localdomain (172.21.252.101) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server id
 15.1.2375.32 via Frontend Transport; Tue, 7 Nov 2023 16:35:25 +0800
From: Stanley Chang <stanley_chang@realtek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Stanley Chang <stanley_chang@realtek.com>, Vinod Koul <vkoul@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Yang Yingliang <yangyingliang@huawei.com>, Ray Chi <raychi@google.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Flavio Suligoi
	<f.suligoi@asem.it>,
        =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?=
	<ricardo.canuelo@collabora.com>,
        Roy Luo <royluo@google.com>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-usb@vger.kernel.org>
Subject: [PATCH v2 1/4] phy: core: add notify_connect and notify_disconnect callback
Date: Tue, 7 Nov 2023 16:31:40 +0800
Message-ID: <20231107083525.24901-1-stanley_chang@realtek.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-KSE-ServerInfo: RTEXMBS05.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

In Realtek SoC, the parameter of usb phy is designed to can dynamic
tuning base on port status. Therefore, add a notify callback of phy
driver when usb connection/disconnection change.

Signed-off-by: Stanley Chang <stanley_chang@realtek.com>
---
v1 to v2:
    No change
---
 drivers/phy/phy-core.c  | 47 +++++++++++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h | 18 ++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 96a0b1e111f3..a84ad4896b7f 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -489,6 +489,53 @@ int phy_calibrate(struct phy *phy)
 }
 EXPORT_SYMBOL_GPL(phy_calibrate);
 
+/**
+ * phy_notify_connect() - phy connect notify
+ * @phy: the phy returned by phy_get()
+ * @port: the port index for connect
+ *
+ * If phy need the get connection status, the callback can be used.
+ * Returns: %0 if successful, a negative error code otherwise
+ */
+int phy_notify_connect(struct phy *phy, int port)
+{
+	int ret;
+
+	if (!phy || !phy->ops->connect)
+		return 0;
+
+	mutex_lock(&phy->mutex);
+	ret = phy->ops->connect(phy, port);
+	mutex_unlock(&phy->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(phy_notify_connect);
+
+/**
+ * phy_notify_disconnect() - phy disconnect notify
+ * @phy: the phy returned by phy_get()
+ * @port: the port index for disconnect
+ *
+ * If phy need the get disconnection status, the callback can be used.
+ *
+ * Returns: %0 if successful, a negative error code otherwise
+ */
+int phy_notify_disconnect(struct phy *phy, int port)
+{
+	int ret;
+
+	if (!phy || !phy->ops->disconnect)
+		return 0;
+
+	mutex_lock(&phy->mutex);
+	ret = phy->ops->disconnect(phy, port);
+	mutex_unlock(&phy->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(phy_notify_disconnect);
+
 /**
  * phy_configure() - Changes the phy parameters
  * @phy: the phy returned by phy_get()
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index f6d607ef0e80..cf98cb29ddaa 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -122,6 +122,8 @@ struct phy_ops {
 			    union phy_configure_opts *opts);
 	int	(*reset)(struct phy *phy);
 	int	(*calibrate)(struct phy *phy);
+	int	(*connect)(struct phy *phy, int port);
+	int	(*disconnect)(struct phy *phy, int port);
 	void	(*release)(struct phy *phy);
 	struct module *owner;
 };
@@ -243,6 +245,8 @@ static inline enum phy_mode phy_get_mode(struct phy *phy)
 }
 int phy_reset(struct phy *phy);
 int phy_calibrate(struct phy *phy);
+int phy_notify_connect(struct phy *phy, int port);
+int phy_notify_disconnect(struct phy *phy, int port);
 static inline int phy_get_bus_width(struct phy *phy)
 {
 	return phy->attrs.bus_width;
@@ -396,6 +400,20 @@ static inline int phy_calibrate(struct phy *phy)
 	return -ENOSYS;
 }
 
+static inline int phy_notify_connect(struct phy *phy, int index)
+{
+	if (!phy)
+		return 0;
+	return -ENOSYS;
+}
+
+static inline int phy_notify_disconnect(struct phy *phy, int index)
+{
+	if (!phy)
+		return 0;
+	return -ENOSYS;
+}
+
 static inline int phy_configure(struct phy *phy,
 				union phy_configure_opts *opts)
 {
-- 
2.34.1



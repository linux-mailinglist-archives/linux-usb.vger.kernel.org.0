Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5A62456B3
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2019 09:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbfFNHr2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Jun 2019 03:47:28 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:19580 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726349AbfFNHr1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Jun 2019 03:47:27 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d03510d0001>; Fri, 14 Jun 2019 00:47:25 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 14 Jun 2019 00:47:25 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 14 Jun 2019 00:47:25 -0700
Received: from jckuo-lt.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Jun
 2019 07:47:23 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <pdeschrijver@nvidia.com>,
        <afrid@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <nkristam@nvidia.com>,
        <skomatineni@nvidia.com>, JC Kuo <jckuo@nvidia.com>
Subject: [PATCH 4/8] phy: tegra: xusb: add sleepwalk and suspend/resume
Date:   Fri, 14 Jun 2019 15:46:52 +0800
Message-ID: <20190614074652.21960-5-jckuo@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190614074652.21960-1-jckuo@nvidia.com>
References: <20190614074652.21960-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560498445; bh=ae8GRZ+AExarJlvCDBzEx/4oOa+upNZbT8vttOwLs2Q=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-Originating-IP:
         X-ClientProxiedBy:Content-Type;
        b=DeMM9Zp+5vnjMfYsQiuoqsci+DCs8W0PAI1x6+KKLdyebM/Am43r8kjRmMO31wj60
         QRqzG24OH53eGZIXQ6wUEIfodJRmsZeGuu3t5UKbe+XpzFx0iyxeETbFkkAd4YjLbM
         w2+qfp1aosdTMLyjtEHJ2uTOa9W9Qqi8ksjtdJtv/8MqjsA15rSneB7k6bd+mQDk6R
         egpM11Hj5FbbzTzqUQE6dK0odcTdkzDg9kZdQi8p4T7Z2VV+4IbnHiclFlMFMsr8gT
         L4uUOysC4cj8jrQcE2Pl+BTPjs4rouwlLGfWArfJZECI8GFOvpsU9RXvZ5qtZg6blr
         D9XVJ/xgOAngw==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This commit adds sleepwalk/wake and suspend/resume interfaces
to Tegra XUSB PHY driver.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
 drivers/phy/tegra/xusb.c       | 78 ++++++++++++++++++++++++++++++++++
 drivers/phy/tegra/xusb.h       |  8 ++++
 include/linux/phy/tegra/xusb.h | 12 ++++++
 3 files changed, 98 insertions(+)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 7fbba53f6097..14461d59b947 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -975,10 +975,36 @@ static int tegra_xusb_padctl_remove(struct platform_device *pdev)
 	return err;
 }
 
+static int tegra_xusb_padctl_suspend_noirq(struct device *dev)
+{
+	struct tegra_xusb_padctl *padctl = dev_get_drvdata(dev);
+
+	if (padctl->soc->ops->suspend_noirq)
+		return padctl->soc->ops->suspend_noirq(padctl);
+
+	return 0;
+}
+
+static int tegra_xusb_padctl_resume_noirq(struct device *dev)
+{
+	struct tegra_xusb_padctl *padctl = dev_get_drvdata(dev);
+
+	if (padctl->soc->ops->resume_noirq)
+		return padctl->soc->ops->resume_noirq(padctl);
+
+	return 0;
+}
+
+static const struct dev_pm_ops tegra_xusb_padctl_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(tegra_xusb_padctl_suspend_noirq,
+				      tegra_xusb_padctl_resume_noirq)
+};
+
 static struct platform_driver tegra_xusb_padctl_driver = {
 	.driver = {
 		.name = "tegra-xusb-padctl",
 		.of_match_table = tegra_xusb_padctl_of_match,
+		.pm = &tegra_xusb_padctl_pm_ops,
 	},
 	.probe = tegra_xusb_padctl_probe,
 	.remove = tegra_xusb_padctl_remove,
@@ -1045,6 +1071,58 @@ int tegra_xusb_padctl_hsic_set_idle(struct tegra_xusb_padctl *padctl,
 }
 EXPORT_SYMBOL_GPL(tegra_xusb_padctl_hsic_set_idle);
 
+int tegra_xusb_padctl_enable_phy_sleepwalk(struct tegra_xusb_padctl *padctl,
+					   struct phy *phy,
+					   enum usb_device_speed speed)
+{
+	if (padctl->soc->ops->phy_sleepwalk)
+		return padctl->soc->ops->phy_sleepwalk(padctl, phy, true,
+						       speed);
+
+	return -ENOTSUPP;
+}
+EXPORT_SYMBOL_GPL(tegra_xusb_padctl_enable_phy_sleepwalk);
+
+int tegra_xusb_padctl_disable_phy_sleepwalk(struct tegra_xusb_padctl *padctl,
+					    struct phy *phy)
+{
+	if (padctl->soc->ops->phy_sleepwalk)
+		return padctl->soc->ops->phy_sleepwalk(padctl, phy, false, 0);
+
+	return -ENOTSUPP;
+}
+EXPORT_SYMBOL_GPL(tegra_xusb_padctl_disable_phy_sleepwalk);
+
+int tegra_xusb_padctl_enable_phy_wake(struct tegra_xusb_padctl *padctl,
+				      struct phy *phy)
+{
+	if (padctl->soc->ops->phy_wake)
+		return padctl->soc->ops->phy_wake(padctl, phy, true);
+
+	return -ENOTSUPP;
+}
+EXPORT_SYMBOL_GPL(tegra_xusb_padctl_enable_phy_wake);
+
+int tegra_xusb_padctl_disable_phy_wake(struct tegra_xusb_padctl *padctl,
+				       struct phy *phy)
+{
+	if (padctl->soc->ops->phy_wake)
+		return padctl->soc->ops->phy_wake(padctl, phy, false);
+
+	return -ENOTSUPP;
+}
+EXPORT_SYMBOL_GPL(tegra_xusb_padctl_disable_phy_wake);
+
+int tegra_xusb_padctl_remote_wake_detected(struct tegra_xusb_padctl *padctl,
+					   struct phy *phy)
+{
+	if (padctl->soc->ops->remote_wake_detected)
+		return padctl->soc->ops->remote_wake_detected(phy);
+
+	return -ENOTSUPP;
+}
+EXPORT_SYMBOL_GPL(tegra_xusb_padctl_remote_wake_detected);
+
 int tegra_xusb_padctl_usb3_set_lfps_detect(struct tegra_xusb_padctl *padctl,
 					   unsigned int port, bool enable)
 {
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index 1bfe14b2a274..9482914536ac 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -11,6 +11,7 @@
 #include <linux/mutex.h>
 #include <linux/workqueue.h>
 
+#include <linux/usb/ch9.h>
 #include <linux/usb/otg.h>
 
 /* legacy entry points for backwards-compatibility */
@@ -368,12 +369,19 @@ struct tegra_xusb_padctl_ops {
 			 const struct tegra_xusb_padctl_soc *soc);
 	void (*remove)(struct tegra_xusb_padctl *padctl);
 
+	int (*suspend_noirq)(struct tegra_xusb_padctl *padctl);
+	int (*resume_noirq)(struct tegra_xusb_padctl *padctl);
 	int (*usb3_save_context)(struct tegra_xusb_padctl *padctl,
 				 unsigned int index);
 	int (*hsic_set_idle)(struct tegra_xusb_padctl *padctl,
 			     unsigned int index, bool idle);
 	int (*usb3_set_lfps_detect)(struct tegra_xusb_padctl *padctl,
 				    unsigned int index, bool enable);
+	int (*phy_sleepwalk)(struct tegra_xusb_padctl *padctl, struct phy *phy,
+			     bool enable, enum usb_device_speed speed);
+	int (*phy_wake)(struct tegra_xusb_padctl *padctl, struct phy *phy,
+			bool enable);
+	int (*remote_wake_detected)(struct phy *phy);
 };
 
 struct tegra_xusb_padctl_soc {
diff --git a/include/linux/phy/tegra/xusb.h b/include/linux/phy/tegra/xusb.h
index ee59562c8354..2fb12e3baaee 100644
--- a/include/linux/phy/tegra/xusb.h
+++ b/include/linux/phy/tegra/xusb.h
@@ -8,6 +8,7 @@
 
 struct tegra_xusb_padctl;
 struct device;
+enum usb_device_speed;
 
 struct tegra_xusb_padctl *tegra_xusb_padctl_get(struct device *dev);
 void tegra_xusb_padctl_put(struct tegra_xusb_padctl *padctl);
@@ -18,5 +19,16 @@ int tegra_xusb_padctl_hsic_set_idle(struct tegra_xusb_padctl *padctl,
 				    unsigned int port, bool idle);
 int tegra_xusb_padctl_usb3_set_lfps_detect(struct tegra_xusb_padctl *padctl,
 					   unsigned int port, bool enable);
+int tegra_xusb_padctl_enable_phy_sleepwalk(struct tegra_xusb_padctl *padctl,
+					   struct phy *phy,
+					   enum usb_device_speed speed);
+int tegra_xusb_padctl_disable_phy_sleepwalk(struct tegra_xusb_padctl *padctl,
+					   struct phy *phy);
+int tegra_xusb_padctl_enable_phy_wake(struct tegra_xusb_padctl *padctl,
+				      struct phy *phy);
+int tegra_xusb_padctl_disable_phy_wake(struct tegra_xusb_padctl *padctl,
+				       struct phy *phy);
+int tegra_xusb_padctl_remote_wake_detected(struct tegra_xusb_padctl *padctl,
+					struct phy *phy);
 
 #endif /* PHY_TEGRA_XUSB_H */
-- 
2.17.1


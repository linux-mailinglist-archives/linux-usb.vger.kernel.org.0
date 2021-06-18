Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EBAB3AC79B
	for <lists+linux-usb@lfdr.de>; Fri, 18 Jun 2021 11:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233798AbhFRJcy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Jun 2021 05:32:54 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:57542 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S233472AbhFRJcX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Jun 2021 05:32:23 -0400
X-UUID: 3e726c11f3ca4147ad36a8bbee9e69af-20210618
X-UUID: 3e726c11f3ca4147ad36a8bbee9e69af-20210618
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 619443617; Fri, 18 Jun 2021 17:30:11 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Jun 2021 17:29:58 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Jun 2021 17:29:56 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Felipe Balbi <balbi@kernel.org>
CC:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 13/13] usb: mtu3: support suspend/resume for dual-role mode
Date:   Fri, 18 Jun 2021 17:29:18 +0800
Message-ID: <1624008558-16949-14-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1624008558-16949-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1624008558-16949-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: D6DFC2FC4B8D1D0542543F30B45D8F370DFB9715F39C62A9742B32CD9BD2B5F82000:8
X-MTK:  N
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Support suspend/resume for dual-role mode including the single
port and multi-ports supported by host controller, when the host
supports mult-ports, only port0 (u2/u3) is used to support dual
role mode.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 drivers/usb/mtu3/mtu3_core.c | 32 +++++++-------
 drivers/usb/mtu3/mtu3_dr.c   |  2 +
 drivers/usb/mtu3/mtu3_dr.h   |  8 ++++
 drivers/usb/mtu3/mtu3_host.c | 10 +----
 drivers/usb/mtu3/mtu3_plat.c | 84 ++++++++++++++++++++++++++----------
 5 files changed, 89 insertions(+), 47 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index a800920d38b9..f90e5cdec614 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -9,7 +9,6 @@
  */
 
 #include <linux/dma-mapping.h>
-#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
@@ -1008,12 +1007,25 @@ void ssusb_gadget_exit(struct ssusb_mtk *ssusb)
 	mtu3_hw_exit(mtu);
 }
 
+bool ssusb_gadget_ip_sleep_check(struct ssusb_mtk *ssusb)
+{
+	struct mtu3 *mtu = ssusb->u3d;
+
+	/* host only, should wait for ip sleep */
+	if (!mtu)
+		return true;
+
+	/* device is started and pullup D+, ip can sleep */
+	if (mtu->is_active && mtu->softconnect)
+		return true;
+
+	/* ip can't sleep if not pullup D+ when support device mode */
+	return false;
+}
+
 int ssusb_gadget_suspend(struct ssusb_mtk *ssusb, pm_message_t msg)
 {
 	struct mtu3 *mtu = ssusb->u3d;
-	void __iomem *ibase = mtu->ippc_base;
-	u32 value;
-	int ret = 0;
 
 	if (!mtu->gadget_driver)
 		return 0;
@@ -1024,17 +1036,7 @@ int ssusb_gadget_suspend(struct ssusb_mtk *ssusb, pm_message_t msg)
 	mtu3_dev_suspend(mtu);
 	synchronize_irq(mtu->irq);
 
-	/* wait for ip to sleep */
-	if (mtu->is_active && mtu->softconnect) {
-		ret = readl_poll_timeout(ibase + U3D_SSUSB_IP_PW_STS1,
-				value, (value & SSUSB_IP_SLEEP_STS), 100, 100000);
-		if (ret) {
-			dev_err(mtu->dev, "ip sleep failed!!!\n");
-			ret = -EBUSY;
-		}
-	}
-
-	return ret;
+	return 0;
 }
 
 int ssusb_gadget_resume(struct ssusb_mtk *ssusb, pm_message_t msg)
diff --git a/drivers/usb/mtu3/mtu3_dr.c b/drivers/usb/mtu3/mtu3_dr.c
index 30e7e5fc0f88..a6b04831b20b 100644
--- a/drivers/usb/mtu3/mtu3_dr.c
+++ b/drivers/usb/mtu3/mtu3_dr.c
@@ -149,6 +149,7 @@ static void ssusb_mode_sw_work(struct work_struct *work)
 
 	dev_dbg(ssusb->dev, "set role : %s\n", usb_role_string(desired_role));
 	mtu3_dbg_trace(ssusb->dev, "set role : %s", usb_role_string(desired_role));
+	pm_runtime_get_sync(ssusb->dev);
 
 	switch (desired_role) {
 	case USB_ROLE_HOST:
@@ -169,6 +170,7 @@ static void ssusb_mode_sw_work(struct work_struct *work)
 	default:
 		dev_err(ssusb->dev, "invalid role\n");
 	}
+	pm_runtime_put(ssusb->dev);
 }
 
 static void ssusb_set_mode(struct otg_switch_mtk *otg_sx, enum usb_role role)
diff --git a/drivers/usb/mtu3/mtu3_dr.h b/drivers/usb/mtu3/mtu3_dr.h
index 5286f9f5ee18..e325508bddf4 100644
--- a/drivers/usb/mtu3/mtu3_dr.h
+++ b/drivers/usb/mtu3/mtu3_dr.h
@@ -59,6 +59,8 @@ int ssusb_gadget_init(struct ssusb_mtk *ssusb);
 void ssusb_gadget_exit(struct ssusb_mtk *ssusb);
 int ssusb_gadget_suspend(struct ssusb_mtk *ssusb, pm_message_t msg);
 int ssusb_gadget_resume(struct ssusb_mtk *ssusb, pm_message_t msg);
+bool ssusb_gadget_ip_sleep_check(struct ssusb_mtk *ssusb);
+
 #else
 static inline int ssusb_gadget_init(struct ssusb_mtk *ssusb)
 {
@@ -79,6 +81,12 @@ ssusb_gadget_resume(struct ssusb_mtk *ssusb, pm_message_t msg)
 {
 	return 0;
 }
+
+static inline bool ssusb_gadget_ip_sleep_check(struct ssusb_mtk *ssusb)
+{
+	return true;
+}
+
 #endif
 
 
diff --git a/drivers/usb/mtu3/mtu3_host.c b/drivers/usb/mtu3/mtu3_host.c
index a0a6a181b752..7d528f3c2482 100644
--- a/drivers/usb/mtu3/mtu3_host.c
+++ b/drivers/usb/mtu3/mtu3_host.c
@@ -8,7 +8,6 @@
  */
 
 #include <linux/clk.h>
-#include <linux/iopoll.h>
 #include <linux/irq.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
@@ -254,7 +253,6 @@ int ssusb_host_suspend(struct ssusb_mtk *ssusb)
 	int num_u3p = ssusb->u3_ports;
 	int num_u2p = ssusb->u2_ports;
 	u32 value;
-	int ret;
 	int i;
 
 	/* power down u3 ports except skipped ones */
@@ -280,13 +278,7 @@ int ssusb_host_suspend(struct ssusb_mtk *ssusb)
 	/* power down host ip */
 	mtu3_setbits(ibase, U3D_SSUSB_IP_PW_CTRL1, SSUSB_IP_HOST_PDN);
 
-	/* wait for host ip to sleep */
-	ret = readl_poll_timeout(ibase + U3D_SSUSB_IP_PW_STS1, value,
-			  (value & SSUSB_IP_SLEEP_STS), 100, 100000);
-	if (ret)
-		dev_err(ssusb->dev, "ip sleep failed!!!\n");
-
-	return ret;
+	return 0;
 }
 
 static void ssusb_host_setup(struct ssusb_mtk *ssusb)
diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index 2bb6f58cbcc4..537c6552831e 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -45,6 +45,29 @@ int ssusb_check_clocks(struct ssusb_mtk *ssusb, u32 ex_clks)
 	return 0;
 }
 
+static int wait_for_ip_sleep(struct ssusb_mtk *ssusb)
+{
+	bool sleep_check = true;
+	u32 value;
+	int ret;
+
+	if (!ssusb->is_host)
+		sleep_check = ssusb_gadget_ip_sleep_check(ssusb);
+
+	if (!sleep_check)
+		return 0;
+
+	/* wait for ip enter sleep mode */
+	ret = readl_poll_timeout(ssusb->ippc_base + U3D_SSUSB_IP_PW_STS1, value,
+				 (value & SSUSB_IP_SLEEP_STS), 100, 100000);
+	if (ret) {
+		dev_err(ssusb->dev, "ip sleep failed!!!\n");
+		ret = -EBUSY;
+	}
+
+	return ret;
+}
+
 static int ssusb_phy_init(struct ssusb_mtk *ssusb)
 {
 	int i;
@@ -421,6 +444,28 @@ static int mtu3_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int resume_ip_and_ports(struct ssusb_mtk *ssusb, pm_message_t msg)
+{
+	switch (ssusb->dr_mode) {
+	case USB_DR_MODE_PERIPHERAL:
+		ssusb_gadget_resume(ssusb, msg);
+		break;
+	case USB_DR_MODE_HOST:
+		ssusb_host_resume(ssusb, false);
+		break;
+	case USB_DR_MODE_OTG:
+		ssusb_host_resume(ssusb, !ssusb->is_host);
+		if (!ssusb->is_host)
+			ssusb_gadget_resume(ssusb, msg);
+
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int mtu3_suspend_common(struct device *dev, pm_message_t msg)
 {
 	struct ssusb_mtk *ssusb = dev_get_drvdata(dev);
@@ -432,26 +477,36 @@ static int mtu3_suspend_common(struct device *dev, pm_message_t msg)
 	case USB_DR_MODE_PERIPHERAL:
 		ret = ssusb_gadget_suspend(ssusb, msg);
 		if (ret)
-			return ret;
+			goto err;
 
 		break;
 	case USB_DR_MODE_HOST:
 		ssusb_host_suspend(ssusb);
 		break;
 	case USB_DR_MODE_OTG:
-		if (!ssusb->is_host)
-			return 0;
-
+		if (!ssusb->is_host) {
+			ret = ssusb_gadget_suspend(ssusb, msg);
+			if (ret)
+				goto err;
+		}
 		ssusb_host_suspend(ssusb);
 		break;
 	default:
 		return -EINVAL;
 	}
+
+	ret = wait_for_ip_sleep(ssusb);
+	if (ret)
+		goto sleep_err;
+
 	ssusb_phy_power_off(ssusb);
 	clk_bulk_disable_unprepare(BULK_CLKS_CNT, ssusb->clks);
 	ssusb_wakeup_set(ssusb, true);
 
-	return 0;
+sleep_err:
+	resume_ip_and_ports(ssusb, msg);
+err:
+	return ret;
 }
 
 static int mtu3_resume_common(struct device *dev, pm_message_t msg)
@@ -470,24 +525,7 @@ static int mtu3_resume_common(struct device *dev, pm_message_t msg)
 	if (ret)
 		goto phy_err;
 
-	switch (ssusb->dr_mode) {
-	case USB_DR_MODE_PERIPHERAL:
-		ssusb_gadget_resume(ssusb, msg);
-		break;
-	case USB_DR_MODE_HOST:
-		ssusb_host_resume(ssusb, false);
-		break;
-	case USB_DR_MODE_OTG:
-		if (!ssusb->is_host)
-			return 0;
-
-		ssusb_host_resume(ssusb, true);
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
+	return resume_ip_and_ports(ssusb, msg);
 
 phy_err:
 	clk_bulk_disable_unprepare(BULK_CLKS_CNT, ssusb->clks);
-- 
2.18.0


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCD4731F28A
	for <lists+linux-usb@lfdr.de>; Thu, 18 Feb 2021 23:52:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbhBRWvz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Feb 2021 17:51:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbhBRWvy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Feb 2021 17:51:54 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18B74C061756
        for <linux-usb@vger.kernel.org>; Thu, 18 Feb 2021 14:51:14 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id 6so3849179ois.9
        for <linux-usb@vger.kernel.org>; Thu, 18 Feb 2021 14:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KFcJoiKZXYEKcUqZgw11Kykzp6Wc04vfEn+1BSxyZ8k=;
        b=o8JmSOb9770yWlKEBlJNf1aNPtBLM/hMrQTYrowLkREkSnomeVA55OdyxbxvMsO0j6
         N6g5fPEPMVmYuODZxjPKVEcmqlG6QnC0TKIR7j+wtSOo/8fWfKpiNt8KeRvYAkhavDf6
         MIfKIX6eARMoxWjmdtgQ6Ld1XEfbbWaZjOHUgBy8PsjVNJSOQFzq2xhr9V1KmgZhjvWe
         QaRgnnTebmO1W8n1t0cyrXHr1ZAiOPtt6fUJF2vLLAc1Dl5fc6buNIW/BNcpV6e9Tao2
         zRd1C8f2f4Ul66b3zbF3fVdmR8PivJOBEBgBk2fR5y+nfKyiMo8M0Or6rrB42zqO8GT2
         HKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KFcJoiKZXYEKcUqZgw11Kykzp6Wc04vfEn+1BSxyZ8k=;
        b=cOP0tWQIJZ/lKy++EdAF4RNqgH8/dYf+Ba0W36q51mrdWv4M79Inmk+tJANrQOfZMf
         zdZD0agda40zbgf6LjIMk+wEZ6vU6LjYQyqBnABJl3qZxz9VqzwJpeik47Jfw63JtlS+
         7x1sCXRi3wLt8BxeQb2ao/a70pp3Yjao4+090G36gY7o6EAKX5jTnImAdScY+dM3AgSj
         08/Q3yLafqOE8dQxykC0C+Td6Rt5ceh1TVklrVVHT1JQuKz5pj34xUqOaX5EBDJwx9xb
         IlZNlFz3PC5aRZ4j+JFl5Imh3H6HcfWVacG/rRN+Cs02Fko7FJQ1tjctGZ0IsnvOR3ql
         wtMg==
X-Gm-Message-State: AOAM5320q0kj3JCTXogn+D1S5dM2qjEjb7G2JbB4UC0FxE3xt4jsHMf8
        y+GdswvEgM7q2RQkbAnFQsHwjjFJmlpSiw==
X-Google-Smtp-Source: ABdhPJwsGr3q18jcwzQwvSIdryVmONllKdT7hmMt8K46aRTuVl9U78UiKyZIlQP3q6Qi+d8lv2TaQg==
X-Received: by 2002:a05:6808:8fb:: with SMTP id d27mr4430745oic.57.1613688673561;
        Thu, 18 Feb 2021 14:51:13 -0800 (PST)
Received: from localhost.localdomain (072-177-087-193.res.spectrum.com. [72.177.87.193])
        by smtp.gmail.com with ESMTPSA id 88sm1318282oto.3.2021.02.18.14.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 14:51:13 -0800 (PST)
From:   Frank Li <lznuaa@gmail.com>
X-Google-Original-From: Frank Li <Frank.Li@nxp.com>
To:     peter.chen@kernel.org, pawell@cadence.com, a-govindraju@ti.com,
        linux-imx@nxp.com, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/2] usb: cdns3: add power lost support for system resume
Date:   Thu, 18 Feb 2021 16:51:08 -0600
Message-Id: <20210218225109.265730-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the controller lost its power during the system suspend, we need
to do all initialiation operations.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v3 to v4
 - add an empty line
Change from v1 to v3.
 - fix build error
 - remove ret variable at cdns_is_power_lost


 drivers/usb/cdns3/cdns3-gadget.c |  2 ++
 drivers/usb/cdns3/cdns3-plat.c   | 23 ++++++++++++++++++++++-
 drivers/usb/cdns3/core.c         | 29 ++++++++++++++++++++++++++++-
 drivers/usb/cdns3/drd.c          | 16 ++++++++++++++++
 drivers/usb/cdns3/drd.h          |  2 +-
 5 files changed, 69 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
index 582bfeceedb4..44b7301b1888 100644
--- a/drivers/usb/cdns3/cdns3-gadget.c
+++ b/drivers/usb/cdns3/cdns3-gadget.c
@@ -3304,6 +3304,8 @@ static int cdns3_gadget_resume(struct cdns *cdns, bool hibernated)
 		return 0;
 
 	cdns3_gadget_config(priv_dev);
+	if (hibernated)
+		writel(USB_CONF_DEVEN, &priv_dev->regs->usb_conf);
 
 	return 0;
 }
diff --git a/drivers/usb/cdns3/cdns3-plat.c b/drivers/usb/cdns3/cdns3-plat.c
index 4b18e1c6a4bb..e1deeada425c 100644
--- a/drivers/usb/cdns3/cdns3-plat.c
+++ b/drivers/usb/cdns3/cdns3-plat.c
@@ -19,6 +19,7 @@
 
 #include "core.h"
 #include "gadget-export.h"
+#include "drd.h"
 
 static int set_phy_power_on(struct cdns *cdns)
 {
@@ -236,6 +237,18 @@ static int cdns3_controller_resume(struct device *dev, pm_message_t msg)
 	if (!cdns->in_lpm)
 		return 0;
 
+	if (cdns_power_is_lost(cdns)) {
+		phy_exit(cdns->usb2_phy);
+		ret = phy_init(cdns->usb2_phy);
+		if (ret)
+			return ret;
+
+		phy_exit(cdns->usb3_phy);
+		ret = phy_init(cdns->usb3_phy);
+		if (ret)
+			return ret;
+	}
+
 	ret = set_phy_power_on(cdns);
 	if (ret)
 		return ret;
@@ -270,10 +283,18 @@ static int cdns3_plat_runtime_resume(struct device *dev)
 static int cdns3_plat_suspend(struct device *dev)
 {
 	struct cdns *cdns = dev_get_drvdata(dev);
+	int ret;
 
 	cdns_suspend(cdns);
 
-	return cdns3_controller_suspend(dev, PMSG_SUSPEND);
+	ret = cdns3_controller_suspend(dev, PMSG_SUSPEND);
+	if (ret)
+		return ret;
+
+	if (device_may_wakeup(dev) && cdns->wakeup_irq)
+		enable_irq_wake(cdns->wakeup_irq);
+
+	return ret;
 }
 
 static int cdns3_plat_resume(struct device *dev)
diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
index 199713769289..5d486c8a9d99 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -525,9 +525,36 @@ EXPORT_SYMBOL_GPL(cdns_suspend);
 int cdns_resume(struct cdns *cdns, u8 set_active)
 {
 	struct device *dev = cdns->dev;
+	enum usb_role real_role;
+	bool role_changed = false;
+	int ret;
+
+	if (cdns_power_is_lost(cdns)) {
+		if (cdns->role_sw) {
+			cdns->role = cdns_role_get(cdns->role_sw);
+		} else {
+			real_role = cdns_hw_role_state_machine(cdns);
+			if (real_role != cdns->role) {
+				ret = cdns_hw_role_switch(cdns);
+				if (ret)
+					return ret;
+				role_changed = true;
+			}
+		}
+
+		if (!role_changed) {
+			if (cdns->role == USB_ROLE_HOST)
+				ret = cdns_drd_host_on(cdns);
+			else if (cdns->role == USB_ROLE_DEVICE)
+				ret = cdns_drd_gadget_on(cdns);
+
+			if (ret)
+				return ret;
+		}
+	}
 
 	if (cdns->roles[cdns->role]->resume)
-		cdns->roles[cdns->role]->resume(cdns, false);
+		cdns->roles[cdns->role]->resume(cdns, cdns_power_is_lost(cdns));
 
 	if (set_active) {
 		pm_runtime_disable(dev);
diff --git a/drivers/usb/cdns3/drd.c b/drivers/usb/cdns3/drd.c
index 605a413db727..1213c540deb3 100644
--- a/drivers/usb/cdns3/drd.c
+++ b/drivers/usb/cdns3/drd.c
@@ -478,3 +478,19 @@ int cdns_drd_exit(struct cdns *cdns)
 
 	return 0;
 }
+
+
+/* Indicate the cdns3 core was power lost before */
+bool cdns_power_is_lost(struct cdns *cdns)
+{
+	if (cdns->version == CDNS3_CONTROLLER_V1) {
+		if (!(readl(&cdns->otg_v1_regs->simulate) & BIT(0)))
+			return true;
+	} else {
+		if (!(readl(&cdns->otg_v0_regs->simulate) & BIT(0)))
+			return true;
+	}
+	return false;
+}
+
+EXPORT_SYMBOL_GPL(cdns_power_is_lost);
diff --git a/drivers/usb/cdns3/drd.h b/drivers/usb/cdns3/drd.h
index 9724acdecbbb..cbdf94f73ed9 100644
--- a/drivers/usb/cdns3/drd.h
+++ b/drivers/usb/cdns3/drd.h
@@ -215,5 +215,5 @@ int cdns_drd_gadget_on(struct cdns *cdns);
 void cdns_drd_gadget_off(struct cdns *cdns);
 int cdns_drd_host_on(struct cdns *cdns);
 void cdns_drd_host_off(struct cdns *cdns);
-
+bool cdns_power_is_lost(struct cdns *cdns);
 #endif /* __LINUX_CDNS3_DRD */
-- 
2.25.1


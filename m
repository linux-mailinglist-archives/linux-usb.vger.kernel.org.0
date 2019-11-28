Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78BB510C376
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2019 06:10:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbfK1FKn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Nov 2019 00:10:43 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35124 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726733AbfK1FKI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Nov 2019 00:10:08 -0500
Received: by mail-pg1-f194.google.com with SMTP id l24so3811350pgk.2
        for <linux-usb@vger.kernel.org>; Wed, 27 Nov 2019 21:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hY1yxqp1ob53DN7ENv/xE/lf8zTH/wjr6NLCwssl4oY=;
        b=hk/1YuwUWLBKvh0dO8zLMRu2RLO+u7QiynmfRzdky6IluYZ3rZoISwdYcgVYqjuAKB
         c2saT8VITc79pLh2gNdmweVtiFDppLRTSQuXzGwJEHZPi6jYQUd7qt8kjJeiAHnu0B0E
         0rXDvRm3hjS3e2oDpFZMXeHgJ1+lSnwygIG7V/IoRth0FBD6+p/zFQCHiBFo+1ArtZaO
         rwBvdw6Vzh24lE2ke7YFJfgLUyZea7JVCxOpnRVhd3OdCADgF891H1I9WRyvDFDSai1Y
         miJesaeILgu5zW+EFX7quCn0EhMO7ypnPVUHr8ByYQJeC38bIb4gAcjMv7cL7XmRxQPk
         aG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hY1yxqp1ob53DN7ENv/xE/lf8zTH/wjr6NLCwssl4oY=;
        b=pDHemC9Mu5zZYibo+vkfqEQd3cmf62FwTLL0thMhC4ZWYfSoUzE1qJZ/Sy847/BP89
         hk8elvSTxWk5vk00eW/EujyzjGZfOEERsvTkrhLJRKcab+flLGTtGSJzojpbWi0OsgWM
         wdar6P+OvS0HXGci/EYKo9qLmlLFZoB9K7tnPwlgeyojZKJSLX6IV8rjjqLIr2g0HC6/
         TcVROipFGNu8MFj8hbH7AIr9UntzwlG8MSU2j8EKVRfpy6T5kZtihuW3jGcsIrbEeB1T
         V2A2mcVYHTAFA06xuyHIG8nC3DEPbsKTi+9MEDIYg/91sEMva35tGE+SYMd+wO8B8XUT
         y7hQ==
X-Gm-Message-State: APjAAAUJ9ZCPoTGvjVcHHRbGt7ibk7dbv4o9GwXtpAMhaTdE5PHchlwW
        +TTAwpasfQbCfNFM3hoGRKEHvQ==
X-Google-Smtp-Source: APXvYqxtdbubB1CULYeLwtLpj0mqVpaBXEL493d2O54D9CS4f7ug03/u4xBGT4vrYDGxAA0BXPlX5g==
X-Received: by 2002:a62:1dcb:: with SMTP id d194mr21747254pfd.66.1574917807440;
        Wed, 27 Nov 2019 21:10:07 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id j20sm17799838pff.182.2019.11.27.21.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2019 21:10:06 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Yu Chen <chenyu56@huawei.com>, Felipe Balbi <balbi@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Jack Pham <jackp@codeaurora.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v6 3/8] usb: dwc3: Add support for role-switch-default-mode binding
Date:   Thu, 28 Nov 2019 05:09:56 +0000
Message-Id: <20191128051001.18995-4-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191128051001.18995-1-john.stultz@linaro.org>
References: <20191128051001.18995-1-john.stultz@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Support the new role-switch-default-mode binding for configuring
the default role the controller assumes as when the usb role is
USB_ROLE_NONE

This patch was split out from a larger patch originally by
Yu Chen <chenyu56@huawei.com>

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
CC: ShuFan Lee <shufan_lee@richtek.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Yu Chen <chenyu56@huawei.com>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jun Li <lijun.kernel@gmail.com>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Jack Pham <jackp@codeaurora.org>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
Change-Id: Ic6e4df1109b350deaecdc69f667d49ce91d599f3
---
v3: Split this patch out from addition of usb-role-switch
    handling
v5: Reworked to use string based role-switch-default-mode
---
 drivers/usb/dwc3/core.h |  3 +++
 drivers/usb/dwc3/drd.c  | 25 ++++++++++++++++++++++---
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 6f19e9891767..3c879c9ab1aa 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -953,6 +953,8 @@ struct dwc3_scratchpad_array {
  *		- USBPHY_INTERFACE_MODE_UTMI
  *		- USBPHY_INTERFACE_MODE_UTMIW
  * @role_sw: usb_role_switch handle
+ * @role_switch_default_mode: default operation mode of controller while
+ *			usb role is USB_ROLE_NONE.
  * @usb2_phy: pointer to USB2 PHY
  * @usb3_phy: pointer to USB3 PHY
  * @usb2_generic_phy: pointer to USB2 PHY
@@ -1087,6 +1089,7 @@ struct dwc3 {
 	struct notifier_block	edev_nb;
 	enum usb_phy_interface	hsphy_mode;
 	struct usb_role_switch	*role_sw;
+	enum usb_dr_mode	role_switch_default_mode;
 
 	u32			fladj;
 	u32			irq_gadget;
diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index 3b57d2ddda93..865341facece 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -491,7 +491,10 @@ static int dwc3_usb_role_switch_set(struct device *dev, enum usb_role role)
 		mode = DWC3_GCTL_PRTCAP_DEVICE;
 		break;
 	default:
-		mode = DWC3_GCTL_PRTCAP_DEVICE;
+		if (dwc->role_switch_default_mode == USB_DR_MODE_HOST)
+			mode = DWC3_GCTL_PRTCAP_HOST;
+		else
+			mode = DWC3_GCTL_PRTCAP_DEVICE;
 		break;
 	}
 
@@ -517,7 +520,10 @@ static enum usb_role dwc3_usb_role_switch_get(struct device *dev)
 		role = dwc->current_otg_role;
 		break;
 	default:
-		role = USB_ROLE_DEVICE;
+		if (dwc->role_switch_default_mode == USB_DR_MODE_HOST)
+			role = USB_ROLE_HOST;
+		else
+			role = USB_ROLE_DEVICE;
 		break;
 	}
 	spin_unlock_irqrestore(&dwc->lock, flags);
@@ -527,6 +533,19 @@ static enum usb_role dwc3_usb_role_switch_get(struct device *dev)
 static int dwc3_setup_role_switch(struct dwc3 *dwc)
 {
 	struct usb_role_switch_desc dwc3_role_switch = {NULL};
+	const char *str;
+	u32 mode;
+	int ret;
+
+	ret = device_property_read_string(dwc->dev, "role-switch-default-mode",
+					  &str);
+	if (ret >= 0  && !strncmp(str, "host", strlen("host"))) {
+		dwc->role_switch_default_mode = USB_DR_MODE_HOST;
+		mode = DWC3_GCTL_PRTCAP_HOST;
+	} else {
+		dwc->role_switch_default_mode = USB_DR_MODE_PERIPHERAL;
+		mode = DWC3_GCTL_PRTCAP_DEVICE;
+	}
 
 	dwc3_role_switch.fwnode = dev_fwnode(dwc->dev);
 	dwc3_role_switch.set = dwc3_usb_role_switch_set;
@@ -535,7 +554,7 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
 	if (IS_ERR(dwc->role_sw))
 		return PTR_ERR(dwc->role_sw);
 
-	dwc3_set_mode(dwc, DWC3_GCTL_PRTCAP_DEVICE);
+	dwc3_set_mode(dwc, mode);
 	return 0;
 }
 #else
-- 
2.17.1


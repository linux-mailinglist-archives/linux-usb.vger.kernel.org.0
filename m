Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E912BF3D50
	for <lists+linux-usb@lfdr.de>; Fri,  8 Nov 2019 02:17:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728687AbfKHBRj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Nov 2019 20:17:39 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36809 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728734AbfKHBRd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Nov 2019 20:17:33 -0500
Received: by mail-pf1-f194.google.com with SMTP id v19so3625210pfm.3
        for <linux-usb@vger.kernel.org>; Thu, 07 Nov 2019 17:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YbemW7AL+I9zYGvxXlbJg+1m1dDalQtynuOAJrGAmWs=;
        b=ACJVwJRkBGFF/+sRj9R7QOdB9bAbJ6DEyprQOIneKcH3rKcMgobDzmL8cbBhYlFlhK
         UG2Ts4IPnKEi0BvogIAVPjdl0GyD/nmlUMJ8j3nrOqWM4sZhl4iScMGH6pMgUdIp3agF
         bAhVgzQJJibox07IVXnsi/E0RBsgmbS4Be+JPffq8vWgbVwBcK/204cFgjRz8+tYE+AW
         NyEqeFkwbX6OcClJTe51TB9TQpaxHfkYHRX9N6XVF/cffjl/FHsbZQGK/bFdbMs7MisO
         s6FQbdYw7P81hKyHCx5wpCeqZldGJFTnOsLYsjfKnKeWzlWpzvYZBckyZBX1n6C8/3tY
         3rog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YbemW7AL+I9zYGvxXlbJg+1m1dDalQtynuOAJrGAmWs=;
        b=K3C0+St+EVa6i/bX+vfOf8OW1UQefK0cmPwvthO0zQB6wnMcgv0KWkcXEZC7PhpH39
         wNKCDFvHY7muWtOzfgSwixjxGCDR1bKLuHWOALtRrcaW672CJTDKLPmzV3TZnSmweb1W
         XemZqONQTzPywTj5u39lXPPaAqffkCUi4rTx+p6WbLQAMrWrcXK49zXNq52GB/FTVsc1
         nKm0kKbRH9YRXzszdFnmbi3dr6zo9sjgOiTIMD69iuPF8bt293KoWHHIaEGXYyCZq9R4
         +j+sHDk07Ogjguuc1NL/efmZVo/W+Kl9EIlQNy81B+ErIDzM6eVqQXpucLQ5vE8R7ufU
         BU9g==
X-Gm-Message-State: APjAAAX+qrTx2To935C2c0OZzy1xmzvAYKOUOo7Db2SUcilPZJ4ZiMfE
        hd2lvY5+kx06wYU5QTtQIMxZMA==
X-Google-Smtp-Source: APXvYqyDhmgyCW2jRU4VkuvCxHq08LF27f3i1nfLBp9RaV09aT68CPvXaoPm9q4dclh6MPOcwKx78Q==
X-Received: by 2002:a63:e84d:: with SMTP id a13mr8340878pgk.226.1573175850634;
        Thu, 07 Nov 2019 17:17:30 -0800 (PST)
Received: from localhost.localdomain (c-67-170-172-113.hsd1.or.comcast.net. [67.170.172.113])
        by smtp.gmail.com with ESMTPSA id s23sm3801627pgh.21.2019.11.07.17.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 17:17:30 -0800 (PST)
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
Subject: [PATCH v5 3/3] usb: dwc3: Add support for role-switch-default-mode binding
Date:   Fri,  8 Nov 2019 01:17:23 +0000
Message-Id: <20191108011723.32390-4-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191108011723.32390-1-john.stultz@linaro.org>
References: <20191108011723.32390-1-john.stultz@linaro.org>
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
index cd43dc2a96c6..dbb881863297 100644
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


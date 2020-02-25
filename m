Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBC1816ED25
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2020 18:54:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731365AbgBYRxx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Feb 2020 12:53:53 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39672 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730834AbgBYRxv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Feb 2020 12:53:51 -0500
Received: by mail-pf1-f193.google.com with SMTP id 84so7585945pfy.6
        for <linux-usb@vger.kernel.org>; Tue, 25 Feb 2020 09:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qTnHuEFnXMMcLEn+/gKdeCOo8JW3ThjOO4eEIBgF+Bo=;
        b=egLJMAf6s7yzY8fc5m2fjxU1pVNXST4lwptfKw803AsiPdoABJwat6lH3hP5/VRZiO
         vDMBDhCOquTGdhPOr8VFP1ywBWbxm7pN1A7vyCA1wVZRVL6Kc0Wo7grIKL6akYhunqwR
         8ahj+nY0mQF3UA67NoNRje1RNJ9/wGuq/A1CYbPZQseR3jGtkT4Qh9YJJQhcxgZRJd+T
         hrsUWavoqzcuF1eKlVehbtGzOZXqBeoDdCdkjCuxMbJSoEesDo0aBZoAiByjnOHSSJfp
         gatbN5FJUFVJSRa94iYvwf/hLr3W8KQY76nK6ugW5TSUAORLWdOFsDZD19SjuuhvOizH
         Lu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qTnHuEFnXMMcLEn+/gKdeCOo8JW3ThjOO4eEIBgF+Bo=;
        b=Nj8e5yXUNiMa13akoJIxtV1rDonevK5J0JqHslUZ6YWVxWs9bF6k5fHK6oiQqwEK4v
         CCehlH1U6URqNQdAS0v03D/OFmWbP8+etuQjmDnNndw1kWBz+dAE6tvexLw21pMDOwXR
         aLlQTRt/9J9Y3HuPPXKhhVZuV9+o8sjSMe8+GHB25S78KZaf30d9b9nJdzapkFhq7QLU
         DwdHHC9wnkGkHp+9bj2LuKH68afXZyU8nMiN/fy7bJdz79xdce6ggj0Mxgs7SF2YHXra
         WDa5JoEMDsTUN6mz6tbLEUZNGaNYgwktKKJnWC+lS44E50hKMA2RxTroPHhHfqKy+r6w
         01Ag==
X-Gm-Message-State: APjAAAWvua1Hta7s/LfywAvaXeWctn/8Fqb5hwPrkaVWDgb7fIW98fAZ
        eJEEvB5+/+bOlyNqyKWmxzEWwQ==
X-Google-Smtp-Source: APXvYqzLkUdjAvPjt/6k7JvP/BEHrBZbEVZr551JrnO8oAHXm+AKYuFXsIjYgQpnNh5bLVB1gczxzQ==
X-Received: by 2002:a63:7152:: with SMTP id b18mr59879884pgn.232.1582653230278;
        Tue, 25 Feb 2020 09:53:50 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id v8sm18013291pgt.52.2020.02.25.09.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 09:53:49 -0800 (PST)
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
        Guillaume Gardet <Guillaume.Gardet@arm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jack Pham <jackp@codeaurora.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v8 3/6] usb: dwc3: Add support for role-switch-default-mode binding
Date:   Tue, 25 Feb 2020 17:53:01 +0000
Message-Id: <20200225175304.36406-4-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200225175304.36406-1-john.stultz@linaro.org>
References: <20200225175304.36406-1-john.stultz@linaro.org>
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
Cc: Guillaume Gardet <Guillaume.Gardet@arm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jack Pham <jackp@codeaurora.org>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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
index a99e57636172..57d549a1ad0b 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -955,6 +955,8 @@ struct dwc3_scratchpad_array {
  *		- USBPHY_INTERFACE_MODE_UTMI
  *		- USBPHY_INTERFACE_MODE_UTMIW
  * @role_sw: usb_role_switch handle
+ * @role_switch_default_mode: default operation mode of controller while
+ *			usb role is USB_ROLE_NONE.
  * @usb2_phy: pointer to USB2 PHY
  * @usb3_phy: pointer to USB3 PHY
  * @usb2_generic_phy: pointer to USB2 PHY
@@ -1089,6 +1091,7 @@ struct dwc3 {
 	struct notifier_block	edev_nb;
 	enum usb_phy_interface	hsphy_mode;
 	struct usb_role_switch	*role_sw;
+	enum usb_dr_mode	role_switch_default_mode;
 
 	u32			fladj;
 	u32			irq_gadget;
diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index 331c6e997f0c..db68d48c2267 100644
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


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC4B2157416
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2020 13:08:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727592AbgBJMIb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Feb 2020 07:08:31 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37300 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727691AbgBJMHf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Feb 2020 07:07:35 -0500
Received: by mail-wr1-f66.google.com with SMTP id w15so7357059wru.4
        for <linux-usb@vger.kernel.org>; Mon, 10 Feb 2020 04:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wfpDvTaP6RkaiP9v3FeD/nKtqOOa/BO0maVgmKq/gnU=;
        b=kSr7WI5W9H62L9z3BxKflYpL8VXG64WJy+4Lm+hiFdgkgBcNO7g4UVIhcYxpgOjAL6
         KhxIBsWJn54VdGwkK3DXGEWs0rJdV04dk6jXd/XUUv8UTi0yAEcqCV5SXB/dBrgNJ+5u
         cGNYssHiZ5PubsByztSuPkggAIUdUPzbIUhJODZDOT7uHsb3by4aujWVuLMLmPQ88MfQ
         lFZLl4AaqQ8YSJ247XnoRanY1HRUobNXRM6ODHwGszsiODETACsZYgqxci4A+mFfAJMy
         g1UzjdkSeD6lcJWMmjt4p5LlIt/u/OWdVCYgt8go8VbSvRGJ+CROMNpKnB+gTwL3nsKq
         XKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wfpDvTaP6RkaiP9v3FeD/nKtqOOa/BO0maVgmKq/gnU=;
        b=l+pCPfH8FDKpDOARdWX7/wKRoD6CYy0ExLoFwjOY3vxmJxPo5Pd5w0gX8l2YEsvtDK
         TSm1FNg6kkl2sVAsL3OgvJYdkVpGc7NeIsyeJvx297E0ei9bWtDXUp759ovBH7SDTmSF
         B4bkNTSD1GbMmzbnDGBrPcM2hIgT97KGq+3cNVIC2Nr5hR2nBxV8dHMQ86qD9iYGuNv7
         VQtJ6tX6FKXir2YY0Okdj3rrqSrFzee7HzWm4V94HpG6ylbas2+m+UbZLxAn/8WuxRFo
         RdHbkgRuotom7OYvm+JHYP4FyJ+qfuQolayyfiNCUgzfPTIKzlUYhF4rbRPYx402oXv8
         5qqA==
X-Gm-Message-State: APjAAAV/Wlil+xOZkkN6hRpPi/LfQpmyXnHaH+0pEKSzTVqANErLZo0u
        ZSbGEUFVUVLMBEWFbOuSAByTEA==
X-Google-Smtp-Source: APXvYqyfiLqBy0qILD6NBDvEhOILasu7ggUCkBdsTDwla9idek1iOpWNgRNUG8J3GeuCyqyJCotjGQ==
X-Received: by 2002:a5d:4687:: with SMTP id u7mr1645915wrq.176.1581336452913;
        Mon, 10 Feb 2020 04:07:32 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id i204sm293124wma.44.2020.02.10.04.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 04:07:32 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Yu Chen <chenyu56@huawei.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        devicetree@vger.kernel.org
Subject: [PATCH v6 10/18] usb: dwc3: Add support for usb-conn-gpio connectors
Date:   Mon, 10 Feb 2020 12:07:15 +0000
Message-Id: <20200210120723.91794-11-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
References: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds the ability to probe and enumerate a connector based on
usb-conn-gpio.

You would use usb-conn-gpio when a regulator in your system provides VBUS
directly to the connector instead of supplying via the USB PHY.

The parent device must have the "usb-role-switch" property, so that when
the usb-conn-gpio driver calls usb_role_switch_set_role() the notification
in dwc3 will run and the block registers will be updated to match the state
detected at the connector.

Cc: John Stultz <john.stultz@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>
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
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/dwc3/drd.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index c355166793d0..c1825fd655f6 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -11,6 +11,7 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/of_platform.h>
 
 #include "debug.h"
 #include "core.h"
@@ -537,8 +538,29 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
 	dwc3_set_mode(dwc, DWC3_GCTL_PRTCAP_DEVICE);
 	return 0;
 }
+
+static int dwc3_register_gpio_usb_connector(struct dwc3 *dwc)
+{
+	struct device		*dev = dwc->dev;
+	struct device_node	*np = dev->of_node, *conn_np;
+	int			ret = 0;
+
+	conn_np = of_get_child_by_name(np, "connector");
+	if (!conn_np) {
+		dev_dbg(dev, "no connector child node specified\n");
+		goto done;
+	}
+
+	if (of_device_is_compatible(conn_np, "gpio-usb-b-connector"))
+		ret = of_platform_populate(np, NULL, NULL, dev);
+done:
+	of_node_put(conn_np);
+	return ret;
+}
+
 #else
 #define dwc3_setup_role_switch(x) 0
+#define dwc3_register_gpio_usb_connector(x) 0
 #endif
 
 int dwc3_drd_init(struct dwc3 *dwc)
@@ -554,6 +576,9 @@ int dwc3_drd_init(struct dwc3 *dwc)
 		ret = dwc3_setup_role_switch(dwc);
 		if (ret < 0)
 			return ret;
+		ret = dwc3_register_gpio_usb_connector(dwc);
+		if (ret < 0)
+			return ret;
 	} else if (dwc->edev) {
 		dwc->edev_nb.notifier_call = dwc3_drd_notifier;
 		ret = extcon_register_notifier(dwc->edev, EXTCON_USB_HOST,
-- 
2.25.0


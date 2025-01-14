Return-Path: <linux-usb+bounces-19349-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F43A111AC
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 21:06:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E05347A41D7
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 20:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02FF120DD74;
	Tue, 14 Jan 2025 20:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TziIXzGy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6914420CCE1
	for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 20:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736885155; cv=none; b=Pe5EP/pFN4g7dNfXr7Vax0QQFP5a6fPnzRkSqUY88ybzc+TYURa64cHCP0X/TpBmRnvzGn2SuiMADC9U04gv5jjF4N8eOPZ13U7GQ0I/ZUM0iJchFELF5p0+GHNo2b0hSMN06SP18czSX+sw2GaoPX57cEti2G2F+teY70XbdWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736885155; c=relaxed/simple;
	bh=op/DCt6ROIee0t+eYACLLqRtmspLz0pZPqJlNXnqaN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ENCIRB9jPtbLbbfjSYdkDgSJUgJ9oJUg5B31L0aZrQE52Fog059r0EK4awuk4Be9xJL924IOdjkrLBcCB3P+Q6Q2TFluLUjRzDOTLK4rZ0fznSylQDG0Eyrsnq0q8c+uFxrKkf+X4H8+vDBLdtMsrtYINRozb9GrAcgSvj0svTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TziIXzGy; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43620a5f81bso6426825e9.0
        for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 12:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736885152; x=1737489952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lUd9pE4ibsdIBdg8Wzjk/goShzuEiiFqbneq+H7LmXk=;
        b=TziIXzGyDyLgfbg4Svhvu3iuh2S6tnplo+/qWmClvhB1x5eKR50HyC3rBr0tdy25m8
         3GF5cAuJyoIFL93gyU1+HmyuD9HFUdD68n0b9/gAMnlR5DL2j4Bce0oUXYn8YId33+cU
         CIf9cp1aHTIedHEq3FGilJPaC8mYjKIXvKQz9rW30h7r+r1a+5z5mF6EN78V2Dto9mgQ
         HYCtffWtnSMrJlLfXuzCt5FJAI97cVp0l5rN1UxvSJayNRDdbgJoIwToACbYJkm4z4K1
         c9UZSA4klp+UqNuHBX/vslSlpjDlj3bKFQsBhfjd7wivDTyTlE90fjUT/fukhuCf/hNG
         c/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736885152; x=1737489952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lUd9pE4ibsdIBdg8Wzjk/goShzuEiiFqbneq+H7LmXk=;
        b=a9XnOd8NEKfMYcemKZToP4WIOTtYPp/Co7DigDzpihvYqfL/VTTyW52Mt92nEpt8wL
         yAJ7nw4FP63eGWIF3Y43i/tzW1yzAsySV89fNU9Twq0mOfLEcJsQZ5Ll3dSALZwo3f3D
         akWP5kyz2efFVpW8AYCqrJfDQPnJWilM94o3TfQ/tbgXvDvHlFgmy/PVzsFaKZ5XTMS+
         tAzJtW9iYje3J7OWcoGundEglUF2SNwq4Kd/y/3qAZL8pdcKsoYtOI7FmmObod1fAjOl
         4sXW8WBHUJlS/Un61+1AdbkP69ynT+if9wgM34rigURWT4+ssQMpVFdF1BQutt2jl8bu
         RQQg==
X-Gm-Message-State: AOJu0Yyn3SJ5PBfFLmxmSzjQWtmCzzocaC55FTMpvzvxAURJ6ggBaoWW
	XP1/syYQ/AZ1HVSBOVpfvSNaUYTvyafiixYkK8LP+3ji0qWcQFSdC8jrneGOPD8=
X-Gm-Gg: ASbGncvFAKkGRaM6B1jSmLCF413rMGeITlQVM2EJOkZ8qbDzVWAzHx65Him0d/4PIy4
	mjS3Pp3hX6GX+dGVXwfdq6PSSsXqZ7T1sFAm7ed3TNwna/gDHuzlhbzlYQ35InBDTwvfjDLvs+k
	kwM5QSd1xrkjz+IgbPPJesjOoQC2B2aXdhVNKa/MxKeTdJMmlms5uYLsSBs/KefGj9EqBpr9iyu
	fwDmjDMiygbB6AMPpw5QOc3yVL/Kh/8zquqOkTN3ArFu/NtniGQVlEIbYrl1YsDPpgGRZV2
X-Google-Smtp-Source: AGHT+IFMvUJ1WIMM1UnKEmJAeByugzBupQdHG12m5u1eVkgqRkIU1T58DOpbdwucugHJJCsq7sIZfQ==
X-Received: by 2002:a05:600c:4e52:b0:434:a339:ec67 with SMTP id 5b1f17b1804b1-436eba35780mr83014555e9.3.1736885151629;
        Tue, 14 Jan 2025 12:05:51 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9dc8802sm184622025e9.10.2025.01.14.12.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 12:05:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 14 Jan 2025 21:05:36 +0100
Subject: [PATCH 3/6] USB: typec: Use str_enable_disable-like helpers
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-str-enable-disable-usb-v1-3-c8405df47c19@linaro.org>
References: <20250114-str-enable-disable-usb-v1-0-c8405df47c19@linaro.org>
In-Reply-To: <20250114-str-enable-disable-usb-v1-0-c8405df47c19@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathias Nyman <mathias.nyman@intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Peter Chen <peter.chen@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 usb-storage@lists.one-eyed-alien.net, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10285;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=op/DCt6ROIee0t+eYACLLqRtmspLz0pZPqJlNXnqaN4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnhsOT5omtXZe4pNX5FucIXi5M/SLvLnE6Fx0dg
 5RFTZwpizSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4bDkwAKCRDBN2bmhouD
 1wniEACTnxh/J9HADUSXH/B4PxpTjFV+HrzcRy0yJFO5nAqDf8CUvzoxy5LiOSJDsxsv27LeepD
 N5ehvpyz+w2gWupb8eKYhihGTkZ1w0IyNmJj6Ohn4aBEU9WxRZyebFGmFgq+U+5Yq3MgEfoEDl9
 KLU9ATXXCmI42YpRmlk8329azwR3r8wRSmREHw9PbPr1Q997cij4f6FSC5kDaf7XqNFkq3Biy7r
 sEKxzqtAq+1zMUbuRJqVoc5bDq1zmjPaX5XF9BSD1luW+oTxpU5XewskSF2zy4llNlDkvOBhpUf
 brYhgStgG0YmQovvVmwGF13nw6GRW3xN/8/O7VG1jmMJMg8U3XDEHcRJFG1uyfxZelW5vyKCFr0
 yNMHm1IfLNSSd0BhcGE/R4kUyI6N/XkeZJzVba/Kc5KZA7HVTb+CSpIBtIJuKtpm39WM+W60PHx
 qSoLgrOPGXZ7fArYjAsMCi2yWV/ZbGsWzpCAblo9RjEYJnvrxUhNTJ181Oy/dCLY58C86yX2j5H
 noV1BpUMujRYSzzVCK93IgHmRlnfKI9vkAa0hJPXjsbXDcJjMtDlNEFGlcCnRGzSSGK2ASCSXY0
 nDWJOYR13ka9BCCBi+4IFPoETK1PdZLOY0+MSfRDgq+ikD5D/uZlMz7v8y0W7VtlqdLvOeEVUr+
 DK2pcX225G0ItrA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace ternary (condition ? "enable" : "disable") syntax with helpers
from string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/typec/class.c                          |  7 ++++---
 drivers/usb/typec/tcpm/fusb302.c                   | 24 +++++++++++-----------
 .../usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c    |  3 ++-
 .../typec/tcpm/qcom/qcom_pmic_typec_pdphy_stub.c   |  3 ++-
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c |  4 +++-
 drivers/usb/typec/tcpm/tcpm.c                      |  7 ++++---
 6 files changed, 27 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index d9d019cff01908eaa8dcb484a87147f3d9992bf3..9c76c3d0c6cff9c9b94ef35fb0cb4be0e395aad6 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -10,6 +10,7 @@
 #include <linux/mutex.h>
 #include <linux/property.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/usb/pd_vdo.h>
 #include <linux/usb/typec_mux.h>
 #include <linux/usb/typec_retimer.h>
@@ -361,7 +362,7 @@ active_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct typec_altmode *alt = to_typec_altmode(dev);
 
-	return sprintf(buf, "%s\n", alt->active ? "yes" : "no");
+	return sprintf(buf, "%s\n", str_yes_no(alt->active));
 }
 
 static ssize_t active_store(struct device *dev, struct device_attribute *attr,
@@ -707,7 +708,7 @@ static ssize_t supports_usb_power_delivery_show(struct device *dev,
 {
 	struct typec_partner *p = to_typec_partner(dev);
 
-	return sprintf(buf, "%s\n", p->usb_pd ? "yes" : "no");
+	return sprintf(buf, "%s\n", str_yes_no(p->usb_pd));
 }
 static DEVICE_ATTR_RO(supports_usb_power_delivery);
 
@@ -1855,7 +1856,7 @@ static ssize_t vconn_source_show(struct device *dev,
 	struct typec_port *port = to_typec_port(dev);
 
 	return sprintf(buf, "%s\n",
-		       port->vconn_role == TYPEC_SOURCE ? "yes" : "no");
+		       str_yes_no(port->vconn_role == TYPEC_SOURCE));
 }
 static DEVICE_ATTR_RW(vconn_source);
 
diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index e2fe479e16ada018930ea0dbbf58ee37ce9a1990..f15c63d3a8f441569ec98302f5b241430d8e4547 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -24,6 +24,7 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
+#include <linux/string_choices.h>
 #include <linux/types.h>
 #include <linux/usb.h>
 #include <linux/usb/typec.h>
@@ -733,7 +734,7 @@ static int tcpm_set_vconn(struct tcpc_dev *dev, bool on)
 
 	mutex_lock(&chip->lock);
 	if (chip->vconn_on == on) {
-		fusb302_log(chip, "vconn is already %s", on ? "On" : "Off");
+		fusb302_log(chip, "vconn is already %s", str_on_off(on));
 		goto done;
 	}
 	if (on) {
@@ -746,7 +747,7 @@ static int tcpm_set_vconn(struct tcpc_dev *dev, bool on)
 	if (ret < 0)
 		goto done;
 	chip->vconn_on = on;
-	fusb302_log(chip, "vconn := %s", on ? "On" : "Off");
+	fusb302_log(chip, "vconn := %s", str_on_off(on));
 done:
 	mutex_unlock(&chip->lock);
 
@@ -761,7 +762,7 @@ static int tcpm_set_vbus(struct tcpc_dev *dev, bool on, bool charge)
 
 	mutex_lock(&chip->lock);
 	if (chip->vbus_on == on) {
-		fusb302_log(chip, "vbus is already %s", on ? "On" : "Off");
+		fusb302_log(chip, "vbus is already %s", str_on_off(on));
 	} else {
 		if (on)
 			ret = regulator_enable(chip->vbus);
@@ -769,15 +770,14 @@ static int tcpm_set_vbus(struct tcpc_dev *dev, bool on, bool charge)
 			ret = regulator_disable(chip->vbus);
 		if (ret < 0) {
 			fusb302_log(chip, "cannot %s vbus regulator, ret=%d",
-				    on ? "enable" : "disable", ret);
+				    str_enable_disable(on), ret);
 			goto done;
 		}
 		chip->vbus_on = on;
-		fusb302_log(chip, "vbus := %s", on ? "On" : "Off");
+		fusb302_log(chip, "vbus := %s", str_on_off(on));
 	}
 	if (chip->charge_on == charge)
-		fusb302_log(chip, "charge is already %s",
-			    charge ? "On" : "Off");
+		fusb302_log(chip, "charge is already %s", str_on_off(charge));
 	else
 		chip->charge_on = charge;
 
@@ -854,16 +854,16 @@ static int tcpm_set_pd_rx(struct tcpc_dev *dev, bool on)
 	ret = fusb302_pd_set_auto_goodcrc(chip, on);
 	if (ret < 0) {
 		fusb302_log(chip, "cannot turn %s auto GCRC, ret=%d",
-			    on ? "on" : "off", ret);
+			    str_on_off(on), ret);
 		goto done;
 	}
 	ret = fusb302_pd_set_interrupts(chip, on);
 	if (ret < 0) {
 		fusb302_log(chip, "cannot turn %s pd interrupts, ret=%d",
-			    on ? "on" : "off", ret);
+			    str_on_off(on), ret);
 		goto done;
 	}
-	fusb302_log(chip, "pd := %s", on ? "on" : "off");
+	fusb302_log(chip, "pd := %s", str_on_off(on));
 done:
 	mutex_unlock(&chip->lock);
 
@@ -1531,7 +1531,7 @@ static void fusb302_irq_work(struct work_struct *work)
 	if (interrupt & FUSB_REG_INTERRUPT_VBUSOK) {
 		vbus_present = !!(status0 & FUSB_REG_STATUS0_VBUSOK);
 		fusb302_log(chip, "IRQ: VBUS_OK, vbus=%s",
-			    vbus_present ? "On" : "Off");
+			    str_on_off(vbus_present));
 		if (vbus_present != chip->vbus_present) {
 			chip->vbus_present = vbus_present;
 			tcpm_vbus_change(chip->tcpm_port);
@@ -1562,7 +1562,7 @@ static void fusb302_irq_work(struct work_struct *work)
 	if ((interrupt & FUSB_REG_INTERRUPT_COMP_CHNG) && intr_comp_chng) {
 		comp_result = !!(status0 & FUSB_REG_STATUS0_COMP);
 		fusb302_log(chip, "IRQ: COMP_CHNG, comp=%s",
-			    comp_result ? "true" : "false");
+			    str_true_false(comp_result));
 		if (comp_result) {
 			/* cc level > Rd_threshold, detach */
 			chip->cc1 = TYPEC_CC_OPEN;
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
index 726423684bae0a690bd20547313704b7d2f4cfdc..18303b34594bbf6f43d1138177c4ab58f0dec395 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
@@ -12,6 +12,7 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/usb/pd.h>
 #include <linux/usb/tcpm.h>
 #include "qcom_pmic_typec.h"
@@ -418,7 +419,7 @@ static int qcom_pmic_typec_pdphy_set_pd_rx(struct tcpc_dev *tcpc, bool on)
 
 	spin_unlock_irqrestore(&pmic_typec_pdphy->lock, flags);
 
-	dev_dbg(pmic_typec_pdphy->dev, "set_pd_rx: %s\n", on ? "on" : "off");
+	dev_dbg(pmic_typec_pdphy->dev, "set_pd_rx: %s\n", str_on_off(on));
 
 	return ret;
 }
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy_stub.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy_stub.c
index df79059cda6755d4de35b7239fadc2dff2e699b1..8fac171778daf471fe4d03de8cc4f9c7ce1f323b 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy_stub.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy_stub.c
@@ -12,6 +12,7 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/usb/pd.h>
 #include <linux/usb/tcpm.h>
 #include "qcom_pmic_typec.h"
@@ -38,7 +39,7 @@ static int qcom_pmic_typec_pdphy_stub_set_pd_rx(struct tcpc_dev *tcpc, bool on)
 	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
 	struct device *dev = tcpm->dev;
 
-	dev_dbg(dev, "set_pd_rx: %s\n", on ? "on" : "off");
+	dev_dbg(dev, "set_pd_rx: %s\n", str_on_off(on));
 
 	return 0;
 }
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index c37dede62e12cd8a105da108838b5ca4f5e632d7..4fc83dcfae643e7a8b8e89ac6e6f5a9aaba3f65b 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
@@ -13,6 +13,7 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/usb/tcpm.h>
 #include <linux/usb/typec_mux.h>
 #include <linux/workqueue.h>
@@ -562,7 +563,8 @@ static int qcom_pmic_typec_port_set_vconn(struct tcpc_dev *tcpc, bool on)
 	spin_unlock_irqrestore(&pmic_typec_port->lock, flags);
 
 	dev_dbg(dev, "set_vconn: orientation %d control 0x%08x state %s cc %s vconn %s\n",
-		orientation, value, on ? "on" : "off", misc_to_vconn(misc), misc_to_cc(misc));
+		orientation, value, str_on_off(on), misc_to_vconn(misc),
+		misc_to_cc(misc));
 
 	return ret;
 }
diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index fcf2d7902352c447651f30610d59fef2471f3124..ef2cec386d965512c64e8b7e640199e10bb7bc94 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -21,6 +21,7 @@
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 #include <linux/usb.h>
 #include <linux/usb/pd.h>
 #include <linux/usb/pd_ado.h>
@@ -892,8 +893,8 @@ static int tcpm_enable_auto_vbus_discharge(struct tcpm_port *port, bool enable)
 
 	if (port->tcpc->enable_auto_vbus_discharge) {
 		ret = port->tcpc->enable_auto_vbus_discharge(port->tcpc, enable);
-		tcpm_log_force(port, "%s vbus discharge ret:%d", enable ? "enable" : "disable",
-			       ret);
+		tcpm_log_force(port, "%s vbus discharge ret:%d",
+			       str_enable_disable(enable), ret);
 		if (!ret)
 			port->auto_vbus_discharge_enabled = enable;
 	}
@@ -4439,7 +4440,7 @@ static void tcpm_unregister_altmodes(struct tcpm_port *port)
 
 static void tcpm_set_partner_usb_comm_capable(struct tcpm_port *port, bool capable)
 {
-	tcpm_log(port, "Setting usb_comm capable %s", capable ? "true" : "false");
+	tcpm_log(port, "Setting usb_comm capable %s", str_true_false(capable));
 
 	if (port->tcpc->set_partner_usb_comm_capable)
 		port->tcpc->set_partner_usb_comm_capable(port->tcpc, capable);

-- 
2.43.0



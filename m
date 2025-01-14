Return-Path: <linux-usb+bounces-19352-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 459E5A111B4
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 21:07:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E3171889FBA
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 20:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 592CE212B3B;
	Tue, 14 Jan 2025 20:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FcODDjea"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA0620F096
	for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 20:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736885161; cv=none; b=MsDr25MGHSxDuU4xR4kwapOtdJqU55mL3bsObQOKaXR1vf74Z+Xg3XKpatgty1IUSxfXiZwwiJg4CQ3QO8WT5EW5k/bOJhdm3ILGxVCbnug72d+U7n78GdtafMLMW6Ppq02IlQwLghEA1LLVYUrBsTAoYE+JwA1uFGjI5LKHY2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736885161; c=relaxed/simple;
	bh=Dn7AExi9kOpb4kbvZsYQzaTe1/K3uWL4UVL+vFuGLtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KNyrqKiFRfpGuy9g9ei+us+M0KrhCzh4xGptmU2IcLQ2FjPZMKVxeVFthk6vRFmrr+6/UlkwNTKhX83I3WY9yU5sDb928KtMx7tqzf+Ia6HraI6NBZNU/E8fb/jib/Ha3p4qNJVtbkq32J1hSO10ya+LkCYyX492DN5O5nRZ03A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FcODDjea; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-436230de7a3so7497335e9.0
        for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 12:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736885158; x=1737489958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jCj4MiQdDJTjdmm2UQHbDgKs2hpOoyxOgKsd7sNfwWo=;
        b=FcODDjea37GF0Dj89KllsmcuTr4u1QuQ/KIO+gSQpNFB7I7U7e4vML2SVoUSVQ2z9w
         X6zX+OwhhG/BVEW404cIw572r+MNRUPbSOPHTFGCByc5rB+7zzzu17ahoijHx+KxPJpF
         7tW3hEY4vqR2G8VA9TWuSVw7/hhLAKfw2U4f/U8QHmiB+/lMTI39aGhZB6xKbvkj78nG
         4iTuCsSXT8x8UIJ7MGd87o0TQodp8aqlKaaWdZEdMLAnNB8bL7HutVYbJk99APQ/yadV
         UkMxV+iSl0uIJDB3Vx7j7UvAIZbqGE3pfzNpHgyrhf1L4nYz9BJmK74aCJpPs+++14MV
         SKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736885158; x=1737489958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jCj4MiQdDJTjdmm2UQHbDgKs2hpOoyxOgKsd7sNfwWo=;
        b=XzEbg4TGHKL06s9hBBNfaZFIHATEJ9xmrc2jwb/qcx+XNsR4BIYoAq8cZJ0q3FujDO
         tNJBnozfk6Xwkg+rGv/deSuij9kujRSVFXqwKF/9N7/Q3l5sHXby9xYuf1+QEcjhpWfq
         mazrYDbbCFMicduOn4TaIKIc4AqMlb+puTPV8xCqiKus/HOSHrLK9UhAsLEsj7Jb/Irv
         ZxV96EuDCTPkEw7UiVfiqNg7i0d68NKAzv/Cq2IOpVoqsaiKKtHKr4/ijp+4/L0yDx8c
         yCiCvB5W6E7ZZSYrHdUjxJuLHZXo7dCN0oywvla69eRql1xSo7jFUiEcuU6E6cR3Rn+f
         /Tig==
X-Gm-Message-State: AOJu0YzNL7w43umjq6SJO6zgVDyCC9rYFY1/ynuv3k+hR2W9VbcTfM+Q
	EIdveURN1JEWV9YfLk4Pl6jyfMQgktECCZ+YVScfmg8IZIgsraQSyC0lCYENli0=
X-Gm-Gg: ASbGnctHJG8gTCIZTpeN8DAuSiOhzhBYowSZSmq0Bc/rwi+NGmDNbLX2jRVAHuU5ZH+
	v+sTkniLraJm3R4UNqW306f1x6Toqa0LXcQhHt695zTFaW8FVV2ygOhiphheUcm5xONP6CovEpZ
	UmOHI3keulGMBruRFmdRu/W7iM3fB3BkEiaFrWeTJdh5B5jQJMNHJN9IGKpVEkPbGoAFnrEyzn5
	6VqmiAFF0flcqG3TuZTFz06YqpyV8YTWISYOIiKCOtsvkufF914VVgaIIXgJ07bZXZOLJjQ
X-Google-Smtp-Source: AGHT+IGpUnCjOtwWTc+k/P2Jh9s7TGe5bsB4tkwgm9Xo/d2v0LUwlV1a7JVjXOXZxW9kJFIEf9IFpg==
X-Received: by 2002:a05:600c:a09:b0:434:f1d5:144a with SMTP id 5b1f17b1804b1-436e2557087mr97123485e9.0.1736885157846;
        Tue, 14 Jan 2025 12:05:57 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9dc8802sm184622025e9.10.2025.01.14.12.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 12:05:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 14 Jan 2025 21:05:39 +0100
Subject: [PATCH 6/6] USB: Use str_enable_disable-like helpers
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-str-enable-disable-usb-v1-6-c8405df47c19@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=15462;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Dn7AExi9kOpb4kbvZsYQzaTe1/K3uWL4UVL+vFuGLtQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnhsOVm6R2JV4lMLh0HO2WSwbkBxxWF0im5GEM3
 s2zrHwToKqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4bDlQAKCRDBN2bmhouD
 18u4D/99tu1qrTUAznVyLt0LA2L7BicoL8heL+g2pjM0KHhMN+Ir9q7job/YtO0c7Rc9fwccR77
 Q4uUn7KPSNP1lypzr9mc9VVgmRgy8eruB4qZBKXMcfoyll1z1YYvkxIwefjMBq7frPDSIyNSgcM
 +rPcFKvKdP7muu1rW6cGm2pETvb1mVRSCBkngzSmhwlc/HCTw92U3Ri3afb8hKi7wn3RVDfcy4p
 ZaYec757+oN5flqHgM7nLzlEmOFaEhkUgOqKwGnV9baasNHZPYSJxBeN9KhC1YlgjYvFaLQ79jx
 o1y2agQ+Iok322rs3RBvs1VOFgzC2FP4LIc+Rqfq0E31c6vQy2J6VtNW6LWGV4iOm09WjFDi0Me
 Zq3W6a8eQLr+b1AHW36uuMbsjYdxSAZsgXv7LeV80BLU+I8hgy2mrJaPrW/0EhZoZrkZ1ztzvsy
 ub6+Mxos9aD/KXpZzcu4HvebKTOD3Ika+JOsvuTpgStn2abxypEw0o/KZZifEx50veT5fcO6GMt
 CqhEQXT2u8EBapZkrXBx8TClLPOCmyK3BHLU+4kG5oWbMsa8H4xsFmdtnr/TrJ9r//qA/eGHHa4
 J9Asc9fRTHGfjz7LchxYl60yCKY9bc0MOiQOFVRrbuxbzKjA6TBpHJ+pvXBdwZoRrdTwcUmkX5a
 AUfyqFvJHCcjRvA==
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
 drivers/usb/cdns3/cdnsp-gadget.c    | 13 +++++++------
 drivers/usb/chipidea/host.c         |  3 ++-
 drivers/usb/common/usb-conn-gpio.c  |  3 ++-
 drivers/usb/core/hub.c              | 10 +++++-----
 drivers/usb/core/port.c             |  3 ++-
 drivers/usb/fotg210/fotg210-core.c  |  5 +++--
 drivers/usb/mtu3/mtu3_debugfs.c     |  3 ++-
 drivers/usb/mtu3/mtu3_dr.c          |  3 ++-
 drivers/usb/mtu3/mtu3_gadget.c      |  3 ++-
 drivers/usb/musb/da8xx.c            |  3 ++-
 drivers/usb/musb/musb_core.c        |  3 ++-
 drivers/usb/musb/musb_dsps.c        |  3 ++-
 drivers/usb/musb/musb_gadget.c      |  3 ++-
 drivers/usb/musb/musb_host.c        |  3 ++-
 drivers/usb/storage/shuttle_usbat.c |  4 ++--
 drivers/usb/usbip/vhci_hcd.c        |  3 ++-
 16 files changed, 41 insertions(+), 27 deletions(-)

diff --git a/drivers/usb/cdns3/cdnsp-gadget.c b/drivers/usb/cdns3/cdnsp-gadget.c
index 4a3f0f95825698f0524cace5c06bfcf27f763149..97edf767ecee9067e3db66c2373d4b1a7a2e29de 100644
--- a/drivers/usb/cdns3/cdnsp-gadget.c
+++ b/drivers/usb/cdns3/cdnsp-gadget.c
@@ -15,6 +15,7 @@
 #include <linux/delay.h>
 #include <linux/log2.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/pci.h>
 #include <linux/irq.h>
 #include <linux/dmi.h>
@@ -1671,12 +1672,12 @@ static int cdnsp_gadget_init_endpoints(struct cdnsp_device *pdev)
 			"CTRL: %s, INT: %s, BULK: %s, ISOC %s, "
 			"SupDir IN: %s, OUT: %s\n",
 			pep->name, 1024,
-			(pep->endpoint.caps.type_control) ? "yes" : "no",
-			(pep->endpoint.caps.type_int) ? "yes" : "no",
-			(pep->endpoint.caps.type_bulk) ? "yes" : "no",
-			(pep->endpoint.caps.type_iso) ? "yes" : "no",
-			(pep->endpoint.caps.dir_in) ? "yes" : "no",
-			(pep->endpoint.caps.dir_out) ? "yes" : "no");
+			str_yes_no(pep->endpoint.caps.type_control),
+			str_yes_no(pep->endpoint.caps.type_int),
+			str_yes_no(pep->endpoint.caps.type_bulk),
+			str_yes_no(pep->endpoint.caps.type_iso),
+			str_yes_no(pep->endpoint.caps.dir_in),
+			str_yes_no(pep->endpoint.caps.dir_out));
 
 		INIT_LIST_HEAD(&pep->pending_list);
 	}
diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
index 442d79e32a65b59d551e274dc3464febead3820b..ced6076a8248427e2aaafd28fd7a6f5aaa1cbc05 100644
--- a/drivers/usb/chipidea/host.c
+++ b/drivers/usb/chipidea/host.c
@@ -13,6 +13,7 @@
 #include <linux/usb/hcd.h>
 #include <linux/usb/chipidea.h>
 #include <linux/regulator/consumer.h>
+#include <linux/string_choices.h>
 #include <linux/pinctrl/consumer.h>
 
 #include "../host/ehci.h"
@@ -56,7 +57,7 @@ static int ehci_ci_portpower(struct usb_hcd *hcd, int portnum, bool enable)
 		if (ret) {
 			dev_err(dev,
 				"Failed to %s vbus regulator, ret=%d\n",
-				enable ? "enable" : "disable", ret);
+				str_enable_disable(enable), ret);
 			return ret;
 		}
 		priv->enabled = enable;
diff --git a/drivers/usb/common/usb-conn-gpio.c b/drivers/usb/common/usb-conn-gpio.c
index c84b4a70008460f4607050b517a22fba4dc0ffec..aa710b50791b0282be0a6a26cffdd981b794acaa 100644
--- a/drivers/usb/common/usb-conn-gpio.c
+++ b/drivers/usb/common/usb-conn-gpio.c
@@ -19,6 +19,7 @@
 #include <linux/platform_device.h>
 #include <linux/power_supply.h>
 #include <linux/regulator/consumer.h>
+#include <linux/string_choices.h>
 #include <linux/usb/role.h>
 
 #define USB_GPIO_DEB_MS		20	/* ms */
@@ -111,7 +112,7 @@ static void usb_conn_detect_cable(struct work_struct *work)
 
 	if (info->vbus)
 		dev_dbg(info->dev, "vbus regulator is %s\n",
-			regulator_is_enabled(info->vbus) ? "enabled" : "disabled");
+			str_enabled_disabled(regulator_is_enabled(info->vbus)));
 
 	power_supply_changed(info->charger);
 }
diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 21ac9b464696f561c87b56eab4b4dce7c5e64533..c3f839637cb5a6222754ae7cd2ea137e8086768e 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -18,6 +18,7 @@
 #include <linux/sched/mm.h>
 #include <linux/list.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/kcov.h>
 #include <linux/ioctl.h>
 #include <linux/usb.h>
@@ -1496,7 +1497,7 @@ static int hub_configure(struct usb_hub *hub,
 
 	maxchild = hub->descriptor->bNbrPorts;
 	dev_info(hub_dev, "%d port%s detected\n", maxchild,
-			(maxchild == 1) ? "" : "s");
+			str_plural(maxchild));
 
 	hub->ports = kcalloc(maxchild, sizeof(struct usb_port *), GFP_KERNEL);
 	if (!hub->ports) {
@@ -4139,14 +4140,14 @@ static int usb_set_device_initiated_lpm(struct usb_device *udev,
 		break;
 	default:
 		dev_warn(&udev->dev, "%s: Can't %s non-U1 or U2 state.\n",
-				__func__, enable ? "enable" : "disable");
+				__func__, str_enable_disable(enable));
 		return -EINVAL;
 	}
 
 	if (udev->state != USB_STATE_CONFIGURED) {
 		dev_dbg(&udev->dev, "%s: Can't %s %s state "
 				"for unconfigured device.\n",
-				__func__, enable ? "enable" : "disable",
+				__func__, str_enable_disable(enable),
 				usb3_lpm_names[state]);
 		return 0;
 	}
@@ -4172,8 +4173,7 @@ static int usb_set_device_initiated_lpm(struct usb_device *udev,
 	}
 	if (ret < 0) {
 		dev_warn(&udev->dev, "%s of device-initiated %s failed.\n",
-				enable ? "Enable" : "Disable",
-				usb3_lpm_names[state]);
+			 str_enable_disable(enable), usb3_lpm_names[state]);
 		return -EBUSY;
 	}
 	return 0;
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index e857e532b35a4687bb8113610cb76d0386fa26b5..f54198171b6a3fb49c5f74f4a8a303b422d099eb 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -9,6 +9,7 @@
 
 #include <linux/kstrtox.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/sysfs.h>
 #include <linux/pm_qos.h>
 #include <linux/component.h>
@@ -25,7 +26,7 @@ static ssize_t early_stop_show(struct device *dev,
 {
 	struct usb_port *port_dev = to_usb_port(dev);
 
-	return sysfs_emit(buf, "%s\n", port_dev->early_stop ? "yes" : "no");
+	return sysfs_emit(buf, "%s\n", str_yes_no(port_dev->early_stop));
 }
 
 static ssize_t early_stop_store(struct device *dev, struct device_attribute *attr,
diff --git a/drivers/usb/fotg210/fotg210-core.c b/drivers/usb/fotg210/fotg210-core.c
index 49f25a70b32ebdd8bdad672d31342d5f89c4a502..7fb4d4715e9f7f5ca64bc4b40e0260e304791bc9 100644
--- a/drivers/usb/fotg210/fotg210-core.c
+++ b/drivers/usb/fotg210/fotg210-core.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/string_choices.h>
 #include <linux/usb.h>
 #include <linux/usb/otg.h>
 
@@ -119,8 +120,8 @@ void fotg210_vbus(struct fotg210 *fotg, bool enable)
 	ret = regmap_update_bits(fotg->map, GEMINI_GLOBAL_MISC_CTRL, mask, val);
 	if (ret)
 		dev_err(fotg->dev, "failed to %s VBUS\n",
-			enable ? "enable" : "disable");
-	dev_info(fotg->dev, "%s: %s VBUS\n", __func__, enable ? "enable" : "disable");
+			str_enable_disable(enable));
+	dev_info(fotg->dev, "%s: %s VBUS\n", __func__, str_enable_disable(enable));
 }
 
 static int fotg210_probe(struct platform_device *pdev)
diff --git a/drivers/usb/mtu3/mtu3_debugfs.c b/drivers/usb/mtu3/mtu3_debugfs.c
index f0de9985835313500ebcce6435dbdd5d0357f914..9bd74c505872dd05bf1237f96d1dde878f76b59b 100644
--- a/drivers/usb/mtu3/mtu3_debugfs.c
+++ b/drivers/usb/mtu3/mtu3_debugfs.c
@@ -7,6 +7,7 @@
  * Author: Chunfeng Yun <chunfeng.yun@mediatek.com>
  */
 
+#include <linux/string_choices.h>
 #include <linux/uaccess.h>
 
 #include "mtu3.h"
@@ -479,7 +480,7 @@ static int ssusb_vbus_show(struct seq_file *sf, void *unused)
 	struct otg_switch_mtk *otg_sx = &ssusb->otg_switch;
 
 	seq_printf(sf, "vbus state: %s\n(echo on/off)\n",
-		   regulator_is_enabled(otg_sx->vbus) ? "on" : "off");
+		   str_on_off(regulator_is_enabled(otg_sx->vbus)));
 
 	return 0;
 }
diff --git a/drivers/usb/mtu3/mtu3_dr.c b/drivers/usb/mtu3/mtu3_dr.c
index 8191b7ed3852107a4ddd55b39fc53987eb56fef6..ffa5b9401dad0a79fa8ded2c32d3bb4e49069951 100644
--- a/drivers/usb/mtu3/mtu3_dr.c
+++ b/drivers/usb/mtu3/mtu3_dr.c
@@ -7,6 +7,7 @@
  * Author: Chunfeng Yun <chunfeng.yun@mediatek.com>
  */
 
+#include <linux/string_choices.h>
 #include "mtu3.h"
 #include "mtu3_dr.h"
 #include "mtu3_debug.h"
@@ -109,7 +110,7 @@ int ssusb_set_vbus(struct otg_switch_mtk *otg_sx, int is_on)
 	if (!vbus)
 		return 0;
 
-	dev_dbg(ssusb->dev, "%s: turn %s\n", __func__, is_on ? "on" : "off");
+	dev_dbg(ssusb->dev, "%s: turn %s\n", __func__, str_on_off(is_on));
 
 	if (is_on) {
 		ret = regulator_enable(vbus);
diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
index ad0eeac4332d9f69d5237180a8a16cbc0eee35c2..bf73fbc29976ff8d99a3591b33f4f6b90ed9b4c3 100644
--- a/drivers/usb/mtu3/mtu3_gadget.c
+++ b/drivers/usb/mtu3/mtu3_gadget.c
@@ -7,6 +7,7 @@
  * Author: Chunfeng Yun <chunfeng.yun@mediatek.com>
  */
 
+#include <linux/string_choices.h>
 #include "mtu3.h"
 #include "mtu3_trace.h"
 
@@ -490,7 +491,7 @@ static int mtu3_gadget_pullup(struct usb_gadget *gadget, int is_on)
 	unsigned long flags;
 
 	dev_dbg(mtu->dev, "%s (%s) for %sactive device\n", __func__,
-		is_on ? "on" : "off", mtu->is_active ? "" : "in");
+		str_on_off(is_on), mtu->is_active ? "" : "in");
 
 	pm_runtime_get_sync(mtu->dev);
 
diff --git a/drivers/usb/musb/da8xx.c b/drivers/usb/musb/da8xx.c
index f772aa272bea65eb403655b81a7bec26a1d355e4..26fd71a5f9b2aeef43eea19fc58302e79b4abc4a 100644
--- a/drivers/usb/musb/da8xx.c
+++ b/drivers/usb/musb/da8xx.c
@@ -21,6 +21,7 @@
 #include <linux/of_platform.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/string_choices.h>
 #include <linux/dma-mapping.h>
 #include <linux/usb/usb_phy_generic.h>
 
@@ -306,7 +307,7 @@ static irqreturn_t da8xx_musb_interrupt(int irq, void *hci)
 		}
 
 		dev_dbg(musb->controller, "VBUS %s (%s)%s, devctl %02x\n",
-				drvvbus ? "on" : "off",
+				str_on_off(drvvbus),
 				usb_otg_state_string(musb->xceiv->otg->state),
 				err ? " ERROR" : "",
 				devctl);
diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index 03b1154a6014ab27b8cca916af3a724b58046c53..7f349f5e781df481c44e84a02e8c93cf3279132d 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -72,6 +72,7 @@
 #include <linux/kobject.h>
 #include <linux/prefetch.h>
 #include <linux/platform_device.h>
+#include <linux/string_choices.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/dma-mapping.h>
@@ -1937,7 +1938,7 @@ vbus_show(struct device *dev, struct device_attribute *attr, char *buf)
 	pm_runtime_put_sync(dev);
 
 	return sprintf(buf, "Vbus %s, timeout %lu msec\n",
-			vbus ? "on" : "off", val);
+			str_on_off(vbus), val);
 }
 static DEVICE_ATTR_RW(vbus);
 
diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c
index 2542239ec64eafa2de5bd34f19cb0bb7d68b88ea..f877faf5a930cabad4e2a62289c4d8224b2befa6 100644
--- a/drivers/usb/musb/musb_dsps.c
+++ b/drivers/usb/musb/musb_dsps.c
@@ -24,6 +24,7 @@
 #include <linux/usb/usb_phy_generic.h>
 #include <linux/platform_data/usb-omap.h>
 #include <linux/sizes.h>
+#include <linux/string_choices.h>
 
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -378,7 +379,7 @@ static irqreturn_t dsps_interrupt(int irq, void *hci)
 
 		/* NOTE: this must complete power-on within 100 ms. */
 		dev_dbg(musb->controller, "VBUS %s (%s)%s, devctl %02x\n",
-				drvvbus ? "on" : "off",
+				str_on_off(drvvbus),
 				usb_otg_state_string(musb->xceiv->otg->state),
 				err ? " ERROR" : "",
 				devctl);
diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
index c6076df0d50cc7aa9b733c2685394cd810c39f4a..6869c58367f2d05b464a0f9a63008425730b94da 100644
--- a/drivers/usb/musb/musb_gadget.c
+++ b/drivers/usb/musb/musb_gadget.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/smp.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/slab.h>
@@ -1606,7 +1607,7 @@ static void musb_pullup(struct musb *musb, int is_on)
 	/* FIXME if on, HdrcStart; if off, HdrcStop */
 
 	musb_dbg(musb, "gadget D+ pullup %s",
-		is_on ? "on" : "off");
+		str_on_off(is_on));
 	musb_writeb(musb->mregs, MUSB_POWER, power);
 }
 
diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
index 732ba981e607e750995db0b7cca2bb270e9793e6..6b4481a867c5e8189ce164b3f98cc3576b0b1a81 100644
--- a/drivers/usb/musb/musb_host.c
+++ b/drivers/usb/musb/musb_host.c
@@ -13,6 +13,7 @@
 #include <linux/delay.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/errno.h>
 #include <linux/list.h>
 #include <linux/dma-mapping.h>
@@ -1028,7 +1029,7 @@ static bool musb_h_ep0_continue(struct musb *musb, u16 len, struct urb *urb)
 					+ urb->actual_length);
 			musb_dbg(musb, "Sending %d byte%s to ep0 fifo %p",
 					fifo_count,
-					(fifo_count == 1) ? "" : "s",
+					str_plural(fifo_count),
 					fifo_dest);
 			musb_write_fifo(hw_ep, fifo_count, fifo_dest);
 
diff --git a/drivers/usb/storage/shuttle_usbat.c b/drivers/usb/storage/shuttle_usbat.c
index 087c706bb315f9d4b921b9d9eb85df752c90337b..c33cbf177e6fcaa80e0d2639594d1314c59f4950 100644
--- a/drivers/usb/storage/shuttle_usbat.c
+++ b/drivers/usb/storage/shuttle_usbat.c
@@ -32,6 +32,7 @@
 #include <linux/errno.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/cdrom.h>
 
 #include <scsi/scsi.h>
@@ -651,8 +652,7 @@ static int usbat_hp8200e_rw_block_test(struct us_data *us,
 				return USB_STOR_TRANSPORT_FAILED;
 
 			usb_stor_dbg(us, "Redoing %s\n",
-				     direction == DMA_TO_DEVICE
-				     ? "write" : "read");
+				     str_write_read(direction == DMA_TO_DEVICE));
 
 		} else if (result != USB_STOR_XFER_GOOD)
 			return USB_STOR_TRANSPORT_ERROR;
diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 2f722849dfc9ff64b8801c56beca3cde49184f31..f4843ea5080c03cade2a77657701731af7dbf8b0 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #include "usbip_common.h"
 #include "vhci.h"
@@ -1449,7 +1450,7 @@ static int vhci_hcd_suspend(struct platform_device *pdev, pm_message_t state)
 	if (connected > 0) {
 		dev_info(&pdev->dev,
 			 "We have %d active connection%s. Do not suspend.\n",
-			 connected, (connected == 1 ? "" : "s"));
+			 connected, str_plural(connected));
 		ret =  -EBUSY;
 	} else {
 		dev_info(&pdev->dev, "suspend vhci_hcd");

-- 
2.43.0



Return-Path: <linux-usb+bounces-19348-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3768EA111AA
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 21:06:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C7691889D2A
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 20:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06D9E20967E;
	Tue, 14 Jan 2025 20:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iGUZ7oNg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A13520C479
	for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 20:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736885152; cv=none; b=r3LqqRvlDs7/Kcbga5pVWRyLtQxjNtTtUY8RB6BfjUz1Q4R0MpKCqXwgGxdseEKQLvHDzjg9dKYP1tqcLkacoVbRO3FeV1WuUin/YRcmyGdWgGTjWCKQK3LmSmVJMQzpYr+SxMtOmCSTQ/M/jOUCkXpVJe+4I117fvR0ge/reVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736885152; c=relaxed/simple;
	bh=6gsuWbH88x9KgXoI5TgmCdvl5bUYE9XYTxx1EDNabmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sGE520tcqm5jSfiIq2Gq9rbSOhchlN3VAOWTBbaLBBpFKV6+dALiPURTBpPkYB+B0Es4SGueU9xPBpALYVWg7G5TBcEVG2xoT6+GrtwmlH3NRXr5bJMGsDJWVSdyp9KJArGwdmgAUwVI6rBxXzm3w9694TbWv7UAZ/PBX2v9jqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iGUZ7oNg; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38636875da4so515496f8f.2
        for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 12:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736885149; x=1737489949; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3qM/tcI7j/OfvD0CcvoyLKgC3FnLS8o6FdfzDJsqGic=;
        b=iGUZ7oNgcd8hJ0qCrWeCb9THArdG5Evj4XLXyZ+1ueOKlqpXbBuBC2XCsI5DtRy+Ln
         iXM3CDL5UuiEnqlmKsfjS1qS0LelsqH+ai5bzHpDI0s6lpTsaYz1KJ53IT8k+q2IpPMn
         l/pskYTzkk4JXraGE+DEAybm05VlIVe8h/ESGzUxz9zZgFlDkPwK8FcD48heZqGoDXvY
         cFV1KksDnmz4tqyl0cvUooPwt9oA8J+fGP0HTY0e7ERoQY0PBqdB1ylEhfrYfVn1rVf7
         cDFFHm2rqCM0hVkrj/dYSVoAJ58ocLAkJa18a89FS1tWjgKOl+qqT3GpcBNE0B9yzYrP
         JQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736885149; x=1737489949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3qM/tcI7j/OfvD0CcvoyLKgC3FnLS8o6FdfzDJsqGic=;
        b=BIJ/VhzYtSRoPmS9pFOcRZGX8piwneeq5APBLF6X/PXHb1IAOMBVuyv8yooRWTXrZ8
         mYZxPMrHAGo0uORIFjAp04/BiMjHM5ao5b3WXoDG0a+61DTvzh0qp/Xzf3GJW2EH2ctL
         R/SNeXpjLXA0KMhAI1KKlB5keFjxBb6pcQ2Y4MHuQc7E57dTgo1lD3jnyUEUuDthpeP4
         hbzo5hzAY3Wf7M6SWv1z+XjULZ8FSJ3/E0GVXqQawz4Kq+8WTI/nonXlQX+Dz5URyja6
         sNZlKRmySh/UbP9N8d3/WqIR4xT5W42gWrbwHgTxCdCZgQQTeBu3e2YUHzYEAOy6Zz1x
         5DaQ==
X-Gm-Message-State: AOJu0YzFYjwg6sGcScnfvZzD+GXHNYEX8Uh0ldJPOlTm5uHD6JHOPTzQ
	5YoX4G6rFFDHe7le0UjjvfNEqFe0HcUxSgaSuQcOZJYMjLsJ1+p0Lo4jPGh9EV8=
X-Gm-Gg: ASbGnct85mp/7stHkx+DdwO8bLOFdUhRRBU4FMtY8Qzk1UZuvwPEdt5HeVVeDaIUe7D
	yOHGhXnTvZ+27moqpv4eyQXFe3qnC3Q8M8X6gYOa2mhj9SoxHxiwnVdQunT34fXXLXR2p5FEPz6
	EYCkyfLvFxZ/KgxeQy+Pmsq25cRMw7ZRBEuH1sfkK4VRhs0JVgT5Gu2BZ7xfrAtTX8m/t3EC9zj
	wGZvf269lMtEtxDRgOqI5AKYclamnROmpKmXZfZm/Pm+KBIlIF3jpgszfz31uNIzUIXvF8o
X-Google-Smtp-Source: AGHT+IEoOZbZSuWLCARa3ej13fhaIk8K815salz+1rjHY3uOlYhFohf1g25+udMvLC8TNZHWQ3cTPw==
X-Received: by 2002:a05:600c:3b08:b0:42c:c0d8:bf49 with SMTP id 5b1f17b1804b1-436e2560720mr96739485e9.0.1736885148916;
        Tue, 14 Jan 2025 12:05:48 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9dc8802sm184622025e9.10.2025.01.14.12.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 12:05:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 14 Jan 2025 21:05:35 +0100
Subject: [PATCH 2/6] USB: host: Use str_enable_disable-like helpers
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-str-enable-disable-usb-v1-2-c8405df47c19@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5423;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6gsuWbH88x9KgXoI5TgmCdvl5bUYE9XYTxx1EDNabmI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnhsOStoOcTYIheQheuxTvcNt6qNGqwgv4Mrucb
 HQfcC8AoGiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4bDkgAKCRDBN2bmhouD
 116uD/4pUHkYVwXjtXupkx4piF1QjTdJqIeQMmpgViZX1SSVvola2wMqHd7L0mTS4axfqr/Rwj/
 WI+LNzEX+tbz1FbtSpXuk5xAy9hn1u536wKGFprj/qinJIqZ6UykfwOE5xhpFjft8Bv8B116enk
 KsmoVSqZhtX9JJak44+tbXuPRRJAfBME/2p7hDNhoJ+gxeh8VNHcGo4Mf1cGg+5b17gStjlogF0
 yz56HV6XS4C+UIdtu6nlwUyoCJfqJRmJd90J1zCgX8LdigNU9lA4DYnfHg1mVQQBV7mO7TTD5qv
 RxZN40B7NtpGvXpXZgOOE3dpeupV9KmSPnVaCiErynSUpwojakhIpYJsCs9Wwihu+gmSvPiCT10
 p8ycLvxfEtXiGbWF+fM8lQQlELVofXa3wmI37ipCMZTc5t4XXzFYeQJI+glL+S1gOE06OMVpuFC
 N5WMZjELYyp3W3/O0KLYMqJ0MogG/eF6wa3bY/9l0Z7qh8A+iX90PZJ28INhPhwo1QFW9K3rriR
 0RlJBemWOA+xMFxBHOqZKcY9H9Z0M2GrDjqH6nzMnst7hrJFdzwhb2EJWzd+3APBWLENlXhY6ZA
 z8VxayvKVWQmB+J5Q0BjIEYorPzk1EEMJvgO9X36XpRXQHG7YmpYtluPO6QnQfP6wr8QRgWa5Ol
 TxWH79PhGdn8YTg==
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
 drivers/usb/host/oxu210hp-hcd.c | 3 ++-
 drivers/usb/host/sl811-hcd.c    | 3 ++-
 drivers/usb/host/xhci-ring.c    | 5 +++--
 drivers/usb/host/xhci-tegra.c   | 5 +++--
 drivers/usb/host/xhci.c         | 3 ++-
 5 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/oxu210hp-hcd.c b/drivers/usb/host/oxu210hp-hcd.c
index a6c20facf9450153121001d36547eee68d6c9ca9..fce800ba4c614ca0ccf23b5af0c0b13423e2a95d 100644
--- a/drivers/usb/host/oxu210hp-hcd.c
+++ b/drivers/usb/host/oxu210hp-hcd.c
@@ -15,6 +15,7 @@
 #include <linux/ioport.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/errno.h>
 #include <linux/timer.h>
 #include <linux/list.h>
@@ -2756,7 +2757,7 @@ static void ehci_port_power(struct oxu_hcd *oxu, int is_on)
 	if (!HCS_PPC(oxu->hcs_params))
 		return;
 
-	oxu_dbg(oxu, "...power%s ports...\n", is_on ? "up" : "down");
+	oxu_dbg(oxu, "...power%s ports...\n", str_up_down(is_on));
 	for (port = HCS_N_PORTS(oxu->hcs_params); port > 0; ) {
 		if (is_on)
 			oxu_hub_control(oxu_to_hcd(oxu), SetPortFeature,
diff --git a/drivers/usb/host/sl811-hcd.c b/drivers/usb/host/sl811-hcd.c
index 036f5fd6d159feee18f3be187c6bc9d5ea59dc4f..fa2e4badd288c0d355b121f27e9d9b5460fa4e7c 100644
--- a/drivers/usb/host/sl811-hcd.c
+++ b/drivers/usb/host/sl811-hcd.c
@@ -48,6 +48,7 @@
 #include <linux/usb/hcd.h>
 #include <linux/platform_device.h>
 #include <linux/prefetch.h>
+#include <linux/string_choices.h>
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
 
@@ -98,7 +99,7 @@ static void port_power(struct sl811 *sl811, int is_on)
 	if (sl811->board && sl811->board->port_power) {
 		/* switch VBUS, at 500mA unless hub power budget gets set */
 		dev_dbg(hcd->self.controller, "power %s\n",
-			is_on ? "on" : "off");
+			str_on_off(is_on));
 		sl811->board->port_power(hcd->self.controller, is_on);
 	}
 
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 3d66ed240dc375af3d51a7c6bcb1970efc7ecd49..965bffce301e24502310fd4a848ede01e1348530 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -55,6 +55,7 @@
 #include <linux/jiffies.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/dma-mapping.h>
 #include "xhci.h"
 #include "xhci-trace.h"
@@ -3441,8 +3442,8 @@ static void check_interval(struct urb *urb, struct xhci_ep_ctx *ep_ctx)
 	if (xhci_interval != ep_interval) {
 		dev_dbg_ratelimited(&urb->dev->dev,
 				"Driver uses different interval (%d microframe%s) than xHCI (%d microframe%s)\n",
-				ep_interval, ep_interval == 1 ? "" : "s",
-				xhci_interval, xhci_interval == 1 ? "" : "s");
+				ep_interval, str_plural(ep_interval),
+				xhci_interval, str_plural(xhci_interval));
 		urb->interval = xhci_interval;
 		/* Convert back to frames for LS/FS devices */
 		if (urb->dev->speed == USB_SPEED_LOW ||
diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 06ae193ec87407f13487556862c9caf03f51b786..a51ce71a6a77eb7ce5308669624c7b8bb735e382 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -26,6 +26,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/usb/otg.h>
 #include <linux/usb/phy.h>
 #include <linux/usb/role.h>
@@ -724,7 +725,7 @@ static void tegra_xusb_mbox_handle(struct tegra_xusb *tegra,
 		if (err < 0) {
 			dev_err(dev,
 				"failed to %s LFPS detection on USB3#%u: %d\n",
-				enable ? "enable" : "disable", port, err);
+				str_enable_disable(enable), port, err);
 			rsp.cmd = MBOX_CMD_NAK;
 		} else {
 			rsp.cmd = MBOX_CMD_ACK;
@@ -1349,7 +1350,7 @@ static void tegra_xhci_id_work(struct work_struct *work)
 	u32 status;
 	int ret;
 
-	dev_dbg(tegra->dev, "host mode %s\n", tegra->host_mode ? "on" : "off");
+	dev_dbg(tegra->dev, "host mode %s\n", str_on_off(tegra->host_mode));
 
 	mutex_lock(&tegra->lock);
 
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 5ebde8cae4fc44cdb997b0f61314e309bda56c0d..45653114ccd7fcc4a1c6872e749c660d4cab705f 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/dmi.h>
 #include <linux/dma-mapping.h>
 
@@ -4523,7 +4524,7 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
 	hlpm_addr = ports[port_num]->addr + PORTHLPMC;
 
 	xhci_dbg(xhci, "%s port %d USB2 hardware LPM\n",
-			enable ? "enable" : "disable", port_num + 1);
+		 str_enable_disable(enable), port_num + 1);
 
 	if (enable) {
 		/* Host supports BESL timeout instead of HIRD */

-- 
2.43.0



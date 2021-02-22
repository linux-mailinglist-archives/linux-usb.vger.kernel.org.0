Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BED3321573
	for <lists+linux-usb@lfdr.de>; Mon, 22 Feb 2021 12:53:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbhBVLxU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Feb 2021 06:53:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbhBVLxA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Feb 2021 06:53:00 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE028C061574
        for <linux-usb@vger.kernel.org>; Mon, 22 Feb 2021 03:52:19 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id x4so16325209ybj.22
        for <linux-usb@vger.kernel.org>; Mon, 22 Feb 2021 03:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=C7kw8jx64LApjlXr8YSHyVe3f0SwrG/CcJgwhfZRYVM=;
        b=AT4Vcn7CD2ooKlsMJvGdNfu9HkqU4a546cJWUY3m4AUuNnHB9fbNLkD7aq/URsDt8x
         XUhkP8YCkMoUFYIpPjK3vccLXCLSSeGBeJAfO6KgBV3GBOW2g1RJRl7Xgezcq1RyxySR
         mczoGFVdG6T6e1t2grHV4ROubyVArO0b1uPwOW1sI3dfgkExKdjNCrMMPKQFRYBUkRc+
         cixHajqNv1AlBLX9db+fDtMtpHLxkqDuPR813tRHu2fAycSZkVGd8/UvIE5QGyLm4Q9Y
         3wZsLS9nRiZAi0itOLAzahfQE7+AzFg7ilPB59iFHB9vk1tflxjH0MjWa4Ec4OWh4UVC
         3ZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=C7kw8jx64LApjlXr8YSHyVe3f0SwrG/CcJgwhfZRYVM=;
        b=gu8fWpN6FNapoMmghqyExIVgX4/OmmnJ3O3DdvKDGCaxj+VA0pASiMreR18ij4EFlj
         M6aUcyG3k3D2izHeMyOI9GHBRF2xIG01cnbmyhOLCqTA0Kx5OUKLZTL96QgKZe9Jf+yd
         84DGq1y/4Kw3oznUUOZN/25uD8WOafq2513GTFbi5oLLPEc04T4wxRJq4B6fAt9ny1bO
         JYyVXYkhkODs98tpCEacaword6qxq8qiR1ATX2zEyXqOfqdbpegsyX3kA4W7E+toYL+G
         O4jk4AVX4KsVN0fkXpMVafzkyqaY42eqGbeFOE+dWFBE5JAxlWF2EXAKZpL2OOAjepfZ
         lSsg==
X-Gm-Message-State: AOAM532+t2ylUxkijKYbiopLzoHzyrNOf6qxBMKf8WfgafbwK+zgD18I
        6JLkQbt2+DZl6c3VNC5Kt7MavynbFYc=
X-Google-Smtp-Source: ABdhPJxevbp8wPkx6Ynac/UjHwNCwxMtwswB0C2urmf+KQMq18bfqqo7raAlrfHy+IozE0P87m6iEZRH4CE=
Sender: "raychi via sendgmr" <raychi@raychi.tao.corp.google.com>
X-Received: from raychi.tao.corp.google.com ([2401:fa00:fc:202:9c8c:8669:7daa:43ff])
 (user=raychi job=sendgmr) by 2002:a5b:2c8:: with SMTP id h8mr31577758ybp.364.1613994739172;
 Mon, 22 Feb 2021 03:52:19 -0800 (PST)
Date:   Mon, 22 Feb 2021 19:51:48 +0800
In-Reply-To: <20210222115149.3606776-1-raychi@google.com>
Message-Id: <20210222115149.3606776-2-raychi@google.com>
Mime-Version: 1.0
References: <20210222115149.3606776-1-raychi@google.com>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
Subject: [PATCH 1/2] usb: dwc3: add a power supply for current control
From:   Ray Chi <raychi@google.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        kyletso@google.com, badhri@google.com, Ray Chi <raychi@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently, VBUS draw callback does no action when the
generic PHYs are used. This patch adds an additional
path to control charging current through power supply
interface.

Signed-off-by: Ray Chi <raychi@google.com>
---
 drivers/usb/dwc3/core.c | 15 +++++++++++++++
 drivers/usb/dwc3/core.h |  4 ++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index f2448d0a9d39..d15f065849cd 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1238,6 +1238,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	u8			rx_max_burst_prd;
 	u8			tx_thr_num_pkt_prd;
 	u8			tx_max_burst_prd;
+	const char		*usb_psy_name;
+	int			ret;
 
 	/* default to highest possible threshold */
 	lpm_nyet_threshold = 0xf;
@@ -1263,6 +1265,13 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	else
 		dwc->sysdev = dwc->dev;
 
+	ret = device_property_read_string(dev, "usb-psy-name", &usb_psy_name);
+	if (ret >= 0) {
+		dwc->usb_psy = power_supply_get_by_name(usb_psy_name);
+		if (!dwc->usb_psy)
+			dev_err(dev, "couldn't get usb power supply\n");
+	}
+
 	dwc->has_lpm_erratum = device_property_read_bool(dev,
 				"snps,has-lpm-erratum");
 	device_property_read_u8(dev, "snps,lpm-nyet-threshold",
@@ -1619,6 +1628,9 @@ static int dwc3_probe(struct platform_device *pdev)
 assert_reset:
 	reset_control_assert(dwc->reset);
 
+	if (!dwc->usb_psy)
+		power_supply_put(dwc->usb_psy);
+
 	return ret;
 }
 
@@ -1641,6 +1653,9 @@ static int dwc3_remove(struct platform_device *pdev)
 	dwc3_free_event_buffers(dwc);
 	dwc3_free_scratch_buffers(dwc);
 
+	if (!dwc->usb_psy)
+		power_supply_put(dwc->usb_psy);
+
 	return 0;
 }
 
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 052b20d52651..6708fdf358b3 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -30,6 +30,8 @@
 
 #include <linux/phy/phy.h>
 
+#include <linux/power_supply.h>
+
 #define DWC3_MSG_MAX	500
 
 /* Global constants */
@@ -1125,6 +1127,8 @@ struct dwc3 {
 	struct usb_role_switch	*role_sw;
 	enum usb_dr_mode	role_switch_default_mode;
 
+	struct power_supply	*usb_psy;
+
 	u32			fladj;
 	u32			irq_gadget;
 	u32			otg_irq;
-- 
2.30.0.617.g56c4b15f3c-goog


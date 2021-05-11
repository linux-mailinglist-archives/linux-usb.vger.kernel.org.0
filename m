Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1647637A294
	for <lists+linux-usb@lfdr.de>; Tue, 11 May 2021 10:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231175AbhEKIwY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 May 2021 04:52:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231143AbhEKIwX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 May 2021 04:52:23 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DF8AC061574
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 01:51:16 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso739461wmh.4
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 01:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DNxyhq7WYEH0U4TtHXig9vqQWs7OAdf1s4tgVO034Ek=;
        b=L8+dIitQEA0nzDAZFmhniL7JR6aAq0+ZtDg4oufaegP5/aeUz4SlQ9IFT7zS8pOosF
         f4KtR1KmTFnOGtGQxMNuBbphZMWmwYdAAxovPRGDZcczc9/LSUy5C24RmtmXRhH0SfSM
         YsvxxSxpX3xMl5PXr/sfuI6hTarFXzJHp5FE6O/bHqy4A6LlYsygv9PjGSaBPrMNabuA
         UnW1cZmECkiH3nGNK0/GIf2q7qOceI6WUNi8RuvQDH2hQC1I/mNItxhmcuUG00zPPUjx
         TM6nDyp+FMuKAvOkwNHvGbY14UG/UmBR0buL9GMLRwsCfF7R0HyGRhILcSxPhpIBvt7h
         XMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DNxyhq7WYEH0U4TtHXig9vqQWs7OAdf1s4tgVO034Ek=;
        b=IU+e8AjR9pUjp4TxbStAJKE9kL7W065eLwCJcXj7e6DS9tOiM8n2nS+XS/SISrZIkZ
         GnHmolUwpgxOPcl9eTme1H1NaMTy+ACiTxnTuBO4b8KLhStQTRTNDzOxkbIDugXTbwpG
         UYQBnwAsygGGL1wC0JJ4+ZJ3IhpwSoIlHTKx809t9blDSpPezSp/gw1rUFeoZPfA6xTb
         2QMMJ+X0OLiJoc3h36OB+TgoMrZHituF8JDV9QbssIOcAsSZ07D5WbLbARMKUYJVFwDh
         Wi6tMAsJb/X82mADbo1n9s/rhR8a6nQ/mlSWe/uDv4uslgn/2p2aTWeZUwE68J82czH/
         lsjw==
X-Gm-Message-State: AOAM533NVCeguVqiHckkRQIPyX5JBdY1PX23sPT7ApVaX1hRG327BBLr
        NT4ZuxD+0nN8n/Ylh6acs/4fCA==
X-Google-Smtp-Source: ABdhPJzn8JQY9aYTOx1mr2XHxcsmnoDQSctoSjlC/7xvpLWE6SKfc3x6U2h9RBbVj6DgIOZNr7+0Pg==
X-Received: by 2002:a1c:14c:: with SMTP id 73mr4257589wmb.152.1620723074850;
        Tue, 11 May 2021 01:51:14 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id j7sm23042980wmi.21.2021.05.11.01.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 01:51:14 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v2 4/9] usb: isp1760: remove platform data struct and code
Date:   Tue, 11 May 2021 09:50:56 +0100
Message-Id: <20210511085101.2081399-5-rui.silva@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511085101.2081399-1-rui.silva@linaro.org>
References: <20210511085101.2081399-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since the removal of the Blackfin port with:
commit 4ba66a976072 ("arch: remove blackfin port")

No one is using or referencing this header and platform data struct.
Remove them.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 drivers/usb/isp1760/isp1760-if.c | 20 +++-----------------
 include/linux/usb/isp1760.h      | 19 -------------------
 2 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 include/linux/usb/isp1760.h

diff --git a/drivers/usb/isp1760/isp1760-if.c b/drivers/usb/isp1760/isp1760-if.c
index abfba9f5ec23..fb6701608cd8 100644
--- a/drivers/usb/isp1760/isp1760-if.c
+++ b/drivers/usb/isp1760/isp1760-if.c
@@ -16,7 +16,6 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/usb/isp1760.h>
 #include <linux/usb/hcd.h>
 
 #include "isp1760-core.h"
@@ -225,22 +224,9 @@ static int isp1760_plat_probe(struct platform_device *pdev)
 
 		if (of_property_read_bool(dp, "dreq-polarity"))
 			devflags |= ISP1760_FLAG_DREQ_POL_HIGH;
-	} else if (dev_get_platdata(&pdev->dev)) {
-		struct isp1760_platform_data *pdata =
-			dev_get_platdata(&pdev->dev);
-
-		if (pdata->is_isp1761)
-			devflags |= ISP1760_FLAG_ISP1761;
-		if (pdata->bus_width_16)
-			devflags |= ISP1760_FLAG_BUS_WIDTH_16;
-		if (pdata->port1_otg)
-			devflags |= ISP1760_FLAG_OTG_EN;
-		if (pdata->analog_oc)
-			devflags |= ISP1760_FLAG_ANALOG_OC;
-		if (pdata->dack_polarity_high)
-			devflags |= ISP1760_FLAG_DACK_POL_HIGH;
-		if (pdata->dreq_polarity_high)
-			devflags |= ISP1760_FLAG_DREQ_POL_HIGH;
+	} else {
+		pr_err("isp1760: no platform data\n");
+		return -ENXIO;
 	}
 
 	ret = isp1760_register(mem_res, irq_res->start, irqflags, &pdev->dev,
diff --git a/include/linux/usb/isp1760.h b/include/linux/usb/isp1760.h
deleted file mode 100644
index b75ded28db81..000000000000
--- a/include/linux/usb/isp1760.h
+++ /dev/null
@@ -1,19 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * board initialization should put one of these into dev->platform_data
- * and place the isp1760 onto platform_bus named "isp1760-hcd".
- */
-
-#ifndef __LINUX_USB_ISP1760_H
-#define __LINUX_USB_ISP1760_H
-
-struct isp1760_platform_data {
-	unsigned is_isp1761:1;			/* Chip is ISP1761 */
-	unsigned bus_width_16:1;		/* 16/32-bit data bus width */
-	unsigned port1_otg:1;			/* Port 1 supports OTG */
-	unsigned analog_oc:1;			/* Analog overcurrent */
-	unsigned dack_polarity_high:1;		/* DACK active high */
-	unsigned dreq_polarity_high:1;		/* DREQ active high */
-};
-
-#endif /* __LINUX_USB_ISP1760_H */
-- 
2.31.1


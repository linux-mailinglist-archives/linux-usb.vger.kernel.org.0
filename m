Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12B56108DEF
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2019 13:32:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727599AbfKYMcU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Nov 2019 07:32:20 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51309 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727522AbfKYMcU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Nov 2019 07:32:20 -0500
Received: by mail-wm1-f66.google.com with SMTP id g206so14972406wme.1;
        Mon, 25 Nov 2019 04:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xJFiyNk61/LmOWhjvusaZcT5zNvIqzpe6rBOAqTUUR8=;
        b=qeI7Aflf9kfdk38c6Gc2zcl+if3N0gufeWRD1KGvfgZjmUfVpdbKkxEe3cHk4nmm1K
         Yjqhgb30PABu6pGB9LpMRenwyB3xtiycv2tCPsQjF9X4u7HFTc1jltPV9Q/iZtB0/JBp
         CLvDu8LRFGp8DZ57lYP6NC6aCBbTkdY2yGeWRbzfmwhg2qOuMOAwibLWfLDM7dLgdN2f
         QdRkDZIzobkq940DlQE/7+sPndr7zNVRBefM0+1ya330hK4h6f6VLIMpl8/FkWlETowT
         kUfga67er19Zvpia2+D+kDmrEH7LKuG3+vjABFiWRjFhiOUzQfIUPWRVi3KDBxz7fT4g
         5lyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xJFiyNk61/LmOWhjvusaZcT5zNvIqzpe6rBOAqTUUR8=;
        b=Hra7mBvAoXl+D8JqnBuIzuiCdGjfsk8N1p24ydKo5Zgx729WoljuakXbcgtqsLYcZG
         raFRuVwQd63ssTXRF6qeIM6peDHscvT+we5Ii4KZ/gJhsxtWfUjZBt2v5F4NYd/hgo1o
         GTB/pNVthmHeWXRfvhT3CMJINFaQ53y2HYgyzm6oJtDhwodIYbVzi3XPdj3ArMkkpR/N
         0gqP35ZAXLSlaSvA4AaWV/bedpFSsL23EnYGIePyqb0AvuvViWmC5983pdmlV+U6+EXG
         JSp0PE8p+g8AXOql8zPxR2iV59gUhtfJQclDlgLBPaUeP/axmP3ga9jz6FtEDdK3Y62B
         9uxQ==
X-Gm-Message-State: APjAAAXJxqTeZw8SxuRiZNhYZNNHwWpaACg/CvO7zyOqY8z3qcSwTibU
        skkHIhb22jsxt91IxhFrZk4=
X-Google-Smtp-Source: APXvYqyMqfrT5wZUzl66aLR7w++8G+NSvfLRTZVk8XmxR/tg5MOnEA63b5ER8CVJkAVTDKq0r5mW6w==
X-Received: by 2002:a7b:c308:: with SMTP id k8mr27559704wmj.32.1574685138061;
        Mon, 25 Nov 2019 04:32:18 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id w13sm10160668wrm.8.2019.11.25.04.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 04:32:17 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 03/10] usb: host: xhci-tegra: Avoid a fixed duration sleep
Date:   Mon, 25 Nov 2019 13:32:03 +0100
Message-Id: <20191125123210.1564323-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191125123210.1564323-1-thierry.reding@gmail.com>
References: <20191125123210.1564323-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Do not use a fixed duration sleep to wait for the DMA controller to
become ready. Instead, poll the L2IMEMOP_RESULT register for the VLD
flag to determine when the XUSB controller's DMA master is ready.

Based on work by JC Kuo <jckuo@nvidia.com>.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 5cfd54862670..d15fd16168ae 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -101,6 +101,8 @@
 #define  L2IMEMOP_ACTION_SHIFT			24
 #define  L2IMEMOP_INVALIDATE_ALL		(0x40 << L2IMEMOP_ACTION_SHIFT)
 #define  L2IMEMOP_LOAD_LOCKED_RESULT		(0x11 << L2IMEMOP_ACTION_SHIFT)
+#define XUSB_CSB_MEMPOOL_L2IMEMOP_RESULT	0x101a18
+#define  L2IMEMOP_RESULT_VLD			BIT(31)
 #define XUSB_CSB_MP_APMAP			0x10181c
 #define  APMAP_BOOTPATH				BIT(31)
 
@@ -893,7 +895,22 @@ static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
 
 	csb_writel(tegra, 0, XUSB_FALC_DMACTL);
 
-	msleep(50);
+	/* wait for RESULT_VLD to get set */
+	timeout = jiffies + msecs_to_jiffies(10);
+
+	do {
+		value = csb_readl(tegra, XUSB_CSB_MEMPOOL_L2IMEMOP_RESULT);
+		if (value & L2IMEMOP_RESULT_VLD)
+			break;
+
+		usleep_range(50, 100);
+	} while (time_is_after_jiffies(timeout));
+
+	value = csb_readl(tegra, XUSB_CSB_MEMPOOL_L2IMEMOP_RESULT);
+	if ((value & L2IMEMOP_RESULT_VLD) == 0) {
+		dev_err(dev, "DMA controller not ready %#010x\n", value);
+		return -EBUSY;
+	}
 
 	csb_writel(tegra, le32_to_cpu(header->boot_codetag),
 		   XUSB_FALC_BOOTVEC);
-- 
2.23.0


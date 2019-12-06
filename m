Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C22A1151EC
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 15:07:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbfLFOHD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 09:07:03 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42027 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbfLFOHD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 09:07:03 -0500
Received: by mail-wr1-f68.google.com with SMTP id a15so7859595wrf.9;
        Fri, 06 Dec 2019 06:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0VJGaxbi6i6aCC2UDQdo84Bf2JzYtiGZVASwYuZ6xg4=;
        b=CU/3JMTmqKP3QMw1+UdIUNuPAEZLOSHuUDzw4Cf5YTL929W4bOmwDnGn72d/T7l5rw
         c+h8c7EOXZ6SHVZnguaZs/b9rnjHeD85Tt/vSG9qtwL8hO6xJhI6QU6yjojHsJsXt5Cf
         PjiLtMiHDAsyA5f3Oif4HluIKVA9lyBSDo6Yk91Elq0VsjDV2hp5+tyxT+LLr45m04fO
         EyI/qSsLMsojdOmKtSKCjWHZeL25bVv8xmRSEakBVxxQ7s46pjLwsRuo8CAnDBBpP1OZ
         TbvKDowKjkEeeLOVICM9YwnBLWfWaYXODlWMgw/bhCJnMrYzspqK4zRWCbLwqalgiCD/
         YGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0VJGaxbi6i6aCC2UDQdo84Bf2JzYtiGZVASwYuZ6xg4=;
        b=kUnQNnGDfav0KYznRaeNdm5iSd6hW5BYws/S6PumExFd3j6Gim2pqfISAM+XoofNir
         s52uLBnPqLd/6QaquyUPssaQcDNszNTiYfWyKcij9lcjQhw0eM8MeY6SqVUdFnMofHNU
         57X1k+zXLbsHdQE71PnEzaGAShSPI+PWruBx8S70/DXE+E1l9ddN2jxUv5RvWgHVqxGU
         sfT3zu2Asm9JIN6th7CViBFuTX17Sjt68qnOHvOsee1wTUzI6thhSBs+2Md/xr36BF6M
         cd33kSymXAls8nGUEHyZnEj/mtTfwat1+CFAoXfSVuWeNI1D4zDGVq8b49YhdKvwLuhE
         g3+Q==
X-Gm-Message-State: APjAAAXtnfHP8Gi6dai5p/gDYcj8UzStIwq82eHMvPPx8uxgQPP2DZQL
        LZZMS9c5GK2jFRiVRwrlmR4=
X-Google-Smtp-Source: APXvYqyf3mB980rFZ1TWpo5G50G8837RUqQ4IpcYD7nw5yCNXh3IXeAs3x5OSaGgBd5unF0tAmhDMA==
X-Received: by 2002:a5d:51cc:: with SMTP id n12mr1207474wrv.177.1575641221596;
        Fri, 06 Dec 2019 06:07:01 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id z12sm3541794wmd.16.2019.12.06.06.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 06:07:00 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 03/10] usb: host: xhci-tegra: Avoid a fixed duration sleep
Date:   Fri,  6 Dec 2019 15:06:46 +0100
Message-Id: <20191206140653.2085561-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191206140653.2085561-1-thierry.reding@gmail.com>
References: <20191206140653.2085561-1-thierry.reding@gmail.com>
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
 drivers/usb/host/xhci-tegra.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 5cfd54862670..e80fce712fd5 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -11,6 +11,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/firmware.h>
 #include <linux/interrupt.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
@@ -101,6 +102,8 @@
 #define  L2IMEMOP_ACTION_SHIFT			24
 #define  L2IMEMOP_INVALIDATE_ALL		(0x40 << L2IMEMOP_ACTION_SHIFT)
 #define  L2IMEMOP_LOAD_LOCKED_RESULT		(0x11 << L2IMEMOP_ACTION_SHIFT)
+#define XUSB_CSB_MEMPOOL_L2IMEMOP_RESULT	0x101a18
+#define  L2IMEMOP_RESULT_VLD			BIT(31)
 #define XUSB_CSB_MP_APMAP			0x10181c
 #define  APMAP_BOOTPATH				BIT(31)
 
@@ -836,6 +839,7 @@ static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
 	struct tm time;
 	u64 address;
 	u32 value;
+	int err;
 
 	header = (struct tegra_xusb_fw_header *)tegra->fw.virt;
 
@@ -893,7 +897,16 @@ static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
 
 	csb_writel(tegra, 0, XUSB_FALC_DMACTL);
 
-	msleep(50);
+	/* wait for RESULT_VLD to get set */
+#define tegra_csb_readl(offset) csb_readl(tegra, offset)
+	err = readx_poll_timeout(tegra_csb_readl,
+				 XUSB_CSB_MEMPOOL_L2IMEMOP_RESULT, value,
+				 value & L2IMEMOP_RESULT_VLD, 100, 10000);
+	if (err < 0) {
+		dev_err(dev, "DMA controller not ready %#010x\n", value);
+		return err;
+	}
+#undef tegra_csb_readl
 
 	csb_writel(tegra, le32_to_cpu(header->boot_codetag),
 		   XUSB_FALC_BOOTVEC);
-- 
2.23.0


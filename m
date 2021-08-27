Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42B823F95EC
	for <lists+linux-usb@lfdr.de>; Fri, 27 Aug 2021 10:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244564AbhH0IWc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Aug 2021 04:22:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244505AbhH0IWb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Aug 2021 04:22:31 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D480BC061757
        for <linux-usb@vger.kernel.org>; Fri, 27 Aug 2021 01:21:42 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id u9so9111734wrg.8
        for <linux-usb@vger.kernel.org>; Fri, 27 Aug 2021 01:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hVN7+WYKw5ehbGOTNFR03zlpLUZf6H/LQjHEF8RLkdo=;
        b=eXgF4xvuKgkDSdpMUIUd7HZ3qhSVLqMA+NkUzqE+J2FNhDgzQO6GXHiyOtK3UD11jo
         ZI5B4+XrgpxYbHESHEtxzNaDWBbo103pENfknhogf5qhGpreAWlcTzRZgFegzqWWUbPO
         dXz3Kr7Rbx7N+DJsRH9/whgz034y6vAhPhRbsPBuDj2Gh6tOklxp3xIuuvoU7LAG2WNZ
         yyZmpdz4Z793q1gMQ58hjbTv+6wqdpQYt2lBydZLK8w/5E8WPsazVXRmdVAQhvTYNbsW
         cBBDVkQB86T8iR62/nUcPo3sysEGWPLojYV3ohw0TV7hvTQfAzsq9L9D/L+xj3cBDai/
         +JQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hVN7+WYKw5ehbGOTNFR03zlpLUZf6H/LQjHEF8RLkdo=;
        b=PPs+LWDCsj/xYrAXYRWji671ha4TRba/+AiJS/TI6egt564R5YMBWwInfqIpFqQntm
         czRfzQWO8rUNwnYDsoxJ3Maeo/0xCigA2Gc/hByRMIHs4GPcsurbLpPvBbO0DsCxzE3P
         g6AAJucnd3sAsrZsM+ECxuPcawaGkDBDwWF3jCKTmi5E7ZRescCtAaBxm2YNJGgLSv2u
         gtIF1FWVtPDunRGba3ZLafn24L3m6ZAHDd9fCQ91aVEZHVd+rfdzs9bwjJRiX3zYxiRZ
         ORVYmkLjtQMvaZXJHty5kha0A7osGOnrpwxkgEvY0DnmeZ5s5TRtQe9O7l4UuyK1yfvP
         UOyQ==
X-Gm-Message-State: AOAM5309cjFPTo3y5WLnEpdvLk2wSWRmOl41jIYuqtcPmEMJPFbKQkTa
        No84vAenIDpQmhkEL/bSks+yG0gQdc1kng==
X-Google-Smtp-Source: ABdhPJxNbUUXyryA1fbk486EGK1WyymASh6Vnchv8nN6GmdmcQzitoLAk2+5IrljVjBJYhksjYJxSQ==
X-Received: by 2002:adf:de09:: with SMTP id b9mr8592091wrm.314.1630052500893;
        Fri, 27 Aug 2021 01:21:40 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id y1sm5177725wmq.43.2021.08.27.01.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 01:21:40 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dietmar Eggemann <deggeman@gmx.de>
Cc:     linux-usb@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 3/5] usb: isp1760: write to status and address register
Date:   Fri, 27 Aug 2021 09:21:10 +0100
Message-Id: <20210827082112.4061086-4-rui.silva@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210827082112.4061086-1-rui.silva@linaro.org>
References: <20210827082112.4061086-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We were already writing directly the port status register to
trigger changes in isp1763. The same is needed in other IP
from the family, including also to setup the read address
before reading from device.

Reported-by: Dietmar Eggemann <deggeman@gmx.de>
Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 drivers/usb/isp1760/isp1760-hcd.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
index fba21122bb00..79d571f1429b 100644
--- a/drivers/usb/isp1760/isp1760-hcd.c
+++ b/drivers/usb/isp1760/isp1760-hcd.c
@@ -182,7 +182,7 @@ struct urb_listitem {
 	struct urb *urb;
 };
 
-static const u32 isp1763_hc_portsc1_fields[] = {
+static const u32 isp176x_hc_portsc1_fields[] = {
 	[PORT_OWNER]		= BIT(13),
 	[PORT_POWER]		= BIT(12),
 	[PORT_LSTATUS]		= BIT(10),
@@ -205,27 +205,28 @@ static u32 isp1760_hcd_read(struct usb_hcd *hcd, u32 field)
 }
 
 /*
- * We need, in isp1763, to write directly the values to the portsc1
+ * We need, in isp176x, to write directly the values to the portsc1
  * register so it will make the other values to trigger.
  */
 static void isp1760_hcd_portsc1_set_clear(struct isp1760_hcd *priv, u32 field,
 					  u32 val)
 {
-	u32 bit = isp1763_hc_portsc1_fields[field];
-	u32 port_status = readl(priv->base + ISP1763_HC_PORTSC1);
+	u32 bit = isp176x_hc_portsc1_fields[field];
+	u16 portsc1_reg = priv->is_isp1763 ? ISP1763_HC_PORTSC1 :
+		ISP176x_HC_PORTSC1;
+	u32 port_status = readl(priv->base + portsc1_reg);
 
 	if (val)
-		writel(port_status | bit, priv->base + ISP1763_HC_PORTSC1);
+		writel(port_status | bit, priv->base + portsc1_reg);
 	else
-		writel(port_status & ~bit, priv->base + ISP1763_HC_PORTSC1);
+		writel(port_status & ~bit, priv->base + portsc1_reg);
 }
 
 static void isp1760_hcd_write(struct usb_hcd *hcd, u32 field, u32 val)
 {
 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
 
-	if (unlikely(priv->is_isp1763 &&
-		     (field >= PORT_OWNER && field <= PORT_CONNECT)))
+	if (unlikely((field >= PORT_OWNER && field <= PORT_CONNECT)))
 		return isp1760_hcd_portsc1_set_clear(priv, field, val);
 
 	isp1760_field_write(priv->fields, field, val);
@@ -367,8 +368,7 @@ static void isp1760_mem_read(struct usb_hcd *hcd, u32 src_offset, void *dst,
 {
 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
 
-	isp1760_hcd_write(hcd, MEM_BANK_SEL, ISP_BANK_0);
-	isp1760_hcd_write(hcd, MEM_START_ADDR, src_offset);
+	isp1760_reg_write(priv->regs, ISP176x_HC_MEMORY, src_offset);
 	ndelay(100);
 
 	bank_reads8(priv->base, src_offset, ISP_BANK_0, dst, bytes);
@@ -496,8 +496,7 @@ static void isp1760_ptd_read(struct usb_hcd *hcd, u32 ptd_offset, u32 slot,
 	u16 src_offset = ptd_offset + slot * sizeof(*ptd);
 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
 
-	isp1760_hcd_write(hcd, MEM_BANK_SEL, ISP_BANK_0);
-	isp1760_hcd_write(hcd, MEM_START_ADDR, src_offset);
+	isp1760_reg_write(priv->regs, ISP176x_HC_MEMORY, src_offset);
 	ndelay(90);
 
 	bank_reads8(priv->base, src_offset, ISP_BANK_0, (void *)ptd,
-- 
2.33.0


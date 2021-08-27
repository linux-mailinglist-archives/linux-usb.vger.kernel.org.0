Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0C4A3F9965
	for <lists+linux-usb@lfdr.de>; Fri, 27 Aug 2021 15:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245184AbhH0NNF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Aug 2021 09:13:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245175AbhH0NNF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Aug 2021 09:13:05 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20004C061757
        for <linux-usb@vger.kernel.org>; Fri, 27 Aug 2021 06:12:16 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id i6so10375249wrv.2
        for <linux-usb@vger.kernel.org>; Fri, 27 Aug 2021 06:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V0J3NHw/qq4gMRkEFJJLpm8VQ/DzEM7Z7FaIoqZdQD4=;
        b=pJySKRulcv5lUPYaZoaC3c3+3Z2rLhxSTgN/cMgDUZP+2Yg06k8wc4dtl6h75fZS45
         cUnKoX9PM03lXNJFHTBXB5IMUOlSXSPS/yu8fq3JoEz94i7/bNuJF6TyYrgD0pteGFM3
         sttCDcMbDd4mC+/9Lg3KplYNRQ/DliozBikRFQMUdmU0Vuiqxn9+TSUFC/y2vAKiQhMC
         Bqidm7Y0ZhZRauifSQ+ngRj30Dn29D1MLGNu4UEqws1vgMtJvnMspAxZd6OGf/+uVp/k
         2rgDy1tguv9jMGE8cD6KQgUDKl1C672jrN4aenMXakHGQjSEygBdGxZwNp8BJJRcCs5u
         0iQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V0J3NHw/qq4gMRkEFJJLpm8VQ/DzEM7Z7FaIoqZdQD4=;
        b=M977sX5SDpaFyDNnQ4nug1DRy8gitX0AJhKyDwKzPTvtdlatScTGX+pCrmKSokuS02
         YZk1JXhq435t86rSWfydSByYoneZkES1ALenUtxc3qKq0rddZI1M+x1PJ1mVnbE1liz+
         n/rpoypzQRDT3gUJR67J3HTZF33OfWPhO4jdhSWIryuuMS8AM1Yeeeafs2AlMmLFPIgn
         Q6tDmvbpoEYw+XXpG8VPD674V+qhckEvtGTxVUC3ryPLYNf291Fh8x6Q7Nr2Wk4rDLoR
         CWJAslx+cWPgDVd+TfaHjXSL4RurfVOXew7EMGFPbzqW2frDTSHS4lkBOk6lKRIwfreO
         lPtg==
X-Gm-Message-State: AOAM531j8KbW92BPP+kHLW+NI13thnaUByHYfyNKid2WTsXwgP7AJluQ
        3DG6UcB5lL+31xxRoaUg0YhAeMr3yH5Cag==
X-Google-Smtp-Source: ABdhPJys6trwbMQO795pFCRhjCojobJ97adECkTTbAxZRihQuSHc6qBMnrrcx+cuTPb+R3o/eqH0ig==
X-Received: by 2002:adf:c40d:: with SMTP id v13mr7975652wrf.388.1630069934721;
        Fri, 27 Aug 2021 06:12:14 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id c7sm5279349wmq.13.2021.08.27.06.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 06:12:14 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc:     linux-usb@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v2 3/5] usb: isp1760: write to status and address register
Date:   Fri, 27 Aug 2021 14:11:52 +0100
Message-Id: <20210827131154.4151862-4-rui.silva@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210827131154.4151862-1-rui.silva@linaro.org>
References: <20210827131154.4151862-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We were already writing directly the port status register to
trigger changes in isp1763. The same is needed in other IP
from the family, including also to setup the read address
before reading from device.

Reported-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
Tested-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
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


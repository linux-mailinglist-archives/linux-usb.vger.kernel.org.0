Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70FC83F9967
	for <lists+linux-usb@lfdr.de>; Fri, 27 Aug 2021 15:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245195AbhH0NNJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Aug 2021 09:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245175AbhH0NNI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Aug 2021 09:13:08 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14ACAC061757
        for <linux-usb@vger.kernel.org>; Fri, 27 Aug 2021 06:12:19 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id d22-20020a1c1d16000000b002e7777970f0so9176385wmd.3
        for <linux-usb@vger.kernel.org>; Fri, 27 Aug 2021 06:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WdG/2gxKlzZkSfzKRSXQY6YVvjSC5elE9cuFSMD1cWs=;
        b=SL3WLYw1kai8PtwgQfmyc3Ls/8zLYgoRd2FB9kyV2Mh3czlcYMFsjrdsW47IcmXbEP
         S8kVdEND0cV0ZkgPj1vFNSWh7Me5CE+ffH8+9hybVFpSY9ykvamsYw+T1PY2IZFxVtpn
         mosLKSNgby4wz/2YXEXZhUsBiVbXBF/kQv0SfrDO3ztJ6Z+MeN6WGy8LptOGPWNMZL2D
         I1HI77BRU5yb9cXWU1c2b2lYd7OYY3xfCGTTTDwhWqbHhGP0H6a8vN9dwkHiDT08F9g0
         SdA0d8cnfbWtXWw4CUpLnmWgQqCJaIXNzwI7YXjhvOSJmPhuwdE4DVfadOU34MTK+I5j
         TtHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WdG/2gxKlzZkSfzKRSXQY6YVvjSC5elE9cuFSMD1cWs=;
        b=DUmKZJASfF40zmOB2j7MkLIrYsQHASxd3k1xxvnjpjPljZyyYD8ZgQCOT2wWR/svgu
         qvNkh5jKnKDTaRBnAINFnyB2CDuy66g5d/OsuWVpQ6xiifUEttEGM8QiA12oUamDKLO4
         IP5EPFP6Cur4+xfjR6QS0Ij8bTCKouIqA/B8E/SdP/85T6r+EVqkw5IxCg0lwVFijeOM
         dMUTlAg9FM1f7CSg1W7JLfh3ne/6PRgaEGC9YOFGCkURrrZQnbukLv2PfvFhsZCaZsYO
         mNxghbmwHiJuRok1pHtdHU2FPnLU9Ndxukqs54S2M7IRXlDnnOXtQSGSDqOujBNcNJaw
         3nqw==
X-Gm-Message-State: AOAM531xkmU3IyJ3nrO/fBsGop0pQ4dU54/sm+csc/Z0BIK1X+iCbAUa
        fXfzdcNd7pvwXckm2xbQw3z7HQ==
X-Google-Smtp-Source: ABdhPJxibX4FUraXHwZB8cV5CnMU4EXKrNMcBFKdIwD16NzllfiNzS5aaXGtTUZsc3oq0jPQvM3Pbw==
X-Received: by 2002:a1c:1d84:: with SMTP id d126mr8797772wmd.160.1630069937672;
        Fri, 27 Aug 2021 06:12:17 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id c7sm5279349wmq.13.2021.08.27.06.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 06:12:17 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc:     linux-usb@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v2 5/5] usb: isp1760: otg control register access
Date:   Fri, 27 Aug 2021 14:11:54 +0100
Message-Id: <20210827131154.4151862-6-rui.silva@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210827131154.4151862-1-rui.silva@linaro.org>
References: <20210827131154.4151862-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The set/clear of the otg control values is done writing to
two different 16bit registers, however we setup the regmap
width for isp1760/61 to 32bit value bits.

So, just access the clear register address (0x376)as the high
part of the otg control register set (0x374), and write the
values in one go to make sure they get clear/set.

Reported-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
Tested-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
---
 drivers/usb/isp1760/isp1760-core.c | 50 ++++++++++++++++--------------
 drivers/usb/isp1760/isp1760-regs.h | 16 ++++++++++
 2 files changed, 42 insertions(+), 24 deletions(-)

diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp1760/isp1760-core.c
index cb70f9d63cdd..d1d9a7d5da17 100644
--- a/drivers/usb/isp1760/isp1760-core.c
+++ b/drivers/usb/isp1760/isp1760-core.c
@@ -30,6 +30,7 @@ static int isp1760_init_core(struct isp1760_device *isp)
 {
 	struct isp1760_hcd *hcd = &isp->hcd;
 	struct isp1760_udc *udc = &isp->udc;
+	u32 otg_ctrl;
 
 	/* Low-level chip reset */
 	if (isp->rst_gpio) {
@@ -83,16 +84,17 @@ static int isp1760_init_core(struct isp1760_device *isp)
 	 *
 	 * TODO: Really support OTG. For now we configure port 1 in device mode
 	 */
-	if (((isp->devflags & ISP1760_FLAG_ISP1761) ||
-	     (isp->devflags & ISP1760_FLAG_ISP1763)) &&
-	    (isp->devflags & ISP1760_FLAG_PERIPHERAL_EN)) {
-		isp1760_field_set(hcd->fields, HW_DM_PULLDOWN);
-		isp1760_field_set(hcd->fields, HW_DP_PULLDOWN);
-		isp1760_field_set(hcd->fields, HW_OTG_DISABLE);
-	} else {
-		isp1760_field_set(hcd->fields, HW_SW_SEL_HC_DC);
-		isp1760_field_set(hcd->fields, HW_VBUS_DRV);
-		isp1760_field_set(hcd->fields, HW_SEL_CP_EXT);
+	if (isp->devflags & ISP1760_FLAG_ISP1761) {
+		if (isp->devflags & ISP1760_FLAG_PERIPHERAL_EN) {
+			otg_ctrl = (ISP176x_HW_DM_PULLDOWN_CLEAR |
+				    ISP176x_HW_DP_PULLDOWN_CLEAR |
+				    ISP176x_HW_OTG_DISABLE);
+		} else {
+			otg_ctrl = (ISP176x_HW_SW_SEL_HC_DC_CLEAR |
+				    ISP176x_HW_VBUS_DRV |
+				    ISP176x_HW_SEL_CP_EXT);
+		}
+		isp1760_reg_write(hcd->regs, ISP176x_HC_OTG_CTRL, otg_ctrl);
 	}
 
 	dev_info(isp->dev, "%s bus width: %u, oc: %s\n",
@@ -235,20 +237,20 @@ static const struct reg_field isp1760_hc_reg_fields[] = {
 	[HC_ISO_IRQ_MASK_AND]	= REG_FIELD(ISP176x_HC_ISO_IRQ_MASK_AND, 0, 31),
 	[HC_INT_IRQ_MASK_AND]	= REG_FIELD(ISP176x_HC_INT_IRQ_MASK_AND, 0, 31),
 	[HC_ATL_IRQ_MASK_AND]	= REG_FIELD(ISP176x_HC_ATL_IRQ_MASK_AND, 0, 31),
-	[HW_OTG_DISABLE]	= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 10, 10),
-	[HW_SW_SEL_HC_DC]	= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 7, 7),
-	[HW_VBUS_DRV]		= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 4, 4),
-	[HW_SEL_CP_EXT]		= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 3, 3),
-	[HW_DM_PULLDOWN]	= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 2, 2),
-	[HW_DP_PULLDOWN]	= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 1, 1),
-	[HW_DP_PULLUP]		= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 0, 0),
-	[HW_OTG_DISABLE_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 10, 10),
-	[HW_SW_SEL_HC_DC_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 7, 7),
-	[HW_VBUS_DRV_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 4, 4),
-	[HW_SEL_CP_EXT_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 3, 3),
-	[HW_DM_PULLDOWN_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 2, 2),
-	[HW_DP_PULLDOWN_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 1, 1),
-	[HW_DP_PULLUP_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 0, 0),
+	[HW_OTG_DISABLE_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL, 26, 26),
+	[HW_SW_SEL_HC_DC_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL, 23, 23),
+	[HW_VBUS_DRV_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL, 20, 20),
+	[HW_SEL_CP_EXT_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL, 19, 19),
+	[HW_DM_PULLDOWN_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL, 18, 18),
+	[HW_DP_PULLDOWN_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL, 17, 17),
+	[HW_DP_PULLUP_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL, 16, 16),
+	[HW_OTG_DISABLE]	= REG_FIELD(ISP176x_HC_OTG_CTRL, 10, 10),
+	[HW_SW_SEL_HC_DC]	= REG_FIELD(ISP176x_HC_OTG_CTRL, 7, 7),
+	[HW_VBUS_DRV]		= REG_FIELD(ISP176x_HC_OTG_CTRL, 4, 4),
+	[HW_SEL_CP_EXT]		= REG_FIELD(ISP176x_HC_OTG_CTRL, 3, 3),
+	[HW_DM_PULLDOWN]	= REG_FIELD(ISP176x_HC_OTG_CTRL, 2, 2),
+	[HW_DP_PULLDOWN]	= REG_FIELD(ISP176x_HC_OTG_CTRL, 1, 1),
+	[HW_DP_PULLUP]		= REG_FIELD(ISP176x_HC_OTG_CTRL, 0, 0),
 };
 
 static const struct reg_field isp1763_hc_reg_fields[] = {
diff --git a/drivers/usb/isp1760/isp1760-regs.h b/drivers/usb/isp1760/isp1760-regs.h
index 94ea60c20b2a..3a6751197e97 100644
--- a/drivers/usb/isp1760/isp1760-regs.h
+++ b/drivers/usb/isp1760/isp1760-regs.h
@@ -61,6 +61,7 @@
 #define ISP176x_HC_INT_IRQ_MASK_AND	0x328
 #define ISP176x_HC_ATL_IRQ_MASK_AND	0x32c
 
+#define ISP176x_HC_OTG_CTRL		0x374
 #define ISP176x_HC_OTG_CTRL_SET		0x374
 #define ISP176x_HC_OTG_CTRL_CLEAR	0x376
 
@@ -179,6 +180,21 @@ enum isp176x_host_controller_fields {
 #define ISP176x_DC_IESUSP		BIT(3)
 #define ISP176x_DC_IEBRST		BIT(0)
 
+#define ISP176x_HW_OTG_DISABLE_CLEAR	BIT(26)
+#define ISP176x_HW_SW_SEL_HC_DC_CLEAR	BIT(23)
+#define ISP176x_HW_VBUS_DRV_CLEAR	BIT(20)
+#define ISP176x_HW_SEL_CP_EXT_CLEAR	BIT(19)
+#define ISP176x_HW_DM_PULLDOWN_CLEAR	BIT(18)
+#define ISP176x_HW_DP_PULLDOWN_CLEAR	BIT(17)
+#define ISP176x_HW_DP_PULLUP_CLEAR	BIT(16)
+#define ISP176x_HW_OTG_DISABLE		BIT(10)
+#define ISP176x_HW_SW_SEL_HC_DC		BIT(7)
+#define ISP176x_HW_VBUS_DRV		BIT(4)
+#define ISP176x_HW_SEL_CP_EXT		BIT(3)
+#define ISP176x_HW_DM_PULLDOWN		BIT(2)
+#define ISP176x_HW_DP_PULLDOWN		BIT(1)
+#define ISP176x_HW_DP_PULLUP		BIT(0)
+
 #define ISP176x_DC_ENDPTYP_ISOC		0x01
 #define ISP176x_DC_ENDPTYP_BULK		0x02
 #define ISP176x_DC_ENDPTYP_INTERRUPT	0x03
-- 
2.33.0


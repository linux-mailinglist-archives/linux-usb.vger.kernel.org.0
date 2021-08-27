Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28B433F9966
	for <lists+linux-usb@lfdr.de>; Fri, 27 Aug 2021 15:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245191AbhH0NNH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Aug 2021 09:13:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245185AbhH0NNG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Aug 2021 09:13:06 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81B20C061757
        for <linux-usb@vger.kernel.org>; Fri, 27 Aug 2021 06:12:17 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id z4so10335216wrr.6
        for <linux-usb@vger.kernel.org>; Fri, 27 Aug 2021 06:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JhkbsWN6yF+zzjQkKyGIO7BRErUtHsxjPq+kPs7GZWc=;
        b=Jh73rVA7zjjGYpLd3WOSV802Ynj4ee73Uo9HOq5s/r766nuO+ctX9wPghw2TvGsCQY
         fFUUZrojPXQrl1usTmLNx7BNF+hv1OpVubPRpHtuSxMDB4dYDTUcPoNVVsxUo1ryJshT
         7IIaSmFLckx9ZvPObWoE3S7CAlXs+muU5d9khtLIrio3ONY1O8PudtKIeKsY9aDnMRsO
         B2gICeIzSj6x+YoQRY73WOva1KR4gv8InNIl9jU8F3EF1bxamAY4FQ5VsAbVpr3gXYNX
         yANCQtXV+IKPDRWICDbt2PD6iV8zWTi4UC4KYxwJLDuNV8/vfXguMsbQdhBf0zjdM++5
         xN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JhkbsWN6yF+zzjQkKyGIO7BRErUtHsxjPq+kPs7GZWc=;
        b=BkVuPNprjgJkmlIMAHS7d9bm8nkvrxziuqSD5apTKZajFkRwT9ReaSjTULRH3fCXCV
         aSmqaoXIYTfAdGAycXQ06FdYjYss3vmriLOKo/4kxbpC8GI4VBUrESqPrbpLfqM0d+ot
         mdJYDEbwcQ6Zsc68+nuNp/ZvJjmTPCcKvK2EDUJSqX9P0QA6CP9kZL6j/Nvmwb0t1MMd
         u/kPKUv2lHhZ5edZ8BNNbPAgI9ePcv1yMWLYrB+HPgd0qTbZEo3mOMQFHzBOlgFjme67
         FWNX47mys/nHhPPiA2tSZK7BJr7rhhgMwjg7yLqbskUfJsJ/babtpPmBl5pXM9ffPSQD
         5pJA==
X-Gm-Message-State: AOAM533xNhaA4nfOMGX7uZvFME5BrvNoIWPU/Lqp6IMHIaSMKKRGkL05
        Sk3ueUxvBng4Z3h96vH4QwBQv7J5CWTTsw==
X-Google-Smtp-Source: ABdhPJwsIgO6J+eVXzR6av3RvCjJCHHn/KTn9pbO/gZzydz2xzbqgHdT3QhuaWK1Gm1tsWyOv0DGyQ==
X-Received: by 2002:a5d:4c50:: with SMTP id n16mr10089098wrt.265.1630069936141;
        Fri, 27 Aug 2021 06:12:16 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id c7sm5279349wmq.13.2021.08.27.06.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 06:12:15 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc:     linux-usb@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v2 4/5] usb: isp1760: use the right irq status bit
Date:   Fri, 27 Aug 2021 14:11:53 +0100
Message-Id: <20210827131154.4151862-5-rui.silva@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210827131154.4151862-1-rui.silva@linaro.org>
References: <20210827131154.4151862-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Instead of using the fields enum values to check interrupts
trigged, use the correct bit values.

Reported-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
Tested-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
---
 drivers/usb/isp1760/isp1760-udc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/isp1760/isp1760-udc.c b/drivers/usb/isp1760/isp1760-udc.c
index a78da59d6417..5cafd23345ca 100644
--- a/drivers/usb/isp1760/isp1760-udc.c
+++ b/drivers/usb/isp1760/isp1760-udc.c
@@ -1363,7 +1363,7 @@ static irqreturn_t isp1760_udc_irq(int irq, void *dev)
 
 	status = isp1760_udc_irq_get_status(udc);
 
-	if (status & DC_IEVBUS) {
+	if (status & ISP176x_DC_IEVBUS) {
 		dev_dbg(udc->isp->dev, "%s(VBUS)\n", __func__);
 		/* The VBUS interrupt is only triggered when VBUS appears. */
 		spin_lock(&udc->lock);
@@ -1371,7 +1371,7 @@ static irqreturn_t isp1760_udc_irq(int irq, void *dev)
 		spin_unlock(&udc->lock);
 	}
 
-	if (status & DC_IEBRST) {
+	if (status & ISP176x_DC_IEBRST) {
 		dev_dbg(udc->isp->dev, "%s(BRST)\n", __func__);
 
 		isp1760_udc_reset(udc);
@@ -1391,18 +1391,18 @@ static irqreturn_t isp1760_udc_irq(int irq, void *dev)
 		}
 	}
 
-	if (status & DC_IEP0SETUP) {
+	if (status & ISP176x_DC_IEP0SETUP) {
 		dev_dbg(udc->isp->dev, "%s(EP0SETUP)\n", __func__);
 
 		isp1760_ep0_setup(udc);
 	}
 
-	if (status & DC_IERESM) {
+	if (status & ISP176x_DC_IERESM) {
 		dev_dbg(udc->isp->dev, "%s(RESM)\n", __func__);
 		isp1760_udc_resume(udc);
 	}
 
-	if (status & DC_IESUSP) {
+	if (status & ISP176x_DC_IESUSP) {
 		dev_dbg(udc->isp->dev, "%s(SUSP)\n", __func__);
 
 		spin_lock(&udc->lock);
@@ -1413,7 +1413,7 @@ static irqreturn_t isp1760_udc_irq(int irq, void *dev)
 		spin_unlock(&udc->lock);
 	}
 
-	if (status & DC_IEHS_STA) {
+	if (status & ISP176x_DC_IEHS_STA) {
 		dev_dbg(udc->isp->dev, "%s(HS_STA)\n", __func__);
 		udc->gadget.speed = USB_SPEED_HIGH;
 	}
-- 
2.33.0


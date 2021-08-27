Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF7F3F95ED
	for <lists+linux-usb@lfdr.de>; Fri, 27 Aug 2021 10:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244505AbhH0IWd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Aug 2021 04:22:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244565AbhH0IWc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Aug 2021 04:22:32 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E10BC061757
        for <linux-usb@vger.kernel.org>; Fri, 27 Aug 2021 01:21:44 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id h13so9193338wrp.1
        for <linux-usb@vger.kernel.org>; Fri, 27 Aug 2021 01:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UgrjwbZBiK8ATFB/HhkR7RlMrnctExRtLTvENDbdq94=;
        b=RKKrGWkEGecrJkuT7pHn3g3572bO/OIINDgDLRYDRubxiecV5Kps43ZPr+7WsMplk0
         mOe28MTwXtol21sEbr+E13nrk8VcG1Hnc7iroJ1zoSJgr9aSv1ykvTMSlpEumta3wY5Q
         UuHjjbtqIcBXjJg5OqJoMt2IShGZqt+4sqKsV4SB+KcgsT2GAb6Pzhyhgvdby3iib+vm
         o9H0p/yC1E6UQonTfK3wGUT1dP8DUWXYeXZZqEkf79oXrs0PDUf6w9Onaa75Ee1hpSAC
         ScPnYGApn4P00fDpmolCrAb1l87jfUzL3LKki961NamH5xJX5hLJGoK9XGU/uWQmUStO
         EKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UgrjwbZBiK8ATFB/HhkR7RlMrnctExRtLTvENDbdq94=;
        b=Z1zRjeFy/w/dfEXFzY9RR7yStiRatJFFIFqZdvW9MxxyHho/NLzs65jq4yVeklpDZf
         mxvsCrhooFMxoWdvv7ab/j2B7bGzl15zxHc6IveS5nZwEI7NRdsqNoCt7tBDRqdenOVk
         CYI0sKhQebUsyedXFvF3+rkdPI+i4VIgm6iEFykHGQFLY04gNHElT1rSFsMdlM1uDEWh
         FT3IDLf6PQVxZyVVuxayKN1qSfUAf8f8tAXuSGaEbLwqpgAq9qlYhyD0sUz+mm5cX0+c
         VxTfTyfGslkFuVLz3E0s61eY7dTIUkAVbPxLxQ0iSs4IcXo33MkSGXFwrEZV8Cn8mcZr
         H8SQ==
X-Gm-Message-State: AOAM533cSRCD8g+BMro1lWK7kQPLDbrQiF9nHjoTXo5DVO8DHNQFQLFS
        g8KXcbgi5VeA08QneR0SVT3rsQ==
X-Google-Smtp-Source: ABdhPJyiDjsrNeFm6Oc+oUB3CLX/DFX3d9OhoywRmZc7sG+7PGeK4o6XmxDlSYL2ngHJy/Hp0TxQOg==
X-Received: by 2002:a05:6000:184e:: with SMTP id c14mr8732287wri.186.1630052502683;
        Fri, 27 Aug 2021 01:21:42 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id y1sm5177725wmq.43.2021.08.27.01.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 01:21:42 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dietmar Eggemann <deggeman@gmx.de>
Cc:     linux-usb@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 4/5] usb: isp1760: use the right irq status bit
Date:   Fri, 27 Aug 2021 09:21:11 +0100
Message-Id: <20210827082112.4061086-5-rui.silva@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210827082112.4061086-1-rui.silva@linaro.org>
References: <20210827082112.4061086-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Instead of using the fields enum values to check interrupts
trigged, use the correct bit values.

Reported-by: Dietmar Eggemann <deggeman@gmx.de>
Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
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


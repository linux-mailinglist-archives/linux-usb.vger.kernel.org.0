Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 353B411263
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2019 06:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbfEBE4k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 May 2019 00:56:40 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36359 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbfEBE4j (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 May 2019 00:56:39 -0400
Received: by mail-pg1-f194.google.com with SMTP id 85so501654pgc.3
        for <linux-usb@vger.kernel.org>; Wed, 01 May 2019 21:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0uEhbXfTbBJ1Z2Kv01LPBYrX3ZS5Rz9y5kPzobESOBI=;
        b=kjA0IkL2lphoYXjpaZd0JAuzOk4YKKTN2UCTNfqgYOGUz6zgSRQY1cyglpFLe9gZ1n
         GRnS9XNzri/D5ysNkPqqdDRMk3KRSwovN2qpgkhVkTiuhC4agg/NTutb4WuN47fVcZCF
         UUIO5robvSzsJ+u7sWK47XdnbhZImedX79T2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0uEhbXfTbBJ1Z2Kv01LPBYrX3ZS5Rz9y5kPzobESOBI=;
        b=D0yrRKbRryITS+KazTfZubDjtV4nsYmvGlFsPy0qnGduuYzCuKZ/XCFDIr1gzNBjnq
         XgnbzbJUE/KpVGHcvpOWAT9wjoi0dmqRQ/FBu5L5YTyVm6ezmBCwoXPS1tAJywE5h/OQ
         8/kzlb9jX1gWHerjEVhhRWaSZRDouKMcV9tIliTUT1/i3cRcMIqUF93J1kdHdMN/gRGQ
         pO8xfmIjrdFNc94SKfQasIB5QsTjxWjUJkND56VW+HOYPKfQfCol7MxF76JNOi/4iNRR
         zD536BQ5Vrdc+jxUYghHIEYGwYfcsGUYdVtSu3IFo0z/3DfZfLY49B0B3eKf1rrqHVLo
         6IAw==
X-Gm-Message-State: APjAAAWJvUbHA1dYqhTRWmgDH4a9DBr0M2TL/r8dXV6CmBglihQHup0X
        BPxCT7aQsa0VPNH3R19Fpa1O7w==
X-Google-Smtp-Source: APXvYqxb8f1zrcqX3NddJRYvEW77UkD+Um0XCa7fQsUuySsX73xUDBYJ7k8eUOzlL/onT4KImTFWUg==
X-Received: by 2002:aa7:800e:: with SMTP id j14mr1786208pfi.157.1556772998334;
        Wed, 01 May 2019 21:56:38 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com ([2401:fa00:1:b:d8b7:33af:adcb:b648])
        by smtp.gmail.com with ESMTPSA id a6sm64239470pfn.181.2019.05.01.21.56.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 21:56:37 -0700 (PDT)
From:   Nicolas Boichat <drinkcat@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Khuong Dinh <khuong@os.amperecomputing.com>,
        Hoan Tran <hoan@os.amperecomputing.com>
Subject: [PATCH 2/2] usb: xhci-mtk: Do not create shared_hcd if no USB 3.0 port available
Date:   Thu,  2 May 2019 12:56:30 +0800
Message-Id: <20190502045631.229386-2-drinkcat@chromium.org>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
In-Reply-To: <20190502045631.229386-1-drinkcat@chromium.org>
References: <20190502045631.229386-1-drinkcat@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When the controller only supports USB 2.0, do not even create the
USB 3.0 hcd/root hub.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---
 drivers/usb/host/xhci-mtk.c | 44 +++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 026fe18972d3e5b..189f5dc614e6e05 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -527,23 +527,28 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	xhci->imod_interval = 5000;
 	device_property_read_u32(dev, "imod-interval-ns", &xhci->imod_interval);
 
-	xhci->shared_hcd = usb_create_shared_hcd(driver, dev,
+	/* Only create shared_hcd when USB3.0 port is available. */
+	if (xhci->usb3_rhub.num_ports > 0) {
+		xhci->shared_hcd = usb_create_shared_hcd(driver, dev,
 			dev_name(dev), hcd);
-	if (!xhci->shared_hcd) {
-		ret = -ENOMEM;
-		goto disable_device_wakeup;
+		if (!xhci->shared_hcd) {
+			ret = -ENOMEM;
+			goto disable_device_wakeup;
+		}
 	}
 
 	ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
 	if (ret)
 		goto put_usb3_hcd;
 
-	if (HCC_MAX_PSA(xhci->hcc_params) >= 4)
-		xhci->shared_hcd->can_do_streams = 1;
+	if (xhci->usb3_rhub.num_ports > 0) {
+		if (HCC_MAX_PSA(xhci->hcc_params) >= 4)
+			xhci->shared_hcd->can_do_streams = 1;
 
-	ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
-	if (ret)
-		goto dealloc_usb2_hcd;
+		ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
+		if (ret)
+			goto dealloc_usb2_hcd;
+	}
 
 	return 0;
 
@@ -552,7 +557,8 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 
 put_usb3_hcd:
 	xhci_mtk_sch_exit(mtk);
-	usb_put_hcd(xhci->shared_hcd);
+	if (xhci->shared_hcd)
+		usb_put_hcd(xhci->shared_hcd);
 
 disable_device_wakeup:
 	device_init_wakeup(dev, false);
@@ -579,12 +585,14 @@ static int xhci_mtk_remove(struct platform_device *dev)
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
 	struct usb_hcd  *shared_hcd = xhci->shared_hcd;
 
-	usb_remove_hcd(shared_hcd);
+	if (shared_hcd)
+		usb_remove_hcd(shared_hcd);
 	xhci->shared_hcd = NULL;
 	device_init_wakeup(&dev->dev, false);
 
 	usb_remove_hcd(hcd);
-	usb_put_hcd(shared_hcd);
+	if (shared_hcd)
+		usb_put_hcd(shared_hcd);
 	usb_put_hcd(hcd);
 	xhci_mtk_sch_exit(mtk);
 	xhci_mtk_clks_disable(mtk);
@@ -611,8 +619,10 @@ static int __maybe_unused xhci_mtk_suspend(struct device *dev)
 	xhci_dbg(xhci, "%s: stop port polling\n", __func__);
 	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
 	del_timer_sync(&hcd->rh_timer);
-	clear_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
-	del_timer_sync(&xhci->shared_hcd->rh_timer);
+	if (xhci->shared_hcd) {
+		clear_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
+		del_timer_sync(&xhci->shared_hcd->rh_timer);
+	}
 
 	xhci_mtk_host_disable(mtk);
 	xhci_mtk_clks_disable(mtk);
@@ -631,8 +641,10 @@ static int __maybe_unused xhci_mtk_resume(struct device *dev)
 	xhci_mtk_host_enable(mtk);
 
 	xhci_dbg(xhci, "%s: restart port polling\n", __func__);
-	set_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
-	usb_hcd_poll_rh_status(xhci->shared_hcd);
+	if (xhci->shared_hcd) {
+		set_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
+		usb_hcd_poll_rh_status(xhci->shared_hcd);
+	}
 	set_bit(HCD_FLAG_POLL_RH, &hcd->flags);
 	usb_hcd_poll_rh_status(hcd);
 	return 0;
-- 
2.21.0.593.g511ec345e18-goog


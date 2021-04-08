Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0955357F58
	for <lists+linux-usb@lfdr.de>; Thu,  8 Apr 2021 11:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231326AbhDHJfp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 05:35:45 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:50611 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231272AbhDHJfh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 05:35:37 -0400
X-UUID: 236ae62e2a614e9692898ed1c828fb3b-20210408
X-UUID: 236ae62e2a614e9692898ed1c828fb3b-20210408
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1780418086; Thu, 08 Apr 2021 17:35:21 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Apr 2021 17:35:19 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 8 Apr 2021 17:35:18 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
CC:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
        <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Tianping Fang <tianping.fang@mediatek.com>,
        Eddie Hung <eddie.hung@mediatek.com>,
        Ikjoon Jang <ikjn@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH 2/6] usb: xhci-mtk: check return value in suspend/resume hooks
Date:   Thu, 8 Apr 2021 17:35:10 +0800
Message-ID: <1617874514-12282-2-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1617874514-12282-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1617874514-12282-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Return error number if encounter errors during suspend and resume.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index c1bc40289833..a74764ab914a 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -630,18 +630,12 @@ static int xhci_mtk_remove(struct platform_device *dev)
 	return 0;
 }
 
-/*
- * if ip sleep fails, and all clocks are disabled, access register will hang
- * AHB bus, so stop polling roothubs to avoid regs access on bus suspend.
- * and no need to check whether ip sleep failed or not; this will cause SPM
- * to wake up system immediately after system suspend complete if ip sleep
- * fails, it is what we wanted.
- */
 static int __maybe_unused xhci_mtk_suspend(struct device *dev)
 {
 	struct xhci_hcd_mtk *mtk = dev_get_drvdata(dev);
 	struct usb_hcd *hcd = mtk->hcd;
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	int ret;
 
 	xhci_dbg(xhci, "%s: stop port polling\n", __func__);
 	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
@@ -649,10 +643,21 @@ static int __maybe_unused xhci_mtk_suspend(struct device *dev)
 	clear_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
 	del_timer_sync(&xhci->shared_hcd->rh_timer);
 
-	xhci_mtk_host_disable(mtk);
+	ret = xhci_mtk_host_disable(mtk);
+	if (ret)
+		goto restart_poll_rh;
+
 	xhci_mtk_clks_disable(mtk);
 	usb_wakeup_set(mtk, true);
 	return 0;
+
+restart_poll_rh:
+	xhci_dbg(xhci, "%s: restart port polling\n", __func__);
+	set_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
+	usb_hcd_poll_rh_status(xhci->shared_hcd);
+	set_bit(HCD_FLAG_POLL_RH, &hcd->flags);
+	usb_hcd_poll_rh_status(hcd);
+	return ret;
 }
 
 static int __maybe_unused xhci_mtk_resume(struct device *dev)
@@ -660,10 +665,16 @@ static int __maybe_unused xhci_mtk_resume(struct device *dev)
 	struct xhci_hcd_mtk *mtk = dev_get_drvdata(dev);
 	struct usb_hcd *hcd = mtk->hcd;
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	int ret;
 
 	usb_wakeup_set(mtk, false);
-	xhci_mtk_clks_enable(mtk);
-	xhci_mtk_host_enable(mtk);
+	ret = xhci_mtk_clks_enable(mtk);
+	if (ret)
+		goto enable_wakeup;
+
+	ret = xhci_mtk_host_enable(mtk);
+	if (ret)
+		goto disable_clks;
 
 	xhci_dbg(xhci, "%s: restart port polling\n", __func__);
 	set_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
@@ -671,6 +682,12 @@ static int __maybe_unused xhci_mtk_resume(struct device *dev)
 	set_bit(HCD_FLAG_POLL_RH, &hcd->flags);
 	usb_hcd_poll_rh_status(hcd);
 	return 0;
+
+disable_clks:
+	xhci_mtk_clks_disable(mtk);
+enable_wakeup:
+	usb_wakeup_set(mtk, true);
+	return ret;
 }
 
 static const struct dev_pm_ops xhci_mtk_pm_ops = {
-- 
2.18.0


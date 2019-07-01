Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 652BB2C7F7
	for <lists+linux-usb@lfdr.de>; Tue, 28 May 2019 15:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbfE1Nkn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 May 2019 09:40:43 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:41972 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727038AbfE1Nkn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 May 2019 09:40:43 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id E02D0BC582C82B9B2D32;
        Tue, 28 May 2019 21:40:36 +0800 (CST)
Received: from localhost (10.177.31.96) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Tue, 28 May 2019
 21:40:30 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <patrice.chotard@st.com>, <stern@rowland.harvard.edu>,
        <gregkh@linuxfoundation.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] usb: host: ohci-st: Remove set but not used variable 'ohci'
Date:   Tue, 28 May 2019 21:38:49 +0800
Message-ID: <20190528133849.22156-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/usb/host/ohci-st.c: In function st_ohci_platform_probe:
drivers/usb/host/ohci-st.c:135:19: warning: variable ohci set but not used [-Wunused-but-set-variable]

It's never used, so can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/usb/host/ohci-st.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/host/ohci-st.c b/drivers/usb/host/ohci-st.c
index 992807c9850a..638a92bd2cdc 100644
--- a/drivers/usb/host/ohci-st.c
+++ b/drivers/usb/host/ohci-st.c
@@ -132,7 +132,6 @@ static int st_ohci_platform_probe(struct platform_device *dev)
 	struct resource *res_mem;
 	struct usb_ohci_pdata *pdata = &ohci_platform_defaults;
 	struct st_ohci_platform_priv *priv;
-	struct ohci_hcd *ohci;
 	int err, irq, clk = 0;
 
 	if (usb_disabled())
@@ -158,7 +157,6 @@ static int st_ohci_platform_probe(struct platform_device *dev)
 	platform_set_drvdata(dev, hcd);
 	dev->dev.platform_data = pdata;
 	priv = hcd_to_ohci_priv(hcd);
-	ohci = hcd_to_ohci(hcd);
 
 	priv->phy = devm_phy_get(&dev->dev, "usb");
 	if (IS_ERR(priv->phy)) {
-- 
2.17.1



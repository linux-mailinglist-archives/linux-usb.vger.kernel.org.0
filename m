Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 193952C80E
	for <lists+linux-usb@lfdr.de>; Tue, 28 May 2019 15:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727350AbfE1NqS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 May 2019 09:46:18 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:17599 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727039AbfE1NqR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 May 2019 09:46:17 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id AFBA132D07E88EBBD51B;
        Tue, 28 May 2019 21:46:09 +0800 (CST)
Received: from localhost (10.177.31.96) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Tue, 28 May 2019
 21:46:01 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <patrice.chotard@st.com>, <stern@rowland.harvard.edu>,
        <gregkh@linuxfoundation.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] usb: host: ehci-st: Remove set but not used variable 'ehci'
Date:   Tue, 28 May 2019 21:45:29 +0800
Message-ID: <20190528134529.17612-1-yuehaibing@huawei.com>
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

drivers/usb/host/ehci-st.c: In function st_ehci_platform_probe:
drivers/usb/host/ehci-st.c:155:19: warning: variable ehci set but not used [-Wunused-but-set-variable]

It is never used, so can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/usb/host/ehci-st.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/host/ehci-st.c b/drivers/usb/host/ehci-st.c
index dc42981047c9..ccb4e611001d 100644
--- a/drivers/usb/host/ehci-st.c
+++ b/drivers/usb/host/ehci-st.c
@@ -152,7 +152,6 @@ static int st_ehci_platform_probe(struct platform_device *dev)
 	struct resource *res_mem;
 	struct usb_ehci_pdata *pdata = &ehci_platform_defaults;
 	struct st_ehci_platform_priv *priv;
-	struct ehci_hcd *ehci;
 	int err, irq, clk = 0;
 
 	if (usb_disabled())
@@ -177,7 +176,6 @@ static int st_ehci_platform_probe(struct platform_device *dev)
 	platform_set_drvdata(dev, hcd);
 	dev->dev.platform_data = pdata;
 	priv = hcd_to_ehci_priv(hcd);
-	ehci = hcd_to_ehci(hcd);
 
 	priv->phy = devm_phy_get(&dev->dev, "usb");
 	if (IS_ERR(priv->phy)) {
-- 
2.17.1



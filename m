Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB8FE3A90B3
	for <lists+linux-usb@lfdr.de>; Wed, 16 Jun 2021 06:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbhFPEnc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Jun 2021 00:43:32 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:10086 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbhFPEnc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Jun 2021 00:43:32 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G4XW95DQZzZfQp;
        Wed, 16 Jun 2021 12:38:29 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 16 Jun 2021 12:41:24 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 16 Jun
 2021 12:41:24 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
CC:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>
Subject: [PATCH -next 1/3] usb: host: xhci-tegra: add missing put_device() in tegra_xusb_probe()
Date:   Wed, 16 Jun 2021 12:45:17 +0800
Message-ID: <20210616044519.2183826-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Goto put_padctl to put refcount of device on error in tegra_xusb_probe()

Fixes: 971ee247060d ("usb: xhci: tegra: Enable ELPG for runtime/system PM")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/usb/host/xhci-tegra.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 937b78cba89b..281abf10f9fd 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1450,12 +1450,16 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		return PTR_ERR(tegra->padctl);
 
 	np = of_parse_phandle(pdev->dev.of_node, "nvidia,xusb-padctl", 0);
-	if (!np)
-		return -ENODEV;
+	if (!np) {
+		err = -ENODEV;
+		goto put_padctl;
+	}
 
 	tegra->padctl_irq = of_irq_get(np, 0);
-	if (tegra->padctl_irq <= 0)
-		return (tegra->padctl_irq == 0) ? -ENODEV : tegra->padctl_irq;
+	if (tegra->padctl_irq <= 0) {
+		err = (tegra->padctl_irq == 0) ? -ENODEV : tegra->padctl_irq;
+		goto put_padctl;
+	}
 
 	tegra->host_clk = devm_clk_get(&pdev->dev, "xusb_host");
 	if (IS_ERR(tegra->host_clk)) {
-- 
2.25.1


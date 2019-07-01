Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA992C803
	for <lists+linux-usb@lfdr.de>; Tue, 28 May 2019 15:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727360AbfE1Nnh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 May 2019 09:43:37 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:17598 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726867AbfE1Nnh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 May 2019 09:43:37 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 0A76DA471E72B15A4CE6;
        Tue, 28 May 2019 21:43:33 +0800 (CST)
Received: from localhost (10.177.31.96) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Tue, 28 May 2019
 21:43:25 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <stern@rowland.harvard.edu>, <kgene@kernel.org>, <krzk@kernel.org>,
        <gregkh@linuxfoundation.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] usb: ohci-s3c2410: Remove set but not used variable 'hcd'
Date:   Tue, 28 May 2019 21:43:05 +0800
Message-ID: <20190528134305.10184-1-yuehaibing@huawei.com>
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

drivers/usb/host/ohci-s3c2410.c: In function s3c2410_hcd_oc:
drivers/usb/host/ohci-s3c2410.c:296:18: warning: variable hcd set but not used [-Wunused-but-set-variable]

It is never used, so can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/usb/host/ohci-s3c2410.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/host/ohci-s3c2410.c b/drivers/usb/host/ohci-s3c2410.c
index 4511e27e9da8..d961097c90f0 100644
--- a/drivers/usb/host/ohci-s3c2410.c
+++ b/drivers/usb/host/ohci-s3c2410.c
@@ -293,7 +293,6 @@ static int ohci_s3c2410_hub_control(
 static void s3c2410_hcd_oc(struct s3c2410_hcd_info *info, int port_oc)
 {
 	struct s3c2410_hcd_port *port;
-	struct usb_hcd *hcd;
 	unsigned long flags;
 	int portno;
 
@@ -301,7 +300,6 @@ static void s3c2410_hcd_oc(struct s3c2410_hcd_info *info, int port_oc)
 		return;
 
 	port = &info->port[0];
-	hcd = info->hcd;
 
 	local_irq_save(flags);
 
-- 
2.17.1



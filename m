Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21D5E3417EA
	for <lists+linux-usb@lfdr.de>; Fri, 19 Mar 2021 10:04:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbhCSJED (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Mar 2021 05:04:03 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:14404 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbhCSJDo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Mar 2021 05:03:44 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F1yZS2xvgzkc7g;
        Fri, 19 Mar 2021 17:02:08 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Fri, 19 Mar 2021 17:03:31 +0800
From:   Zeng Tao <prime.zeng@hisilicon.com>
To:     <hminas@synopsys.com>
CC:     <linuxarm@huawei.com>, Zeng Tao <prime.zeng@hisilicon.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] usb: dwc2: Using tab instead of blank
Date:   Fri, 19 Mar 2021 17:00:55 +0800
Message-ID: <1616144456-15381-1-git-send-email-prime.zeng@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Signed-off-by: Zeng Tao <prime.zeng@hisilicon.com>
---
 drivers/usb/dwc2/gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index ad4c943..53406f0 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -3380,7 +3380,7 @@ void dwc2_hsotg_core_init_disconnected(struct dwc2_hsotg *hsotg,
 
 	/* remove the HNP/SRP and set the PHY */
 	usbcfg &= ~(GUSBCFG_SRPCAP | GUSBCFG_HNPCAP);
-        dwc2_writel(hsotg, usbcfg, GUSBCFG);
+	dwc2_writel(hsotg, usbcfg, GUSBCFG);
 
 	dwc2_phy_init(hsotg, true);
 
-- 
2.8.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0141B0059
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2020 06:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725825AbgDTEAH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Apr 2020 00:00:07 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2804 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725681AbgDTEAH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Apr 2020 00:00:07 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 0BE0D13B2D017AE430E6;
        Mon, 20 Apr 2020 12:00:05 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Mon, 20 Apr 2020
 11:59:55 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <ryan5544@gmail.com>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] usb: pci-quirks: use true,false for bool variables
Date:   Mon, 20 Apr 2020 12:26:22 +0800
Message-ID: <20200420042622.18564-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix the following coccicheck warning:

drivers/usb/host/pci-quirks.c:532:1-27: WARNING: Assignment of 0/1 to
bool variable
drivers/usb/host/pci-quirks.c:208:1-20: WARNING: Assignment of 0/1 to
bool variable
drivers/usb/host/pci-quirks.c:232:2-21: WARNING: Assignment of 0/1 to
bool variable
drivers/usb/host/pci-quirks.c:235:2-21: WARNING: Assignment of 0/1 to
bool variable

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/usb/host/pci-quirks.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/pci-quirks.c b/drivers/usb/host/pci-quirks.c
index beb2efa71341..92150ecdb036 100644
--- a/drivers/usb/host/pci-quirks.c
+++ b/drivers/usb/host/pci-quirks.c
@@ -205,7 +205,7 @@ static void usb_amd_find_chipset_info(void)
 {
 	unsigned long flags;
 	struct amd_chipset_info info;
-	info.need_pll_quirk = 0;
+	info.need_pll_quirk = false;
 
 	spin_lock_irqsave(&amd_lock, flags);
 
@@ -229,10 +229,10 @@ static void usb_amd_find_chipset_info(void)
 	case AMD_CHIPSET_SB800:
 	case AMD_CHIPSET_HUDSON2:
 	case AMD_CHIPSET_BOLTON:
-		info.need_pll_quirk = 1;
+		info.need_pll_quirk = true;
 		break;
 	default:
-		info.need_pll_quirk = 0;
+		info.need_pll_quirk = false;
 		break;
 	}
 
@@ -529,7 +529,7 @@ void usb_amd_dev_put(void)
 	amd_chipset.nb_type = 0;
 	memset(&amd_chipset.sb_type, 0, sizeof(amd_chipset.sb_type));
 	amd_chipset.isoc_reqs = 0;
-	amd_chipset.need_pll_quirk = 0;
+	amd_chipset.need_pll_quirk = false;
 
 	spin_unlock_irqrestore(&amd_lock, flags);
 
-- 
2.21.1


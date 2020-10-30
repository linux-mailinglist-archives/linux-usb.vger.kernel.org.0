Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76BF12A09F1
	for <lists+linux-usb@lfdr.de>; Fri, 30 Oct 2020 16:35:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbgJ3PfH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Oct 2020 11:35:07 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:6994 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726662AbgJ3PfG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Oct 2020 11:35:06 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CN5wR6Rgvzhcjt;
        Fri, 30 Oct 2020 23:35:03 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Fri, 30 Oct 2020
 23:34:56 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <hadess@hadess.net>
CC:     <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: apple-mfi-fastcharge: fix reference leak in apple_mfi_fc_set_property
Date:   Fri, 30 Oct 2020 23:45:34 +0800
Message-ID: <20201030154534.98294-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

pm_runtime_get_sync() will increment pm usage counter even
it failed. Forgetting to call pm_runtime_put_noidle will
result in reference leak in apple_mfi_fc_set_property, so
we should fix it.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/usb/misc/apple-mfi-fastcharge.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/apple-mfi-fastcharge.c b/drivers/usb/misc/apple-mfi-fastcharge.c
index b403094a6b3a..9e1ad4536e36 100644
--- a/drivers/usb/misc/apple-mfi-fastcharge.c
+++ b/drivers/usb/misc/apple-mfi-fastcharge.c
@@ -120,8 +120,10 @@ static int apple_mfi_fc_set_property(struct power_supply *psy,
 	dev_dbg(&mfi->udev->dev, "prop: %d\n", psp);
 
 	ret = pm_runtime_get_sync(&mfi->udev->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(&mfi->udev->dev);
 		return ret;
+	}
 
 	switch (psp) {
 	case POWER_SUPPLY_PROP_CHARGE_TYPE:
-- 
2.17.1


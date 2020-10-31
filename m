Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69B3B2A150A
	for <lists+linux-usb@lfdr.de>; Sat, 31 Oct 2020 11:01:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbgJaKBH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 31 Oct 2020 06:01:07 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:6716 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726580AbgJaKBH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 31 Oct 2020 06:01:07 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CNZSb2S1Nzkb5r;
        Sat, 31 Oct 2020 18:01:03 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Sat, 31 Oct 2020
 18:01:00 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <hadess@hadess.net>, <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>
Subject: [PATCH v2] USB: apple-mfi-fastcharge: fix reference leak in apple_mfi_fc_set_property
Date:   Sat, 31 Oct 2020 18:11:44 +0800
Message-ID: <20201031101144.45164-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

pm_runtime_get_sync() will increment pm usage at first and it
will resume the device later. If runtime of the device is
active or has error(else....), resume operation will fail. If
we do not call put operation to decrease the reference, the
result is that this device cannot enter the idle state and
always stay busy or other non-idle state.

Fixes: 249fa8217b846 ("USB: Add driver to control USB fast charge for iOS devices")
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


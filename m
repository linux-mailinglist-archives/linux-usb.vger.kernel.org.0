Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A34B2C0E41
	for <lists+linux-usb@lfdr.de>; Mon, 23 Nov 2020 15:59:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730018AbgKWOyo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Nov 2020 09:54:44 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:7720 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728654AbgKWOyn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Nov 2020 09:54:43 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CfqtH5D7wzkdjP;
        Mon, 23 Nov 2020 22:54:15 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Mon, 23 Nov 2020
 22:54:38 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>
Subject: [PATCH] usb: oxu210hp-hcd: Fix memory leak in oxu_create
Date:   Mon, 23 Nov 2020 22:58:09 +0800
Message-ID: <20201123145809.1456541-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

usb_create_hcd will alloc memory for hcd, and we should
call usb_put_hcd to free it when adding fails to prevent
memory leak.

Fixes: b92a78e582b1a ("usb host: Oxford OXU210HP HCD driver")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/usb/host/oxu210hp-hcd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/oxu210hp-hcd.c b/drivers/usb/host/oxu210hp-hcd.c
index 27dbbe1b28b1..e832909a924f 100644
--- a/drivers/usb/host/oxu210hp-hcd.c
+++ b/drivers/usb/host/oxu210hp-hcd.c
@@ -4151,8 +4151,10 @@ static struct usb_hcd *oxu_create(struct platform_device *pdev,
 	oxu->is_otg = otg;
 
 	ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
-	if (ret < 0)
+	if (ret < 0) {
+		usb_put_hcd(hcd);
 		return ERR_PTR(ret);
+	}
 
 	device_wakeup_enable(hcd->self.controller);
 	return hcd;
-- 
2.25.4


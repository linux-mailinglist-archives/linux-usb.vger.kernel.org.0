Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0085E2A09F9
	for <lists+linux-usb@lfdr.de>; Fri, 30 Oct 2020 16:36:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgJ3PgK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Oct 2020 11:36:10 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:7382 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbgJ3PgK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Oct 2020 11:36:10 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CN5xf1l3Bz6xGD;
        Fri, 30 Oct 2020 23:36:06 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Fri, 30 Oct 2020
 23:36:01 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <b-liu@ti.com>, <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>
Subject: [PATCH] usb: musb: fix reference leak in musb_irq_work
Date:   Fri, 30 Oct 2020 23:46:46 +0800
Message-ID: <20201030154646.98852-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

pm_runtime_get_sync() will increment pm usage counter even it
failed. Forgetting to call pm_runtime_put_noidle will result
in reference leak in musb_irq_work, so we should fix it.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/usb/musb/musb_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index 849e0b770130..160387de59c0 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -2069,7 +2069,7 @@ static void musb_irq_work(struct work_struct *data)
 	error = pm_runtime_get_sync(musb->controller);
 	if (error < 0) {
 		dev_err(musb->controller, "Could not enable: %i\n", error);
-
+		pm_runtime_put_noidle(musb->controller);
 		return;
 	}
 
-- 
2.17.1


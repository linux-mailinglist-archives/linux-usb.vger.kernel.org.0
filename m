Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 956F31B8E74
	for <lists+linux-usb@lfdr.de>; Sun, 26 Apr 2020 11:43:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbgDZJmN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Apr 2020 05:42:13 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:40064 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726143AbgDZJmN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 26 Apr 2020 05:42:13 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id A628BF011B69DD75195C;
        Sun, 26 Apr 2020 17:42:11 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Sun, 26 Apr 2020
 17:42:04 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <b-liu@ti.com>, <gregkh@linuxfoundation.org>, <tony@atomide.com>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] usb: musb: use true for 'use_dma'
Date:   Sun, 26 Apr 2020 17:41:30 +0800
Message-ID: <20200426094130.23384-1-yanaijie@huawei.com>
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

drivers/usb/musb/musb_core.c:1798:12-19: WARNING: Assignment of 0/1 to
bool variable

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/usb/musb/musb_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index d590110539ab..a0eba889ec61 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -1795,7 +1795,7 @@ irqreturn_t musb_interrupt(struct musb *musb)
 EXPORT_SYMBOL_GPL(musb_interrupt);
 
 #ifndef CONFIG_MUSB_PIO_ONLY
-static bool use_dma = 1;
+static bool use_dma = true;
 
 /* "modprobe ... use_dma=0" etc */
 module_param(use_dma, bool, 0644);
-- 
2.21.1


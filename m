Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5A6F234118
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jul 2020 10:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731893AbgGaIUU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jul 2020 04:20:20 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:9305 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731510AbgGaIUU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 31 Jul 2020 04:20:20 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 9DCCE504443213A5E4B4;
        Fri, 31 Jul 2020 16:20:17 +0800 (CST)
Received: from localhost (10.174.179.108) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Fri, 31 Jul 2020
 16:20:10 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <chunfeng.yun@mediatek.com>, <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] usb: mtu3: Remove unsused inline function is_first_entry
Date:   Fri, 31 Jul 2020 16:20:08 +0800
Message-ID: <20200731082008.33016-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.108]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It is never used, so can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/usb/mtu3/mtu3.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index 71f4f02c05c6..aef0a0bba25a 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -370,12 +370,6 @@ static inline struct mtu3 *gadget_to_mtu3(struct usb_gadget *g)
 	return container_of(g, struct mtu3, g);
 }
 
-static inline int is_first_entry(const struct list_head *list,
-	const struct list_head *head)
-{
-	return list_is_last(head, list);
-}
-
 static inline struct mtu3_request *to_mtu3_request(struct usb_request *req)
 {
 	return req ? container_of(req, struct mtu3_request, request) : NULL;
-- 
2.17.1



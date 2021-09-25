Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48A7B41820F
	for <lists+linux-usb@lfdr.de>; Sat, 25 Sep 2021 14:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245343AbhIYMvO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Sep 2021 08:51:14 -0400
Received: from mx24.baidu.com ([111.206.215.185]:42344 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S245215AbhIYMvN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 25 Sep 2021 08:51:13 -0400
Received: from BC-Mail-Ex32.internal.baidu.com (unknown [172.31.51.26])
        by Forcepoint Email with ESMTPS id D40368EFAEF02CC8E43E;
        Sat, 25 Sep 2021 20:49:37 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex32.internal.baidu.com (172.31.51.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Sat, 25 Sep 2021 20:49:36 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Sat, 25 Sep 2021 20:49:36 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] usb: host: oxu210hp: Fix a function name in comments
Date:   Sat, 25 Sep 2021 20:49:19 +0800
Message-ID: <20210925124920.1564-3-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210925124920.1564-1-caihuoqing@baidu.com>
References: <20210925124920.1564-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex01.internal.baidu.com (10.127.64.11) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use dma_map_single() instead of pci_map_single(),
because only dma_map_single() is called here.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/usb/host/oxu210hp-hcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/oxu210hp-hcd.c b/drivers/usb/host/oxu210hp-hcd.c
index 4300326b3730..e82ff2a49672 100644
--- a/drivers/usb/host/oxu210hp-hcd.c
+++ b/drivers/usb/host/oxu210hp-hcd.c
@@ -3131,7 +3131,7 @@ static int oxu_run(struct usb_hcd *hcd)
 	/* hcc_params controls whether oxu->regs->segment must (!!!)
 	 * be used; it constrains QH/ITD/SITD and QTD locations.
 	 * dma_pool consistent memory always uses segment zero.
-	 * streaming mappings for I/O buffers, like pci_map_single(),
+	 * streaming mappings for I/O buffers, like dma_map_single(),
 	 * can return segments above 4GB, if the device allows.
 	 *
 	 * NOTE:  the dma mask is visible through dev->dma_mask, so
-- 
2.25.1


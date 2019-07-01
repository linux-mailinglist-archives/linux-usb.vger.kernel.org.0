Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C39D6290C9
	for <lists+linux-usb@lfdr.de>; Fri, 24 May 2019 08:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388607AbfEXGLv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 May 2019 02:11:51 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:56969 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387622AbfEXGLv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 May 2019 02:11:51 -0400
X-UUID: b64d19cc5a7f45e3876effe756583b49-20190524
X-UUID: b64d19cc5a7f45e3876effe756583b49-20190524
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 576521694; Fri, 24 May 2019 14:11:44 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 24 May 2019 14:11:43 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 24 May 2019 14:11:42 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Matthias Brugger <matthias.bgg@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RESEND PATCH] usb: mtu3: fix up undefined reference to usb_debug_root
Date:   Fri, 24 May 2019 14:11:33 +0800
Message-ID: <ee71197a681165aa72cb73c7f6cb402953351805.1558678075.git.chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When CONFIG_USB is not set, and CONFIG_USB_GADGET is set,
there is an issue:

ld:
drivers/usb/mtu3/mtu3_debugfs.o: in function 'ssusb_debugfs_create_root':
mtu3_debugfs.c:(.text+0xba3): undefined reference to 'usb_debug_root'

usb_debug_root is only built when CONFIG_USB is enabled, so here drop it
and use NULL instead.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
---
 drivers/usb/mtu3/mtu3_debugfs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_debugfs.c b/drivers/usb/mtu3/mtu3_debugfs.c
index 62c57ddc554e..b7c86ccd50b4 100644
--- a/drivers/usb/mtu3/mtu3_debugfs.c
+++ b/drivers/usb/mtu3/mtu3_debugfs.c
@@ -528,8 +528,7 @@ void ssusb_dr_debugfs_init(struct ssusb_mtk *ssusb)
 
 void ssusb_debugfs_create_root(struct ssusb_mtk *ssusb)
 {
-	ssusb->dbgfs_root =
-		debugfs_create_dir(dev_name(ssusb->dev), usb_debug_root);
+	ssusb->dbgfs_root = debugfs_create_dir(dev_name(ssusb->dev), NULL);
 }
 
 void ssusb_debugfs_remove_root(struct ssusb_mtk *ssusb)
-- 
2.21.0


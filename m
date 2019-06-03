Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAD8D335F0
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jun 2019 19:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727450AbfFCREB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Jun 2019 13:04:01 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35460 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbfFCREB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Jun 2019 13:04:01 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id CC15027FDB2
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-usb@vger.kernel.org
Cc:     Felipe Balbi <balbi@kernel.org>,
        Michal Nazarewicz <mina86@mina86.com>, kernel@collabora.com,
        Marek Szyprowski <mszyprow@samsung.com>
Subject: [PATCH] usb: gadget: Zero ffs_io_data
Date:   Mon,  3 Jun 2019 19:03:52 +0200
Message-Id: <20190603170352.28625-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In some cases the "Allocate & copy" block in ffs_epfile_io() is not
executed. Consequently, in such a case ffs_alloc_buffer() is never called
and struct ffs_io_data is not initialized properly. This in turn leads to
problems when ffs_free_buffer() is called at the end of ffs_epfile_io().

This patch uses kzalloc() instead of kmalloc() in the aio case and memset()
in non-aio case to properly initialize struct ffs_io_data.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/usb/gadget/function/f_fs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 47be961f1bf3..41d57ae8bc15 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1182,11 +1182,12 @@ static ssize_t ffs_epfile_write_iter(struct kiocb *kiocb, struct iov_iter *from)
 	ENTER();
 
 	if (!is_sync_kiocb(kiocb)) {
-		p = kmalloc(sizeof(io_data), GFP_KERNEL);
+		p = kzalloc(sizeof(io_data), GFP_KERNEL);
 		if (unlikely(!p))
 			return -ENOMEM;
 		p->aio = true;
 	} else {
+		memset(p, 0, sizeof(*p));
 		p->aio = false;
 	}
 
@@ -1218,11 +1219,12 @@ static ssize_t ffs_epfile_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 	ENTER();
 
 	if (!is_sync_kiocb(kiocb)) {
-		p = kmalloc(sizeof(io_data), GFP_KERNEL);
+		p = kzalloc(sizeof(io_data), GFP_KERNEL);
 		if (unlikely(!p))
 			return -ENOMEM;
 		p->aio = true;
 	} else {
+		memset(p, 0, sizeof(*p));
 		p->aio = false;
 	}
 
-- 
2.17.1


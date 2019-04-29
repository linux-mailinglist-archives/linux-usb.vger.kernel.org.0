Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 208EEE41F
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 16:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728189AbfD2OB2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 10:01:28 -0400
Received: from forward105o.mail.yandex.net ([37.140.190.183]:48983 "EHLO
        forward105o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725838AbfD2OB1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Apr 2019 10:01:27 -0400
Received: from mxback16g.mail.yandex.net (mxback16g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:316])
        by forward105o.mail.yandex.net (Yandex) with ESMTP id 9FAEC420012F;
        Mon, 29 Apr 2019 17:01:24 +0300 (MSK)
Received: from smtp4o.mail.yandex.net (smtp4o.mail.yandex.net [2a02:6b8:0:1a2d::28])
        by mxback16g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id CPYKnEGxeG-1OveKchV;
        Mon, 29 Apr 2019 17:01:24 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1556546484;
        bh=8noguB7hzXZS0jxzQKkyjhweqZpT7LhRgyV6yeX/PXs=;
        h=Subject:To:From:Message-Id:Cc:Date;
        b=DeknrugnT4GzByQOicEtLj98ENp9rdR62D/K2fH53MOlIm6l07CpjzNuXeQ3zRasN
         9Z4rC5VW6RBSm3csyP/7s4NEId5VwdVL+Ow5dUXexQb1MCjBLrPJ1tuCt20Coh20Cz
         RUICPPK92PIkLpk4r/QDrBZUib+oj+ihBvEqsn2I=
Authentication-Results: mxback16g.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by smtp4o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id LGPWAgxqs3-1NeGIFRX;
        Mon, 29 Apr 2019 17:01:23 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Aleksey Kuleshov <rndfax@yandex.ru>
To:     linux-usb@vger.kernel.org
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Aleksey Kuleshov <rndfax@yandex.ru>
Subject: [PATCH] This patch fixes endian issue in xHCI for scratchpad buffer.
Date:   Mon, 29 Apr 2019 17:01:00 +0300
Message-Id: <20190429140100.15889-1-rndfax@yandex.ru>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Scratchpad buffer is an array of pointers every of which must be
in little endian format.

Signed-off-by: Aleksey Kuleshov <rndfax@yandex.ru>
---
 drivers/usb/host/xhci-mem.c | 6 +++---
 drivers/usb/host/xhci.h     | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index cf5e179..ffc3236 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1677,7 +1677,7 @@ static int scratchpad_alloc(struct xhci_hcd *xhci, gfp_t flags)
 		if (!buf)
 			goto fail_sp4;
 
-		xhci->scratchpad->sp_array[i] = dma;
+		xhci->scratchpad->sp_array[i] = cpu_to_le64(dma);
 		xhci->scratchpad->sp_buffers[i] = buf;
 	}
 
@@ -1687,7 +1687,7 @@ static int scratchpad_alloc(struct xhci_hcd *xhci, gfp_t flags)
 	for (i = i - 1; i >= 0; i--) {
 		dma_free_coherent(dev, xhci->page_size,
 				    xhci->scratchpad->sp_buffers[i],
-				    xhci->scratchpad->sp_array[i]);
+				    le64_to_cpu(xhci->scratchpad->sp_array[i]));
 	}
 
 	kfree(xhci->scratchpad->sp_buffers);
@@ -1719,7 +1719,7 @@ static void scratchpad_free(struct xhci_hcd *xhci)
 	for (i = 0; i < num_sp; i++) {
 		dma_free_coherent(dev, xhci->page_size,
 				    xhci->scratchpad->sp_buffers[i],
-				    xhci->scratchpad->sp_array[i]);
+				    le64_to_cpu(xhci->scratchpad->sp_array[i]));
 	}
 	kfree(xhci->scratchpad->sp_buffers);
 	dma_free_coherent(dev, num_sp * sizeof(u64),
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 9334cde..385fa70 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1621,7 +1621,7 @@ struct xhci_erst {
 };
 
 struct xhci_scratchpad {
-	u64 *sp_array;
+	__le64 *sp_array;
 	dma_addr_t sp_dma;
 	void **sp_buffers;
 };
-- 
1.8.3.1


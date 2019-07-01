Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93DAC25186
	for <lists+linux-usb@lfdr.de>; Tue, 21 May 2019 16:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728263AbfEUOH5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 May 2019 10:07:57 -0400
Received: from inva020.nxp.com ([92.121.34.13]:47238 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727044AbfEUOH5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 May 2019 10:07:57 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C737B1A0062;
        Tue, 21 May 2019 16:07:54 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BA9AA1A003B;
        Tue, 21 May 2019 16:07:54 +0200 (CEST)
Received: from fsr-ub1864-101.ea.freescale.net (fsr-ub1864-101.ea.freescale.net [10.171.82.13])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 4091A20612;
        Tue, 21 May 2019 16:07:54 +0200 (CEST)
From:   laurentiu.tudor@nxp.com
To:     hch@lst.de, stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, marex@denx.de
Cc:     leoyang.li@nxp.com, linux-kernel@vger.kernel.org,
        robin.murphy@arm.com, noring@nocrew.org, JuergenUrban@gmx.de
Subject: [PATCH v5 1/5] lib/genalloc.c: Add gen_pool_dma_zalloc() for zeroed DMA allocations
Date:   Tue, 21 May 2019 17:07:44 +0300
Message-Id: <20190521140748.20012-2-laurentiu.tudor@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190521140748.20012-1-laurentiu.tudor@nxp.com>
References: <20190521140748.20012-1-laurentiu.tudor@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Fredrik Noring <noring@nocrew.org>

gen_pool_dma_zalloc() is a zeroed memory variant of gen_pool_dma_alloc().
Document return values of both, and indicate NULL as a "%NULL" constant.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 include/linux/genalloc.h |  1 +
 lib/genalloc.c           | 29 ++++++++++++++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/include/linux/genalloc.h b/include/linux/genalloc.h
index dd0a452373e7..6c62eeca754f 100644
--- a/include/linux/genalloc.h
+++ b/include/linux/genalloc.h
@@ -121,6 +121,7 @@ extern unsigned long gen_pool_alloc_algo(struct gen_pool *, size_t,
 		genpool_algo_t algo, void *data);
 extern void *gen_pool_dma_alloc(struct gen_pool *pool, size_t size,
 		dma_addr_t *dma);
+void *gen_pool_dma_zalloc(struct gen_pool *pool, size_t size, dma_addr_t *dma);
 extern void gen_pool_free(struct gen_pool *, unsigned long, size_t);
 extern void gen_pool_for_each_chunk(struct gen_pool *,
 	void (*)(struct gen_pool *, struct gen_pool_chunk *, void *), void *);
diff --git a/lib/genalloc.c b/lib/genalloc.c
index 7e85d1e37a6e..5db43476a19b 100644
--- a/lib/genalloc.c
+++ b/lib/genalloc.c
@@ -337,12 +337,14 @@ EXPORT_SYMBOL(gen_pool_alloc_algo);
  * gen_pool_dma_alloc - allocate special memory from the pool for DMA usage
  * @pool: pool to allocate from
  * @size: number of bytes to allocate from the pool
- * @dma: dma-view physical address return value.  Use NULL if unneeded.
+ * @dma: dma-view physical address return value.  Use %NULL if unneeded.
  *
  * Allocate the requested number of bytes from the specified pool.
  * Uses the pool allocation function (with first-fit algorithm by default).
  * Can not be used in NMI handler on architectures without
  * NMI-safe cmpxchg implementation.
+ *
+ * Return: virtual address of the allocated memory, or %NULL on failure
  */
 void *gen_pool_dma_alloc(struct gen_pool *pool, size_t size, dma_addr_t *dma)
 {
@@ -362,6 +364,31 @@ void *gen_pool_dma_alloc(struct gen_pool *pool, size_t size, dma_addr_t *dma)
 }
 EXPORT_SYMBOL(gen_pool_dma_alloc);
 
+/**
+ * gen_pool_dma_zalloc - allocate special zeroed memory from the pool for
+ * DMA usage
+ * @pool: pool to allocate from
+ * @size: number of bytes to allocate from the pool
+ * @dma: dma-view physical address return value.  Use %NULL if unneeded.
+ *
+ * Allocate the requested number of zeroed bytes from the specified pool.
+ * Uses the pool allocation function (with first-fit algorithm by default).
+ * Can not be used in NMI handler on architectures without
+ * NMI-safe cmpxchg implementation.
+ *
+ * Return: virtual address of the allocated zeroed memory, or %NULL on failure
+ */
+void *gen_pool_dma_zalloc(struct gen_pool *pool, size_t size, dma_addr_t *dma)
+{
+	void *vaddr = gen_pool_dma_alloc(pool, size, dma);
+
+	if (vaddr)
+		memset(vaddr, 0, size);
+
+	return vaddr;
+}
+EXPORT_SYMBOL(gen_pool_dma_zalloc);
+
 /**
  * gen_pool_free - free allocated special memory back to the pool
  * @pool: pool to free to
-- 
2.17.1


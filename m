Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8221A7E516
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2019 00:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732732AbfHAWBl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Aug 2019 18:01:41 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44448 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbfHAWBl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Aug 2019 18:01:41 -0400
Received: by mail-pl1-f195.google.com with SMTP id t14so32764327plr.11
        for <linux-usb@vger.kernel.org>; Thu, 01 Aug 2019 15:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegavinli.com; s=google;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qyg4k1Y5K1bN/mVVU0NVVPjBjQ6AQIkhN58GkPGD0wc=;
        b=Y0h8Z/MquZqkEqFv7Fm9y0X5XqZcz0jwWpGfSuOf1mMCgJVd1jhd7Uurn9pBGa8Gl/
         v11HFs6LVIOIMvH1W3KJ0Gdqn5NqiENvCsxOQ8J7/5OnU+YIyd+BBDGymlqqZDSpEwDP
         bDf1y5ahwEyA56+auzxPY3wEBoTjMpla8n4DY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=Qyg4k1Y5K1bN/mVVU0NVVPjBjQ6AQIkhN58GkPGD0wc=;
        b=GPfaoyA01Rcmjx4Zb3LQriKLTW3LlxhsHZwZBUft+spQt0VcsmNPZAhc4h8U9bMTPT
         D7qVFW1GxMGRLHeL2P/pG+zOGqCnaEiqM1nP9yzUyAPkcauqNjkhm1ZUGI2yDdLPOj+m
         ZBf6+JDq1uugaTmU5i+SLtvMkPq+X7ffiiQ6lAu+7oOZwxiMxLIYfNbIKwAA43cSOYfZ
         +btAOnATmYzlJc/dt8bcFDbv9TcpditGylcjTcHBSa/A3Voi5CPVxrMUryB/maOo1N5V
         1kZwPZcQGAAxw83yQoM1ywEEVPWD8OccBqvGvJQM/9mxkzNN3ldv60wmSFvQgPsvx+vI
         R+uQ==
X-Gm-Message-State: APjAAAV0hFcfomH2Q5W1GOhJg0JBIZjgF60pmHAlbVb0e4o++44xmihf
        msD/VjEND7D4noZR/VzBxCU=
X-Google-Smtp-Source: APXvYqw8oVropLuBP16STC8+wODnSAyPUG8j8LhavHmE0uJY25CArPms4He2OOs/lnfnA9A31uNojQ==
X-Received: by 2002:a17:902:7612:: with SMTP id k18mr126391249pll.48.1564696900288;
        Thu, 01 Aug 2019 15:01:40 -0700 (PDT)
Received: from mtgav.corp.matician.com ([2601:647:5a01:84c0::a53])
        by smtp.gmail.com with ESMTPSA id r27sm79538731pgn.25.2019.08.01.15.01.38
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 01 Aug 2019 15:01:39 -0700 (PDT)
From:   gavinli@thegavinli.com
To:     gregkh@linuxfoundation.o, linux-usb@vger.kernel.org
Cc:     Gavin Li <git@thegavinli.com>
Subject: [PATCH] usb: devio: fix mmap() on non-coherent DMA architectures
Date:   Thu,  1 Aug 2019 15:01:34 -0700
Message-Id: <20190801220134.3295-1-gavinli@thegavinli.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Gavin Li <git@thegavinli.com>

On architectures that are not (or are optionally) DMA coherent,
dma_alloc_coherent() returns an address into the vmalloc space,
and calling virt_to_phys() on this address returns an unusable
physical address.

This patch replaces the raw remap_pfn_range() call with a call to
dmap_mmap_coherent(), which takes care of the differences between
coherent and non-coherent code paths.

Tested on an arm64 rk3399 board.

Signed-off-by: Gavin Li <git@thegavinli.com>
---
 drivers/usb/core/devio.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index a02448105527..76ec9aef3eff 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -241,11 +241,10 @@ static int usbdev_mmap(struct file *file, struct vm_area_struct *vma)
 	usbm->vma_use_count = 1;
 	INIT_LIST_HEAD(&usbm->memlist);
 
-	if (remap_pfn_range(vma, vma->vm_start,
-			virt_to_phys(usbm->mem) >> PAGE_SHIFT,
-			size, vma->vm_page_prot) < 0) {
+	ret = dma_mmap_coherent(ps->dev->bus->sysdev, vma, mem, dma_handle, size);
+	if (ret) {
 		dec_usb_memory_use_count(usbm, &usbm->vma_use_count);
-		return -EAGAIN;
+		return ret;
 	}
 
 	vma->vm_flags |= VM_IO;
-- 
2.22.0


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F03767E52C
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2019 00:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389329AbfHAWEp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Aug 2019 18:04:45 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44920 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727987AbfHAWEp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Aug 2019 18:04:45 -0400
Received: by mail-pf1-f196.google.com with SMTP id t16so34808281pfe.11
        for <linux-usb@vger.kernel.org>; Thu, 01 Aug 2019 15:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegavinli.com; s=google;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qyg4k1Y5K1bN/mVVU0NVVPjBjQ6AQIkhN58GkPGD0wc=;
        b=jr9TGXIUvjP0wszKXl6ESelkS6rn1QXIH6SghwcFGbxWlbNB6UK/I7cnzIdrrts+Lb
         TbTKicDuZC7afFxcne2b+KlkjkPo/eCzxCJlEVxDLCDNvmf/NlWTc7TKHxTFt8bMBTBG
         s2vH9ptAV9wc6jsiI6VbHpM3UcUNUMmtUc8p8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=Qyg4k1Y5K1bN/mVVU0NVVPjBjQ6AQIkhN58GkPGD0wc=;
        b=RJzTG5b5nAqS/06cyZiaB3WTHg8w0eozYpbvahrAjVgjS8R9jVRSMgyxBYib4mLApH
         1qiao+Oi0KlzO2VTwYYMPzBM7x0tpX0oGj7zpY0p+uArR3V98o1wnRIvei6Q5jxw7tNC
         qb+FHTxLUuitNGSSvriZzcPtZrzbtSmBLL0vcwEgbyVp1QU430KHfi+mtkf7rFqhSgzd
         hND36HtF0HAR7K8hMeMwHQKfqnz6rbS7pTvMXZUa5dQ5DtlYshPY+nLorIDmKe8/ydK0
         zY1WmQbEUabIBevgOZIiKSvGiXKj+jepl5ZO4VXiwTARhioq2jDgrO1NZEsZIAqfkPvT
         iEmQ==
X-Gm-Message-State: APjAAAUQupc75KvMLapCUjzn2NiVr8ZHGQa1FUbpKC6W4LmR+rFwXMV0
        zPPm2xCnvvNCzjLWXEAy33c=
X-Google-Smtp-Source: APXvYqzj8SsyEmihZfIbIP2oDxa0SARZPEIDTxPXspxbceCFOxsdwI2qY2NyPNupf34tyXiSFZ2jWA==
X-Received: by 2002:a63:4f18:: with SMTP id d24mr44628058pgb.126.1564697084591;
        Thu, 01 Aug 2019 15:04:44 -0700 (PDT)
Received: from mtgav.corp.matician.com ([2601:647:5a01:84c0::a53])
        by smtp.gmail.com with ESMTPSA id s185sm110415326pgs.67.2019.08.01.15.04.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 01 Aug 2019 15:04:43 -0700 (PDT)
From:   gavinli@thegavinli.com
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     Gavin Li <git@thegavinli.com>
Subject: [PATCH] usb: devio: fix mmap() on non-coherent DMA architectures
Date:   Thu,  1 Aug 2019 15:04:36 -0700
Message-Id: <20190801220436.3871-1-gavinli@thegavinli.com>
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


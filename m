Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE8ED1C7F73
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2020 02:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727929AbgEGA5k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 May 2020 20:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgEGA5k (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 May 2020 20:57:40 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6104CC061A0F
        for <linux-usb@vger.kernel.org>; Wed,  6 May 2020 17:57:40 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id l25so2008245pgc.5
        for <linux-usb@vger.kernel.org>; Wed, 06 May 2020 17:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegavinli.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5SLLZQ9jFn3N4OE1yLlQZW0kNyC539u7ISswmSTpWDc=;
        b=B1ZTltsrDiwORosNS44eXo9W935o+DrHVWy3WK2q6lUd1G9knZ/UEbAeS1QyaCs/QY
         gS03Q2iJwgFshdwNoehfXyKbMHw+b1BZOoKl9ETI2276M9vfTGQlSBvDQEcrhhfTgKKW
         y5GfVgJuaSEOb8X28T2BFHTJY0nbmzwOjMBLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5SLLZQ9jFn3N4OE1yLlQZW0kNyC539u7ISswmSTpWDc=;
        b=DdCUqIPkwNfKNq16nVnRfZt6B3HKTHgyrB0XSiZ5uU6fc3K9nC0/0sOhJvtMCqQ6Y5
         Mqg7xFo9kzV2qu0TkXVodBsW19SNFQq733FLQsTbyVTuVvRutj54610EsY1jKyfQIqcl
         phNnmeS4GSziQYbARGaqqiU4ZRrm+0DM+k6k6la/O/0X8z9RwzDrjfNvDUlWVx1AAwdW
         B01wE5nPVxB4nhcMSU3KIbsNxU+kUerZoj+XZUSKwqERFZ09Q6e47/UEVGAnhccL/Fy5
         Kzb4f/NAA8gzpE1h0+NpwvvDc3ZnVp0x6u0rtmTFUvtl1oupbyqvCWVO3n0ujMJkceJO
         y/Gg==
X-Gm-Message-State: AGi0PuaHpxjDybvzz+xE0Ykn8j+g40HTzT/oTHPxO02fuMVst2qLNIcX
        d1t1qgOWD6uQSe4nAk+AGMOLOj4HL10=
X-Google-Smtp-Source: APiQypL2L60Ecw/xhVEQ/WrEoeSqOx/vyHCRNkvT0zTgUSXC884FQ5l4IqoMLapQS/4nvl+49+fNjQ==
X-Received: by 2002:a63:490d:: with SMTP id w13mr940917pga.79.1588813059998;
        Wed, 06 May 2020 17:57:39 -0700 (PDT)
Received: from craggy.lan ([2601:647:5801:4ca0:fced:feff:feed:2])
        by smtp.gmail.com with ESMTPSA id l63sm2530491pga.24.2020.05.06.17.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 17:57:39 -0700 (PDT)
From:   gavinli@thegavinli.com
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Gavin Li <gavinli@thegavinli.com>
Subject: [PATCH v2] usb: devio: fix mmap() on non-coherent DMA architectures
Date:   Wed,  6 May 2020 17:56:47 -0700
Message-Id: <20200507005647.172515-1-gavinli@thegavinli.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Gavin Li <gavinli@thegavinli.com>

On architectures that are not (or are optionally) DMA coherent,
dma_alloc_coherent() returns an address into the vmalloc space,
and calling virt_to_phys() on this address returns an unusable
physical address.

This patch replaces the raw remap_pfn_range() call with a call to
dmap_mmap_coherent(), which takes care of the differences between
coherent and non-coherent code paths.

Tested on an arm64 rk3399 board.
---
 drivers/usb/core/devio.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 6833c918abce..9d0043dd8e64 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -250,11 +250,10 @@ static int usbdev_mmap(struct file *file, struct vm_area_struct *vma)
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
2.26.2


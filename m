Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B05651C090B
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2020 23:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgD3VTY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Apr 2020 17:19:24 -0400
Received: from foss.arm.com ([217.140.110.172]:33902 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726449AbgD3VTY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 30 Apr 2020 17:19:24 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6D241FB;
        Thu, 30 Apr 2020 14:19:23 -0700 (PDT)
Received: from mammon-tx2.austin.arm.com (mammon-tx2.austin.arm.com [10.118.28.62])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DF1733F68F;
        Thu, 30 Apr 2020 14:19:23 -0700 (PDT)
From:   Jeremy Linton <jeremy.linton@arm.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        git@thegavinli.com, jarkko.sakkinen@linux.intel.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jeremy Linton <jeremy.linton@arm.com>
Subject: [PATCH] usb: usbfs: correct kernel->user page attribute mismatch
Date:   Thu, 30 Apr 2020 16:19:22 -0500
Message-Id: <20200430211922.929165-1-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On arm64, and possibly other architectures, requesting
IO coherent memory may return Normal-NC if the underlying
hardware isn't coherent. If these pages are then
remapped into userspace as Normal, that defeats the
purpose of getting Normal-NC, as well as resulting in
mappings with differing cache attributes.

In particular this happens with libusb, when it attempts
to create zero-copy buffers as is used by rtl-sdr, and
maybe other applications. The result is usually
application death.

If dma_mmap_attr() is used instead of remap_pfn_range,
the page cache/etc attributes can be matched between the
kernel and userspace.

Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
---
 drivers/usb/core/devio.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 6833c918abce..1e7458dd6e5d 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -217,6 +217,7 @@ static int usbdev_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	struct usb_memory *usbm = NULL;
 	struct usb_dev_state *ps = file->private_data;
+	struct usb_hcd *hcd = bus_to_hcd(ps->dev->bus);
 	size_t size = vma->vm_end - vma->vm_start;
 	void *mem;
 	unsigned long flags;
@@ -250,9 +251,7 @@ static int usbdev_mmap(struct file *file, struct vm_area_struct *vma)
 	usbm->vma_use_count = 1;
 	INIT_LIST_HEAD(&usbm->memlist);
 
-	if (remap_pfn_range(vma, vma->vm_start,
-			virt_to_phys(usbm->mem) >> PAGE_SHIFT,
-			size, vma->vm_page_prot) < 0) {
+	if (dma_mmap_attrs(hcd->self.sysdev, vma, mem, dma_handle, size, 0)) {
 		dec_usb_memory_use_count(usbm, &usbm->vma_use_count);
 		return -EAGAIN;
 	}
-- 
2.24.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C15A41C47BE
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2020 22:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgEDUOB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 May 2020 16:14:01 -0400
Received: from foss.arm.com ([217.140.110.172]:52874 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726111AbgEDUOA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 4 May 2020 16:14:00 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BD30101E;
        Mon,  4 May 2020 13:14:00 -0700 (PDT)
Received: from mammon-tx2.austin.arm.com (mammon-tx2.austin.arm.com [10.118.28.62])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 52CCC3F71F;
        Mon,  4 May 2020 13:14:00 -0700 (PDT)
From:   Jeremy Linton <jeremy.linton@arm.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        git@thegavinli.com, jarkko.sakkinen@linux.intel.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        mark.rutland@arm.com, maz@kernel.org, robin.murphy@arm.com,
        Jeremy Linton <jeremy.linton@arm.com>
Subject: [PATCH v2] usb: usbfs: correct kernel->user page attribute mismatch
Date:   Mon,  4 May 2020 15:13:48 -0500
Message-Id: <20200504201348.1183246-1-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On some architectures (e.g. arm64) requests for
IO coherent memory may use non-cachable attributes if
the relevant device isn't cache coherent. If these
pages are then remapped into userspace as cacheable,
they may not be coherent with the non-cacheable mappings.

In particular this happens with libusb, when it attempts
to create zero-copy buffers for use by rtl-sdr
(https://github.com/osmocom/rtl-sdr/). On low end arm
devices with non-coherent USB ports, the application will
be unexpectedly killed, while continuing to work fine on
arm machines with coherent USB controllers.

This bug has been discovered/reported a few times over
the last few years. In the case of rtl-sdr a compile time
option to enable/disable zero copy was implemented to
work around it.

Rather than relaying on application specific workarounds,
dma_mmap_coherent() can be used instead of remap_pfn_range().
The page cache/etc attributes will then be correctly set in
userspace to match the kernel mapping.

Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
---
v1->v2:
	Update commit message and change to dma_mmap_coherent()
	from dma_mmap_attr(,,,0) which are the same.

 drivers/usb/core/devio.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 6833c918abce..b9db9812d6c5 100644
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
+	if (dma_mmap_coherent(hcd->self.sysdev, vma, mem, dma_handle, size)) {
 		dec_usb_memory_use_count(usbm, &usbm->vma_use_count);
 		return -EAGAIN;
 	}
-- 
2.24.1


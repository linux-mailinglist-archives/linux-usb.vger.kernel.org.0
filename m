Return-Path: <linux-usb+bounces-536-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BBC7AC4F4
	for <lists+linux-usb@lfdr.de>; Sat, 23 Sep 2023 21:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id B68DF282290
	for <lists+linux-usb@lfdr.de>; Sat, 23 Sep 2023 19:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175C221361;
	Sat, 23 Sep 2023 19:49:31 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390C221350
	for <linux-usb@vger.kernel.org>; Sat, 23 Sep 2023 19:49:29 +0000 (UTC)
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B455194;
	Sat, 23 Sep 2023 12:49:27 -0700 (PDT)
Received: from remote.user (localhost [127.0.0.1])
	by rere.qmqm.pl (Postfix) with ESMTPSA id 4RtKK032ZRz8x;
	Sat, 23 Sep 2023 21:41:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
	t=1695498116; bh=gJMERvxnLVOKYH/aIEsRWMYnuo69cEYR+2/lalyD1xE=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:From;
	b=MJuNiuzH8doJjg97Ydt1b6Jds+XcAFNp5S5+Al2adhMcTFVkB9yZrs8cokY211KmR
	 5GzIKsM8OJw0oJDHgRtdPQoaqheKXNxpQSF++hdh6rNNBTPXYdKQb1rzIC66Kjlv4+
	 foEaT5YOo10U6dP55bHhPwHJga5fu2aatPNgH4u/8AnaAaRu8k4e2x/m1nw/n4b8F7
	 QpaiphDrn0J16aMzFyzzNNPt42xsPBS7FyjYmXiZ4r+Z4FLbxW2ZCzu3XNPeA/9QTv
	 eejy122ovLyxIB1rRVnh5mfsdgb8w0y9DeWndZ39V6UJzFtLNhI3ESnPjDtnai97GK
	 ZH3Bf8hMA7gWg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.8 at mail
Date: Sat, 23 Sep 2023 21:41:56 +0200
Message-Id: <c45f534025322b9613d4955de4cc6763a57f518d.1695497666.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1695497666.git.mirq-linux@rere.qmqm.pl>
References: <cover.1695497666.git.mirq-linux@rere.qmqm.pl>
Subject: [PATCH 2/3] usb: chipidea: Simplify Tegra DMA alignment code
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From:	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
To:	Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Geis <pgwipeout@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc:	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

The USB host on Tegra3 works with DWORD alignment. Previous code tried
to align the buffer, but it did align the wrapper struct instead, so
the buffer was at a constant offset of 8 bytes (two pointers) from
assumed alignment.  Since kmalloc() guarantees at least 8-byte
alignment, the alignment-extending is removed.

Fixes: fc53d5279094 ("usb: chipidea: tegra: Support host mode")
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/usb/chipidea/host.c | 45 +++++++++++++++----------------------
 1 file changed, 18 insertions(+), 27 deletions(-)

diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
index abddd39d1ff1..0cce19208370 100644
--- a/drivers/usb/chipidea/host.c
+++ b/drivers/usb/chipidea/host.c
@@ -30,8 +30,7 @@ struct ehci_ci_priv {
 };
 
 struct ci_hdrc_dma_aligned_buffer {
-	void *kmalloc_ptr;
-	void *old_xfer_buffer;
+	void *original_buffer;
 	u8 data[];
 };
 
@@ -380,60 +379,52 @@ static int ci_ehci_bus_suspend(struct usb_hcd *hcd)
 	return 0;
 }
 
-static void ci_hdrc_free_dma_aligned_buffer(struct urb *urb)
+static void ci_hdrc_free_dma_aligned_buffer(struct urb *urb, bool copy_back)
 {
 	struct ci_hdrc_dma_aligned_buffer *temp;
-	size_t length;
 
 	if (!(urb->transfer_flags & URB_ALIGNED_TEMP_BUFFER))
 		return;
+	urb->transfer_flags &= ~URB_ALIGNED_TEMP_BUFFER;
 
 	temp = container_of(urb->transfer_buffer,
 			    struct ci_hdrc_dma_aligned_buffer, data);
+	urb->transfer_buffer = temp->original_buffer;
+
+	if (copy_back && usb_urb_dir_in(urb)) {
+		size_t length;
 
-	if (usb_urb_dir_in(urb)) {
 		if (usb_pipeisoc(urb->pipe))
 			length = urb->transfer_buffer_length;
 		else
 			length = urb->actual_length;
 
-		memcpy(temp->old_xfer_buffer, temp->data, length);
+		memcpy(temp->original_buffer, temp->data, length);
 	}
-	urb->transfer_buffer = temp->old_xfer_buffer;
-	kfree(temp->kmalloc_ptr);
 
-	urb->transfer_flags &= ~URB_ALIGNED_TEMP_BUFFER;
+	kfree(temp);
 }
 
 static int ci_hdrc_alloc_dma_aligned_buffer(struct urb *urb, gfp_t mem_flags)
 {
-	struct ci_hdrc_dma_aligned_buffer *temp, *kmalloc_ptr;
-	const unsigned int ci_hdrc_usb_dma_align = 32;
-	size_t kmalloc_size;
+	struct ci_hdrc_dma_aligned_buffer *temp;
 
 	if (urb->num_sgs || urb->sg || urb->transfer_buffer_length == 0)
 		return 0;
-	if (!((uintptr_t)urb->transfer_buffer & (ci_hdrc_usb_dma_align - 1)) && !(urb->transfer_buffer_length & 3))
+	if (IS_ALIGNED((uintptr_t)urb->transfer_buffer, 4)
+	    && IS_ALIGNED(urb->transfer_buffer_length, 4))
 		return 0;
 
-	/* Allocate a buffer with enough padding for alignment */
-	kmalloc_size = ALIGN(urb->transfer_buffer_length, 4) +
-		       sizeof(struct ci_hdrc_dma_aligned_buffer) +
-		       ci_hdrc_usb_dma_align - 1;
-
-	kmalloc_ptr = kmalloc(kmalloc_size, mem_flags);
-	if (!kmalloc_ptr)
+	temp = kmalloc(sizeof(*temp) + ALIGN(urb->transfer_buffer_length, 4), mem_flags);
+	if (!temp)
 		return -ENOMEM;
 
-	/* Position our struct dma_aligned_buffer such that data is aligned */
-	temp = PTR_ALIGN(kmalloc_ptr + 1, ci_hdrc_usb_dma_align) - 1;
-	temp->kmalloc_ptr = kmalloc_ptr;
-	temp->old_xfer_buffer = urb->transfer_buffer;
 	if (usb_urb_dir_out(urb))
 		memcpy(temp->data, urb->transfer_buffer,
 		       urb->transfer_buffer_length);
+
+	temp->original_buffer = urb->transfer_buffer;
 	urb->transfer_buffer = temp->data;
-
 	urb->transfer_flags |= URB_ALIGNED_TEMP_BUFFER;
 
 	return 0;
@@ -450,7 +441,7 @@ static int ci_hdrc_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
 
 	ret = usb_hcd_map_urb_for_dma(hcd, urb, mem_flags);
 	if (ret)
-		ci_hdrc_free_dma_aligned_buffer(urb);
+		ci_hdrc_free_dma_aligned_buffer(urb, false);
 
 	return ret;
 }
@@ -458,7 +449,7 @@ static int ci_hdrc_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
 static void ci_hdrc_unmap_urb_for_dma(struct usb_hcd *hcd, struct urb *urb)
 {
 	usb_hcd_unmap_urb_for_dma(hcd, urb);
-	ci_hdrc_free_dma_aligned_buffer(urb);
+	ci_hdrc_free_dma_aligned_buffer(urb, true);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.39.2



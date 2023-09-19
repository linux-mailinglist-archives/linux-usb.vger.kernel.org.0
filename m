Return-Path: <linux-usb+bounces-356-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B95637A57E9
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 05:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D532B1C2092B
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 03:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A61534194;
	Tue, 19 Sep 2023 03:32:09 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C41530F94
	for <linux-usb@vger.kernel.org>; Tue, 19 Sep 2023 03:32:04 +0000 (UTC)
Received: from SHSQR01.spreadtrum.com (mx1.unisoc.com [222.66.158.135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F851112;
	Mon, 18 Sep 2023 20:32:03 -0700 (PDT)
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTP id 38J3VERv084976;
	Tue, 19 Sep 2023 11:31:14 +0800 (+08)
	(envelope-from xingxing.luo@unisoc.com)
Received: from SHDLP.spreadtrum.com (shmbx06.spreadtrum.com [10.0.1.11])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4RqRv22qlzz2SGkjR;
	Tue, 19 Sep 2023 11:27:58 +0800 (CST)
Received: from zebjkernups01.spreadtrum.com (10.0.93.153) by
 shmbx06.spreadtrum.com (10.0.1.11) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Tue, 19 Sep 2023 11:31:13 +0800
From: Xingxing Luo <xingxing.luo@unisoc.com>
To: <b-liu@ti.com>, <gregkh@linuxfoundation.org>, <s.shtylyov@omp.ru>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <xingxing0070.luo@gmail.com>, <Zhiyong.Liu@unisoc.com>,
        <Cixi.Geng1@unisoc.com>, <Orson.Zhai@unisoc.com>,
        <zhang.lyra@gmail.com>
Subject: [PATCH V3] usb: musb: Get the musb_qh poniter after musb_giveback
Date: Tue, 19 Sep 2023 11:30:55 +0800
Message-ID: <20230919033055.14085-1-xingxing.luo@unisoc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.0.93.153]
X-ClientProxiedBy: SHCAS01.spreadtrum.com (10.0.1.201) To
 shmbx06.spreadtrum.com (10.0.1.11)
X-MAIL:SHSQR01.spreadtrum.com 38J3VERv084976
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

When multiple threads are performing USB transmission, musb->lock will be
unlocked when musb_giveback is executed. At this time, qh may be released
in the dequeue process in other threads, resulting in a wild pointer, so
it needs to be here get qh again, and judge whether qh is NULL, and when
dequeue, you need to set qh to NULL.

Fixes: dbac5d07d13e ("usb: musb: host: don't start next rx urb if current one failed")
Cc: stable@vger.kernel.org
Signed-off-by: Xingxing Luo <xingxing.luo@unisoc.com>
---
v2 -> v3: Add Cc: stable
v1 -> v2: - Modified the comments section.
          - Modified "if (qh != NULL && ..." to "if (qh && ...".

 drivers/usb/musb/musb_host.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
index a02c29216955..bc4507781167 100644
--- a/drivers/usb/musb/musb_host.c
+++ b/drivers/usb/musb/musb_host.c
@@ -321,10 +321,16 @@ static void musb_advance_schedule(struct musb *musb, struct urb *urb,
 	musb_giveback(musb, urb, status);
 	qh->is_ready = ready;
 
+	/*
+	 * musb->lock had been unlocked in musb_giveback, so qh may
+	 * be freed, need to get it again
+	 */
+	qh = musb_ep_get_qh(hw_ep, is_in);
+
 	/* reclaim resources (and bandwidth) ASAP; deschedule it, and
 	 * invalidate qh as soon as list_empty(&hep->urb_list)
 	 */
-	if (list_empty(&qh->hep->urb_list)) {
+	if (qh && list_empty(&qh->hep->urb_list)) {
 		struct list_head	*head;
 		struct dma_controller	*dma = musb->dma_controller;
 
@@ -2398,6 +2404,7 @@ static int musb_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 		 * and its URB list has emptied, recycle this qh.
 		 */
 		if (ready && list_empty(&qh->hep->urb_list)) {
+			musb_ep_set_qh(qh->hw_ep, is_in, NULL);
 			qh->hep->hcpriv = NULL;
 			list_del(&qh->ring);
 			kfree(qh);
-- 
2.17.1



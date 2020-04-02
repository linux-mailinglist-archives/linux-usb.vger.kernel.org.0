Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FEEC19C144
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2020 14:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388154AbgDBMkX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Apr 2020 08:40:23 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:51042 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729213AbgDBMkX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 2 Apr 2020 08:40:23 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 9B32B2A08C991D16BF4F;
        Thu,  2 Apr 2020 20:40:08 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Thu, 2 Apr 2020
 20:40:01 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <gregkh@linuxfoundation.org>, <pawell@cadence.com>,
        <peter.chen@nxp.com>, <linux-usb@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] usb: cdns3: gadget: make a bunch of functions static
Date:   Thu, 2 Apr 2020 20:38:37 +0800
Message-ID: <20200402123837.5850-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix the following sparse warning:

drivers/usb/cdns3/gadget.c:85:6: warning: symbol
'cdns3_clear_register_bit' was not declared. Should it be static?
drivers/usb/cdns3/gadget.c:140:26: warning: symbol
'cdns3_next_align_buf' was not declared. Should it be static?
drivers/usb/cdns3/gadget.c:151:22: warning: symbol
'cdns3_next_priv_request' was not declared. Should it be static?
drivers/usb/cdns3/gadget.c:193:5: warning: symbol 'cdns3_ring_size' was
not declared. Should it be static?
drivers/usb/cdns3/gadget.c:348:6: warning: symbol
'cdns3_move_deq_to_next_trb' was not declared. Should it be static?
drivers/usb/cdns3/gadget.c:514:20: warning: symbol
'cdns3_wa2_gadget_giveback' was not declared. Should it be static?
drivers/usb/cdns3/gadget.c:554:5: warning: symbol
'cdns3_wa2_gadget_ep_queue' was not declared. Should it be static?
drivers/usb/cdns3/gadget.c:839:6: warning: symbol
'cdns3_wa1_restore_cycle_bit' was not declared. Should it be static?
drivers/usb/cdns3/gadget.c:1907:6: warning: symbol
'cdns3_stream_ep_reconfig' was not declared. Should it be static?
drivers/usb/cdns3/gadget.c:1928:6: warning: symbol
'cdns3_configure_dmult' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/usb/cdns3/gadget.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 372460ea4df9..62f585c55846 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -82,7 +82,7 @@ static int cdns3_ep_run_stream_transfer(struct cdns3_endpoint *priv_ep,
  * @ptr: address of device controller register to be read and changed
  * @mask: bits requested to clar
  */
-void cdns3_clear_register_bit(void __iomem *ptr, u32 mask)
+static void cdns3_clear_register_bit(void __iomem *ptr, u32 mask)
 {
 	mask = readl(ptr) & ~mask;
 	writel(mask, ptr);
@@ -137,7 +137,7 @@ struct usb_request *cdns3_next_request(struct list_head *list)
  *
  * Returns buffer or NULL if no buffers in list
  */
-struct cdns3_aligned_buf *cdns3_next_align_buf(struct list_head *list)
+static struct cdns3_aligned_buf *cdns3_next_align_buf(struct list_head *list)
 {
 	return list_first_entry_or_null(list, struct cdns3_aligned_buf, list);
 }
@@ -148,7 +148,7 @@ struct cdns3_aligned_buf *cdns3_next_align_buf(struct list_head *list)
  *
  * Returns request or NULL if no requests in list
  */
-struct cdns3_request *cdns3_next_priv_request(struct list_head *list)
+static struct cdns3_request *cdns3_next_priv_request(struct list_head *list)
 {
 	return list_first_entry_or_null(list, struct cdns3_request, list);
 }
@@ -190,7 +190,7 @@ dma_addr_t cdns3_trb_virt_to_dma(struct cdns3_endpoint *priv_ep,
 	return priv_ep->trb_pool_dma + offset;
 }
 
-int cdns3_ring_size(struct cdns3_endpoint *priv_ep)
+static int cdns3_ring_size(struct cdns3_endpoint *priv_ep)
 {
 	switch (priv_ep->type) {
 	case USB_ENDPOINT_XFER_ISOC:
@@ -345,7 +345,7 @@ static void cdns3_ep_inc_deq(struct cdns3_endpoint *priv_ep)
 	cdns3_ep_inc_trb(&priv_ep->dequeue, &priv_ep->ccs, priv_ep->num_trbs);
 }
 
-void cdns3_move_deq_to_next_trb(struct cdns3_request *priv_req)
+static void cdns3_move_deq_to_next_trb(struct cdns3_request *priv_req)
 {
 	struct cdns3_endpoint *priv_ep = priv_req->priv_ep;
 	int current_trb = priv_req->start_trb;
@@ -511,7 +511,7 @@ static void cdns3_wa2_descmiss_copy_data(struct cdns3_endpoint *priv_ep,
 	}
 }
 
-struct usb_request *cdns3_wa2_gadget_giveback(struct cdns3_device *priv_dev,
+static struct usb_request *cdns3_wa2_gadget_giveback(struct cdns3_device *priv_dev,
 					      struct cdns3_endpoint *priv_ep,
 					      struct cdns3_request *priv_req)
 {
@@ -551,7 +551,7 @@ struct usb_request *cdns3_wa2_gadget_giveback(struct cdns3_device *priv_dev,
 	return &priv_req->request;
 }
 
-int cdns3_wa2_gadget_ep_queue(struct cdns3_device *priv_dev,
+static int cdns3_wa2_gadget_ep_queue(struct cdns3_device *priv_dev,
 			      struct cdns3_endpoint *priv_ep,
 			      struct cdns3_request *priv_req)
 {
@@ -836,7 +836,7 @@ void cdns3_gadget_giveback(struct cdns3_endpoint *priv_ep,
 		cdns3_gadget_ep_free_request(&priv_ep->endpoint, request);
 }
 
-void cdns3_wa1_restore_cycle_bit(struct cdns3_endpoint *priv_ep)
+static void cdns3_wa1_restore_cycle_bit(struct cdns3_endpoint *priv_ep)
 {
 	/* Work around for stale data address in TRB*/
 	if (priv_ep->wa1_set) {
@@ -1904,7 +1904,7 @@ static int cdns3_ep_onchip_buffer_reserve(struct cdns3_device *priv_dev,
 	return 0;
 }
 
-void cdns3_stream_ep_reconfig(struct cdns3_device *priv_dev,
+static void cdns3_stream_ep_reconfig(struct cdns3_device *priv_dev,
 			      struct cdns3_endpoint *priv_ep)
 {
 	if (!priv_ep->use_streams || priv_dev->gadget.speed < USB_SPEED_SUPER)
@@ -1925,7 +1925,7 @@ void cdns3_stream_ep_reconfig(struct cdns3_device *priv_dev,
 			       EP_CFG_TDL_CHK | EP_CFG_SID_CHK);
 }
 
-void cdns3_configure_dmult(struct cdns3_device *priv_dev,
+static void cdns3_configure_dmult(struct cdns3_device *priv_dev,
 			   struct cdns3_endpoint *priv_ep)
 {
 	struct cdns3_usb_regs __iomem *regs = priv_dev->regs;
-- 
2.17.2


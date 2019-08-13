Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F11028AD43
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2019 05:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727316AbfHMDmn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Aug 2019 23:42:43 -0400
Received: from rtits2.realtek.com ([211.75.126.72]:39392 "EHLO
        rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbfHMDmm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Aug 2019 23:42:42 -0400
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x7D3gcKd011967, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCASV01.realtek.com.tw[172.21.6.18])
        by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x7D3gcKd011967
        (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
        Tue, 13 Aug 2019 11:42:39 +0800
Received: from fc30.localdomain (172.21.177.138) by RTITCASV01.realtek.com.tw
 (172.21.6.18) with Microsoft SMTP Server id 14.3.468.0; Tue, 13 Aug 2019
 11:42:37 +0800
From:   Hayes Wang <hayeswang@realtek.com>
To:     <netdev@vger.kernel.org>
CC:     <nic_swsd@realtek.com>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, Hayes Wang <hayeswang@realtek.com>
Subject: [PATCH net-next v2 2/5] r8152: replace array with linking list for rx information
Date:   Tue, 13 Aug 2019 11:42:06 +0800
Message-ID: <1394712342-15778-297-albertk@realtek.com>
X-Mailer: Microsoft Office Outlook 11
In-Reply-To: <1394712342-15778-295-albertk@realtek.com>
References: <1394712342-15778-289-Taiwan-albertk@realtek.com>
 <1394712342-15778-295-albertk@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [172.21.177.138]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The original method uses an array to store the rx information. The
new one uses a list to link each rx structure. Then, it is possible
to increase/decrease the number of rx structure dynamically.

Signed-off-by: Hayes Wang <hayeswang@realtek.com>
---
 drivers/net/usb/r8152.c | 182 +++++++++++++++++++++++++++-------------
 1 file changed, 125 insertions(+), 57 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 94da79028a65..d063c9b358e5 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -22,6 +22,7 @@
 #include <linux/mdio.h>
 #include <linux/usb/cdc.h>
 #include <linux/suspend.h>
+#include <linux/atomic.h>
 #include <linux/acpi.h>
 
 /* Information for net-next */
@@ -694,7 +695,7 @@ struct tx_desc {
 struct r8152;
 
 struct rx_agg {
-	struct list_head list;
+	struct list_head list, info_list;
 	struct urb *urb;
 	struct r8152 *context;
 	void *buffer;
@@ -719,7 +720,7 @@ struct r8152 {
 	struct net_device *netdev;
 	struct urb *intr_urb;
 	struct tx_agg tx_info[RTL8152_MAX_TX];
-	struct rx_agg rx_info[RTL8152_MAX_RX];
+	struct list_head rx_info;
 	struct list_head rx_done, tx_free;
 	struct sk_buff_head tx_queue, rx_queue;
 	spinlock_t rx_lock, tx_lock;
@@ -744,6 +745,8 @@ struct r8152 {
 		void (*autosuspend_en)(struct r8152 *tp, bool enable);
 	} rtl_ops;
 
+	atomic_t rx_count;
+
 	int intr_interval;
 	u32 saved_wolopts;
 	u32 msg_enable;
@@ -1468,18 +1471,81 @@ static inline void *tx_agg_align(void *data)
 	return (void *)ALIGN((uintptr_t)data, TX_ALIGN);
 }
 
+static void free_rx_agg(struct r8152 *tp, struct rx_agg *agg)
+{
+	list_del(&agg->info_list);
+
+	usb_free_urb(agg->urb);
+	kfree(agg->buffer);
+	kfree(agg);
+
+	atomic_dec(&tp->rx_count);
+}
+
+static struct rx_agg *alloc_rx_agg(struct r8152 *tp, gfp_t mflags)
+{
+	struct net_device *netdev = tp->netdev;
+	int node = netdev->dev.parent ? dev_to_node(netdev->dev.parent) : -1;
+	struct rx_agg *rx_agg;
+	unsigned long flags;
+	u8 *buf;
+
+	rx_agg = kmalloc_node(sizeof(*rx_agg), mflags, node);
+	if (!rx_agg)
+		return NULL;
+
+	buf = kmalloc_node(tp->rx_buf_sz, mflags, node);
+	if (!buf)
+		goto free_rx;
+
+	if (buf != rx_agg_align(buf)) {
+		kfree(buf);
+		buf = kmalloc_node(tp->rx_buf_sz + RX_ALIGN, mflags,
+				   node);
+		if (!buf)
+			goto free_rx;
+	}
+
+	rx_agg->buffer = buf;
+	rx_agg->head = rx_agg_align(buf);
+
+	rx_agg->urb = usb_alloc_urb(0, mflags);
+	if (!rx_agg->urb)
+		goto free_buf;
+
+	rx_agg->context = tp;
+
+	INIT_LIST_HEAD(&rx_agg->list);
+	INIT_LIST_HEAD(&rx_agg->info_list);
+	spin_lock_irqsave(&tp->rx_lock, flags);
+	list_add_tail(&rx_agg->info_list, &tp->rx_info);
+	spin_unlock_irqrestore(&tp->rx_lock, flags);
+
+	atomic_inc(&tp->rx_count);
+
+	return rx_agg;
+
+free_buf:
+	kfree(rx_agg->buffer);
+free_rx:
+	kfree(rx_agg);
+	return NULL;
+}
+
 static void free_all_mem(struct r8152 *tp)
 {
+	struct rx_agg *agg, *agg_next;
+	unsigned long flags;
 	int i;
 
-	for (i = 0; i < RTL8152_MAX_RX; i++) {
-		usb_free_urb(tp->rx_info[i].urb);
-		tp->rx_info[i].urb = NULL;
+	spin_lock_irqsave(&tp->rx_lock, flags);
 
-		kfree(tp->rx_info[i].buffer);
-		tp->rx_info[i].buffer = NULL;
-		tp->rx_info[i].head = NULL;
-	}
+	list_for_each_entry_safe(agg, agg_next, &tp->rx_info, info_list)
+		free_rx_agg(tp, agg);
+
+	spin_unlock_irqrestore(&tp->rx_lock, flags);
+
+	WARN_ON(atomic_read(&tp->rx_count));
 
 	for (i = 0; i < RTL8152_MAX_TX; i++) {
 		usb_free_urb(tp->tx_info[i].urb);
@@ -1503,46 +1569,28 @@ static int alloc_all_mem(struct r8152 *tp)
 	struct usb_interface *intf = tp->intf;
 	struct usb_host_interface *alt = intf->cur_altsetting;
 	struct usb_host_endpoint *ep_intr = alt->endpoint + 2;
-	struct urb *urb;
 	int node, i;
-	u8 *buf;
 
 	node = netdev->dev.parent ? dev_to_node(netdev->dev.parent) : -1;
 
 	spin_lock_init(&tp->rx_lock);
 	spin_lock_init(&tp->tx_lock);
+	INIT_LIST_HEAD(&tp->rx_info);
 	INIT_LIST_HEAD(&tp->tx_free);
 	INIT_LIST_HEAD(&tp->rx_done);
 	skb_queue_head_init(&tp->tx_queue);
 	skb_queue_head_init(&tp->rx_queue);
+	atomic_set(&tp->rx_count, 0);
 
 	for (i = 0; i < RTL8152_MAX_RX; i++) {
-		buf = kmalloc_node(tp->rx_buf_sz, GFP_KERNEL, node);
-		if (!buf)
+		if (!alloc_rx_agg(tp, GFP_KERNEL))
 			goto err1;
-
-		if (buf != rx_agg_align(buf)) {
-			kfree(buf);
-			buf = kmalloc_node(tp->rx_buf_sz + RX_ALIGN, GFP_KERNEL,
-					   node);
-			if (!buf)
-				goto err1;
-		}
-
-		urb = usb_alloc_urb(0, GFP_KERNEL);
-		if (!urb) {
-			kfree(buf);
-			goto err1;
-		}
-
-		INIT_LIST_HEAD(&tp->rx_info[i].list);
-		tp->rx_info[i].context = tp;
-		tp->rx_info[i].urb = urb;
-		tp->rx_info[i].buffer = buf;
-		tp->rx_info[i].head = rx_agg_align(buf);
 	}
 
 	for (i = 0; i < RTL8152_MAX_TX; i++) {
+		struct urb *urb;
+		u8 *buf;
+
 		buf = kmalloc_node(agg_buf_sz, GFP_KERNEL, node);
 		if (!buf)
 			goto err1;
@@ -2331,44 +2379,64 @@ static void rxdy_gated_en(struct r8152 *tp, bool enable)
 
 static int rtl_start_rx(struct r8152 *tp)
 {
-	int i, ret = 0;
+	struct rx_agg *agg, *agg_next;
+	struct list_head tmp_list;
+	unsigned long flags;
+	int ret = 0;
 
-	INIT_LIST_HEAD(&tp->rx_done);
-	for (i = 0; i < RTL8152_MAX_RX; i++) {
-		INIT_LIST_HEAD(&tp->rx_info[i].list);
-		ret = r8152_submit_rx(tp, &tp->rx_info[i], GFP_KERNEL);
-		if (ret)
-			break;
-	}
+	INIT_LIST_HEAD(&tmp_list);
 
-	if (ret && ++i < RTL8152_MAX_RX) {
-		struct list_head rx_queue;
-		unsigned long flags;
+	spin_lock_irqsave(&tp->rx_lock, flags);
 
-		INIT_LIST_HEAD(&rx_queue);
+	INIT_LIST_HEAD(&tp->rx_done);
 
-		do {
-			struct rx_agg *agg = &tp->rx_info[i++];
-			struct urb *urb = agg->urb;
+	list_splice_init(&tp->rx_info, &tmp_list);
 
-			urb->actual_length = 0;
-			list_add_tail(&agg->list, &rx_queue);
-		} while (i < RTL8152_MAX_RX);
+	spin_unlock_irqrestore(&tp->rx_lock, flags);
 
-		spin_lock_irqsave(&tp->rx_lock, flags);
-		list_splice_tail(&rx_queue, &tp->rx_done);
-		spin_unlock_irqrestore(&tp->rx_lock, flags);
+	list_for_each_entry_safe(agg, agg_next, &tmp_list, info_list) {
+		INIT_LIST_HEAD(&agg->list);
+
+		if (ret < 0)
+			list_add_tail(&agg->list, &tp->rx_done);
+		else
+			ret = r8152_submit_rx(tp, agg, GFP_KERNEL);
 	}
 
+	spin_lock_irqsave(&tp->rx_lock, flags);
+	WARN_ON(!list_empty(&tp->rx_info));
+	list_splice(&tmp_list, &tp->rx_info);
+	spin_unlock_irqrestore(&tp->rx_lock, flags);
+
 	return ret;
 }
 
 static int rtl_stop_rx(struct r8152 *tp)
 {
-	int i;
+	struct rx_agg *agg, *agg_next;
+	struct list_head tmp_list;
+	unsigned long flags;
+
+	INIT_LIST_HEAD(&tmp_list);
+
+	/* The usb_kill_urb() couldn't be used in atomic.
+	 * Therefore, move the list of rx_info to a tmp one.
+	 * Then, list_for_each_entry_safe could be used without
+	 * spin lock.
+	 */
+
+	spin_lock_irqsave(&tp->rx_lock, flags);
+	list_splice_init(&tp->rx_info, &tmp_list);
+	spin_unlock_irqrestore(&tp->rx_lock, flags);
+
+	list_for_each_entry_safe(agg, agg_next, &tmp_list, info_list)
+		usb_kill_urb(agg->urb);
 
-	for (i = 0; i < RTL8152_MAX_RX; i++)
-		usb_kill_urb(tp->rx_info[i].urb);
+	/* Move back the list of temp to the rx_info */
+	spin_lock_irqsave(&tp->rx_lock, flags);
+	WARN_ON(!list_empty(&tp->rx_info));
+	list_splice(&tmp_list, &tp->rx_info);
+	spin_unlock_irqrestore(&tp->rx_lock, flags);
 
 	while (!skb_queue_empty(&tp->rx_queue))
 		dev_kfree_skb(__skb_dequeue(&tp->rx_queue));
-- 
2.21.0


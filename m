Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2403B78DBAB
	for <lists+linux-usb@lfdr.de>; Wed, 30 Aug 2023 20:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235986AbjH3Sbb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Aug 2023 14:31:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242513AbjH3I5O (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Aug 2023 04:57:14 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1340CC9
        for <linux-usb@vger.kernel.org>; Wed, 30 Aug 2023 01:57:09 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RbJ683x9nzrSJK;
        Wed, 30 Aug 2023 16:55:28 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 30 Aug
 2023 16:57:07 +0800
From:   Jinjie Ruan <ruanjinjie@huawei.com>
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next] usbmon: Use list_for_each_entry() helper
Date:   Wed, 30 Aug 2023 16:56:58 +0800
Message-ID: <20230830085658.527752-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Convert list_for_each() to list_for_each_entry() so that the p/pos
list_head pointer and list_entry() call are no longer needed, which
can reduce a few lines of code. No functional changed.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/usb/mon/mon_main.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/mon/mon_main.c b/drivers/usb/mon/mon_main.c
index 9812d102a005..824904abe76f 100644
--- a/drivers/usb/mon/mon_main.c
+++ b/drivers/usb/mon/mon_main.c
@@ -81,15 +81,12 @@ void mon_reader_del(struct mon_bus *mbus, struct mon_reader *r)
 static void mon_bus_submit(struct mon_bus *mbus, struct urb *urb)
 {
 	unsigned long flags;
-	struct list_head *pos;
 	struct mon_reader *r;
 
 	spin_lock_irqsave(&mbus->lock, flags);
 	mbus->cnt_events++;
-	list_for_each (pos, &mbus->r_list) {
-		r = list_entry(pos, struct mon_reader, r_link);
+	list_for_each_entry(r, &mbus->r_list, r_link)
 		r->rnf_submit(r->r_data, urb);
-	}
 	spin_unlock_irqrestore(&mbus->lock, flags);
 }
 
@@ -108,15 +105,12 @@ static void mon_submit(struct usb_bus *ubus, struct urb *urb)
 static void mon_bus_submit_error(struct mon_bus *mbus, struct urb *urb, int error)
 {
 	unsigned long flags;
-	struct list_head *pos;
 	struct mon_reader *r;
 
 	spin_lock_irqsave(&mbus->lock, flags);
 	mbus->cnt_events++;
-	list_for_each (pos, &mbus->r_list) {
-		r = list_entry(pos, struct mon_reader, r_link);
+	list_for_each_entry(r, &mbus->r_list, r_link)
 		r->rnf_error(r->r_data, urb, error);
-	}
 	spin_unlock_irqrestore(&mbus->lock, flags);
 }
 
@@ -135,15 +129,12 @@ static void mon_submit_error(struct usb_bus *ubus, struct urb *urb, int error)
 static void mon_bus_complete(struct mon_bus *mbus, struct urb *urb, int status)
 {
 	unsigned long flags;
-	struct list_head *pos;
 	struct mon_reader *r;
 
 	spin_lock_irqsave(&mbus->lock, flags);
 	mbus->cnt_events++;
-	list_for_each (pos, &mbus->r_list) {
-		r = list_entry(pos, struct mon_reader, r_link);
+	list_for_each_entry(r, &mbus->r_list, r_link)
 		r->rnf_complete(r->r_data, urb, status);
-	}
 	spin_unlock_irqrestore(&mbus->lock, flags);
 }
 
@@ -165,11 +156,9 @@ static void mon_complete(struct usb_bus *ubus, struct urb *urb, int status)
 static void mon_stop(struct mon_bus *mbus)
 {
 	struct usb_bus *ubus;
-	struct list_head *p;
 
 	if (mbus == &mon_bus0) {
-		list_for_each (p, &mon_buses) {
-			mbus = list_entry(p, struct mon_bus, bus_link);
+		list_for_each_entry(mbus, &mon_buses, bus_link) {
 			/*
 			 * We do not change nreaders here, so rely on mon_lock.
 			 */
@@ -332,14 +321,12 @@ static void mon_bus0_init(void)
  */
 struct mon_bus *mon_bus_lookup(unsigned int num)
 {
-	struct list_head *p;
 	struct mon_bus *mbus;
 
 	if (num == 0) {
 		return &mon_bus0;
 	}
-	list_for_each (p, &mon_buses) {
-		mbus = list_entry(p, struct mon_bus, bus_link);
+	list_for_each_entry(mbus, &mon_buses, bus_link) {
 		if (mbus->u_bus->busnum == num) {
 			return mbus;
 		}
-- 
2.34.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8524DD541
	for <lists+linux-usb@lfdr.de>; Fri, 18 Mar 2022 08:32:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233104AbiCRHdm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Mar 2022 03:33:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231326AbiCRHdl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Mar 2022 03:33:41 -0400
Received: from ZXSHCAS2.zhaoxin.com (ZXSHCAS2.zhaoxin.com [203.148.12.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 373843207E;
        Fri, 18 Mar 2022 00:32:21 -0700 (PDT)
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by ZXSHCAS2.zhaoxin.com
 (10.28.252.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 18 Mar
 2022 15:32:17 +0800
Received: from [10.29.8.49] (10.29.8.49) by zxbjmbx1.zhaoxin.com
 (10.29.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 18 Mar
 2022 15:32:15 +0800
Message-ID: <dedb789b-c1bb-34af-7887-78a3fc627e75@zhaoxin.com>
Date:   Fri, 18 Mar 2022 15:32:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
From:   "WeitaoWang-oc@zhaoxin.com" <WeitaoWang-oc@zhaoxin.com>
Subject: [PATCH] USB: Fix xhci ERDP update issue
To:     <mathias.nyman@intel.com>, <hzpeterchen@gmail.com>,
        <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <TonyWWang-oc@zhaoxin.com>, <weitaowang@zhaoxin.com>,
        <CobeChen@zhaoxin.com>, <TimGuo@zhaoxin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.29.8.49]
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 zxbjmbx1.zhaoxin.com (10.29.252.163)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On some situations, software handles TRB events slower than adding TRBs.
If the number of TRB events to be processed in a given interrupt is 256.
The local variable "event_ring_deq" that records in interrupt handler
is equal to software_dequeue. It will cause driver not update ERDP,then
software dequeue pointer is out of sync with ERDP on interrupt exit.
On the next interrupt, the event ring may full but driver will not
update ERDP as software_dequeue is equal to ERDP.

[  536.377115] xhci_hcd 0000:00:12.0: ERROR unknown event type 37
[  566.933173] sd 8:0:0:0: [sdb] tag#27 uas_eh_abort_handler 0 uas-tag 7 
inflight: CMD OUT
[  566.933181] sd 8:0:0:0: [sdb] tag#27 CDB: Write(10) 2a 00 17 71 e6 78 
00 00 08 00
[  572.041186] xhci_hcd On some situataions,the0000:00:12.0: xHCI host 
not responding to stop endpoint command.
[  572.057193] xhci_hcd 0000:00:12.0: Host halt failed, -110
[  572.057196] xhci_hcd 0000:00:12.0: xHCI host controller not 
responding, assume dead
[  572.057236] sd 8:0:0:0: [sdb] tag#26 uas_eh_abort_handler 0 uas-tag 6 
inflight: CMD
[  572.057240] sd 8:0:0:0: [sdb] tag#26 CDB: Write(10) 2a 00 38 eb cc d8 
00 00 08 00
[  572.057244] sd 8:0:0:0: [sdb] tag#25 uas_eh_abort_handler 0 uas-tag 5 
inflight: CMD

Fixed this issue by update software record local variable when handles 
128 TRB events.

Signed-off-by: Weitao Wang <WeitaoWang-oc@zhaoxin.com>
---
  drivers/usb/host/xhci-ring.c | 1 +
  1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index d0b6806..f970799 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3141,6 +3141,7 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
  		if (event_loop++ < TRBS_PER_SEGMENT / 2)
  			continue;
  		xhci_update_erst_dequeue(xhci, event_ring_deq);
+		event_ring_deq = xhci->event_ring->dequeue;

  		/* ring is half-full, force isoc trbs to interrupt more often */
  		if (xhci->isoc_bei_interval > AVOID_BEI_INTERVAL_MIN)
-- 
2.7.4

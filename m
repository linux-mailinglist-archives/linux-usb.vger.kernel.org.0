Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21AA157BFD2
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jul 2022 23:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbiGTVvT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Jul 2022 17:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbiGTVvS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Jul 2022 17:51:18 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91E5542AD0
        for <linux-usb@vger.kernel.org>; Wed, 20 Jul 2022 14:51:17 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oEHb9-0004FY-Vt; Wed, 20 Jul 2022 23:51:16 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oEHb9-002Bvu-9j; Wed, 20 Jul 2022 23:51:15 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oEHb8-004RKu-98; Wed, 20 Jul 2022 23:51:14 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, kernel@pengutronix.de
Subject: [PATCH 2/2] usb: dwc3: trace: add Start of Frame Number to trace event
Date:   Wed, 20 Jul 2022 23:51:13 +0200
Message-Id: <20220720215113.1058313-2-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720215113.1058313-1-m.grzeschik@pengutronix.de>
References: <20220720215113.1058313-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Having the Start of Frame Number in the trace data is useful for debugging.
This patch adds the (micro)frame number in which the last packet of the
TRB's buffer was transmitted or received to the trace output.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/dwc3/trace.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/trace.h b/drivers/usb/dwc3/trace.h
index cb998ba50fea9d..1975aec8d36d85 100644
--- a/drivers/usb/dwc3/trace.h
+++ b/drivers/usb/dwc3/trace.h
@@ -241,7 +241,7 @@ DECLARE_EVENT_CLASS(dwc3_log_trb,
 		__entry->enqueue = dep->trb_enqueue;
 		__entry->dequeue = dep->trb_dequeue;
 	),
-	TP_printk("%s: trb %p (E%d:D%d) buf %08x%08x size %s%d ctrl %08x (%c%c%c%c:%c%c:%s)",
+	TP_printk("%s: trb %p (E%d:D%d) buf %08x%08x size %s%d ctrl %08x sofn %08x (%c%c%c%c:%c%c:%s)",
 		__get_str(name), __entry->trb, __entry->enqueue,
 		__entry->dequeue, __entry->bph, __entry->bpl,
 		({char *s;
@@ -267,6 +267,7 @@ DECLARE_EVENT_CLASS(dwc3_log_trb,
 			s = "";
 		} s; }),
 		DWC3_TRB_SIZE_LENGTH(__entry->size), __entry->ctrl,
+		DWC3_TRB_CTRL_GET_SID_SOFN(__entry->ctrl),
 		__entry->ctrl & DWC3_TRB_CTRL_HWO ? 'H' : 'h',
 		__entry->ctrl & DWC3_TRB_CTRL_LST ? 'L' : 'l',
 		__entry->ctrl & DWC3_TRB_CTRL_CHN ? 'C' : 'c',
-- 
2.30.2


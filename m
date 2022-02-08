Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61BE44AE246
	for <lists+linux-usb@lfdr.de>; Tue,  8 Feb 2022 20:31:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386082AbiBHTbp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Feb 2022 14:31:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233618AbiBHTbo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Feb 2022 14:31:44 -0500
Received: from mxout04.lancloud.ru (mxout04.lancloud.ru [45.84.86.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB704C0612C0
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 11:31:40 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 345AE20A9827
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
To:     Mathias Nyman <mathias.nyman@intel.com>,
        <"Greg Kroah-Hartman <gregkh"@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] usb: host: xhci: drop redundant checks
Organization: Open Mobile Platform
Message-ID: <af8665f5-bc6e-2770-0f7f-750e804511d6@omp.ru>
Date:   Tue, 8 Feb 2022 22:31:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In xhci_endpoint_{disable|}() the expression '&vdev->eps[ep_index]' just
cannot be NULL, so the checks have no sense at all...

Found by Linux Verification Center (linuxtesting.org) with the SVACE static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
 drivers/usb/host/xhci.c |    4 ----
 1 file changed, 4 deletions(-)

Index: usb/drivers/usb/host/xhci.c
===================================================================
--- usb.orig/drivers/usb/host/xhci.c
+++ usb/drivers/usb/host/xhci.c
@@ -3150,8 +3150,6 @@ rescan:
 
 	ep_index = xhci_get_endpoint_index(&host_ep->desc);
 	ep = &vdev->eps[ep_index];
-	if (!ep)
-		goto done;
 
 	/* wait for hub_tt_work to finish clearing hub TT */
 	if (ep->ep_state & EP_CLEARING_TT) {
@@ -3209,8 +3207,6 @@ static void xhci_endpoint_reset(struct u
 		return;
 	ep_index = xhci_get_endpoint_index(&host_ep->desc);
 	ep = &vdev->eps[ep_index];
-	if (!ep)
-		return;
 
 	/* Bail out if toggle is already being cleared by a endpoint reset */
 	spin_lock_irqsave(&xhci->lock, flags);

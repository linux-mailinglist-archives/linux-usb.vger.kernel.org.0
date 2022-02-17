Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 225A34BA724
	for <lists+linux-usb@lfdr.de>; Thu, 17 Feb 2022 18:30:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243732AbiBQRao (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Feb 2022 12:30:44 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234264AbiBQRae (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Feb 2022 12:30:34 -0500
Received: from mxout04.lancloud.ru (mxout04.lancloud.ru [45.84.86.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89DFF2731C2
        for <linux-usb@vger.kernel.org>; Thu, 17 Feb 2022 09:30:17 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru EA35C209D4F2
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH v2] usb: host: ehci-q: make qtd_fill() return *unsigned int*
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Organization: Open Mobile Platform
Message-ID: <8c64fdeb-5857-8cb3-cfd8-0c248a14b909@omp.ru>
Date:   Thu, 17 Feb 2022 20:30:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

At the end of qtd_fill(), we assign the 'int count' variable to the 'size_t
length' field of 'struct ehci_qtd' -- which implies a problematic type cast.
Let's make that variable and the function's result *unsigned int* instead...

Found by Linux Verification Center (linuxtesting.org) with the SVACE static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
This patch is against the 'usb-next' branch of Greg KH's 'usb.git' repo.

Changes in version 2:
- changed 'u16' to *unsigned int* everywhere, repordering the declarations;
- updated the type of the 'this_qtd_len' local variable qh_urb_transaction();
- rewrote the patch description.

 drivers/usb/host/ehci-q.c |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

Index: usb/drivers/usb/host/ehci-q.c
===================================================================
--- usb.orig/drivers/usb/host/ehci-q.c
+++ usb/drivers/usb/host/ehci-q.c
@@ -33,12 +33,13 @@
 
 /* fill a qtd, returning how much of the buffer we were able to queue up */
 
-static int
+static unsigned int
 qtd_fill(struct ehci_hcd *ehci, struct ehci_qtd *qtd, dma_addr_t buf,
 		  size_t len, int token, int maxpacket)
 {
-	int	i, count;
+	unsigned int count;
 	u64	addr = buf;
+	int	i;
 
 	/* one buffer entry per 4K ... first might be short or unaligned */
 	qtd->hw_buf[0] = cpu_to_hc32(ehci, (u32)addr);
@@ -652,7 +653,7 @@ qh_urb_transaction (
 	 * and may serve as a control status ack
 	 */
 	for (;;) {
-		int this_qtd_len;
+		unsigned int this_qtd_len;
 
 		this_qtd_len = qtd_fill(ehci, qtd, buf, this_sg_len, token,
 				maxpacket);

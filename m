Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3B84B922D
	for <lists+linux-usb@lfdr.de>; Wed, 16 Feb 2022 21:19:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbiBPUT1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Feb 2022 15:19:27 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbiBPUT1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Feb 2022 15:19:27 -0500
Received: from mxout04.lancloud.ru (mxout04.lancloud.ru [45.84.86.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2930E276D7A
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 12:19:12 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru A39DC20ABB61
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] usb: host: ehci-q: make qtd_fill() return 'u16'
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Organization: Open Mobile Platform
Message-ID: <7f2e3194-c897-7ffd-756e-8a9c93d652cd@omp.ru>
Date:   Wed, 16 Feb 2022 23:19:07 +0300
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
length' field of 'struct ehci_qtd'.  In order not to mix the *signed* and
*unsigned* values let's make that variable and the function's result 'u16'
as qTD's maximum length is a 15-bit quantity anyway...

Found by Linux Verification Center (linuxtesting.org) with the SVACE static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
This patch is against the 'usb-next' branch of Greg KH's 'usb.git' repo.

 drivers/usb/host/ehci-q.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

Index: usb/drivers/usb/host/ehci-q.c
===================================================================
--- usb.orig/drivers/usb/host/ehci-q.c
+++ usb/drivers/usb/host/ehci-q.c
@@ -33,12 +33,13 @@
 
 /* fill a qtd, returning how much of the buffer we were able to queue up */
 
-static int
+static u16
 qtd_fill(struct ehci_hcd *ehci, struct ehci_qtd *qtd, dma_addr_t buf,
 		  size_t len, int token, int maxpacket)
 {
-	int	i, count;
 	u64	addr = buf;
+	u16	count;
+	int	i;
 
 	/* one buffer entry per 4K ... first might be short or unaligned */
 	qtd->hw_buf[0] = cpu_to_hc32(ehci, (u32)addr);

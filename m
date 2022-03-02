Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 597924CB09C
	for <lists+linux-usb@lfdr.de>; Wed,  2 Mar 2022 22:03:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242079AbiCBVD6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Mar 2022 16:03:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232218AbiCBVD4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Mar 2022 16:03:56 -0500
Received: from mxout04.lancloud.ru (mxout04.lancloud.ru [45.84.86.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED60B9FEE
        for <linux-usb@vger.kernel.org>; Wed,  2 Mar 2022 13:03:06 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 8736A20ADE83
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] usb: host: xhci-dbgtty: fix check in dbc_tty_write()
To:     Mathias Nyman <mathias.nyman@intel.com>,
        <linux-usb@vger.kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Organization: Open Mobile Platform
Message-ID: <b082aae4-8366-91a6-e8ff-d8cbbff77b09@omp.ru>
Date:   Thu, 3 Mar 2022 00:03:01 +0300
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

The 'int count' parameter of the tty write() method gets assigned to
*unsigned long* local variable in the fifo_in() macro which implies
a problematic type cast.  Fix the 'count' check before the fifo_in()
invocation to account for the signed type of the 'count' parameter...

Found by Linux Verification Center (linuxtesting.org) with the SVACE static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
 drivers/usb/host/xhci-dbgtty.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: usb/drivers/usb/host/xhci-dbgtty.c
===================================================================
--- usb.orig/drivers/usb/host/xhci-dbgtty.c
+++ usb/drivers/usb/host/xhci-dbgtty.c
@@ -216,7 +216,7 @@ static int dbc_tty_write(struct tty_stru
 	unsigned long		flags;
 
 	spin_lock_irqsave(&port->port_lock, flags);
-	if (count)
+	if (count > 0)
 		count = kfifo_in(&port->write_fifo, buf, count);
 	dbc_start_tx(port);
 	spin_unlock_irqrestore(&port->port_lock, flags);

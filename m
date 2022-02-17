Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7086C4B9571
	for <lists+linux-usb@lfdr.de>; Thu, 17 Feb 2022 02:25:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbiBQBXO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Feb 2022 20:23:14 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbiBQBXN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Feb 2022 20:23:13 -0500
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 114C61F227A
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 17:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1645060980; x=1676596980;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J1RN0m4A0+x6Nk/R/Nw0cTIQU2lhfoSTXyrNvNmNuaY=;
  b=Smi9LXN6h63s0RPU/W5WZDNlIYZ+QLwlsJfgrG6YdNgxDii5JFUsWUdI
   M4gWCgoaWOWLJA+jNoqbr5xvMY0yolWIJ/jLIl0yggCPi+9Sxi5xnkaDf
   iZy/MncaBPrRaOPYwaUnv4r75r4n5OvR8Ykrh19XFo9JdZoUkNNcj4be6
   k=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 16 Feb 2022 17:22:59 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 17:22:59 -0800
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 16 Feb 2022 17:22:59 -0800
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 16 Feb 2022 17:22:57 -0800
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH v2 1/5] usb: host: xhci: use ffs() in xhci_mem_init()
Date:   Thu, 17 Feb 2022 09:22:47 +0800
Message-ID: <1645060971-27141-2-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1645060971-27141-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1645060971-27141-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The for loop to find page size bit can be replaced with ffs().

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: move assignment out of if condition

 drivers/usb/host/xhci-mem.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 0e31206..ad681e2 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2395,11 +2395,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	page_size = readl(&xhci->op_regs->page_size);
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"Supported page size register = 0x%x", page_size);
-	for (i = 0; i < 16; i++) {
-		if ((0x1 & page_size) != 0)
-			break;
-		page_size = page_size >> 1;
-	}
+	i = ffs(page_size);
 	if (i < 16)
 		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"Supported page size of %iK", (1 << (i+12)) / 1024);
-- 
2.7.4


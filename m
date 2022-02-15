Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B03E4B76C4
	for <lists+linux-usb@lfdr.de>; Tue, 15 Feb 2022 21:49:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237305AbiBOUJi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Feb 2022 15:09:38 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbiBOUJh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Feb 2022 15:09:37 -0500
Received: from mxout03.lancloud.ru (mxout03.lancloud.ru [45.84.86.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A59AB10A6
        for <linux-usb@vger.kernel.org>; Tue, 15 Feb 2022 12:09:25 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 2442F2061799
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] usb: host: xhci: make 'usec' parameter of xhci_handshake()
 *unsigned*
To:     Mathias Nyman <mathias.nyman@intel.com>,
        <linux-usb@vger.kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Organization: Open Mobile Platform
Message-ID: <e8e27f4c-489e-08c2-7495-7bfe07bf6f97@omp.ru>
Date:   Tue, 15 Feb 2022 23:09:21 +0300
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

The negative timeouts hardly make sense, and the 'usec' parameter of
xhci_handshake() gets assigned to a 'u64' typed local variable in
readl_poll_timeout_atomic() anyways...

Found by Linux Verification Center (linuxtesting.org) with the SVACE static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
This patch is against the 'usb-next' branch of Greg KH's 'usb.git' repo.

 drivers/usb/host/xhci.c |    2 +-
 drivers/usb/host/xhci.h |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

Index: usb/drivers/usb/host/xhci.c
===================================================================
--- usb.orig/drivers/usb/host/xhci.c
+++ usb/drivers/usb/host/xhci.c
@@ -65,7 +65,7 @@ static bool td_on_ring(struct xhci_td *t
  * handshake done).  There are two failure modes:  "usec" have passed (major
  * hardware flakeout), or the register reads as all-ones (hardware removed).
  */
-int xhci_handshake(void __iomem *ptr, u32 mask, u32 done, int usec)
+int xhci_handshake(void __iomem *ptr, u32 mask, u32 done, unsigned int usec)
 {
 	u32	result;
 	int	ret;
Index: usb/drivers/usb/host/xhci.h
===================================================================
--- usb.orig/drivers/usb/host/xhci.h
+++ usb/drivers/usb/host/xhci.h
@@ -2083,7 +2083,7 @@ void xhci_free_container_ctx(struct xhci
 
 /* xHCI host controller glue */
 typedef void (*xhci_get_quirks_t)(struct device *, struct xhci_hcd *);
-int xhci_handshake(void __iomem *ptr, u32 mask, u32 done, int usec);
+int xhci_handshake(void __iomem *ptr, u32 mask, u32 done, unsigned int usec);
 void xhci_quiesce(struct xhci_hcd *xhci);
 int xhci_halt(struct xhci_hcd *xhci);
 int xhci_start(struct xhci_hcd *xhci);

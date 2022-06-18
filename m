Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C71FB55045C
	for <lists+linux-usb@lfdr.de>; Sat, 18 Jun 2022 14:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232514AbiFRMGb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 Jun 2022 08:06:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231329AbiFRMG3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 18 Jun 2022 08:06:29 -0400
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88E9ADF32
        for <linux-usb@vger.kernel.org>; Sat, 18 Jun 2022 05:06:26 -0700 (PDT)
Received: from [192.168.1.103] (178.176.74.141) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Sat, 18 Jun
 2022 15:06:16 +0300
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] usb: musb: core: drop redundant checks
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bin Liu <b-liu@ti.com>, <linux-usb@vger.kernel.org>
Organization: Open Mobile Platform
Message-ID: <3f8f60d9-f1b5-6b2c-1222-39b156151a22@omp.ru>
Date:   Sat, 18 Jun 2022 15:06:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [178.176.74.141]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 06/18/2022 11:51:19
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 171212 [Jun 18 2022]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 490 490 64947c9fe6ec4170c45683de1592f92a9c3bac07
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.74.141 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.74.141 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info: 178.176.74.141:7.1.2;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.74.141
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 06/18/2022 11:54:00
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 6/18/2022 10:23:00 AM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In musb_{save|restore}_context() the expression '&musb->endpoints[i]' just
cannot be NULL, so the checks have no sense at all -- after dropping them,
the local variables 'hw_ep' are no longer necessary, so drop them as well.

Found by Linux Verification Center (linuxtesting.org) with the SVACE static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
This patch is against the 'usb-next' branch of Greg KH's 'usb.git' repo.

 drivers/usb/musb/musb_core.c |   16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

Index: usb/drivers/usb/musb/musb_core.c
===================================================================
--- usb.orig/drivers/usb/musb/musb_core.c
+++ usb/drivers/usb/musb/musb_core.c
@@ -2684,13 +2684,7 @@ static void musb_save_context(struct mus
 	musb->context.devctl = musb_readb(musb_base, MUSB_DEVCTL);
 
 	for (i = 0; i < musb->config->num_eps; ++i) {
-		struct musb_hw_ep	*hw_ep;
-
-		hw_ep = &musb->endpoints[i];
-		if (!hw_ep)
-			continue;
-
-		epio = hw_ep->regs;
+		epio = musb->endpoints[i].regs;
 		if (!epio)
 			continue;
 
@@ -2765,13 +2759,7 @@ static void musb_restore_context(struct
 		musb_writeb(musb_base, MUSB_DEVCTL, musb->context.devctl);
 
 	for (i = 0; i < musb->config->num_eps; ++i) {
-		struct musb_hw_ep	*hw_ep;
-
-		hw_ep = &musb->endpoints[i];
-		if (!hw_ep)
-			continue;
-
-		epio = hw_ep->regs;
+		epio = musb->endpoints[i].regs;
 		if (!epio)
 			continue;
 

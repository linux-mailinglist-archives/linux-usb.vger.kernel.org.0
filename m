Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 667015E724E
	for <lists+linux-usb@lfdr.de>; Fri, 23 Sep 2022 05:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbiIWDEO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Sep 2022 23:04:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232142AbiIWDDh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Sep 2022 23:03:37 -0400
Received: from mailgw.kylinos.cn (unknown [124.126.103.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DEA8E11CA
        for <linux-usb@vger.kernel.org>; Thu, 22 Sep 2022 20:03:30 -0700 (PDT)
X-UUID: 7fafa513122148f3bf8609e04f54a17d-20220923
Message-ID: <1663902249837086.19.seg@mailgw>
X-Spam-Fingerprint: 0
X-GW-Reason: 11109
X-Spam-Reason: Heuristic_Spam_Fraud_546F022B
X-Content-Feature: ica/max.line-size 82
        audit/email.address 3
        dict/contack 1
        dict/transaction 1
        meta/cnt.alert 1
X-CPASD-INFO: a73363c32bcf4a7596fe5bbb62ba65cb@qodtU2NlkWNegqWyg6SCb1lnmJFVsaS
        cVmKQkWJVuLSMbFJkYl1ZgYFqUWJnX2FZVXp4blJgYGJcWHh4lHKPVGBeYIJUdJOAo3FTY2Rj
X-CLOUD-ID: a73363c32bcf4a7596fe5bbb62ba65cb
X-CPASD-SUMMARY: SIP:-1,APTIP:-2.0,KEY:0.0,FROMBLOCK:1,OB:0.0,URL:-5,TVAL:172.
        0,ESV:0.0,ECOM:-5.0,ML:12.0,FD:0.0,CUTS:168.0,IP:-2.0,MAL:-5.0,PHF:-5.0,PHC:-
        5.0,SPF:4.0,EDMS:-5,IPLABEL:4480.0,FROMTO:0,AD:0,FFOB:0.0,CFOB:0.0,SPC:0,SIG:
        -5,AUF:42,DUF:5470,ACD:88,DCD:88,SL:0,EISP:0,AG:0,CFC:0.476,CFSR:0.067,UAT:0,
        RAF:0,IMG:-5.0,DFA:0,DTA:0,IBL:-2.0,ADI:-5,SBL:0,REDM:0,REIP:0,ESB:0,ATTNUM:0
        ,EAF:0,CID:-5.0,VERSION:2.3.17
X-CPASD-ID: 7fafa513122148f3bf8609e04f54a17d-20220923
X-CPASD-BLOCK: 12
X-CPASD-STAGE: 1
X-UUID: 7fafa513122148f3bf8609e04f54a17d-20220923
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(112.64.161.44)] by mailgw
        (envelope-from <zenghongling@kylinos.cn>)
        (Generic MTA)
        with ESMTP id 837780238; Fri, 23 Sep 2022 10:46:58 +0800
From:   Hongling Zeng <zenghongling@kylinos.cn>
To:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        zhongling0719@126.com, Hongling Zeng <zenghongling@kylinos.cn>
Subject: [PATCH v8 v8 3/3] uas: ignore UAS for Thinkplus chips
Date:   Fri, 23 Sep 2022 10:46:35 +0800
X-Mailer: git-send-email 2.1.0
X-Spam-Status: No, score=0.5 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        MAY_BE_FORGED,MSGID_FROM_MTA_HEADER,RDNS_DYNAMIC,SPF_HELO_NONE,
        T_SPF_PERMERROR,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The UAS mode of Thinkplus(0x17ef, 0x3899) is reported to influence 
performance and trigger kernel panic on several platforms with the 
following error message:

[   39.702439] xhci_hcd 0000:0c:00.3: ERROR Transfer event for disabled
               endpoint or incorrect stream ring
[   39.702442] xhci_hcd 0000:0c:00.3: @000000026c61f810 00000000 00000000
               1b000000 05038000

[  720.545894][13] Workqueue: usb_hub_wq hub_event
[  720.550971][13]  ffff88026c143c38 0000000000016300 ffff8802755bb900 ffff880
                    26cb80000
[  720.559673][13]  ffff88026c144000 ffff88026ca88100 0000000000000000 ffff880
                    26cb80000
[  720.568374][13]  ffff88026cb80000 ffff88026c143c50 ffffffff8186ae25 ffff880
                    26ca880f8
[  720.577076][13] Call Trace:
[  720.580201][13]  [<ffffffff8186ae25>] schedule+0x35/0x80
[  720.586137][13]  [<ffffffff8186b0ce>] schedule_preempt_disabled+0xe/0x10
[  720.593623][13]  [<ffffffff8186cb94>] __mutex_lock_slowpath+0x164/0x1e0
[  720.601012][13]  [<ffffffff8186cc3f>] mutex_lock+0x2f/0x40
[  720.607141][13]  [<ffffffff8162b8e9>] usb_disconnect+0x59/0x290

Falling back to USB mass storage can solve this problem, so ignore UAS
function of this chip.

Acked-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
Change for v8
 -Add acked for patch 3/3 (thinkplus(0x17ef, 0x3899))
---
 drivers/usb/storage/unusual_uas.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
index 8a18d58..156e89c 100644
--- a/drivers/usb/storage/unusual_uas.h
+++ b/drivers/usb/storage/unusual_uas.h
@@ -198,6 +198,13 @@ UNUSUAL_DEV(0x154b, 0xf00d, 0x0000, 0x9999,
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_NO_ATA_1X),
 
+/* Reported-by: Hongling Zeng <zenghongling@kylinos.cn> */
+UNUSUAL_DEV(0x17ef, 0x3899, 0x0000, 0x9999,
+		"Thinkplus",
+		"External HDD",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_IGNORE_UAS),
+
 /* Reported-by: Hans de Goede <hdegoede@redhat.com> */
 UNUSUAL_DEV(0x2109, 0x0711, 0x0000, 0x9999,
 		"VIA",
-- 
2.1.0


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85E3C5B1298
	for <lists+linux-usb@lfdr.de>; Thu,  8 Sep 2022 04:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbiIHCmr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Sep 2022 22:42:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbiIHCmq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Sep 2022 22:42:46 -0400
Received: from mailgw.kylinos.cn (unknown [124.126.103.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C54898E457
        for <linux-usb@vger.kernel.org>; Wed,  7 Sep 2022 19:42:39 -0700 (PDT)
X-UUID: ecf105ea691f4745a26b2378c255d676-20220907
Message-ID: <1662604981055928.8.seg@mailgw>
X-Spam-Fingerprint: 0
X-GW-Reason: 11109
X-Spam-Reason: Heuristic_Spam_Fraud_546F022B
X-Content-Feature: ica/max.line-size 82
        audit/email.address 2
        meta/cnt.alert 1
X-CPASD-INFO: 7af3840a56ac42f1a99c6eb0a11d0bf2@gLGgU2VmXpFhVqOvg3Wxa4Fqa49WtKR
        qgWFflFyCu4SMbFJkYl1ZgYFqUWJnX2FZVXp4blJgYGJcWHh4lHKPVGBeYIJUdJOAeZuGaWZk
X-CLOUD-ID: 7af3840a56ac42f1a99c6eb0a11d0bf2
X-CPASD-SUMMARY: SIP:-1,APTIP:-2.0,KEY:0.0,FROMBLOCK:1,OB:0.0,URL:-5,TVAL:172.
        0,ESV:0.0,ECOM:-5.0,ML:12.0,FD:0.0,CUTS:154.0,IP:-2.0,MAL:-5.0,PHF:-5.0,PHC:-
        5.0,SPF:4.0,EDMS:-5,IPLABEL:4480.0,FROMTO:0,AD:0,FFOB:0.0,CFOB:6.0,SPC:0,SIG:
        -5,AUF:18,DUF:4221,ACD:72,DCD:72,SL:0,EISP:0,AG:0,CFC:0.17,CFSR:0.161,UAT:0,R
        AF:0,IMG:-5.0,DFA:0,DTA:0,IBL:-2.0,ADI:-5,SBL:0,REDM:0,REIP:0,ESB:0,ATTNUM:0,
        EAF:0,CID:-5.0,VERSION:2.3.17
X-CPASD-ID: ecf105ea691f4745a26b2378c255d676-20220907
X-CPASD-BLOCK: 12
X-CPASD-STAGE: 1
X-UUID: ecf105ea691f4745a26b2378c255d676-20220907
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain.localdomain [(112.64.161.44)] by mailgw
        (envelope-from <zenghongling@kylinos.cn>)
        (Generic MTA)
        with ESMTP id 1740127396; Wed, 07 Sep 2022 10:54:16 +0800
From:   Hongling Zeng <zenghongling@kylinos.cn>
To:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        zhongling0719@126.com, Hongling Zeng <zenghongling@kylinos.cn>
Subject: [PATCH v2 2/3] usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS
Date:   Wed,  7 Sep 2022 10:54:16 +0800
X-Mailer: git-send-email 2.1.0
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,DATE_IN_PAST_12_24,
        KHOP_HELO_FCRDNS,MSGID_FROM_MTA_HEADER,RDNS_DYNAMIC,SPF_HELO_NONE,
        T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,UNPARSEABLE_RELAY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The UAS mode of Hiksemi USB_HDD is reported to fail to work on several
platforms with the following error message, then after re-connecting the
device will be offlined and not working at all.

[  592.518442][ 2] sd 8:0:0:0: [sda] tag#17 uas_eh_abort_handler 0 uas-tag 18
                   inflight: CMD
[  592.527575][ 2] sd 8:0:0:0: [sda] tag#17 CDB: Write(10) 2a 00 03 6f 88 00 00
                   04 00 00
[  592.536330][ 2] sd 8:0:0:0: [sda] tag#0 uas_eh_abort_handler 0 uas-tag 1
                   inflight: CMD
[  592.545266][ 2] sd 8:0:0:0: [sda] tag#0 CDB: Write(10) 2a 00 07 44 1a 88 00
                   00 08 00

These disks have a broken uas implementation, the tag field of the status
iu-s is not set properly,so we need to fall-back to usb-storage.

Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
Change for v1
 - Change the email real name and the code worng place.

Change for v2
 -Change spelling error.

---
 drivers/usb/storage/unusual_uas.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
index a6bf87a..8a18d58 100644
--- a/drivers/usb/storage/unusual_uas.h
+++ b/drivers/usb/storage/unusual_uas.h
@@ -149,6 +149,13 @@ UNUSUAL_DEV(0x0bc2, 0xab2a, 0x0000, 0x9999,
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_NO_ATA_1X),
 
+/* Reported-by: Hongling Zeng <zenghongling@kylinos.cn> */
+UNUSUAL_DEV(0x0bda, 0x9210, 0x0000, 0x9999,
+		"Hiksemi",
+		"External HDD",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_IGNORE_UAS),
+
 /* Reported-by: Benjamin Tissoires <benjamin.tissoires@redhat.com> */
 UNUSUAL_DEV(0x13fd, 0x3940, 0x0000, 0x9999,
 		"Initio Corporation",
-- 
2.1.0


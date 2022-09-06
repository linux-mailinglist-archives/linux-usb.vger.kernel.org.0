Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4960A5ADE03
	for <lists+linux-usb@lfdr.de>; Tue,  6 Sep 2022 05:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238214AbiIFD2z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Sep 2022 23:28:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238415AbiIFD2Q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Sep 2022 23:28:16 -0400
Received: from mailgw.kylinos.cn (unknown [124.126.103.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3061E6C107
        for <linux-usb@vger.kernel.org>; Mon,  5 Sep 2022 20:27:48 -0700 (PDT)
X-UUID: 8f741a944b3f40968e60ae5334a07ee6-20220906
X-CPASD-INFO: 13a9b898c1e24abdab9142087e07c898@eoObWY9qZ2iPUad-g6StnoGTaWFkXlC
        HeZ9QZ5FoZViVhH5xTV5uYFV9fWtVYV9dYVR6eGxQYmBgZFJ4i3-XblBgXoZgUZB3gHWbWZRmaQ==
X-CLOUD-ID: 13a9b898c1e24abdab9142087e07c898
X-CPASD-SUMMARY: SIP:-1,APTIP:-2.0,KEY:0.0,FROMBLOCK:1,OB:0.0,URL:-5,TVAL:172.
        0,ESV:0.0,ECOM:-5.0,ML:0.0,FD:0.0,CUTS:141.0,IP:-2.0,MAL:-5.0,PHF:-5.0,PHC:-5
        .0,SPF:4.0,EDMS:-5,IPLABEL:4480.0,FROMTO:0,AD:0,FFOB:0.0,CFOB:2.0,SPC:0,SIG:-
        5,AUF:13,DUF:4113,ACD:71,DCD:71,SL:0,EISP:0,AG:0,CFC:0.167,CFSR:0.2,UAT:0,RAF
        :0,IMG:-5.0,DFA:0,DTA:0,IBL:-2.0,ADI:-5,SBL:0,REDM:0,REIP:0,ESB:0,ATTNUM:0,EA
        F:0,CID:-5.0,VERSION:2.3.17
X-CPASD-ID: 8f741a944b3f40968e60ae5334a07ee6-20220906
X-CPASD-BLOCK: 1000
X-CPASD-STAGE: 1
X-UUID: 8f741a944b3f40968e60ae5334a07ee6-20220906
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain.localdomain [(112.64.161.44)] by mailgw
        (envelope-from <zenghongling@kylinos.cn>)
        (Generic MTA)
        with ESMTP id 442656841; Tue, 06 Sep 2022 11:28:09 +0800
From:   zenghongling <zenghongling@kylinos.cn>
To:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        zhongling0719@126.com, zenghongling <zenghongling@kylinos.cn>
Subject: [PATCH 2/3] usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS
Date:   Tue,  6 Sep 2022 11:28:11 +0800
Message-Id: <1662434891-5160-1-git-send-email-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.1.0
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        RDNS_DYNAMIC,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,
        UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.6
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

Signed-off-by: zenghongling <zenghongling@kylinos.cn>
---
 linux-4.9.327/drivers/usb/storage/unusual_uas.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/linux-4.9.327/drivers/usb/storage/unusual_uas.h b/linux-4.9.327/drivers/usb/storage/unusual_uas.h
index 2fc6787..bf0bb79 100644
--- a/linux-4.9.327/drivers/usb/storage/unusual_uas.h
+++ b/linux-4.9.327/drivers/usb/storage/unusual_uas.h
@@ -141,6 +141,12 @@ UNUSUAL_DEV(0x0bc2, 0xab21, 0x0000, 0x9999,
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_NO_ATA_1X),
 
+UNUSUAL_DEV(0x0bda, 0x9210, 0x0000, 0x9999,
+		"Hiksemi",
+		"External HDD",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_IGNORE_UAS),
+
 /* Reported-by: G. Richard Bellamy <rbellamy@pteradigm.com> */
 UNUSUAL_DEV(0x0bc2, 0xab2a, 0x0000, 0x9999,
 		"Seagate",
-- 
2.1.0


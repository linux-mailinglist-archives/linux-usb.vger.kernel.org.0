Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57FD45A8CFD
	for <lists+linux-usb@lfdr.de>; Thu,  1 Sep 2022 06:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232561AbiIAE5w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Sep 2022 00:57:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231530AbiIAE5v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Sep 2022 00:57:51 -0400
Received: from mailgw.kylinos.cn (unknown [124.126.103.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5477A10F95B
        for <linux-usb@vger.kernel.org>; Wed, 31 Aug 2022 21:57:50 -0700 (PDT)
X-UUID: 310dcbdb25fa4400a39df82dd5133278-20220901
X-CPASD-INFO: 0762841faff54982b4821fdf80681029@eYdwUmVnX5aNhqiBg3yDbIJlaGJhkoS
        1empWaF9gXlmVhH5xTV5uYFV9fWtVYV9dYVR6eGxQYmBgZFJ4i3-XblBgXoZgUZB3f3lwUmpiYQ==
X-CLOUD-ID: 0762841faff54982b4821fdf80681029
X-CPASD-SUMMARY: SIP:-1,APTIP:-2.0,KEY:0.0,FROMBLOCK:1,OB:0.0,URL:-5,TVAL:173.
        0,ESV:0.0,ECOM:-5.0,ML:0.0,FD:0.0,CUTS:153.0,IP:-3.0,MAL:-5.0,PHF:-5.0,PHC:-5
        .0,SPF:4.0,EDMS:-5,IPLABEL:-5.0,FROMTO:0,AD:0,FFOB:0.0,CFOB:2.0,SPC:0,SIG:-5,
        AUF:9,DUF:3752,ACD:67,DCD:67,SL:0,EISP:0,AG:0,CFC:0.486,CFSR:0.039,UAT:0,RAF:
        0,IMG:-5.0,DFA:0,DTA:0,IBL:-5,ADI:-5,SBL:0,REDM:0,REIP:0,ESB:0,ATTNUM:0,EAF:0
        ,CID:-5.0,VERSION:2.3.17
X-CPASD-ID: 310dcbdb25fa4400a39df82dd5133278-20220901
X-CPASD-BLOCK: 1000
X-CPASD-STAGE: 1
X-UUID: 310dcbdb25fa4400a39df82dd5133278-20220901
X-User: huxiaoying@kylinos.cn
Received: from localhost.localdomain [(112.64.161.44)] by mailgw
        (envelope-from <huxiaoying@kylinos.cn>)
        (Generic MTA)
        with ESMTP id 271972006; Thu, 01 Sep 2022 12:58:03 +0800
From:   Hu Xiaoying <huxiaoying@kylinos.cn>
To:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Cc:     Hu Xiaoying <huxiaoying@kylinos.cn>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v6] usb: storage: Add ASUS <0x0b05:0x1932> to IGNORE_UAS
Date:   Thu,  1 Sep 2022 12:57:37 +0800
Message-Id: <20220901045737.3438046-1-huxiaoying@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.5 required=5.0 tests=BAYES_00,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,KHOP_HELO_FCRDNS,RDNS_DYNAMIC,SPF_HELO_NONE,
        T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,UNPARSEABLE_RELAY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

USB external storage device(0x0b05:1932), use gnome-disk-utility tools
to test usb write  < 30MB/s.
if does not to load module of uas for this device, can increase the
write speed from 20MB/s to >40MB/s.

Suggested-by: Matthias Kaehlcke <mka@chromium.org>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Hu Xiaoying <huxiaoying@kylinos.cn>
---
change for v6
 - Add maintenance email addresses for acked-by and Suggested -by.
change for v5
 - Update the description of title accurately.
change for v4
 - Update two email addresses to be the same.
change for v3
 - Does not send html mail to the mailing lists.
 - Update patch, which sorted by vendor ID and product ID.
 - Modify discription, correct some english words.
change for v2
 - Update discription for patch.
---
 drivers/usb/storage/unusual_uas.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
index 4051c8cd0cd8..23ab3b048d9b 100644
--- a/drivers/usb/storage/unusual_uas.h
+++ b/drivers/usb/storage/unusual_uas.h
@@ -62,6 +62,13 @@ UNUSUAL_DEV(0x0984, 0x0301, 0x0128, 0x0128,
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_IGNORE_UAS),
 
+/* Reported-by: Tom Hu <huxiaoying@kylinos.cn> */
+UNUSUAL_DEV(0x0b05, 0x1932, 0x0000, 0x9999,
+		"ASUS",
+		"External HDD",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_IGNORE_UAS),
+
 /* Reported-by: David Webb <djw@noc.ac.uk> */
 UNUSUAL_DEV(0x0bc2, 0x331a, 0x0000, 0x9999,
 		"Seagate",
-- 
2.25.1


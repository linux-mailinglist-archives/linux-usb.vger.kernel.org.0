Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F2ED5A8F0D
	for <lists+linux-usb@lfdr.de>; Thu,  1 Sep 2022 09:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233545AbiIAHCD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Sep 2022 03:02:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233459AbiIAHBC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Sep 2022 03:01:02 -0400
Received: from mailgw.kylinos.cn (unknown [124.126.103.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D58C511A38
        for <linux-usb@vger.kernel.org>; Thu,  1 Sep 2022 00:00:46 -0700 (PDT)
X-UUID: d103c71f3fc74af99f4845dd6ffc6e74-20220901
X-CPASD-INFO: 3d271a446fd641829edf3b5b15762428@fLRsV16TYmRihqaCg3SDbFmWlJZjjlW
        xc29XZmBkXliVhH5xTV5uYFV9fWtVYV9dYVR6eGxQYmBgZFJ4i3-XblBgXoZgUZB3gqZsV2GPZA==
X-CLOUD-ID: 3d271a446fd641829edf3b5b15762428
X-CPASD-SUMMARY: SIP:-1,APTIP:-2.0,KEY:0.0,FROMBLOCK:1,OB:0.0,URL:-5,TVAL:172.
        0,ESV:0.0,ECOM:-5.0,ML:0.0,FD:0.0,CUTS:275.0,IP:-2.0,MAL:-5.0,PHF:-5.0,PHC:-5
        .0,SPF:4.0,EDMS:-5,IPLABEL:4480.0,FROMTO:0,AD:0,FFOB:0.0,CFOB:0.0,SPC:0,SIG:-
        5,AUF:8,DUF:3768,ACD:67,DCD:67,SL:0,EISP:0,AG:0,CFC:0.288,CFSR:0.094,UAT:0,RA
        F:0,IMG:-5.0,DFA:0,DTA:0,IBL:-2.0,ADI:-5,SBL:0,REDM:0,REIP:0,ESB:0,ATTNUM:0,E
        AF:0,CID:-5.0,VERSION:2.3.17
X-CPASD-ID: d103c71f3fc74af99f4845dd6ffc6e74-20220901
X-CPASD-BLOCK: 1000
X-CPASD-STAGE: 1
X-UUID: d103c71f3fc74af99f4845dd6ffc6e74-20220901
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain.localdomain [(112.64.161.44)] by mailgw
        (envelope-from <zenghongling@kylinos.cn>)
        (Generic MTA)
        with ESMTP id 965130518; Thu, 01 Sep 2022 15:01:01 +0800
From:   zenghongling <zenghongling@kylinos.cn>
To:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        zhongling0719@126.com, zenghongling <zenghongling@kylinos.cn>
Subject: [PATCH v4] uas: add no-uas quirk for Thinkplus and Hiksemi usb-storage
Date:   Thu,  1 Sep 2022 15:00:53 +0800
Message-Id: <1662015653-12976-1-git-send-email-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.1.0
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        RDNS_DYNAMIC,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,
        UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

UAS:if ignore uas feature for these drivers can fix the not working and
output error message bug.

The UAS mode of Thinkplus and Hiksemi is reported to fail to work on
several platforms with the following error message,I tested these USB
disks on other architecture platforms as arm/loongson for different xHCI
controller,the same error occurred:

[   39.702439] xhci_hcd 0000:0c:00.3: ERROR Transfer event for disabled
               endpoint or incorrect stream ring
[   39.702442] xhci_hcd 0000:0c:00.3: @000000026c61f810 00000000 00000000
               1b000000 05038000

[  592.490369][ 1] xhci_hcd 0000:0c:00.3: Assuming host is dying, halting host.
[  592.518442][ 2] sd 8:0:0:0: [sda] tag#17 uas_eh_abort_handler 0 uas-tag 18
                   inflight: CMD
[  592.527575][ 2] sd 8:0:0:0: [sda] tag#17 CDB: Write(10) 2a 00 03 6f 88 00 00
                   04 00 00
[  592.536330][ 2] sd 8:0:0:0: [sda] tag#0 uas_eh_abort_handler 0 uas-tag 1
                   inflight: CMD
[  592.545266][ 2] sd 8:0:0:0: [sda] tag#0 CDB: Write(10) 2a 00 07 44 1a 88 00
                   00 08 00

And when running iozone will disconnect from the USB controller, then after
re-connecting the device will be offlined and not working at all.

We changed a lot of USB devices and contact relevant manufacturers to 
confirm the USB disk is ok.

Signed-off-by: zenghongling <zenghongling@kylinos.cn>
---
change for v4
 - Change the send patch email address

change for v3
 - Add the a description of why the patch is needed.

change for v2
 -Change the ./script/checkpatch.pl warning.
--
---
 drivers/usb/storage/unusual_uas.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
index cdff7dc..ddcdf1a 100644
--- a/drivers/usb/storage/unusual_uas.h
+++ b/drivers/usb/storage/unusual_uas.h
@@ -62,6 +62,12 @@ UNUSUAL_DEV(0x059f, 0x1061, 0x0000, 0x9999,
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_IGNORE_UAS),
 
+UNUSUAL_DEV(0x090c, 0x2000, 0x0000, 0x9999,
+		"Hiksemi",
+		"External HDD",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_IGNORE_UAS),
+
 /*
  * Apricorn USB3 dongle sometimes returns "USBSUSBSUSBS" in response to SCSI
  * commands in UAS mode.  Observed with the 1.28 firmware; are there others?
@@ -142,6 +148,12 @@ UNUSUAL_DEV(0x0bc2, 0xab2a, 0x0000, 0x9999,
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_NO_ATA_1X),
 
+UNUSUAL_DEV(0x0bda, 0x9210, 0x0000, 0x9999,
+		"Hiksemi",
+		"External HDD",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_IGNORE_UAS),
+
 /* Reported-by: Benjamin Tissoires <benjamin.tissoires@redhat.com> */
 UNUSUAL_DEV(0x13fd, 0x3940, 0x0000, 0x9999,
 		"Initio Corporation",
@@ -184,6 +196,12 @@ UNUSUAL_DEV(0x154b, 0xf00d, 0x0000, 0x9999,
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_NO_ATA_1X),
 
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


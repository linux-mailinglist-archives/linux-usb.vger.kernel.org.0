Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC81413165
	for <lists+linux-usb@lfdr.de>; Tue, 21 Sep 2021 12:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231608AbhIUKTf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Sep 2021 06:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbhIUKTe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Sep 2021 06:19:34 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F3C8C061574
        for <linux-usb@vger.kernel.org>; Tue, 21 Sep 2021 03:18:06 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id t18so37583227wrb.0
        for <linux-usb@vger.kernel.org>; Tue, 21 Sep 2021 03:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UD05AQRtTYhvfFSFPPBFmCBR7+c/rAE9QcA9diTWpv8=;
        b=Uqohw1X5T2Upxwc83egnItXx5omS9SGb7xXXiZgkyUnqpN8tYWbNKNSTkUnCG7+bn0
         38p4Sf+ilGqdiRwXpSNAb7ap+cWc0rztnsTINjRZmW2ULk5+e93i8QQptf3o7dUDb73d
         EcWt9nQlNWIoSYxGIeRuWUyTwGbZQYfiX3rbkiLgmRS3alveHjir6ruO2u65AJ7LgFuX
         VPE3j28zS5CfyY71gn5SsR2cpi6jhzf2gToWBLZkUM/yP9V/Jw1gGocjXgI8wRyj8wZ6
         3s8ly2HC3CqcxPPQI+EoNlCl0R/1RqbpgAYK1NLPNYugN/7XO+RUZjhm0QdOgJSr7Q3w
         lSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UD05AQRtTYhvfFSFPPBFmCBR7+c/rAE9QcA9diTWpv8=;
        b=q/j/Lkke/8N0wbUgddNh4h+fDWOVvZld4GrJrFv154FLSXCJK7yBwOiUmlQN/cgJkM
         DIWm+L7x6eqFbCHm9YSskO3c15vY8s6L9R/m8AtpitC/ndJljSiTSNQ9dMES+DuGGKM7
         8UGGkOmzE1pfCrWo6H3+ppK6m3xK57q4dznIlysTi8i8w0isTGocCs5F7R1iXUZvnDIJ
         dWk2bQcjk1DkFjRKkjcpWy5PYbP8A5FJgX3oaHm6oh5OOtL/5MRJWmsxNE5YxqItvI3G
         7Rnju3wc1rbsY7K+S4C5oGGCCC3ZK6fKiG2R1TLSrbI9sP+wmNfY3i2VMCuEF/NnRbJu
         MYnA==
X-Gm-Message-State: AOAM530YvmU5ujdHv/phvHreAULf7QBD5NJHPmzROoU3NLmbRBmLOWwU
        p9zn7ccBVljhuHjA6xcPMD4=
X-Google-Smtp-Source: ABdhPJyl5wfaJnCDCshDEx+u1HVhrbVz+aSav8jJ4/CIzQsmB9lUp+R+s21qhpBpAWvKktmNrmqOSA==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr17600197wrz.29.1632219484771;
        Tue, 21 Sep 2021 03:18:04 -0700 (PDT)
Received: from localhost (ip5f5afd21.dynamic.kabel-deutschland.de. [95.90.253.33])
        by smtp.gmail.com with ESMTPSA id r25sm19216141wra.76.2021.09.21.03.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 03:18:04 -0700 (PDT)
From:   Tobias Jakobi <cubic2k@gmail.com>
X-Google-Original-From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
To:     stern@rowland.harvard.edu
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH] usb: storage: add quirks for VIA VL817 USB3-SATA bridge
Date:   Tue, 21 Sep 2021 12:17:52 +0200
Message-Id: <20210921101752.4679-1-tjakobi@math.uni-bielefeld.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The VL817 is used in the RaidSonic Icy Box IB-3740-C31 enclosure. The enclosure
is advertised as having UASP support, but appears to have problems with 4Kn
drives (test was done with two Seagate Exos X, 12TB).

Disable UAS for the VL817 as it behaves highly unstable:

[Aug14 16:31] usb 2-1.2: USB disconnect, device number 4
[  +0.007701] sd 4:0:0:0: [sdb] tag#4 uas_zap_pending 0 uas-tag 1 inflight: CMD
[  +0.000004] sd 4:0:0:0: [sdb] tag#4 CDB: opcode=0x2a 2a 00 00 37 63 da 00 00 80 00
[  +0.000022] sd 4:0:0:0: [sdb] tag#4 UNKNOWN(0x2003) Result: hostbyte=0x01 driverbyte=0x00 cmd_age=19s
[  +0.000001] sd 4:0:0:0: [sdb] tag#4 CDB: opcode=0x2a 2a 00 00 37 63 da 00 00 80 00
[  +0.000001] blk_update_request: I/O error, dev sdb, sector 29040336 op 0x1:(WRITE) flags 0x0 phys_seg 128 prio class 0
[  +0.000028] blk_update_request: I/O error, dev sdb, sector 29041360 op 0x1:(WRITE) flags 0x0 phys_seg 128 prio class 0
[  +0.000000] blk_update_request: I/O error, dev sdb, sector 16 op 0x1:(WRITE) flags 0x800 phys_seg 1 prio class 0
[  +0.000005] md: super_written gets error=-5
[  +0.000002] md/raid1:md126: Disk failure on sdb, disabling device.
              md/raid1:md126: Operation continuing on 1 devices.
[  +0.000024] blk_update_request: I/O error, dev sdb, sector 29042384 op 0x1:(WRITE) flags 0x0 phys_seg 128 prio class 0
[  +0.000222] sd 4:0:0:0: [sdb] Synchronizing SCSI cache
[  +0.078154] blk_update_request: I/O error, dev sdb, sector 29040336 op 0x1:(WRITE) flags 0x800 phys_seg 1 prio class 0
[  +0.000025] blk_update_request: I/O error, dev sdb, sector 29040344 op 0x1:(WRITE) flags 0x800 phys_seg 1 prio class 0
[  +0.007520] blk_update_request: I/O error, dev sdb, sector 29040352 op 0x1:(WRITE) flags 0x800 phys_seg 1 prio class 0
[  +0.000021] blk_update_request: I/O error, dev sdb, sector 29040360 op 0x1:(WRITE) flags 0x800 phys_seg 1 prio class 0
[  +0.000015] blk_update_request: I/O error, dev sdb, sector 29040368 op 0x1:(WRITE) flags 0x800 phys_seg 1 prio class 0
[  +0.000009] blk_update_request: I/O error, dev sdb, sector 29040376 op 0x1:(WRITE) flags 0x800 phys_seg 1 prio class 0
[  +0.023299] sd 4:0:0:0: [sdb] Synchronize Cache(10) failed: Result: hostbyte=0x07 driverbyte=0x00
[  +1.893439] usb 2-1.2: new SuperSpeed Plus Gen 2x1 USB device number 7 using xhci_hcd
[  +0.024064] scsi host7: uas
[ +16.365880] scsi 7:0:0:0: Direct-Access     ST12000N M001G-2MV103     SB2D PQ: 0 ANSI: 6
[  +0.001192] sd 7:0:0:0: Attached scsi generic sg1 type 0
[  +0.000940] sd 7:0:0:0: [sde] 2929721344 4096-byte logical blocks: (12.0 TB/10.9 TiB)
[  +0.000130] sd 7:0:0:0: [sde] Write Protect is off
[  +0.000001] sd 7:0:0:0: [sde] Mode Sense: 2f 00 00 00
[  +0.000265] sd 7:0:0:0: [sde] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[  +0.000399] sd 7:0:0:0: [sde] Optimal transfer size 268431360 bytes
[  +0.120240] sd 7:0:0:0: [sde] Attached SCSI disk

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/usb/storage/unusual_uas.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
index bda0f2cdf093..7d83ecf835c6 100644
--- a/drivers/usb/storage/unusual_uas.h
+++ b/drivers/usb/storage/unusual_uas.h
@@ -125,6 +125,13 @@ UNUSUAL_DEV(0x2109, 0x0711, 0x0000, 0x9999,
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_NO_ATA_1X),
 
+/* Reported-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de> */
+UNUSUAL_DEV(0x2109, 0x0715, 0x0000, 0x9999,
+		"VIA",
+		"VL817",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_IGNORE_UAS),
+
 /* Reported-by: Icenowy Zheng <icenowy@aosc.io> */
 UNUSUAL_DEV(0x2537, 0x1068, 0x0000, 0x9999,
 		"Norelsys",
-- 
2.32.0


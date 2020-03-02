Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD22175CD5
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2020 15:21:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbgCBOVt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Mar 2020 09:21:49 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:3371 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726953AbgCBOVs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Mar 2020 09:21:48 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e5d16540001>; Mon, 02 Mar 2020 06:21:08 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 02 Mar 2020 06:21:48 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 02 Mar 2020 06:21:48 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 2 Mar
 2020 14:21:47 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 2 Mar 2020 14:21:47 +0000
Received: from jilin-desktop.nvidia.com (Not Verified[10.19.120.101]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e5d167a0006>; Mon, 02 Mar 2020 06:21:47 -0800
From:   Jim Lin <jilin@nvidia.com>
To:     <stern@rowland.harvard.edu>, <linux-usb@vger.kernel.org>
CC:     <usb-storage@lists.one-eyed-alien.net>, Jim Lin <jilin@nvidia.com>
Subject: [PATCH 1/1] usb: storage: Add quirk for Samsung Fit flash
Date:   Mon, 2 Mar 2020 22:21:35 +0800
Message-ID: <1583158895-31342-1-git-send-email-jilin@nvidia.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1583158868; bh=Ug+SL8BpPUbsHay9ECIf12zMrZ7uPxOUUQ7ibuliW/E=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:Content-Type;
        b=dlZBkYhvJtf53G1DbhdpWcmOsHAgwbUwLmyPvVRJ5JPXs/5IYdmrmLzLsXnHpPVjM
         oiEnivli+eBRDAq/Sk+3J928AzuKtssJFqJ+F/dMWWHCnSRZjQnThoMtvbJA7mr6Wv
         J5wBx6flalbL9/MEd0TDKbYbtxaHdo6bl6IM+EVEMWOBg3ApIGewAtVtdCGbOnX6XX
         /7fevFzDB4vCGA3oELJ5qODCLxws2Bst5fF3CIqV89h796ZzBjnxkRdv1b9uwEYVRb
         yseq+yqYhYVGd9l+t3zl2TeHaI/BoCht3SLe6ofZWP0xAwltndd5BsMWyIe810wd1V
         TaJ2QyI85WlvA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Current driver has 240 (USB2.0) and 2048 (USB3.0) as max_sectors,
e.g., /sys/bus/scsi/devices/0:0:0:0/max_sectors

If data access times out, driver error handling will issue a port
reset.
Sometimes Samsung Fit (090C:1000) flash disk will not respond to
later Set Address or Get Descriptor command.

Adding this quirk to limit max_sectors to 64 sectors to avoid issue
occurring.

Signed-off-by: Jim Lin <jilin@nvidia.com>
---
 drivers/usb/storage/unusual_devs.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/storage/unusual_devs.h b/drivers/usb/storage/unusual_devs.h
index 1cd9b6305b06..1880f3e13f57 100644
--- a/drivers/usb/storage/unusual_devs.h
+++ b/drivers/usb/storage/unusual_devs.h
@@ -1258,6 +1258,12 @@ UNUSUAL_DEV( 0x090a, 0x1200, 0x0000, 0x9999,
 		USB_SC_RBC, USB_PR_BULK, NULL,
 		0 ),
 
+UNUSUAL_DEV(0x090c, 0x1000, 0x1100, 0x1100,
+		"Samsung",
+		"Flash Drive FIT",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_MAX_SECTORS_64),
+
 /* aeb */
 UNUSUAL_DEV( 0x090c, 0x1132, 0x0000, 0xffff,
 		"Feiya",
-- 
2.1.4


-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 889DF90994
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2019 22:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727628AbfHPUpP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Aug 2019 16:45:15 -0400
Received: from 17.mo4.mail-out.ovh.net ([46.105.41.16]:57148 "EHLO
        17.mo4.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727548AbfHPUpP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Aug 2019 16:45:15 -0400
X-Greylist: delayed 1799 seconds by postgrey-1.27 at vger.kernel.org; Fri, 16 Aug 2019 16:45:14 EDT
Received: from player792.ha.ovh.net (unknown [10.108.42.174])
        by mo4.mail-out.ovh.net (Postfix) with ESMTP id 70864202AC7
        for <linux-usb@vger.kernel.org>; Fri, 16 Aug 2019 22:09:54 +0200 (CEST)
Received: from henkvdlaan.com (a83-161-125-58.adsl.xs4all.nl [83.161.125.58])
        (Authenticated sender: henk@henkvdlaan.com)
        by player792.ha.ovh.net (Postfix) with ESMTPSA id E13B48F8E178;
        Fri, 16 Aug 2019 20:09:51 +0000 (UTC)
From:   Henk van der Laan <opensource@henkvdlaan.com>
To:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Cc:     Henk van der Laan <opensource@henkvdlaan.com>
Subject: [PATCH] usb-storage: Add new JMS567 revision to unusual_devs
Date:   Fri, 16 Aug 2019 22:08:47 +0200
Message-Id: <20190816200847.21366-1-opensource@henkvdlaan.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 977844069904190565
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudeffedgudegvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecu
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Revision 0x0117 suffers from an identical issue to earlier revisions,
therefore it should be added to the quirks list.

Signed-off-by: Henk van der Laan <opensource@henkvdlaan.com>
---
 drivers/usb/storage/unusual_devs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/storage/unusual_devs.h b/drivers/usb/storage/unusual_devs.h
index ea0d27a94afe..1cd9b6305b06 100644
--- a/drivers/usb/storage/unusual_devs.h
+++ b/drivers/usb/storage/unusual_devs.h
@@ -2100,7 +2100,7 @@ UNUSUAL_DEV(  0x14cd, 0x6600, 0x0201, 0x0201,
 		US_FL_IGNORE_RESIDUE ),
 
 /* Reported by Michael Büsch <m@bues.ch> */
-UNUSUAL_DEV(  0x152d, 0x0567, 0x0114, 0x0116,
+UNUSUAL_DEV(  0x152d, 0x0567, 0x0114, 0x0117,
 		"JMicron",
 		"USB to ATA/ATAPI Bridge",
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
-- 
2.21.0


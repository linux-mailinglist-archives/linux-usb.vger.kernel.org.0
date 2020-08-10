Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECE9240376
	for <lists+linux-usb@lfdr.de>; Mon, 10 Aug 2020 10:32:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbgHJIcO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Aug 2020 04:32:14 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:52026 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbgHJIcN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Aug 2020 04:32:13 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1k53E3-0007V4-Ai; Mon, 10 Aug 2020 08:32:11 +0000
From:   Colin King <colin.king@canonical.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] USB: storage: isd200: fix spelling mistake "removeable" -> "removable"
Date:   Mon, 10 Aug 2020 09:32:11 +0100
Message-Id: <20200810083211.48282-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a usb_stor_dbg debug message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/storage/isd200.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/storage/isd200.c b/drivers/usb/storage/isd200.c
index 89f5e33a6e6d..3c76336e43bb 100644
--- a/drivers/usb/storage/isd200.c
+++ b/drivers/usb/storage/isd200.c
@@ -1383,7 +1383,7 @@ static int isd200_scsi_to_ata(struct scsi_cmnd *srb, struct us_data *us,
 				ATA_CMD_MEDIA_LOCK : ATA_CMD_MEDIA_UNLOCK;
 			isd200_srb_set_bufflen(srb, 0);
 		} else {
-			usb_stor_dbg(us, "   Not removeable media, just report okay\n");
+			usb_stor_dbg(us, "   Not removable media, just report okay\n");
 			srb->result = SAM_STAT_GOOD;
 			sendToTransport = 0;
 		}
-- 
2.27.0


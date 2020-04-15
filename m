Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC5B1AA9B6
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2020 16:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506393AbgDOOSD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Apr 2020 10:18:03 -0400
Received: from mx2.suse.de ([195.135.220.15]:43912 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2506374AbgDOORy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 15 Apr 2020 10:17:54 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id E4A9AAA7C;
        Wed, 15 Apr 2020 14:17:52 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 1/2] UAS: no use logging any details in case of ENODEV
Date:   Wed, 15 Apr 2020 16:17:49 +0200
Message-Id: <20200415141750.811-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Once a device is gone, the internal state does not matter anymore.
There is no need to spam the logs.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
Fixes: 326349f824619 ("uas: add dead request list")
---
 drivers/usb/storage/uas.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index 3670fda02c34..08503e3507bf 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -190,6 +190,9 @@ static void uas_log_cmd_state(struct scsi_cmnd *cmnd, const char *prefix,
 	struct uas_cmd_info *ci = (void *)&cmnd->SCp;
 	struct uas_cmd_info *cmdinfo = (void *)&cmnd->SCp;
 
+	if (status == -ENODEV) /* too late */
+		return;
+
 	scmd_printk(KERN_INFO, cmnd,
 		    "%s %d uas-tag %d inflight:%s%s%s%s%s%s%s%s%s%s%s%s ",
 		    prefix, status, cmdinfo->uas_tag,
-- 
2.16.4


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 863B0FC54C
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2019 12:28:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbfKNL2K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Nov 2019 06:28:10 -0500
Received: from mx2.suse.de ([195.135.220.15]:52700 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726605AbfKNL2K (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 14 Nov 2019 06:28:10 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 96E0CB244;
        Thu, 14 Nov 2019 11:28:08 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     gregKH@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 2/3] UAS: heed CAPACITY_HEURISTICS
Date:   Thu, 14 Nov 2019 12:27:57 +0100
Message-Id: <20191114112758.32747-3-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191114112758.32747-1-oneukum@suse.com>
References: <20191114112758.32747-1-oneukum@suse.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is no need to ignore this flag. We should be as close
to storage in that regard as makes sense, so honor flags whose
cost is tiny.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/storage/uas.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index 6adc8f9a9ab0..4d4723e15c61 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -846,6 +846,12 @@ static int uas_slave_configure(struct scsi_device *sdev)
 	if (devinfo->flags & US_FL_FIX_CAPACITY)
 		sdev->fix_capacity = 1;
 
+	/*
+	 * in some cases we have to guess
+	 */
+	if (devinfo->flags & US_FL_CAPACITY_HEURISTICS)
+		sdev->guess_capacity = 1;
+
 	/*
 	 * Some devices don't like MODE SENSE with page=0x3f,
 	 * which is the command used for checking if a device
-- 
2.16.4


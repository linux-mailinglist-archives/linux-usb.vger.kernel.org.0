Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E12231CC56
	for <lists+linux-usb@lfdr.de>; Tue, 16 Feb 2021 15:47:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbhBPOrx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Feb 2021 09:47:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:36912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230228AbhBPOrn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Feb 2021 09:47:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0762064E09;
        Tue, 16 Feb 2021 14:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1613486822;
        bh=IGtIdw03Dy8quYQG26ZnPMosaXl5fq260AHdsrFrT1g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aXkmY3X7LKVjrkABspnYpxp1IHeIMetbVFU2vJ9+wGqeUy/O5V4S0g9QkWzWRJqL1
         FT6pyyubKhi7DktqsElXECloWgyRGqybermmLpnRhLWG2E2Ors5+Tv08XAFGMpXm+/
         /PgUzVBdiAqRq0gAHAyHirt/iISFSyG2uqKLeJ68=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH 5/6] USB: typec: fusb302: create debugfs subdir for the driver
Date:   Tue, 16 Feb 2021 15:46:44 +0100
Message-Id: <20210216144645.3813043-5-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210216144645.3813043-1-gregkh@linuxfoundation.org>
References: <20210216144645.3813043-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The single debugfs file for this driver really is a log file, so make a
subdir and call it "log" to make it obvious this is what it is for.
This makes cleanup simpler as we just remove the whole directory, no
need to handle individual files anymore.

Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/typec/tcpm/fusb302.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index ebc46b9f776c..7a2a17866a82 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -213,8 +213,9 @@ static void fusb302_debugfs_init(struct fusb302_chip *chip)
 
 	mutex_init(&chip->logbuffer_lock);
 	snprintf(name, NAME_MAX, "fusb302-%s", dev_name(chip->dev));
-	chip->dentry = debugfs_create_file(name, S_IFREG | 0444, usb_debug_root,
-					   chip, &fusb302_debug_fops);
+	chip->dentry = debugfs_create_dir(name, usb_debug_root);
+	debugfs_create_file("log", S_IFREG | 0444, chip->dentry, chip,
+			    &fusb302_debug_fops);
 }
 
 static void fusb302_debugfs_exit(struct fusb302_chip *chip)
-- 
2.30.1


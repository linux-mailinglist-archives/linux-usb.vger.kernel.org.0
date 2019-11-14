Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1235EFC54B
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2019 12:28:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbfKNL2K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Nov 2019 06:28:10 -0500
Received: from mx2.suse.de ([195.135.220.15]:52706 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726628AbfKNL2K (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 14 Nov 2019 06:28:10 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id A9ED9B2D8;
        Thu, 14 Nov 2019 11:28:08 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     gregKH@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 3/3] documentation: flags on usb-storage versus UAS
Date:   Thu, 14 Nov 2019 12:27:58 +0100
Message-Id: <20191114112758.32747-4-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191114112758.32747-1-oneukum@suse.com>
References: <20191114112758.32747-1-oneukum@suse.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Document which flags work storage, UAS or both

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a84a83f8881e..a02b1799a756 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4998,13 +4998,13 @@
 			Flags is a set of characters, each corresponding
 			to a common usb-storage quirk flag as follows:
 				a = SANE_SENSE (collect more than 18 bytes
-					of sense data);
+					of sense data, not on uas);
 				b = BAD_SENSE (don't collect more than 18
-					bytes of sense data);
+					bytes of sense data, not on uas);
 				c = FIX_CAPACITY (decrease the reported
 					device capacity by one sector);
 				d = NO_READ_DISC_INFO (don't use
-					READ_DISC_INFO command);
+					READ_DISC_INFO command, not on uas);
 				e = NO_READ_CAPACITY_16 (don't use
 					READ_CAPACITY_16 command);
 				f = NO_REPORT_OPCODES (don't use report opcodes
@@ -5019,17 +5019,18 @@
 				j = NO_REPORT_LUNS (don't use report luns
 					command, uas only);
 				l = NOT_LOCKABLE (don't try to lock and
-					unlock ejectable media);
+					unlock ejectable media, not on uas);
 				m = MAX_SECTORS_64 (don't transfer more
-					than 64 sectors = 32 KB at a time);
+					than 64 sectors = 32 KB at a time,
+					not on uas);
 				n = INITIAL_READ10 (force a retry of the
-					initial READ(10) command);
+					initial READ(10) command, not on uas);
 				o = CAPACITY_OK (accept the capacity
-					reported by the device);
+					reported by the device, not on uas);
 				p = WRITE_CACHE (the device cache is ON
-					by default);
+					by default, not on uas);
 				r = IGNORE_RESIDUE (the device reports
-					bogus residue values);
+					bogus residue values, not on uas);
 				s = SINGLE_LUN (the device has only one
 					Logical Unit);
 				t = NO_ATA_1X (don't allow ATA(12) and ATA(16)
@@ -5038,7 +5039,8 @@
 				w = NO_WP_DETECT (don't test whether the
 					medium is write-protected).
 				y = ALWAYS_SYNC (issue a SYNCHRONIZE_CACHE
-					even if the device claims no cache)
+					even if the device claims no cache,
+					not on uas)
 			Example: quirks=0419:aaf5:rl,0421:0433:rc
 
 	user_debug=	[KNL,ARM]
-- 
2.16.4


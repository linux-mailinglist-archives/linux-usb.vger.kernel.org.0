Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 612391814CB
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2020 10:28:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728255AbgCKJ2K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Mar 2020 05:28:10 -0400
Received: from mx2.suse.de ([195.135.220.15]:56628 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726934AbgCKJ2J (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Mar 2020 05:28:09 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 37BA7AF0D;
        Wed, 11 Mar 2020 09:28:08 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH] thunderbolt: Use scnprintf() for avoiding potential buffer overflow
Date:   Wed, 11 Mar 2020 10:28:07 +0100
Message-Id: <20200311092807.24308-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since snprintf() returns the would-be-output size instead of the
actual output size, the succeeding calls may go beyond the given
buffer limit.  Fix it by replacing with scnprintf().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/thunderbolt/domain.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index b7980c856898..68c1b93ac5d9 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -147,10 +147,10 @@ static ssize_t boot_acl_show(struct device *dev, struct device_attribute *attr,
 
 	for (ret = 0, i = 0; i < tb->nboot_acl; i++) {
 		if (!uuid_is_null(&uuids[i]))
-			ret += snprintf(buf + ret, PAGE_SIZE - ret, "%pUb",
+			ret += scnprintf(buf + ret, PAGE_SIZE - ret, "%pUb",
 					&uuids[i]);
 
-		ret += snprintf(buf + ret, PAGE_SIZE - ret, "%s",
+		ret += scnprintf(buf + ret, PAGE_SIZE - ret, "%s",
 			       i < tb->nboot_acl - 1 ? "," : "\n");
 	}
 
-- 
2.16.4


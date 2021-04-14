Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57FCA35ECDD
	for <lists+linux-usb@lfdr.de>; Wed, 14 Apr 2021 08:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349056AbhDNGGH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Apr 2021 02:06:07 -0400
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:38529 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1347522AbhDNGGE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Apr 2021 02:06:04 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R581e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0UVWALWV_1618380341;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UVWALWV_1618380341)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 14 Apr 2021 14:05:42 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] usb: core: remove unused including <linux/version.h>
Date:   Wed, 14 Apr 2021 14:05:40 +0800
Message-Id: <1618380340-108958-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix the following versioncheck warning:
./drivers/usb/core/hcd.c: 14 linux/version.h not needed.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/usb/core/hcd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 3f03813..53bc93d 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -11,7 +11,6 @@
 
 #include <linux/bcd.h>
 #include <linux/module.h>
-#include <linux/version.h>
 #include <linux/kernel.h>
 #include <linux/sched/task_stack.h>
 #include <linux/slab.h>
-- 
1.8.3.1


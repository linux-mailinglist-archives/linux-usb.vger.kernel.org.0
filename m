Return-Path: <linux-usb+bounces-2097-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE00F7D4421
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 02:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A004CB20E8C
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 00:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B65AD1855;
	Tue, 24 Oct 2023 00:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477837E
	for <linux-usb@vger.kernel.org>; Tue, 24 Oct 2023 00:43:38 +0000 (UTC)
Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09D1AA6;
	Mon, 23 Oct 2023 17:43:35 -0700 (PDT)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0Vuo0ST7_1698108211;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0Vuo0ST7_1698108211)
          by smtp.aliyun-inc.com;
          Tue, 24 Oct 2023 08:43:32 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: andreas.noever@gmail.com,
	michael.jamet@intel.com,
	mika.westerberg@linux.intel.com,
	YehezkelShB@gmail.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] thunderbolt: Fix one kernel-doc comment
Date: Tue, 24 Oct 2023 08:43:30 +0800
Message-Id: <20231024004330.100898-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a spelling errors in kernel doc comment, silence the warning:

drivers/thunderbolt/tb.c:760: warning: expecting prototype for tb_maximum_banwidth(). Prototype was for tb_maximum_bandwidth() instead

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=7048
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/thunderbolt/tb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index f831aaf77efd..5acdeb766860 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -739,7 +739,7 @@ static bool tb_asym_supported(struct tb_port *src_port, struct tb_port *dst_port
 }
 
 /**
- * tb_maximum_banwidth() - Maximum bandwidth over a single link
+ * tb_maximum_bandwidth() - Maximum bandwidth over a single link
  * @tb: Domain structure
  * @src_port: Source protocol adapter
  * @dst_port: Destination protocol adapter
-- 
2.20.1.7.g153144c



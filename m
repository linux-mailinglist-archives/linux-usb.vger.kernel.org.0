Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86F99595EE
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2019 10:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbfF1IU6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jun 2019 04:20:58 -0400
Received: from mail.steuer-voss.de ([85.183.69.95]:40544 "EHLO
        mail.steuer-voss.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbfF1IU6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jun 2019 04:20:58 -0400
X-Greylist: delayed 478 seconds by postgrey-1.27 at vger.kernel.org; Fri, 28 Jun 2019 04:20:58 EDT
X-Virus-Scanned: Debian amavisd-new at mail.steuer-voss.de
Received: from pc-niv.weinmann.com (localhost [127.0.0.1])
        by mail.steuer-voss.de (Postfix) with ESMTP id B6AF643EAA;
        Fri, 28 Jun 2019 10:12:57 +0200 (CEST)
From:   Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, nv@vosn.de
Subject: [PATCH] drivers/usb/typec/tps6598x.c: fix two bugs
Date:   Fri, 28 Jun 2019 10:12:35 +0200
Message-Id: <20190628081235.19205-1-nikolaus.voss@loewensteinmedical.de>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

1. Portinfo bit field is 3 bits wide, not 2 bits. This led to
   a wrong driver configuration for some tps6598x configurations.

2. Writing 4CC commands with tps6598x_write_4cc() already has
   a pointer arg, don't reference it when using as arg to
   tps6598x_block_write(). Correcting this enforces the constness
   of the pointer to propagate to tps6598x_block_write(), so add
   the const qualifier there to avoid the warning.

Signed-off-by: Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>
---
 drivers/usb/typec/tps6598x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/tps6598x.c b/drivers/usb/typec/tps6598x.c
index c674abe3cf99..a38d1409f15b 100644
--- a/drivers/usb/typec/tps6598x.c
+++ b/drivers/usb/typec/tps6598x.c
@@ -41,7 +41,7 @@
 #define TPS_STATUS_VCONN(s)		(!!((s) & BIT(7)))
 
 /* TPS_REG_SYSTEM_CONF bits */
-#define TPS_SYSCONF_PORTINFO(c)		((c) & 3)
+#define TPS_SYSCONF_PORTINFO(c)		((c) & 7)
 
 enum {
 	TPS_PORTINFO_SINK,
@@ -127,7 +127,7 @@ tps6598x_block_read(struct tps6598x *tps, u8 reg, void *val, size_t len)
 }
 
 static int tps6598x_block_write(struct tps6598x *tps, u8 reg,
-				void *val, size_t len)
+				const void *val, size_t len)
 {
 	u8 data[TPS_MAX_LEN + 1];
 
@@ -173,7 +173,7 @@ static inline int tps6598x_write64(struct tps6598x *tps, u8 reg, u64 val)
 static inline int
 tps6598x_write_4cc(struct tps6598x *tps, u8 reg, const char *val)
 {
-	return tps6598x_block_write(tps, reg, &val, sizeof(u32));
+	return tps6598x_block_write(tps, reg, val, 4);
 }
 
 static int tps6598x_read_partner_identity(struct tps6598x *tps)
-- 
2.17.1


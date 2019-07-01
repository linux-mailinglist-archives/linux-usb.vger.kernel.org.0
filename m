Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB10596AD
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2019 11:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbfF1JBX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jun 2019 05:01:23 -0400
Received: from mail.steuer-voss.de ([85.183.69.95]:40966 "EHLO
        mail.steuer-voss.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726484AbfF1JBX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jun 2019 05:01:23 -0400
X-Virus-Scanned: Debian amavisd-new at mail.steuer-voss.de
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from pc-niv.weinmann.com (localhost [127.0.0.1])
        by mail.steuer-voss.de (Postfix) with ESMTP id 8D42A4BAAC;
        Fri, 28 Jun 2019 11:01:21 +0200 (CEST)
From:   Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, nv@vosn.de
Subject: [PATCH 2/2] drivers/usb/typec/tps6598x.c: fix 4CC cmd write
Date:   Fri, 28 Jun 2019 11:01:09 +0200
Message-Id: <47a0d3b0b725c58bf7f422261a7c5d3accafea57.1561712364.git.nikolaus.voss@loewensteinmedical.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <f8daf204d49fff00db33e2b417a20afcc58ad56e.1561712364.git.nikolaus.voss@loewensteinmedical.de>
References: <f8daf204d49fff00db33e2b417a20afcc58ad56e.1561712364.git.nikolaus.voss@loewensteinmedical.de>
In-Reply-To: <20190628083417.GA21701@kuha.fi.intel.com>
References: <20190628083417.GA21701@kuha.fi.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Writing 4CC commands with tps6598x_write_4cc() already has
a pointer arg, don't reference it when using as arg to
tps6598x_block_write(). Correcting this enforces the constness
of the pointer to propagate to tps6598x_block_write(), so add
the const qualifier there to avoid the warning.

Fixes: 0a4c005bd171 ("usb: typec: driver for TI TPS6598x USB Power Delivery controllers")
Signed-off-by: Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>
---
 drivers/usb/typec/tps6598x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tps6598x.c b/drivers/usb/typec/tps6598x.c
index a170c49c2542..a38d1409f15b 100644
--- a/drivers/usb/typec/tps6598x.c
+++ b/drivers/usb/typec/tps6598x.c
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


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34E3020F7B6
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jun 2020 16:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389164AbgF3O4E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Jun 2020 10:56:04 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:48716 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729260AbgF3O4E (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Jun 2020 10:56:04 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jqHfz-00020M-4o; Tue, 30 Jun 2020 14:55:59 +0000
From:   Colin King <colin.king@canonical.com>
To:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        linux-usb@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] thunderbolt: ensure left shift of 512 does not overflow a 32 bit int
Date:   Tue, 30 Jun 2020 15:55:58 +0100
Message-Id: <20200630145558.516961-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The 32 bit int value 512 is being left shifted and then used in a context
that expects the expression to be a larger unsigned long. There may be
a potential integer overflow, so make 512 a UL before shift to avoid
any such issues.

Addresses-Coverity: ("Uninintentional integer overflow")
Fixes: 3b1d8d577ca8 ("thunderbolt: Implement USB3 bandwidth negotiation routines")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/thunderbolt/usb4.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index d1a554fd09ae..ed609075cf66 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -909,7 +909,7 @@ static unsigned int usb3_bw_to_mbps(u32 bw, u8 scale)
 {
 	unsigned long uframes;
 
-	uframes = bw * 512 << scale;
+	uframes = bw * 512UL << scale;
 	return DIV_ROUND_CLOSEST(uframes * 8000, 1000 * 1000);
 }
 
@@ -919,7 +919,7 @@ static u32 mbps_to_usb3_bw(unsigned int mbps, u8 scale)
 
 	/* 1 uframe is 1/8 ms (125 us) -> 1 / 8000 s */
 	uframes = ((unsigned long)mbps * 1000 *  1000) / 8000;
-	return DIV_ROUND_UP(uframes, 512 << scale);
+	return DIV_ROUND_UP(uframes, 512UL << scale);
 }
 
 static int usb4_usb3_port_read_allocated_bandwidth(struct tb_port *port,
-- 
2.27.0


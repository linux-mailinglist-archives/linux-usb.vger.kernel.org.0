Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD6B71F4C5E
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jun 2020 06:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbgFJEdJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Jun 2020 00:33:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:38396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725268AbgFJEdJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 10 Jun 2020 00:33:09 -0400
Received: from localhost.localdomain (unknown [222.65.251.6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 832F22074B;
        Wed, 10 Jun 2020 04:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591763588;
        bh=3YYcWzwX4Ez1Wip1HB7L60PH3Sn97YBIMGr8qtLyiCk=;
        h=From:To:Cc:Subject:Date:From;
        b=vY/2B9Zr5aJiac9LW1uXDJyB39jF+UpQXwcM4vPC99dmfBxn1/cBP4jtX7UK/og8Y
         7ydg62BTBlwSP2Nvfg5ZAhCmSZaylcEDSNaN/Q3UgiHi6BWxQqAtK0z6ys2PvcCJ8H
         bOmVqiaKFO8ztiRBeW3V40sgSmlfzFZnpfZ5n9DY=
From:   Peter Chen <peter.chen@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     linux-imx@nxp.com, jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/1] usb: chipidea: udc: fix the ENDIAN issue
Date:   Wed, 10 Jun 2020 12:32:51 +0800
Message-Id: <20200610043251.10330-1-peter.chen@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

Fix the ENDIAN issue when assign dTD entry.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/udc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index db0cfde0cc3c..ff9de91d98ca 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -473,9 +473,10 @@ static void ci_add_buffer_entry(struct td_node *node, struct scatterlist *s)
 	int empty_td_slot_index = (CI_MAX_BUF_SIZE - node->td_remaining_size)
 			/ CI_HDRC_PAGE_SIZE;
 	int i;
+	u32 token;
 
-	node->ptr->token +=
-		cpu_to_le32(sg_dma_len(s) << __ffs(TD_TOTAL_BYTES));
+	token = le32_to_cpu(node->ptr->token) + (sg_dma_len(s) << __ffs(TD_TOTAL_BYTES));
+	node->ptr->token = cpu_to_le32(token);
 
 	for (i = empty_td_slot_index; i < TD_PAGE_COUNT; i++) {
 		u32 page = (u32) sg_dma_address(s) +
-- 
2.17.1


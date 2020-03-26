Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC9EA193D29
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 11:43:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728000AbgCZKnp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 06:43:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:35526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727560AbgCZKno (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Mar 2020 06:43:44 -0400
Received: from localhost.localdomain (unknown [180.171.74.255])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BA5EE20714;
        Thu, 26 Mar 2020 10:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585219423;
        bh=aCk6r2q6VK/uGhzy0qoSo2kidcROxyinP377YtYGdeE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=n6MBmczrilkYMOPOvMUh95mQUXT4w0xsq2da13nvVwO291viqfVBRbKxE/1tmnxli
         d/7XF9JJhMDt2oxyPqjOh6xEK8dY0QLSc7/tLJFZdzZdVhHQBr/cDLoUktveR4/pVx
         hW9TUtd8k4jYuBR7FG4twtl737SKEF7ccUDxlRT4=
From:   Peter Chen <peter.chen@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     linux-imx@nxp.com, jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 3/3] usb: chipidea: core: show the real pointer value for register
Date:   Thu, 26 Mar 2020 18:43:25 +0800
Message-Id: <20200326104325.5628-3-peter.chen@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326104325.5628-1-peter.chen@kernel.org>
References: <20200326104325.5628-1-peter.chen@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

The pointer value is "ptrval" like below at current code:
ci_hdrc ci_hdrc.0: ChipIdea HDRC found, revision: 25, lpm: 0;
cap: (ptrval) op: (ptrval)

According to Documentation/core-api/printk-formats.rst, we change
it from %p to %px for real value.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 12971c96c19e..ea8ac4a54a8d 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -246,7 +246,7 @@ static int hw_device_init(struct ci_hdrc *ci, void __iomem *base)
 	ci->rev = ci_get_revision(ci);
 
 	dev_dbg(ci->dev,
-		"ChipIdea HDRC found, revision: %d, lpm: %d; cap: %p op: %p\n",
+		"revision: %d, lpm: %d; cap: %px op: %px\n",
 		ci->rev, ci->hw_bank.lpm, ci->hw_bank.cap, ci->hw_bank.op);
 
 	/* setup lock mode ? */
-- 
2.17.1


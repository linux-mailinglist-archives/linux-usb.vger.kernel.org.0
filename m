Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82AD71BA069
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2020 11:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbgD0Ju5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Apr 2020 05:50:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:56866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727013AbgD0Ju4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 27 Apr 2020 05:50:56 -0400
Received: from localhost.localdomain (unknown [180.171.74.255])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 60E82206CD;
        Mon, 27 Apr 2020 09:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587981056;
        bh=759Xb4P31zPAbKj7+F8DbYBtMU8VCjJMFuzIuD/gvvM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WuB8OAq9qVjfLvapcL9AOv76CzRlAvsTvQFDK/Q3QN//X0BYDkjlkHY+usEm/HcPg
         OoUZ9C/gmK+WjkQdkef6tHdouw0G6NG9QcNZvELBfEU1nWsOkxHWZBT0G41JK/17VS
         NV+pEopfYLvmqZxxh/3v0q4BXOID9Tg/kfKdf18I=
From:   Peter Chen <peter.chen@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     linux-imx@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 3/4] usb: chipidea: pull down dp for possible charger detection operation
Date:   Mon, 27 Apr 2020 17:50:38 +0800
Message-Id: <20200427095039.3833-3-peter.chen@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200427095039.3833-1-peter.chen@kernel.org>
References: <20200427095039.3833-1-peter.chen@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

The bootloader may use device mode, and keep dp up. We need dp
to be pulled down before possbile charger detection operation.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index ea8ac4a54a8d..804c0a5a213b 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -1123,8 +1123,11 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 
 	if (!ci_otg_is_fsm_mode(ci)) {
 		/* only update vbus status for peripheral */
-		if (ci->role == CI_ROLE_GADGET)
+		if (ci->role == CI_ROLE_GADGET) {
+			/* Pull down DP for possible charger detection */
+			hw_write(ci, OP_USBCMD, USBCMD_RS, 0);
 			ci_handle_vbus_change(ci);
+		}
 
 		ret = ci_role_start(ci, ci->role);
 		if (ret) {
-- 
2.17.1


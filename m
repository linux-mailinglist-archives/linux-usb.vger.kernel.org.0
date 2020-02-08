Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA1A156590
	for <lists+linux-usb@lfdr.de>; Sat,  8 Feb 2020 17:50:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727471AbgBHQu0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 Feb 2020 11:50:26 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:46733 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727390AbgBHQuZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 8 Feb 2020 11:50:25 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1j0TJH-0005uJ-5K; Sat, 08 Feb 2020 16:50:23 +0000
From:   Colin King <colin.king@canonical.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: remove redundant assignment to variable num
Date:   Sat,  8 Feb 2020 16:50:22 +0000
Message-Id: <20200208165022.30429-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable num is being assigned with a value that is never read, it is
assigned a new value later in a for-loop. The assignment is redundant
and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index d5a6aac86327..b1b72cb7af10 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -400,7 +400,7 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 	struct typec_altmode_desc desc;
 	struct ucsi_altmode alt[2];
 	u64 command;
-	int num = 1;
+	int num;
 	int ret;
 	int len;
 	int j;
-- 
2.25.0


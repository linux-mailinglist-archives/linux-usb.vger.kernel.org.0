Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB23ABF347
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2019 14:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbfIZMp4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Sep 2019 08:45:56 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56334 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726209AbfIZMp4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Sep 2019 08:45:56 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1iDT9d-0002xK-Eq; Thu, 26 Sep 2019 12:45:53 +0000
From:   Colin King <colin.king@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        YueHaibing <yuehaibing@huawei.com>, linux-usb@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: ftdi-elan: move a couple of statements to next line
Date:   Thu, 26 Sep 2019 13:45:53 +0100
Message-Id: <20190926124553.15177-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are a couple of statements that follow the end brace
of while loops that should be moved to the next line to clean
up the coding style. Cleans up style warnings from smatch.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/misc/ftdi-elan.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/ftdi-elan.c b/drivers/usb/misc/ftdi-elan.c
index cdee3af33ad7..8a3d9c0c8d8b 100644
--- a/drivers/usb/misc/ftdi-elan.c
+++ b/drivers/usb/misc/ftdi-elan.c
@@ -333,7 +333,8 @@ static void ftdi_elan_abandon_completions(struct usb_ftdi *ftdi)
 		*respond->result = -ESHUTDOWN;
 		*respond->value = 0;
 		complete(&respond->wait_completion);
-	} mutex_unlock(&ftdi->u132_lock);
+	}
+	mutex_unlock(&ftdi->u132_lock);
 }
 
 static void ftdi_elan_abandon_targets(struct usb_ftdi *ftdi)
@@ -763,7 +764,8 @@ static int ftdi_elan_total_command_size(struct usb_ftdi *ftdi, int command_size)
 		struct u132_command *command = &ftdi->command[COMMAND_MASK &
 							      i++];
 		total_size += 5 + command->follows;
-	} return total_size;
+	}
+	return total_size;
 }
 
 static int ftdi_elan_command_engine(struct usb_ftdi *ftdi)
-- 
2.20.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FCEFC0221
	for <lists+linux-usb@lfdr.de>; Fri, 27 Sep 2019 11:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbfI0JUD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Sep 2019 05:20:03 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33344 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbfI0JUD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Sep 2019 05:20:03 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1iDmPx-0006fE-0U; Fri, 27 Sep 2019 09:20:01 +0000
From:   Colin King <colin.king@canonical.com>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usbip: clean up an indentation issue
Date:   Fri, 27 Sep 2019 10:20:00 +0100
Message-Id: <20190927092000.19373-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a return statement that is indented incorrectly, fix this.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/usbip/stub_tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/usbip/stub_tx.c b/drivers/usb/usbip/stub_tx.c
index 36010a82b359..b1c2f6781cb3 100644
--- a/drivers/usb/usbip/stub_tx.c
+++ b/drivers/usb/usbip/stub_tx.c
@@ -291,7 +291,7 @@ static int stub_send_ret_submit(struct stub_device *sdev)
 				kfree(iov);
 				usbip_event_add(&sdev->ud,
 						SDEV_EVENT_ERROR_TCP);
-			   return -1;
+				return -1;
 			}
 		}
 
-- 
2.20.1


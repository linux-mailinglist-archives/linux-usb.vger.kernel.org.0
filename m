Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99C80145F40
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2020 00:40:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbgAVXj6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jan 2020 18:39:58 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:51643 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbgAVXj5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jan 2020 18:39:57 -0500
Received: from [82.43.126.140] (helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1iuPbH-0007hb-GW; Wed, 22 Jan 2020 23:39:55 +0000
From:   Colin King <colin.king@canonical.com>
To:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] USB: serial: cyberjack: fix spelling mistake "To" -> "Too"
Date:   Wed, 22 Jan 2020 23:39:55 +0000
Message-Id: <20200122233955.2829493-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_dbg message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/serial/cyberjack.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/serial/cyberjack.c b/drivers/usb/serial/cyberjack.c
index ebd76ab07b72..821970609695 100644
--- a/drivers/usb/serial/cyberjack.c
+++ b/drivers/usb/serial/cyberjack.c
@@ -276,7 +276,7 @@ static void cyberjack_read_int_callback(struct urb *urb)
 		old_rdtodo = priv->rdtodo;
 
 		if (old_rdtodo > SHRT_MAX - size) {
-			dev_dbg(dev, "To many bulk_in urbs to do.\n");
+			dev_dbg(dev, "Too many bulk_in urbs to do.\n");
 			spin_unlock_irqrestore(&priv->lock, flags);
 			goto resubmit;
 		}
-- 
2.24.0


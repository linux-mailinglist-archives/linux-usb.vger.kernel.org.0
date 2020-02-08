Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E51E15658D
	for <lists+linux-usb@lfdr.de>; Sat,  8 Feb 2020 17:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727456AbgBHQqE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 Feb 2020 11:46:04 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:46709 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727350AbgBHQqE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 8 Feb 2020 11:46:04 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1j0TF4-0005Re-3W; Sat, 08 Feb 2020 16:46:02 +0000
From:   Colin King <colin.king@canonical.com>
To:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] USB: serial: digi_acceleport: remove redundant assignment to pointer priv
Date:   Sat,  8 Feb 2020 16:46:01 +0000
Message-Id: <20200208164601.30032-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer priv is being assigned with a value that is never read, it is
assigned a new value later on in a for-loop. The assignment is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/serial/digi_acceleport.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/serial/digi_acceleport.c b/drivers/usb/serial/digi_acceleport.c
index 578ebdd86520..91055a191995 100644
--- a/drivers/usb/serial/digi_acceleport.c
+++ b/drivers/usb/serial/digi_acceleport.c
@@ -1472,7 +1472,7 @@ static int digi_read_oob_callback(struct urb *urb)
 	struct usb_serial_port *port = urb->context;
 	struct usb_serial *serial = port->serial;
 	struct tty_struct *tty;
-	struct digi_port *priv = usb_get_serial_port_data(port);
+	struct digi_port *priv;
 	unsigned char *buf = urb->transfer_buffer;
 	int opcode, line, status, val;
 	unsigned long flags;
-- 
2.25.0


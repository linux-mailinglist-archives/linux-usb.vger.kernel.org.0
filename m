Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB7C2F9DE6
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jan 2021 12:19:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390123AbhARLS1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 06:18:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:57300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390063AbhARLRB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Jan 2021 06:17:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80D3422B4E;
        Mon, 18 Jan 2021 11:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610968475;
        bh=ZmiwXvU1fPkhwjAFY6wchIWp1xM+P3XaMY4OdYYItgU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=frZAJ8h7VYXTMeR0QnRgda1XE9XKXd2JUBZPtCKsZ8gOyy4LYD1DT3LpdC0KfCLel
         eo/r1eY5tkVLkH8Lug47HZWV2bh8h/7vrCxZSKvPOsX0ZGppTSUpY7r177THIooL4n
         iUguEA770KBcM0eEQ65XSZeljSCyrhiLf7lgkjwMnELF01nI9dWYM+2pKx9gk1pedh
         2AevsTqpx0KfjSrT1iOKSVn4AKwaevTdPsNYdyLLp2CmqBuxDv+avyMJL8yMkdtxW9
         iF0HlGdLDOhzkwFsoQK3o/dQISAmgCozqtDmOn4Dbzvt4YiUgOaWijrOejR0Sz9f7B
         jbOg7s/No90AQ==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1l1SUc-0001M7-7e; Mon, 18 Jan 2021 12:14:42 +0100
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 5/6] USB: serial: f81232: drop short control-transfer checks
Date:   Mon, 18 Jan 2021 12:14:25 +0100
Message-Id: <20210118111426.5147-6-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210118111426.5147-1-johan@kernel.org>
References: <20210118111426.5147-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There's no need to check for short control transfers when sending data
so remove the redundant sanity checks.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/f81232.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/serial/f81232.c b/drivers/usb/serial/f81232.c
index 0c7eacc630e0..6a8f39147d8e 100644
--- a/drivers/usb/serial/f81232.c
+++ b/drivers/usb/serial/f81232.c
@@ -192,13 +192,9 @@ static int f81232_set_register(struct usb_serial_port *port, u16 reg, u8 val)
 				tmp,
 				sizeof(val),
 				USB_CTRL_SET_TIMEOUT);
-	if (status != sizeof(val)) {
+	if (status < 0) {
 		dev_err(&port->dev, "%s failed status: %d\n", __func__, status);
-
-		if (status < 0)
-			status = usb_translate_errors(status);
-		else
-			status = -EIO;
+		status = usb_translate_errors(status);
 	} else {
 		status = 0;
 	}
@@ -886,10 +882,6 @@ static int f81534a_ctrl_set_register(struct usb_interface *intf, u16 reg,
 			status = usb_translate_errors(status);
 			if (status == -EIO)
 				continue;
-		} else if (status != size) {
-			/* Retry on short transfers */
-			status = -EIO;
-			continue;
 		} else {
 			status = 0;
 		}
-- 
2.26.2


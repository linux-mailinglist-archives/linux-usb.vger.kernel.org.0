Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C75835C2F6
	for <lists+linux-usb@lfdr.de>; Mon, 12 Apr 2021 12:04:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242166AbhDLJxb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 05:53:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:35508 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239622AbhDLJs0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Apr 2021 05:48:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B50A76120B;
        Mon, 12 Apr 2021 09:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618220888;
        bh=ADjfyJ0X8Wa3xUssDrUvlvHtaYa/1AEMvi6lfD/NlKU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MbU9uF2pPDZIF099J9YnLlw2uxarWulUoVjWLpbkv+IIrK876k82meS/71qE9diE0
         S0P75JmMyhQluSW5deTGa+32/7vjcwPIl6EjVAbyZ3ODb7sex9s5XWZTNflxJDlGcC
         o1jCOC9jWU7TYcL6vTsZ2+vJNWqJer7Ra7KqyeQpxIJk/rbnX8bZnHr5juODzXbtaH
         hlalhPTlL9JlJu1orP6/NxFjy9D9pI+ndY19GpYXbji4oEiDvl9q/84ZEsKiaOOyh0
         qy0GuFCOnDFMO1PDjXCPd7Afgv3cPR0GY7HniNQEmGllGH+FWM48mQP7fDawJ09HfB
         dDsnTmZ3jqIFA==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lVtAo-0000GD-Tl; Mon, 12 Apr 2021 11:48:02 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 01/10] USB: serial: io_ti: clean up vendor-request helpers
Date:   Mon, 12 Apr 2021 11:47:29 +0200
Message-Id: <20210412094738.944-2-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210412094738.944-1-johan@kernel.org>
References: <20210412094738.944-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Clean up the vendor-request helpers by using kernel-types consistently
and using void pointers for the data arguments, which allows removing
a cast from one caller.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/io_ti.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/serial/io_ti.c b/drivers/usb/serial/io_ti.c
index 17720670e06c..5d99e6d25c11 100644
--- a/drivers/usb/serial/io_ti.c
+++ b/drivers/usb/serial/io_ti.c
@@ -252,8 +252,8 @@ static int edge_remove_sysfs_attrs(struct usb_serial_port *port);
 #define TI_VSEND_TIMEOUT_DEFAULT 1000
 #define TI_VSEND_TIMEOUT_FW_DOWNLOAD 10000
 
-static int ti_vread_sync(struct usb_device *dev, __u8 request,
-				__u16 value, __u16 index, u8 *data, int size)
+static int ti_vread_sync(struct usb_device *dev, u8 request, u16 value,
+		u16 index, void *data, int size)
 {
 	int status;
 
@@ -271,7 +271,7 @@ static int ti_vread_sync(struct usb_device *dev, __u8 request,
 }
 
 static int ti_vsend_sync(struct usb_device *dev, u8 request, u16 value,
-		u16 index, u8 *data, int size, int timeout)
+		u16 index, void *data, int size, int timeout)
 {
 	int status;
 
@@ -284,9 +284,8 @@ static int ti_vsend_sync(struct usb_device *dev, u8 request, u16 value,
 	return 0;
 }
 
-static int send_cmd(struct usb_device *dev, __u8 command,
-				__u8 moduleid, __u16 value, u8 *data,
-				int size)
+static int send_cmd(struct usb_device *dev, u8 command, u8 moduleid,
+		u16 value, void *data, int size)
 {
 	return ti_vsend_sync(dev, command, value, moduleid, data, size,
 			TI_VSEND_TIMEOUT_DEFAULT);
@@ -2354,7 +2353,7 @@ static void change_port_settings(struct tty_struct *tty,
 
 	status = send_cmd(edge_port->port->serial->dev, UMPC_SET_CONFIG,
 				(__u8)(UMPM_UART1_PORT + port_number),
-				0, (__u8 *)config, sizeof(*config));
+				0, config, sizeof(*config));
 	if (status)
 		dev_dbg(dev, "%s - error %d when trying to write config to device\n",
 			__func__, status);
-- 
2.26.3


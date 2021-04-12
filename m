Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D56435C2FC
	for <lists+linux-usb@lfdr.de>; Mon, 12 Apr 2021 12:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241407AbhDLJxn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 05:53:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:35904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242475AbhDLJuS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Apr 2021 05:50:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C6D9F61277;
        Mon, 12 Apr 2021 09:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618220888;
        bh=h9fvXgLThgG6bWbqBFZJHQe5cKyhLIqCsS03LB273xY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Cx1/9Sr/RPp6jA8em+yqLS4wR8XzlEbn04Tm4AgqhTXkzE4y0wY/L25ocLFIH9ggx
         YWaRZG3Ndukk56E5pwiuU4klyU3eE6+u92Gt/WH8x8b6WFCg4lDkABYUSUgagybG8k
         T0TQJkW2CSyC9aOLs1mzmnSl9TcKpA8vLwpwjkWPCEzAD1npbSxQdMrTX+nl1OeVMR
         zuuhCSv1yDKkPfJQaSekgh8lSWb4xbH11gN0lxXHJwLLUR9q9Fa3k7M+kY+EqHxPXv
         gAzfVLm7ikGWGG395NrENo8PGz/JLR9jXhPXw5Phf5wKv7e1fkkym8iVJ/mvAU9G8R
         KTy6ZVah9M1OQ==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lVtAp-0000GS-BC; Mon, 12 Apr 2021 11:48:03 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 06/10] USB: serial: ti_usb_3410_5052: drop unnecessary packed attributes
Date:   Mon, 12 Apr 2021 11:47:34 +0200
Message-Id: <20210412094738.944-7-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210412094738.944-1-johan@kernel.org>
References: <20210412094738.944-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop unnecessary packed attributes from structures that don't need it.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/ti_usb_3410_5052.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/serial/ti_usb_3410_5052.c b/drivers/usb/serial/ti_usb_3410_5052.c
index d9bffb2de8bf..11e6792981b7 100644
--- a/drivers/usb/serial/ti_usb_3410_5052.c
+++ b/drivers/usb/serial/ti_usb_3410_5052.c
@@ -184,7 +184,7 @@ struct ti_uart_config {
 	char	cXon;
 	char	cXoff;
 	u8	bUartMode;
-} __packed;
+};
 
 /* Get port status */
 struct ti_port_status {
@@ -193,7 +193,7 @@ struct ti_port_status {
 	u8 bErrorCode;
 	u8 bMSR;
 	u8 bLSR;
-} __packed;
+};
 
 /* Purge modes */
 #define TI_PURGE_OUTPUT			0x00
@@ -236,13 +236,13 @@ struct ti_read_data_bytes {
 	__u8	bModuleId;
 	__u8	bErrorCode;
 	__u8	bData[];
-} __packed;
+};
 
 /* Interrupt struct */
 struct ti_interrupt {
 	__u8	bICode;
 	__u8	bIInfo;
-} __packed;
+};
 
 /* Interrupt codes */
 #define TI_CODE_HARDWARE_ERROR		0xFF
-- 
2.26.3


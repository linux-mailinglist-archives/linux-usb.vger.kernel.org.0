Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B283D35C305
	for <lists+linux-usb@lfdr.de>; Mon, 12 Apr 2021 12:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242882AbhDLJyW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 05:54:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:35918 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242542AbhDLJu0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Apr 2021 05:50:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 200E26128B;
        Mon, 12 Apr 2021 09:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618220889;
        bh=VANim6b6ABVVkb21MkrR38Z0jqTkgYPR57e7Q61KJAo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SI1mRyPknTnuxjPbW3axJl43dvOl7kl04HxmZkSNB1M66sVv9T4LQdRpXDkeo8HYS
         U2GgZwfKBWNHbuiC2nDtdVT9WH0luBvsQZo0ndfRkX0JmmS2M7gxqWG5i4Cf1qDrUV
         5XP7GLW8zBljjgUr6/KhhjBBjTo+cgU3glj4JCvdAvS6l/Vn+FuhBFi2rU+Gfjb0JR
         xWPFhWYcOItHnYMqskXa1mhQvY0l7BO/H1ZvUSAvfuMjKHKGImDMq/3ERGbwccxQ1R
         u/cykjjTHW0sRIToR/dHQ3NAidtdK7Cajht2w4j/B5Efkk/cLLIcIXwJY9KJXBdUqA
         hwiYC/fWrccxw==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lVtAp-0000Ge-NV; Mon, 12 Apr 2021 11:48:03 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 10/10] USB: serial: ti_usb_3410_5052: clean up termios CSIZE handling
Date:   Mon, 12 Apr 2021 11:47:38 +0200
Message-Id: <20210412094738.944-11-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210412094738.944-1-johan@kernel.org>
References: <20210412094738.944-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Remove the random white space from the CSIZE switch.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/ti_usb_3410_5052.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/serial/ti_usb_3410_5052.c b/drivers/usb/serial/ti_usb_3410_5052.c
index aadcb00f1343..8598f5a47349 100644
--- a/drivers/usb/serial/ti_usb_3410_5052.c
+++ b/drivers/usb/serial/ti_usb_3410_5052.c
@@ -911,18 +911,18 @@ static void ti_set_termios(struct tty_struct *tty,
 
 	switch (C_CSIZE(tty)) {
 	case CS5:
-		    config->bDataBits = TI_UART_5_DATA_BITS;
-		    break;
+		config->bDataBits = TI_UART_5_DATA_BITS;
+		break;
 	case CS6:
-		    config->bDataBits = TI_UART_6_DATA_BITS;
-		    break;
+		config->bDataBits = TI_UART_6_DATA_BITS;
+		break;
 	case CS7:
-		    config->bDataBits = TI_UART_7_DATA_BITS;
-		    break;
+		config->bDataBits = TI_UART_7_DATA_BITS;
+		break;
 	default:
 	case CS8:
-		    config->bDataBits = TI_UART_8_DATA_BITS;
-		    break;
+		config->bDataBits = TI_UART_8_DATA_BITS;
+		break;
 	}
 
 	/* CMSPAR isn't supported by this driver */
-- 
2.26.3


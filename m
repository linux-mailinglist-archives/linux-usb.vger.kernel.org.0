Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB56A2DEF08
	for <lists+linux-usb@lfdr.de>; Sat, 19 Dec 2020 13:58:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727348AbgLSM54 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 19 Dec 2020 07:57:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:44168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726752AbgLSM5g (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 19 Dec 2020 07:57:36 -0500
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Thomas Winischhofer <thomas@winischhofer.net>,
        linux-usb@vger.kernel.org
Subject: [PATCH 5.10 14/16] USB: sisusbvga: Make console support depend on BROKEN
Date:   Sat, 19 Dec 2020 13:57:21 +0100
Message-Id: <20201219125339.772799620@linuxfoundation.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201219125339.066340030@linuxfoundation.org>
References: <20201219125339.066340030@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Thomas Gleixner <tglx@linutronix.de>

commit 862ee699fefe1e6d6f2c1518395f0b999b8beb15 upstream.

The console part of sisusbvga is broken vs. printk(). It uses in_atomic()
to detect contexts in which it cannot sleep despite the big fat comment in
preempt.h which says: Do not use in_atomic() in driver code.

in_atomic() does not work on kernels with CONFIG_PREEMPT_COUNT=n which
means that spin/rw_lock held regions are not detected by it.

There is no way to make this work by handing context information through to
the driver and this only can be solved once the core printk infrastructure
supports sleepable console drivers.

Make it depend on BROKEN for now.

Fixes: 1bbb4f2035d9 ("[PATCH] USB: sisusb[vga] update")
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Thomas Winischhofer <thomas@winischhofer.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20201019101109.603244207@linutronix.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/usb/misc/sisusbvga/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/usb/misc/sisusbvga/Kconfig
+++ b/drivers/usb/misc/sisusbvga/Kconfig
@@ -16,7 +16,7 @@ config USB_SISUSBVGA
 
 config USB_SISUSBVGA_CON
 	bool "Text console and mode switching support" if USB_SISUSBVGA
-	depends on VT
+	depends on VT && BROKEN
 	select FONT_8x16
 	help
 	  Say Y here if you want a VGA text console via the USB dongle or



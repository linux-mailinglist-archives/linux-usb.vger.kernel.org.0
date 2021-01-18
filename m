Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D53BE2F9DDF
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jan 2021 12:19:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390107AbhARLSJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 06:18:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:57292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390059AbhARLRB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Jan 2021 06:17:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2EB2822226;
        Mon, 18 Jan 2021 11:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610968475;
        bh=ZQ07/waqfaC2N5t4AtnlnRpzU0Lw+vRibiaKx/GbcPs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PGzzMgmUF1F2zbk4etrkRZGTNFyjxt8XEt0KJOs+fqtdKlyI/DJfAM5C3ldXFDInG
         mPilrfDN/4heZRPPo0V8xZYp7vTuSBB64XSYtByI908tUHhLaKgO/Au3ddBe2XGyTM
         nwirypFYIeceVj6KqhRhJnrqv1b9iv5T9cS/R4OvvJyx9p3Kvdozt6p4yTj8GxZ5Ig
         Um8SbdtQKVmHx4VCx1uBM4Zsi5WyQotfR6mihHVJ5yXARTlazPFtSdUmgTeItCmg0i
         CGyQJ7hkjJlKC4R+82z6C07ErM32vtyHykPmGNBCAg8pVsPMFwtqmwRfCj2L0cxC6p
         H50jZOFdIcMDQ==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1l1SUb-0001Lw-TM; Mon, 18 Jan 2021 12:14:41 +0100
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/6] USB: serial: upd78f0730: drop short control-transfer check
Date:   Mon, 18 Jan 2021 12:14:22 +0100
Message-Id: <20210118111426.5147-3-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210118111426.5147-1-johan@kernel.org>
References: <20210118111426.5147-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There's no need to check for short control transfers when sending data
so remove the redundant sanity check.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/upd78f0730.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/usb/serial/upd78f0730.c b/drivers/usb/serial/upd78f0730.c
index 0a2268c479af..1ca9c1881621 100644
--- a/drivers/usb/serial/upd78f0730.c
+++ b/drivers/usb/serial/upd78f0730.c
@@ -145,14 +145,11 @@ static int upd78f0730_send_ctl(struct usb_serial_port *port,
 
 	kfree(buf);
 
-	if (res != size) {
+	if (res < 0) {
 		struct device *dev = &port->dev;
 
 		dev_err(dev, "failed to send control request %02x: %d\n",
 			*(u8 *)data, res);
-		/* The maximum expected length of a transfer is 6 bytes */
-		if (res >= 0)
-			res = -EIO;
 
 		return res;
 	}
-- 
2.26.2


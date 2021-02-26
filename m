Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A52B7326720
	for <lists+linux-usb@lfdr.de>; Fri, 26 Feb 2021 19:50:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbhBZSt6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Feb 2021 13:49:58 -0500
Received: from xaiki.net ([108.166.209.89]:42658 "EHLO mail.xaiki.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229949AbhBZStz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Feb 2021 13:49:55 -0500
X-Greylist: delayed 577 seconds by postgrey-1.27 at vger.kernel.org; Fri, 26 Feb 2021 13:49:55 EST
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by mail.xaiki.net (Postfix) with ESMTPA id 18912EBCB;
        Fri, 26 Feb 2021 18:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=evilgiggle.com;
        s=dkim; t=1614364776;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=2S3IvyZivRinvEYg67JK//ykGifEzYQqMHzoN27TnFI=;
        b=N7WtcGFAJurIteSoG3Ypfj4Ts4GWwbp7n13ZcBlF9CL9KlxdGfVxZzKE1CXwvoOfm0Lw65
        pQrhTeL9VYKlQNs5FJOeRslDYoOtpkpBipYYpjsRMqIvUImv/BYyFJZoiQ4V083uTxyzHF
        PDc9ZwsD6mTksiqiuvIjuLGf+LzmTk5xB96iW3q9YNV/moMJNXjUf7jj7p0HpUH8edhpS8
        3lAWAPYLfVeVL6t6JwMnZiyZUhYTh1pgrlVSVW0RJZ5F//ryLTGeVUYMIiR/6z7X6ILn9p
        Nw1yEHAw4pyTs/Qi/IpVSHXrvjqeS5FF5WfFWNdRw/bYMkwTzaDLU5DXwi9XSw==
From:   Niv Sardi <xaiki@evilgiggle.com>
To:     linux-usb@vger.kernel.org
Cc:     Niv Sardi <xaiki@evilgiggle.com>
Subject: [PATCH fixed 1/1] USB: serial: ch341: add new Product ID
Date:   Fri, 26 Feb 2021 15:38:36 -0300
Message-Id: <20210226183836.20840-1-xaiki@evilgiggle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: mail.xaiki.net;
        auth=pass smtp.auth=x@btn.sh smtp.mailfrom=xaiki@evilgiggle.com
X-Spam-Level: ****
X-Spamd-Bar: ++++
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add PID for CH340 that's found on cheap programers. They are sometimes refered to as ANU232MI like in this one:
https://www.nordfield.com/downloads/anu232mi/ANU232MI-datasheet.pdf

The driver works flawlessly as soon as the new PID (0x9986) is added to it.

Signed-off-by: Niv Sardi <xaiki@evilgiggle.com>
---
 drivers/usb/serial/ch341.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index 28deaaec581f..f26861246f65 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -86,6 +86,7 @@ static const struct usb_device_id id_table[] = {
 	{ USB_DEVICE(0x1a86, 0x7522) },
 	{ USB_DEVICE(0x1a86, 0x7523) },
 	{ USB_DEVICE(0x4348, 0x5523) },
+	{ USB_DEVICE(0x9986, 0x7523) },
 	{ },
 };
 MODULE_DEVICE_TABLE(usb, id_table);
-- 
2.30.1


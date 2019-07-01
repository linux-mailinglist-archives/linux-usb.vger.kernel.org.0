Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61DB03019D
	for <lists+linux-usb@lfdr.de>; Thu, 30 May 2019 20:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbfE3SPB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 May 2019 14:15:01 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:54163 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726328AbfE3SPB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 May 2019 14:15:01 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1hWPZq-0001NL-Td; Thu, 30 May 2019 18:14:59 +0000
From:   Colin King <colin.king@canonical.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: net2272: remove redundant assignments to pointer 's'
Date:   Thu, 30 May 2019 19:14:58 +0100
Message-Id: <20190530181458.7488-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer 's' is being assigned however the pointer is
never used with either of these values before it it reassigned much
later on.  I suspect it was going to be used in the output of the
main control registers scnprintf but was omitted.  The assignments
of 's' to the driver name or the literal string are redundant and
can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/gadget/udc/net2272.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/net2272.c b/drivers/usb/gadget/udc/net2272.c
index 564aeee1a1fe..247de0faaeb7 100644
--- a/drivers/usb/gadget/udc/net2272.c
+++ b/drivers/usb/gadget/udc/net2272.c
@@ -1178,11 +1178,6 @@ registers_show(struct device *_dev, struct device_attribute *attr, char *buf)
 	size = PAGE_SIZE;
 	spin_lock_irqsave(&dev->lock, flags);
 
-	if (dev->driver)
-		s = dev->driver->driver.name;
-	else
-		s = "(none)";
-
 	/* Main Control Registers */
 	t = scnprintf(next, size, "%s version %s,"
 		"chiprev %02x, locctl %02x\n"
-- 
2.20.1


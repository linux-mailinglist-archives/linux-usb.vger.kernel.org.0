Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9479D26DA1D
	for <lists+linux-usb@lfdr.de>; Thu, 17 Sep 2020 13:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgIQL0g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 07:26:36 -0400
Received: from mx2.suse.de ([195.135.220.15]:39226 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726741AbgIQL0b (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Sep 2020 07:26:31 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=cantorsusede;
        t=1600341973;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=QuOfJhxQIvyrH2DCSVwZa/GRYVhxmHYANfKKakCjitY=;
        b=N6lY6fj6BAtbkno+mu3w/+U0CdhNaVSqq3Ikg5szwgl97KylgZETWH9ar0Ez2DrsrsxL1h
        iMRTtd4P7HWBX1sL/2J6jl9C1+LIzSZN3P+Qcwubb23JtU43G9m0zhyZ4kRph4AYrlex73
        t2FfnDeCXHsodwryFi/7CKTOsGp1qgUynrFJ6BxnwjhYW6MFU1PfbjGkwyulidEXZSiMOY
        J1qahAowRvKzgMQSv3HFEPUbHNq9jmHzF+izW7MLhIGbrU+RRunTSPW+ZtQ7DIQzC3kZp1
        TYRtABcFhsC+S89ZNJ9+TJJIMC3dMUjkTZgaC0D9LgB2/Cn0G6WbqSOZ/Wq7+A==
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id AD1FAAE0C;
        Thu, 17 Sep 2020 11:26:47 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     gregKH@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] USB: adutux: fix debugging
Date:   Thu, 17 Sep 2020 13:26:00 +0200
Message-Id: <20200917112600.26508-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Handling for removal of the controller was missing at one place.
Add it.

Signed-of-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/misc/adutux.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/misc/adutux.c b/drivers/usb/misc/adutux.c
index d8d157c4c271..96495fcd952a 100644
--- a/drivers/usb/misc/adutux.c
+++ b/drivers/usb/misc/adutux.c
@@ -209,6 +209,7 @@ static void adu_interrupt_out_callback(struct urb *urb)
 
 	if (status != 0) {
 		if ((status != -ENOENT) &&
+		    (status != -ESHUTDOWN) &&
 		    (status != -ECONNRESET)) {
 			dev_dbg(&dev->udev->dev,
 				"%s :nonzero status received: %d\n", __func__,
-- 
2.16.4


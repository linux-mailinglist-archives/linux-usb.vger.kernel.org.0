Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0E8EA387
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2019 19:41:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728137AbfJ3SlN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Oct 2019 14:41:13 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:33738 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726242AbfJ3SlM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Oct 2019 14:41:12 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 0B5736043F; Wed, 30 Oct 2019 18:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572460872;
        bh=qczos0G7s6BLPmMS+/bsvHdT6H1rTJzzwmEr8cfv8c4=;
        h=From:To:Cc:Subject:Date:From;
        b=Y70aRTAuktZ1QsIE4Lz0RnqenJXmVuuTrsy+fYILauG0pb2E9w/AyOHOluTWiHQDN
         YQElMnKci04uDHrhBzHzqYwcLO/InTeLC21hjP5mShWf0mvWgm7zVDXHYrQ6PM+jaE
         mEpcJnOZA58Pm8mkF/EkTg01JbPEVKOkOQfffzBw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 255456043F;
        Wed, 30 Oct 2019 18:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572460871;
        bh=qczos0G7s6BLPmMS+/bsvHdT6H1rTJzzwmEr8cfv8c4=;
        h=From:To:Cc:Subject:Date:From;
        b=Bld0le9PqeDpelT2Hxyqg2viDC+ZYmGm+Fj9aJSZ+6FtjXzmsujM3tArRnJusRn1d
         5pqPMeSLingIcJepk86pl5B+pyiifnrAX3Ip2YPyw6MBCtywUXVN0pvqeSMlQBDrIG
         nWuGb+bKmpjiTkLCFbxBX2+PuwDmRmo222TLC9bg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 255456043F
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jackp@codeaurora.org
From:   Jack Pham <jackp@codeaurora.org>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Jack Pham <jackp@codeaurora.org>
Subject: [PATCH v3 1/2] usb: gadget: composite: Fix bMaxPower for SuperSpeedPlus
Date:   Wed, 30 Oct 2019 11:39:53 -0700
Message-Id: <20191030183954.9791-1-jackp@codeaurora.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SuperSpeedPlus peripherals must report their bMaxPower of the
configuration descriptor in units of 8mA as per the USB 3.2
specification. The current switch statement in encode_bMaxPower()
only checks for USB_SPEED_SUPER but not USB_SPEED_SUPER_PLUS so
the latter falls back to USB 2.0 encoding which uses 2mA units.
Replace the switch with a simple if/else.

Fixes: eae5820b852f ("usb: gadget: composite: Write SuperSpeedPlus config descriptors")
Signed-off-by: Jack Pham <jackp@codeaurora.org>
---
 drivers/usb/gadget/composite.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index d516e8d6cd7f..e1db94d1fe2e 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -437,12 +437,10 @@ static u8 encode_bMaxPower(enum usb_device_speed speed,
 		val = CONFIG_USB_GADGET_VBUS_DRAW;
 	if (!val)
 		return 0;
-	switch (speed) {
-	case USB_SPEED_SUPER:
-		return DIV_ROUND_UP(val, 8);
-	default:
+	if (speed < USB_SPEED_SUPER)
 		return DIV_ROUND_UP(val, 2);
-	}
+	else
+		return DIV_ROUND_UP(val, 8);
 }
 
 static int config_buf(struct usb_configuration *config,
-- 
2.21.0


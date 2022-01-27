Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06EE749E15F
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jan 2022 12:43:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240722AbiA0Lnn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jan 2022 06:43:43 -0500
Received: from cable.insite.cz ([84.242.75.189]:60911 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235822AbiA0Lnl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Jan 2022 06:43:41 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 9ABD7A1A3D401;
        Thu, 27 Jan 2022 12:43:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1643283818; bh=d3wb32EGapDm1K2TgBZKk9f4KEcNMWfD35sNfTDAwwQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pGeAUowFY+reERGUnDQ1lGg3WlkKQS9YjAO2KdFX4ZUsnBN4UnhQKKNKhqbe6tfni
         7I6d66x0LZNpzqa/q67byZbsyrxF+QJdD4k4+HZ0jDFZsfU0FtndiMSn9oyhV8ZVgQ
         W2NVcCThgSH39xqeleK10CmAlcsqAOG/pQvLVpDc=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id BszJVKdXbMRM; Thu, 27 Jan 2022 12:43:33 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 51992A1A3D404;
        Thu, 27 Jan 2022 12:43:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1643283813; bh=d3wb32EGapDm1K2TgBZKk9f4KEcNMWfD35sNfTDAwwQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mklJG62kuO3iVjtdn+oGdDszJlcr7INAuTaghIDH3uCV7J7gLs4pGt3v4ZST55DOt
         tVvf13mWHcL9UJ5gyOBpvxuFddsYS5bvjwEieK5h4E+jOw+kbMI7ouGGjO4Jn1IgsV
         6VDQzy964xVdZaS16Dmpov7//44gTyM3KAuiHDOE=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yunhao Tian <t123yh.xyz@gmail.com>
Subject: [PATCH 4/4] usb: gadget: f_uac2: Add speed names to bInterval dbg/warn
Date:   Thu, 27 Jan 2022 12:43:31 +0100
Message-Id: <20220127114331.41367-5-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127114331.41367-1-pavel.hofman@ivitera.com>
References: <20220127114331.41367-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add speed names for better clarity of dgb/warn messages from max packet
size/bInterval checks.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 drivers/usb/gadget/function/f_uac2.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 48d6fb26bb19..ce3ca7e62e2a 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -124,6 +124,16 @@ static struct usb_string strings_fn[] = {
 	{ },
 };
 
+static const char *const speed_names[] = {
+	[USB_SPEED_UNKNOWN] = "UNKNOWN",
+	[USB_SPEED_LOW] = "LS",
+	[USB_SPEED_FULL] = "FS",
+	[USB_SPEED_HIGH] = "HS",
+	[USB_SPEED_WIRELESS] = "W",
+	[USB_SPEED_SUPER] = "SS",
+	[USB_SPEED_SUPER_PLUS] = "SS+",
+};
+
 static struct usb_gadget_strings str_fn = {
 	.language = 0x0409,	/* en-us */
 	.strings = strings_fn,
@@ -745,12 +755,12 @@ static int set_ep_max_packet_size_bint(struct device *dev, const struct f_uac2_o
 
 	if (max_size_bw <= max_size_ep)
 		dev_dbg(dev,
-			"%s: Will use maxpctksize %d and bInterval %d\n",
-			dir, max_size_bw, bint);
+			"%s %s: Would use maxpctksize %d and bInterval %d\n",
+			speed_names[speed], dir, max_size_bw, bint);
 	else {
 		dev_warn(dev,
-			"%s: Req. maxpcktsize %d at bInterval %d > max ISOC %d, may drop data!\n",
-			dir, max_size_bw, bint, max_size_ep);
+			"%s %s: Req. maxpcktsize %d at bInterval %d > max ISOC %d, may drop data!\n",
+			speed_names[speed], dir, max_size_bw, bint, max_size_ep);
 		max_size_bw = max_size_ep;
 	}
 
-- 
2.25.1


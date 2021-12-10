Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E1B246FD08
	for <lists+linux-usb@lfdr.de>; Fri, 10 Dec 2021 09:52:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238757AbhLJI4C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Dec 2021 03:56:02 -0500
Received: from cable.insite.cz ([84.242.75.189]:52393 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231728AbhLJI4C (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 10 Dec 2021 03:56:02 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 5CECFA1A3D403;
        Fri, 10 Dec 2021 09:52:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1639126346; bh=BfXpO1ramU7Jhp0Tq7qENbdUjofBbAmGHFhS/AXDY88=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=L+1WbD7KAD0ZYbH0XaHUkT8PQK0MCInyA9qdPZv1C8kXUOOcQVUUa/hZMm6bi6ucz
         zBZMlJtOpF+6wfdYQbQ5j3nsKNumL82nOygxFaGiZbVh5CU7JAShtOFwH2gbhWka6O
         VRbrA6BSAL+a2NvqS1TVLkqxXpx/tB7vvtWXcanY=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id xqjp5Xn6CH0h; Fri, 10 Dec 2021 09:52:20 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 9491FA1A3D402;
        Fri, 10 Dec 2021 09:52:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1639126340; bh=BfXpO1ramU7Jhp0Tq7qENbdUjofBbAmGHFhS/AXDY88=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o3LW/Y1YkNtMSoYbDu9p5b5hQPwFUd4HgZTwRm/GU2AMImq250Jcdp7Zils/birFC
         ZvEAEkTSAMAHJ+WN//9k0m2cxRM8LjG9HpnnFGnm6NgV8VaAQ5ymj/dL74nkJ/8t6I
         LcQF9n+T0Kc/3ZePAqWSunh6SZSJjKXiRvI2SYgE=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 2/2] usb: core: config: using bit mask instead of individual bits
Date:   Fri, 10 Dec 2021 09:52:19 +0100
Message-Id: <20211210085219.16796-2-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211210085219.16796-1-pavel.hofman@ivitera.com>
References: <20211210085219.16796-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Using standard USB_EP_MAXP_MULT_MASK instead of individual bits for
extracting multiple-transactions bits from wMaxPacketSize value.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 drivers/usb/core/config.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 74eb356c8767..00e28456e4cc 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -422,9 +422,9 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
 		maxpacket_maxes = full_speed_maxpacket_maxes;
 		break;
 	case USB_SPEED_HIGH:
-		/* Bits 12..11 are allowed only for HS periodic endpoints */
+		/* Multiple-transactions bits are allowed only for HS periodic endpoints */
 		if (usb_endpoint_xfer_int(d) || usb_endpoint_xfer_isoc(d)) {
-			i = maxp & (BIT(12) | BIT(11));
+			i = maxp & USB_EP_MAXP_MULT_MASK;
 			maxp &= ~i;
 		}
 		fallthrough;
-- 
2.25.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBC6146FD07
	for <lists+linux-usb@lfdr.de>; Fri, 10 Dec 2021 09:52:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236032AbhLJI4C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Dec 2021 03:56:02 -0500
Received: from cable.insite.cz ([84.242.75.189]:58553 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231410AbhLJI4B (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 10 Dec 2021 03:56:01 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id AF518A1A3D404;
        Fri, 10 Dec 2021 09:52:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1639126345; bh=8X37uBDEDyAEjOC5sbNhnFOoTCam9FONTJkejrK1bNk=;
        h=From:To:Cc:Subject:Date:From;
        b=UHe2a+i1ooPJk6LkFUrZws4TJjan9ZmRfOre/lZnpdXbTEsd2Z2NqX/vHdJFSR/0S
         CcSIvlasBhqSq2st1lBiFHp1wtli3kb/7UjmGseGapAGIQKbP4Q1Hel8ZPAJGXrFZX
         Et8l2q9b0GdhU85YwS8dObV9Iu51I32VgOS+rKv0=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id f6Iis1NSTloS; Fri, 10 Dec 2021 09:52:20 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 55E18A1A3D400;
        Fri, 10 Dec 2021 09:52:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1639126340; bh=8X37uBDEDyAEjOC5sbNhnFOoTCam9FONTJkejrK1bNk=;
        h=From:To:Cc:Subject:Date:From;
        b=rl/gP18o7g9wqUeZ/P5sVbOxM2V5grdpGwJhmogf6mWVGIX6wypRTk1hfZtjQFQ/W
         MvEdkkGItc5o0MxHbEgJSIeVWXUnCPgXVLEpADU5YViPs64O4uBECsflff25jl3+X6
         G+errnuNz/H/F8oa48JI6lKWCtSgrB8LUA+T0Llc=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 1/2] usb: core: config: fix validation of wMaxPacketValue entries
Date:   Fri, 10 Dec 2021 09:52:18 +0100
Message-Id: <20211210085219.16796-1-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The checks performed by commit aed9d65ac327 ("USB: validate
wMaxPacketValue entries in endpoint descriptors") require that initial
value of the maxp variable contains both maximum packet size bits
(10..0) and multiple-transactions bits (12..11). However, the existing
code assings only the maximum packet size bits. This patch assigns all
bits of wMaxPacketSize to the variable.

Fixes: aed9d65ac327 ("USB: validate wMaxPacketValue entries in endpoint descriptors")
Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 drivers/usb/core/config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index b199eb65f378..74eb356c8767 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -406,7 +406,7 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
 	 * the USB-2 spec requires such endpoints to have wMaxPacketSize = 0
 	 * (see the end of section 5.6.3), so don't warn about them.
 	 */
-	maxp = usb_endpoint_maxp(&endpoint->desc);
+	maxp = le16_to_cpu(endpoint->desc.wMaxPacketSize);
 	if (maxp == 0 && !(usb_endpoint_xfer_isoc(d) && asnum == 0)) {
 		dev_warn(ddev, "config %d interface %d altsetting %d endpoint 0x%X has invalid wMaxPacketSize 0\n",
 		    cfgno, inum, asnum, d->bEndpointAddress);
-- 
2.25.1


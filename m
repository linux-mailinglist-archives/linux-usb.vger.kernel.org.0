Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05EBD95AFD
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2019 11:28:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729604AbfHTJ2d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Aug 2019 05:28:33 -0400
Received: from mx2.suse.de ([195.135.220.15]:43986 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729198AbfHTJ2d (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Aug 2019 05:28:33 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id B038BAE12;
        Tue, 20 Aug 2019 09:28:31 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     gregKH@linuxfoundation.org, linux-usb@vger.kernel.org,
        guido.kiener@rohde-schwarz.com, steve_bayless@keysight.com
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] usbtmc: more sanity checking for packet size
Date:   Tue, 20 Aug 2019 11:28:25 +0200
Message-Id: <20190820092826.17694-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A malicious device can make the driver divide ny zero
with a nonsense maximum packet size.

V2: return a sensible error code

SIgned-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/usbtmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
index 4942122b2346..36858ddd8d9b 100644
--- a/drivers/usb/class/usbtmc.c
+++ b/drivers/usb/class/usbtmc.c
@@ -2362,8 +2362,11 @@ static int usbtmc_probe(struct usb_interface *intf,
 		goto err_put;
 	}
 
+	retcode = -EINVAL;
 	data->bulk_in = bulk_in->bEndpointAddress;
 	data->wMaxPacketSize = usb_endpoint_maxp(bulk_in);
+	if (!data->wMaxPacketSize)
+		goto err_put;
 	dev_dbg(&intf->dev, "Found bulk in endpoint at %u\n", data->bulk_in);
 
 	data->bulk_out = bulk_out->bEndpointAddress;
-- 
2.16.4


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78CAC291F2C
	for <lists+linux-usb@lfdr.de>; Sun, 18 Oct 2020 21:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388389AbgJRT6E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 18 Oct 2020 15:58:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:57768 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728111AbgJRTTN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 18 Oct 2020 15:19:13 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2E528222E9;
        Sun, 18 Oct 2020 19:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603048753;
        bh=bzQkU9Qz/bjx/6kjfzTUK0k/Vqf0K+PBXgMc+qXaGXA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=twTgXtFVFSQBbeDqKxD9Gn328IbR1py6dJczGbeCjgsYYWMinb7lpyVZ4fdjyt5wa
         lHNQ9Pq6iI9kDL/XidrpIJ12x/W+lOSNld67RJrZu5uLeuM9DiZwUO4qVDsvwv+T8O
         KtjgeU4bQamZ6n6apQ35VEI5kcNy0GKWqtoi8CmQ=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>,
        Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>,
        Oliver Neukum <oneukum@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 054/111] USB: cdc-acm: handle broken union descriptors
Date:   Sun, 18 Oct 2020 15:17:10 -0400
Message-Id: <20201018191807.4052726-54-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201018191807.4052726-1-sashal@kernel.org>
References: <20201018191807.4052726-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Johan Hovold <johan@kernel.org>

[ Upstream commit 960c7339de27c6d6fec13b54880501c3576bb08d ]

Handle broken union functional descriptors where the master-interface
doesn't exist or where its class is of neither Communication or Data
type (as required by the specification) by falling back to
"combined-interface" probing.

Note that this still allows for handling union descriptors with switched
interfaces.

This specifically makes the Whistler radio scanners TRX series devices
work with the driver without adding further quirks to the device-id
table.

Reported-by: Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>
Tested-by: Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>
Acked-by: Oliver Neukum <oneukum@suse.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
Link: https://lore.kernel.org/r/20200921135951.24045-3-johan@kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/class/cdc-acm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 7f6f3ab5b8a67..c8fb85a71c3ad 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1243,9 +1243,21 @@ static int acm_probe(struct usb_interface *intf,
 			}
 		}
 	} else {
+		int class = -1;
+
 		data_intf_num = union_header->bSlaveInterface0;
 		control_interface = usb_ifnum_to_if(usb_dev, union_header->bMasterInterface0);
 		data_interface = usb_ifnum_to_if(usb_dev, data_intf_num);
+
+		if (control_interface)
+			class = control_interface->cur_altsetting->desc.bInterfaceClass;
+
+		if (class != USB_CLASS_COMM && class != USB_CLASS_CDC_DATA) {
+			dev_dbg(&intf->dev, "Broken union descriptor, assuming single interface\n");
+			combined_interfaces = 1;
+			control_interface = data_interface = intf;
+			goto look_for_collapsed_interface;
+		}
 	}
 
 	if (!control_interface || !data_interface) {
-- 
2.25.1


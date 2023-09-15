Return-Path: <linux-usb+bounces-168-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E66FD7A270F
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 21:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEE881C20943
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 19:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002B318E36;
	Fri, 15 Sep 2023 19:19:19 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A5719BB2
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 19:19:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ABCCC433C8;
	Fri, 15 Sep 2023 19:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694805559;
	bh=O6zKBde/jQeUo4lppmCpOky1iZxcXTpe2NdXo5CtT+k=;
	h=Date:From:To:Cc:Subject:From;
	b=udBm1XbCL5/0ifCYnkf2qJ3cbdstwMq/rAxd67WQQcp3+EJWMFabpDIPT3InuAgxl
	 dc4t+yxDE9wFhQVq2rU1ehkXtstoW65Udmk3iflTeYs+8ickHVOnVJNwXZAS6nmKh5
	 Gf4VvoP75j65FeMbiMji31mczSwpzVw+xUkiQdxs9gbfFj9Eqn5FOZ190lCOcwA7p5
	 1YoDh5XBc0tmkPPQ5t7GUgJVnkr/+x2lbXVtQJSrtQhZRB9Nos9HsIRtqRJSPRT8zk
	 lkEduTNvCu53RsDrDUzghpv2wL0VrPPJ4k/XHROZuimlWqt9TJ5GWUKQlLDG03xFNX
	 hzac0nz0k+iwg==
Date: Fri, 15 Sep 2023 13:20:14 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Duncan Sands <duncan.sands@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH][next] usb: atm: Use size_add() in call to struct_size()
Message-ID: <ZQSuboEIhvATAdxN@work>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

If, for any reason, the open-coded arithmetic causes a wraparound,
the protection that `struct_size()` adds against potential integer
overflows is defeated. Fix this by hardening call to `struct_size()`
with `size_add()`.

Fixes: b626871a7cda ("usb: atm: Use struct_size() helper")
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/usb/atm/usbatm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/atm/usbatm.c b/drivers/usb/atm/usbatm.c
index 1cdb8758ae01..2da6615fbb6f 100644
--- a/drivers/usb/atm/usbatm.c
+++ b/drivers/usb/atm/usbatm.c
@@ -1018,7 +1018,8 @@ int usbatm_usb_probe(struct usb_interface *intf, const struct usb_device_id *id,
 	size_t size;
 
 	/* instance init */
-	size = struct_size(instance, urbs, num_rcv_urbs + num_snd_urbs);
+	size = struct_size(instance, urbs,
+			   size_add(num_rcv_urbs, num_snd_urbs));
 	instance = kzalloc(size, GFP_KERNEL);
 	if (!instance)
 		return -ENOMEM;
-- 
2.34.1



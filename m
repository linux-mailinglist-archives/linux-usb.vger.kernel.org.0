Return-Path: <linux-usb+bounces-15527-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61322987BF0
	for <lists+linux-usb@lfdr.de>; Fri, 27 Sep 2024 01:39:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16FE3285C9C
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2024 23:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBEC61B2535;
	Thu, 26 Sep 2024 23:37:55 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9ECB1B07BC
	for <linux-usb@vger.kernel.org>; Thu, 26 Sep 2024 23:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727393875; cv=none; b=cr+rbUlZ9cYwg4boUJQpoZVCGF7cVZ6PCzCvtVzRWNkUJDU9B+yutiit8M+/bzTsSwv2i3PVQMVmlaNBl3DyfSoq6boauDnuiJLVds5vq/oz9sE+e2t/vJAYPWbojH9VEpnE9uMWQNW/unCJE++RF6JqyDwHiSjaTbSnvbrCWlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727393875; c=relaxed/simple;
	bh=WxO9FtiUOTZsczgqkrChh1s/riJQM+B/cX5Zyz/pI8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R/Mdka18cCl4UsRs4Fp7PIhgmpSzr/gQ1FQy7uZW1nwnauKjOE9w08EfKnVhF64RVzj7UqW0PSQyo5mxI0dERPMpP9d6tsY9jQEiH1WiIiH32S9xfUKfKaPEuSaQRPtgKm5peVjgaOsXIMJaDFb7Hqk7hJgJqi7/SoavWWYHqDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1sty3M-0007WH-W9; Fri, 27 Sep 2024 01:37:45 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1sty3M-001nOS-C7; Fri, 27 Sep 2024 01:37:44 +0200
Received: from localhost ([::1] helo=dude04.red.stw.pengutronix.de)
	by dude04.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1sty3L-005IAz-2s;
	Fri, 27 Sep 2024 01:37:44 +0200
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
Date: Fri, 27 Sep 2024 01:37:40 +0200
Subject: [PATCH v5 1/9] usb: gadget: uvc: wake pump everytime we update the
 free list
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-uvc_request_length_by_interval-v5-1-2de78794365c@pengutronix.de>
References: <20240403-uvc_request_length_by_interval-v5-0-2de78794365c@pengutronix.de>
In-Reply-To: <20240403-uvc_request_length_by_interval-v5-0-2de78794365c@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Avichal Rakesh <arakesh@google.com>, 
 Jayant Chowdhary <jchowdhary@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Grzeschik <m.grzeschik@pengutronix.de>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1131;
 i=m.grzeschik@pengutronix.de; h=from:subject:message-id;
 bh=WxO9FtiUOTZsczgqkrChh1s/riJQM+B/cX5Zyz/pI8Y=;
 b=owEBbQKS/ZANAwAKAb9pWET5cfSrAcsmYgBm9fBE87K/lCGYSq61GH93p/Kp43Ax28QA1oXFb
 /hEf3UlBSqJAjMEAAEKAB0WIQQV2+2Fpbqd6fvv0Gi/aVhE+XH0qwUCZvXwRAAKCRC/aVhE+XH0
 qwEpD/9vV+ue53srQIH2xrzTw2RGRx0vuHfO1CfTnVsH7x7czHwmnHrrt/Icq4sYYcpE4KIbjIm
 PGKMxiqVKDNhaaSanozcoJdQsEJC/fVdkCzP+6+aE8fsieUDRXBll7khL9nMko8Xo+DZWeY7Flm
 dZLGV/k4bCUl2Yx2xQ/DFcT2YkgbDHJUW5EFqgIA9z9ZkhRNqj3/NmdPFYA6FWa7wZHcsGNsjt9
 NvZupWjgzPypE4Tsdfa41i2+682u7TnLNhsIEWEHmxsoelB9nwgo0f4MfY+WnOXU3aB2yL9rrhc
 uEs7OzXPcme9U+NdAdTwl+bXrwRypGXdJJKYAIZhI9QCOW/GOdJHZGcFM/lLJnH4OZyLY1d7wnz
 /q3puwCFk4MWtibfltmPMPu9pio/gcz8bLpcKip5iu3AaYl2rJ65IkBpL4cd1XQZsRfYGpm1tVd
 P3FkzRJdjh8lxa+wuVPLq/+B/lLTMXNfvlSgdpgevMJiruarks9wdCXAOfN+LMZgnvc3hd42TUS
 HIBHr2YRr4Aw6EyAwcFoy29NDR5ZCGI7tEgoXPfWnDe11cqDe/l0XPIX9zPQI4DOnM7z7zidl3v
 KRfzfSAV8UKupO6ZFd+67cTvoc2heiuTHOfea/JNHgoqS+LYQr3MQAH8GcZ87thVQPdaljXNX28
 FELoAJOfwdNFkKA==
X-Developer-Key: i=m.grzeschik@pengutronix.de; a=openpgp;
 fpr=957BC452CE953D7EA60CF4FC0BE9E3157A1E2C64
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.grzeschik@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

Since the req_free list will updated if enqueuing one request was not
possible it will be added back to the free list. With every available
free request in the queue it is a valid case for the pump worker to use
it and continue the pending bufferdata into requests for the req_ready
list.

Fixes: 6acba0345b68 ("usb:gadget:uvc Do not use worker thread to pump isoc usb requests")
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/gadget/function/uvc_video.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index a9edd60fbbf77..48fd8d3c50b0c 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -480,6 +480,10 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
 		 * up later.
 		 */
 		list_add_tail(&to_queue->list, &video->req_free);
+		/*
+		 * There is a new free request - wake up the pump.
+		 */
+		queue_work(video->async_wq, &video->pump);
 	}
 
 	spin_unlock_irqrestore(&video->req_lock, flags);

-- 
2.39.5



Return-Path: <linux-usb+bounces-15528-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20922987BF1
	for <lists+linux-usb@lfdr.de>; Fri, 27 Sep 2024 01:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF52228659B
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2024 23:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB8D1B07BC;
	Thu, 26 Sep 2024 23:37:56 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04161B1422
	for <linux-usb@vger.kernel.org>; Thu, 26 Sep 2024 23:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727393875; cv=none; b=uGLqGJpHg9+K4c3+e73sKP3KHSEF7CF7Gzbk3AuiALotmfarxleKYNaPhYRYdXHhjlhds1Ne71HtC86zJUGKMmO4kIxYmJBDPXjBU7ER7pVORW0N3JqEWpmgIgEU5uqFMXAalxSO5lDViHeYLY6Y2gizFlcT8G4YOhkvVXGEsOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727393875; c=relaxed/simple;
	bh=2E2DSWp9jRss1gsarQGHeBIDtJR9gvC7i2e631GtL6Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q6w9iMEaLt12ytYx7NiaWSo2Vdxq5UGwZrHJpxgYlzggpE3vOdLsIKwZ5Uznu5DbZPvVP8x9aJDwRwfOOFKD5hK7KxTZJJKvYXdQjtvnnybFqRtaZ/zNBBMWeiIdU0ilreor5Y5PeaJr/7VFr/8tWd4A0cZDwoJC3gv93dpWLwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1sty3N-0007WP-11; Fri, 27 Sep 2024 01:37:45 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1sty3M-001nOY-F4; Fri, 27 Sep 2024 01:37:44 +0200
Received: from localhost ([::1] helo=dude04.red.stw.pengutronix.de)
	by dude04.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1sty3L-005IAz-2y;
	Fri, 27 Sep 2024 01:37:44 +0200
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
Date: Fri, 27 Sep 2024 01:37:46 +0200
Subject: [PATCH v5 7/9] usb: gadget: uvc: set nbuffers to minimum
 STREAMING_MIN_BUFFERS in uvc_queue_setup
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-uvc_request_length_by_interval-v5-7-2de78794365c@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1915;
 i=m.grzeschik@pengutronix.de; h=from:subject:message-id;
 bh=2E2DSWp9jRss1gsarQGHeBIDtJR9gvC7i2e631GtL6Q=;
 b=owEBbQKS/ZANAwAKAb9pWET5cfSrAcsmYgBm9fBHF8gn+ePJeCHwBKrCx9BRxUYzpsPLP+3Qq
 MsNPy87EPiJAjMEAAEKAB0WIQQV2+2Fpbqd6fvv0Gi/aVhE+XH0qwUCZvXwRwAKCRC/aVhE+XH0
 q4F3EACTWbE6uCHYvTtugu0tSUHlHc70kSp7Ksb2maUjGsAQ+qTiZlRAw6Gqu0lRgTWXkhQmAp4
 enPlpb37TsOhi1be2mDfHUw6nodNxw4s086d/+BcKh0iwSVO2S+0MDFGCfDTvBvVQfm0V5eyUjx
 hBXUdERvFptQKo3Q1psCuQ6EIWa4KwW/BKkv6HxSJdI5h2BTA+gXpC8atvzug8L85yw6lesE8kz
 n7cqQAq07Xay74Wuaixj+BJ9wWWqtNvIwx7o4al6NeM3WLWBJ06FdDW7VKcfdwYzkgOx/DIxbhV
 8SRYJNaFH/fQE5aBEUH4LvrSBj09kN+t38zu4sWKc9ktlD6kyswsTfopYU83BXvuPKcAewAUSHJ
 xNbQCeIsvoBhPO1G3tRkQ6WJgiIif8l1E+Xvh9ixF4OWSr9T+aCEDUzMkFBPvecswXwX0Rp4sLZ
 TdpfEpT2ymYe3U1MEt+fFCnxVGiytM/LRYrkLfD80LZEdZJT1LiBqjpI+SXt1W+H+bIpYRyEkmJ
 IiZ72RNFwszmDcakZq/MBNo2UBqORK4DT7kPdJtr2PXR717jpdtgQfY0T9tFFspDc78g8XQdGN/
 CRR5EAZdwxRKg14MuTP6Mhk4hIx979sBef0rqb1lD3QuQO0RLvrrWarVc9wmgDOZ5/VLA+qxs04
 E4SD6zC7sKxXL7A==
X-Developer-Key: i=m.grzeschik@pengutronix.de; a=openpgp;
 fpr=957BC452CE953D7EA60CF4FC0BE9E3157A1E2C64
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.grzeschik@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

We set the minimum amount of v4l2 buffers that is possibly be pending
to UVCG_STREAMING_MIN_BUFFERS which is two. This way the driver will
always have at least one frame pending to be encoded while the other
is being enqueued in the hardware.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v4 -> v5:
 - using STREAMING_MIN_BUFFERS set the min nbuffers
 - renamed the patch since the function changed
 - removed the g_ctrl function
 - reordered this patch in the series
v1 -> v4: -
---
 drivers/usb/gadget/function/uvc.h       | 2 ++
 drivers/usb/gadget/function/uvc_queue.c | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index bedb4ef42864f..6f44dd7323150 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -74,6 +74,8 @@ extern unsigned int uvc_gadget_trace_param;
 #define UVCG_REQ_MAX_INT_COUNT			16
 #define UVCG_REQ_MAX_ZERO_COUNT			(2 * UVCG_REQ_MAX_INT_COUNT)
 
+#define UVCG_STREAMING_MIN_BUFFERS		2
+
 /* ------------------------------------------------------------------------
  * Structures
  */
diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
index 6757a4e25a743..5eaeae3e2441c 100644
--- a/drivers/usb/gadget/function/uvc_queue.c
+++ b/drivers/usb/gadget/function/uvc_queue.c
@@ -21,6 +21,7 @@
 #include <media/videobuf2-vmalloc.h>
 
 #include "uvc.h"
+#include "uvc_video.h"
 
 /* ------------------------------------------------------------------------
  * Video buffers queue management.
@@ -47,6 +48,8 @@ static int uvc_queue_setup(struct vb2_queue *vq,
 
 	if (*nbuffers > UVC_MAX_VIDEO_BUFFERS)
 		*nbuffers = UVC_MAX_VIDEO_BUFFERS;
+	if (*nbuffers < UVCG_STREAMING_MIN_BUFFERS)
+		*nbuffers = UVCG_STREAMING_MIN_BUFFERS;
 
 	*nplanes = 1;
 

-- 
2.39.5



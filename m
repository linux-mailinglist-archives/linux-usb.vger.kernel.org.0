Return-Path: <linux-usb+bounces-16332-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 000C29A0C2B
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 16:00:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80135288D0C
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 14:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2176B212F14;
	Wed, 16 Oct 2024 13:58:31 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685A320F5B0
	for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2024 13:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729087110; cv=none; b=XHyLbVHUb16R5jNXlLOl0oyBRQoFYTvWOHMO0G29DfznicwFgjpz91Ww/oFBW3umHSItqXlxX2+ZQaoS1En1Ruy0V3T6xPU7DnPFeo+/SKUIsvtfvw8P9/jRbL71c5ba5/UpJpgIIJfUktfyEfEYIL84J/2XMs7FGRzOLXJU5Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729087110; c=relaxed/simple;
	bh=FQQKhQAXmmfvBtHkKDMq5EyEYLZUfN9InwR5tHYzyaU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aPfp36I2l7iprPXJ0COz58NURFigJquDASSLDoHD+N31W0I0gx8mxspVNvRSojjWBmMj3M7iCMao7VmS1kaWHdSJd32mGIEe9B7ok1mIh0i9F4CFTYPyGjke6NrnM/4vpxJidE9o8APl4+1ZQgzSEerK5nKS1U0TJNaxhOoaGSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1t14Xd-0003H1-Ok; Wed, 16 Oct 2024 15:58:21 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1t14Xd-002HjA-2e; Wed, 16 Oct 2024 15:58:21 +0200
Received: from localhost ([::1] helo=dude04.red.stw.pengutronix.de)
	by dude04.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1t14Xc-00BU5S-36;
	Wed, 16 Oct 2024 15:58:20 +0200
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
Subject: [PATCH v7 0/9] usb: gadget: uvc: effectively fill the udc isoc
 pipeline with available video buffers and fixes
Date: Wed, 16 Oct 2024 15:58:05 +0200
Message-Id: <20240403-uvc_request_length_by_interval-v7-0-e224bb1035f0@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG7GD2cC/5XQTW7DIBAF4KtErEuFhz+7q96jqiwMQ4xk4RRsl
 Cjy3YuzrRf18o1G3xvNk2RMATP5uDxJwhJymGMN+u1C7GjiFWlwNRNgIJhgnK7F9gl/VsxLP2G
 8LmM/PPoQF0zFTNRo9E622nWKk4oMJiMdkol2rExcp6kObwl9uL9av75rHkNe5vR4HVGaffrvv
 tJQRjvBlRW6UcD5560urUuaY7i/OyS7X+CcCdVsQHXMawPo/aHJz5m8msIZzTh3TrTtoSnOmaK
 a1gB4zgWAwkNTnjNlNcGhbvX+VWkPTXXOVNVkrWVSAmDj5R9z27ZfmNi6wIoCAAA=
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Avichal Rakesh <arakesh@google.com>, 
 Jayant Chowdhary <jchowdhary@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Michael Grzeschik <m.grzeschik@pengutronix.de>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4123;
 i=m.grzeschik@pengutronix.de; h=from:subject:message-id;
 bh=FQQKhQAXmmfvBtHkKDMq5EyEYLZUfN9InwR5tHYzyaU=;
 b=owEBbQKS/ZANAwAKAb9pWET5cfSrAcsmYgBnD8Z2m1af6iujBK9LRvZs/Kpn3OYmXfH3fwu9l
 DEHpFWtjxuJAjMEAAEKAB0WIQQV2+2Fpbqd6fvv0Gi/aVhE+XH0qwUCZw/GdgAKCRC/aVhE+XH0
 qwgcD/99ryX1cRFAztD0ZmZ72RwY5hngnyn0osKrcUUgNsOT3hyuZDLymzF9cnoE3t6A74tYCmm
 8s7FPXEUyRJgNLAPPYek0PrWjN58tk/olJ119O+cbmfvqExnJosENyTF7pDL1NHKX/cyAyfD6DB
 OO4vf/QwNRjAo+cKk66PnBlW8KJK3+BbYJ6Yt5bzPYzeCkcDQIsjxtx/ruzCrUGaGO+FWGTGEK1
 4nzy+LvyzzTePLYMiuoJYwQFneonzANQD9Ob38T8hIY+pCWBlYieiisdrqZwRu+9euE0zAq709e
 /Kow8KIvT5aEJ7Xxcpo2MjvoFHnnsVk4RuaaYQGkXP2yT2urOTDBi7mmxZ57QTgk949KzzF83PN
 x98lk+jIpcBcbq0kWXkN2xydYI3iLEwAOkkLeV6zkHfkPtDFIwP98IiTGNjejoNhGlx7+f/5al9
 GkJS1aqpDm/eFn/CS95t4iKRDTMocGF/1obJxw7ZX7FArLppax4K3jbJPelngJMO5BD10u9yC5q
 afz6Ar3WaEKUl61c2wXXtRMakVE97154zbz8pWYnvgfXf9mhaTtpHIfQgJ2tih2JrV7NZqqnQpZ
 gqi5uKQ6N1pwwX6ZkktuUgYN96bQ7gSF7mEvYq+P9mTjQKJS8IA+rXquvUTrOLHtLMye1v5CAq7
 QOXy0EQg3YUIEPA==
X-Developer-Key: i=m.grzeschik@pengutronix.de; a=openpgp;
 fpr=957BC452CE953D7EA60CF4FC0BE9E3157A1E2C64
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.grzeschik@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

This patch series is improving the size calculation and allocation of
the uvc requests. Using the selected frame duration of the stream it is
possible to calculate the number of requests based on the interval
length.

It also precalculates the request length based on the actual per frame
size for compressed formats.

For this calculations to work it was needed to rework the request
queueing by moving the encoding to one extra thread (in this case we
chose the qbuf) context.

Next it was needed to move the actual request enqueueing to one extra
thread which is kept busy to fill the isoc queue in the udc.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
Changes in v7:
- fixed build of tracing in uvc_trace
- Link to v6: https://lore.kernel.org/r/20240403-uvc_request_length_by_interval-v6-0-08c05522e1f5@pengutronix.de

Changes in v6:
- fixes in: ("usb: gadget: uvc: add trace of enqueued and completed requests")
- Link to v5: https://lore.kernel.org/r/20240403-uvc_request_length_by_interval-v5-0-2de78794365c@pengutronix.de

Changes in v5:
- dropped: ('usb: gadget: uvc: remove pump worker and enqueue all buffers per frame in qbuf')
- squashed ('usb: gadget: uvc: rework to enqueue in pump worker from encoded queue') and ('usb: gadget: uvc: remove uvc_video_ep_queue_initial_requests'))
- squashed ('usb: gadget: uvc: set req_size once when the vb2 queue is calculated') and ('usb: gadget: uvc: set req_size and n_requests based on the frame interval')
- replaced ('usb: gadget: uvc: add min g_ctrl vidioc and set min buffs to 4') with ('usb: gadget: uvc: set nbuffers to minimum STREAMING_MIN_BUFFERS in uvc_queue_setup')
- added ('usb: gadget: uvc: wake pump everytime we update the free list')
- added ('usb: gadget: uvc: add trace of enqueued and completed requests')
- added ('usb: gadget: uvc: dont call usb_composite_setup_continue when not streamin')
- some patch reordering
- Link to v4: https://lore.kernel.org/r/20240403-uvc_request_length_by_interval-v4-0-ca22f334226e@pengutronix.de

Changes in v4:
- fixed exit path in uvc_enqueue_buffer on loop break
- Link to v3: https://lore.kernel.org/r/20240403-uvc_request_length_by_interval-v3-0-4da7033dd488@pengutronix.de

Changes in v3:
- Added more patches necessary to properly rework the request queueing
- Link to v2: https://lore.kernel.org/r/20240403-uvc_request_length_by_interval-v2-0-12690f7a2eff@pengutronix.de

Changes in v2:
- added header size into calculation of request size
- Link to v1: https://lore.kernel.org/r/20240403-uvc_request_length_by_interval-v1-0-9436c4716233@pengutronix.de

---
Michael Grzeschik (9):
      usb: gadget: uvc: wake pump everytime we update the free list
      usb: gadget: uvc: only enqueue zero length requests in potential underrun
      usb: gadget: uvc: rework to enqueue in pump worker from encoded queue
      usb: gadget: uvc: add g_parm and s_parm for frame interval
      usb: gadget: uvc: set req_size and n_requests based on the frame interval
      usb: gadget: uvc: set req_length based on payload by nreqs instead of req_size
      usb: gadget: uvc: set nbuffers to minimum STREAMING_MIN_BUFFERS in uvc_queue_setup
      usb: gadget: uvc: add trace of enqueued and completed requests
      usb: gadget: uvc: dont call usb_composite_setup_continue when not streaming

 drivers/usb/gadget/function/Makefile    |   4 +
 drivers/usb/gadget/function/f_uvc.c     |   2 +
 drivers/usb/gadget/function/uvc.h       |  13 ++
 drivers/usb/gadget/function/uvc_queue.c |  26 ++--
 drivers/usb/gadget/function/uvc_queue.h |   2 +
 drivers/usb/gadget/function/uvc_trace.c |  11 ++
 drivers/usb/gadget/function/uvc_trace.h |  60 ++++++++
 drivers/usb/gadget/function/uvc_v4l2.c  |  55 +++++++
 drivers/usb/gadget/function/uvc_video.c | 264 +++++++++++++++++++-------------
 9 files changed, 317 insertions(+), 120 deletions(-)
---
base-commit: 64f3b5a6bc49adf77d58eddd72a4bfccd492fa24
change-id: 20240403-uvc_request_length_by_interval-a7efd587d963

Best regards,
-- 
Michael Grzeschik <m.grzeschik@pengutronix.de>



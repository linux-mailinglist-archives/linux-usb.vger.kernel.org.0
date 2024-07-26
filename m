Return-Path: <linux-usb+bounces-12480-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F4793DA83
	for <lists+linux-usb@lfdr.de>; Sat, 27 Jul 2024 00:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48E601F22127
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2024 22:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9B614E2CC;
	Fri, 26 Jul 2024 22:02:58 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC9714A086
	for <linux-usb@vger.kernel.org>; Fri, 26 Jul 2024 22:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722031378; cv=none; b=H3oAsNF7nznTAjwTZwnzcd2xd1RyLitmfimAJ1b/b4Q6wUqqR82ZRXk9lzZAk0d1kmvSq/lYxM7Stz5Bb/Ce9J7oEJIVtSYZxAgtMzM943DlSCufbMZbWkFDU/R6Cgm4PRux00EItdZDHrB/S+tLzHsWYJUkgX7nVV82dudkxgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722031378; c=relaxed/simple;
	bh=G0BEnwqGJG76k3f/c8zaJ/Nltc1mlmkYFI+LzqJDZEI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=C24LoqINYfGkiSqiyT3RFCJ871ChabRRRKDcl27NBQyQUWT28Xkm71J9n9rdwC6XYSwCPG8aa9tdljP3+xIgTVBbVVgATs+xWx3w+TowfQnL/cWMn9hiRa7Egch9wgrXmApFv5VzhaLnoCVMQo8sSWhmrBi7wI3j0y/gJs33IcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1sXT1Q-0005Mk-RF; Sat, 27 Jul 2024 00:02:44 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1sXT1P-002Qht-SF; Sat, 27 Jul 2024 00:02:43 +0200
Received: from localhost ([::1] helo=dude04.red.stw.pengutronix.de)
	by dude04.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1sXT1P-00FdLn-2Z;
	Sat, 27 Jul 2024 00:02:43 +0200
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
Subject: [PATCH v3 00/10] usb: gadget: uvc: effectively fill the udc isoc
 pipeline with available video buffers
Date: Sat, 27 Jul 2024 00:02:35 +0200
Message-Id: <20240403-uvc_request_length_by_interval-v3-0-4da7033dd488@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPscpGYC/5XOQQ6DIBAF0Ks0rEuDYKF21Xs0DUEZlMSgBSQa4
 92Lbrtpl/9n8v6sKIC3END9tCIPyQY7uBzY+YSaTrkWsNU5I0poSUrC8JQa6eE9QYiyB9fGTta
 LtC6CT6rHSoDR15vQFWcoI7UKgGuvXNNlxk19n8vRg7Hzsfp85dzZEAe/HE+kYm9/3ksFJrgqG
 W9KUXDK2GPMR1P0g7PzRQPa/UT/M2k2C8orYoSiYMyXuW3bB14VQ1M6AQAA
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Avichal Rakesh <arakesh@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Grzeschik <m.grzeschik@pengutronix.de>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2708;
 i=m.grzeschik@pengutronix.de; h=from:subject:message-id;
 bh=G0BEnwqGJG76k3f/c8zaJ/Nltc1mlmkYFI+LzqJDZEI=;
 b=owEBbQKS/ZANAwAKAb9pWET5cfSrAcsmYgBmpBz97ISPYedwFkDftib2FuKjxHuz95hUW1z6g
 iCYRZ4U9e2JAjMEAAEKAB0WIQQV2+2Fpbqd6fvv0Gi/aVhE+XH0qwUCZqQc/QAKCRC/aVhE+XH0
 q5oKD/0WvLY/rwHpHmXuubapFuKETrJES+2dIoDTFRsuUyZBHB5NSqBg2rVNvR0375MxeJPiYEQ
 hwEhDeO4A9X1OLdQH3FnEGkraZDrP48j1FJ/fnRO71CIzadOStoPzXXYd5noZq5cDZI5uPcJkzt
 oJ+CGRDFDV6B1BLz6KB4rm/DDwbCI7MXD0sUp1eHPCet6iACZb6WFDkHy9eGwVHnUlTi+qbcECK
 QUHLIPWEJiE0EGUFL49R+ZZfw8VxbC0SGdvClZbXXyRgmXkqNBM4JtPfP4wZhU2jjCVbzK4+RMP
 rQZCMP852ZFqHZNZt3E1TWILx4m5w5Te0OqsJky8dkAkXsokLyiMS0e/NQ2uW75bFFBgWeDlXYR
 gJ3/zRuFTBMjsjZ8YtglfFCLUjh3xzkZcBYRL1cm1XzETNyL81d6Y4hBtXMhlyH46WKGTFKeGqJ
 TPTmTlNXI+B3VwkYh6a/DwFZ6U9FaMyJMfikkBjFoBLrmZoyNEUMvRMMvOXPJHBi+LsEhiMrMQU
 BL62SDctv2rPeUWXl8GG6WSOdPqR3kjlQsYK4FH+Bekm8Si0dNphsVCRuhm1JU5TtZiacpCxBGb
 Fdw1kzD8q0ptVG3WLqXICRk4mdxEYdWfKpxrEy3+ncWXPjLzsirsUiOdoFQ5+Zd1vNNRoimg9YM
 rj6z0y+inY/EDKQ==
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

As a final step the series is increasing the minimum amount of
v4l2 buffers to 4 and allocates at least the amount of usb_requests
to store them in the usb gadgte isoc pipeline.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
Changes in v3:
- Added more patches necessary to properly rework the request queueing
- Link to v2: https://lore.kernel.org/r/20240403-uvc_request_length_by_interval-v2-0-12690f7a2eff@pengutronix.de

Changes in v2:
- added header size into calculation of request size
- Link to v1: https://lore.kernel.org/r/20240403-uvc_request_length_by_interval-v1-0-9436c4716233@pengutronix.de

---
Michael Grzeschik (10):
      usb: gadget: uvc: always set interrupt on zero length requests
      usb: gadget: uvc: only enqueue zero length requests in potential underrun
      usb: gadget: uvc: remove pump worker and enqueue all buffers per frame in qbuf
      usb: gadget: uvc: rework to enqueue in pump worker from encoded queue
      usb: gadget: uvc: remove uvc_video_ep_queue_initial_requests
      usb: gadget: uvc: set req_size once when the vb2 queue is calculated
      usb: gadget: uvc: add g_parm and s_parm for frame interval
      usb: gadget: uvc: set req_size and n_requests based on the frame interval
      usb: gadget: uvc: set req_length based on payload by nreqs instead of req_size
      usb: gadget: uvc: add min g_ctrl vidioc and set min buffs to 4

 drivers/usb/gadget/function/f_uvc.c     |   3 +-
 drivers/usb/gadget/function/uvc.h       |  14 +-
 drivers/usb/gadget/function/uvc_queue.c |  52 +++++--
 drivers/usb/gadget/function/uvc_queue.h |   1 +
 drivers/usb/gadget/function/uvc_v4l2.c  |  67 ++++++++-
 drivers/usb/gadget/function/uvc_video.c | 236 +++++++++++++-------------------
 drivers/usb/gadget/function/uvc_video.h |   1 +
 7 files changed, 215 insertions(+), 159 deletions(-)
---
base-commit: 1722389b0d863056d78287a120a1d6cadb8d4f7b
change-id: 20240403-uvc_request_length_by_interval-a7efd587d963

Best regards,
-- 
Michael Grzeschik <m.grzeschik@pengutronix.de>



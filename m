Return-Path: <linux-usb+bounces-16330-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFBC9A0C25
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 16:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2D641F23C71
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 14:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B442B21262A;
	Wed, 16 Oct 2024 13:58:30 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BBD20E022
	for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2024 13:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729087110; cv=none; b=SJHaOPSJ3d8XmLVJ11Mz0PWCneJShgQZf7EisfHasv07m/pJG6vDJJIYe0FOujWp/Ot9iHClJOlVJDoKXgCI349HYQpz9+VhtZkUuMd/zclC1+23cJ+R+jW/bxi/DTvA/BgL6TzE2E73EZ1KCZZ2WxIRIXXf3vFC1TAldVILjyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729087110; c=relaxed/simple;
	bh=lxMrwpZ77rgZrCcv4E5I3U8EaQhP4MIcvyniUzUZWhA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RH//vlSWStabpQGjx1i51FVXyi6OK863UKp9rteIl5VoZowBr2Li+JgEWvdrevq4zI9GUl1vqPv56uFilNE6sVWqZrMENAe8UyKYrU81Y5sP6APCyqBHCEuGpUGAKJWJi77do8TlSf4HqebWygdanjQ0UQKxpv4MQz1LliYI2p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1t14Xd-0003H4-O8; Wed, 16 Oct 2024 15:58:21 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1t14Xd-002HjI-3L; Wed, 16 Oct 2024 15:58:21 +0200
Received: from localhost ([::1] helo=dude04.red.stw.pengutronix.de)
	by dude04.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1t14Xd-00BU5S-01;
	Wed, 16 Oct 2024 15:58:21 +0200
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
Date: Wed, 16 Oct 2024 15:58:14 +0200
Subject: [PATCH v7 9/9] usb: gadget: uvc: dont call
 usb_composite_setup_continue when not streaming
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-uvc_request_length_by_interval-v7-9-e224bb1035f0@pengutronix.de>
References: <20240403-uvc_request_length_by_interval-v7-0-e224bb1035f0@pengutronix.de>
In-Reply-To: <20240403-uvc_request_length_by_interval-v7-0-e224bb1035f0@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Avichal Rakesh <arakesh@google.com>, 
 Jayant Chowdhary <jchowdhary@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Michael Grzeschik <m.grzeschik@pengutronix.de>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1116;
 i=m.grzeschik@pengutronix.de; h=from:subject:message-id;
 bh=lxMrwpZ77rgZrCcv4E5I3U8EaQhP4MIcvyniUzUZWhA=;
 b=owEBbQKS/ZANAwAKAb9pWET5cfSrAcsmYgBnD8Z88gJtVaxHj75VmfrPgW5ryXP6R57oHQ4T8
 QMXUsyvSD2JAjMEAAEKAB0WIQQV2+2Fpbqd6fvv0Gi/aVhE+XH0qwUCZw/GfAAKCRC/aVhE+XH0
 qzZeD/9LNNHzSWIZRPjbyAcnY5lTswVMrMdcGtoylDHPnrj1xoxad4+5W9s9ZA1tUHIm4txVDdF
 Fen1nYlDehldlyn68Ca2h8oVcr5ZQdQhnwGteFYw9/LwXIqOpO8pRSBy5Sq0YPo5pJcB7HDvoJA
 CFJ7uIV8gmu5PQAy619EgSnbRWMm0k/qzrAkcUUioed24lWB/8AoA5nCNX0RtfVpA1CGnGwBDen
 Q7dETeO7OxWiXZfx7PLaC4/KHGD2C6qvLrKnCd4ua1/bcAC3icYsqlzhnlSslmgo27IhPcIAFSd
 pyWGd1qFRp2X5s9BbpaTy8bQ8KkwHWMGXZiE12uxUGYAKkZ8Xd/+MdvItMMT7SNeu69d00tISWP
 q/4X9Fhi6x1vAuOMPxelGUGgUS0iPVP6HuGDgaFS6+jMD2v9a8Ak6pta5f/NaVNKKr72lFQuSlA
 GlvZdTujNFvORsVb9zMiAXqiY9IeZjCYuBTybWtjv71Ww2ajIQdxU3C1G+OYEML8j6yPwJFlWv2
 nYsLnxpec9vEuEejNfG5aH7nyg3MEoRcp727ge4CUdz18jiRGtArhS8An+q3LhgxC0huG4I36Ej
 Kaj0bDsWQOU2ekmUxJLn+IFcl958dEbUYFJ9Gp2ipKO3N6TQbb0Px/Y4PAju7LAtgY70KmgMKPN
 OO+6VMxkQQVT2oQ==
X-Developer-Key: i=m.grzeschik@pengutronix.de; a=openpgp;
 fpr=957BC452CE953D7EA60CF4FC0BE9E3157A1E2C64
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.grzeschik@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

If the streamoff call was triggered by some previous disconnect
or userspace application shutdown the uvc_function_setup_continue
should not be called and the state should not be overwritten.

For this situation the set_alt(0) was never called and the streaming ep
has no USB_GADGET_DELAYED_STATUS pending.

Since the state then was already updated before we also omit the state
update.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v5 -> v7: -
v1 -> v5: - new patch
---
 drivers/usb/gadget/function/uvc_v4l2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index ab89f1630acb0..3492855f0fb29 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -546,6 +546,9 @@ uvc_v4l2_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 	if (ret < 0)
 		return ret;
 
+	if (uvc->state != UVC_STATE_STREAMING)
+		return 0;
+
 	uvc->state = UVC_STATE_CONNECTED;
 	uvc_function_setup_continue(uvc, 1);
 	return 0;

-- 
2.39.5



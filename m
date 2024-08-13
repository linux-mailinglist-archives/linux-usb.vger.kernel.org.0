Return-Path: <linux-usb+bounces-13346-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 125F59500EF
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2024 11:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48B6DB24984
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2024 09:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2938B189BB5;
	Tue, 13 Aug 2024 09:09:43 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA5917BB34
	for <linux-usb@vger.kernel.org>; Tue, 13 Aug 2024 09:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723540182; cv=none; b=q+BBTPOkH9ZOrzVq0uYNrr+1rxpHbU87GAoljQj2Dx3LXikDSwWG/9n8tJ9z5V4u0iTYO4FTOsQdIiQ136MzjSAMecMSSha1R7dwYjx3oZhJ6DChBhez0aas0m7hrDPUKNdp2sWesgk1u6gIlTjHzcRyiLL4DcGjGYRGxDtR8v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723540182; c=relaxed/simple;
	bh=V2Yg1K6uq3EvyDknOFm++29HuHf8ClJtAHIq6pWIOJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mLOQGfkj1jIMQGUp7NfM6EY7YrvibHxxBn9hUAcydsop2uSyOaD+4NpX0I9TGbyUhd/Xvp3ClPmUXEnKXj+sk0ebMj1bdgT6/9FXNDdQqi4K3//9y5/T+Dd9wbJE6+hURdJs7mtnGgMaGi3Jywj0QtSC4tPKL0McpOP/C6JY2Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1sdnX4-0002CI-SF; Tue, 13 Aug 2024 11:09:34 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1sdnX4-0005of-6f; Tue, 13 Aug 2024 11:09:34 +0200
Received: from localhost ([::1] helo=dude04.red.stw.pengutronix.de)
	by dude04.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1sdnX4-00G1eS-0G;
	Tue, 13 Aug 2024 11:09:34 +0200
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
Date: Tue, 13 Aug 2024 11:09:25 +0200
Subject: [PATCH v4 01/10] usb: gadget: uvc: always set interrupt on zero
 length requests
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-uvc_request_length_by_interval-v4-1-ca22f334226e@pengutronix.de>
References: <20240403-uvc_request_length_by_interval-v4-0-ca22f334226e@pengutronix.de>
In-Reply-To: <20240403-uvc_request_length_by_interval-v4-0-ca22f334226e@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Avichal Rakesh <arakesh@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Grzeschik <m.grzeschik@pengutronix.de>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=992;
 i=m.grzeschik@pengutronix.de; h=from:subject:message-id;
 bh=V2Yg1K6uq3EvyDknOFm++29HuHf8ClJtAHIq6pWIOJk=;
 b=owEBbQKS/ZANAwAKAb9pWET5cfSrAcsmYgBmuyLKSSExtNbuUUMoqae99KcjxOhVaaLhCebWv
 t+FBaNFbiyJAjMEAAEKAB0WIQQV2+2Fpbqd6fvv0Gi/aVhE+XH0qwUCZrsiygAKCRC/aVhE+XH0
 qx/XD/9YiB/CgVkhOBRfztk6YsPjovjZRSCipVTgxN2AYls+g+SuaJBYLtP1uR2vnTW4TQEXzBw
 blEFgzkhe3ui8RKd7l6gYFEq1tX8/nMFpsXED2DYYZw/la6S0aBrmWg+w/HngVasDt07yAJ3JVR
 QHo62S2qHqlKNwhUkxNHzsRBqJkf6j7FZcjkjc8gPfpc/Q7Gqu9XuTUGS4JKhF6ECbVlk1n0EPa
 DejCc6BjcXwzovAHIVlZAny2pLe/r3WQBy/vLkP1gDL2PrNhUz/4Agv6U5GxOdKsWu4kj8/wSI2
 8qXtQrWVMeZZJhgCbZarw+iOmW0ZzEv3ePfSy4rcHkHo1f39zy3arjx56Hk9ekakDKgDUpe2lXL
 +JYeoUgJLI1Asf7YX1e5g8dwyphYsjmWzpXzconqtobusUFk74uk0G2kua0euGkOg6eVqJfWaM7
 hqb1reEB6cgZBNLS7pBADFtEM7r9jlUGLPYdb2S35iqTfoq9A5+nSEyWwZ4Gq4iaVJb1Aite9St
 Hba5dhxWylRUusKReg02KuzJyt6IRpH5JNQY/xXcSkKNxopUxcuGhgaQ3mNzOFMZV1goOip2H2A
 9Jz1eHeArdjC90mRJV+tpCx/ENPe+PLBWjmhP0cETpMAGaRY84ephRNaSnV7PvMN+n+uJcN2FVZ
 1OziOdTDRGG4pWw==
X-Developer-Key: i=m.grzeschik@pengutronix.de; a=openpgp;
 fpr=957BC452CE953D7EA60CF4FC0BE9E3157A1E2C64
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.grzeschik@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

Since the uvc gadget is depending on the completion handler to
properly enqueue new data, we have to ensure that the requeue mechanism
is always working. To be safe we always create an interrupt
on zero length requests.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v3 -> v4: -
v1 -> v3: new patch
---
 drivers/usb/gadget/function/uvc_video.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index d41f5f31dadd5..03bff39cd4902 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -303,6 +303,7 @@ static int uvcg_video_usb_req_queue(struct uvc_video *video,
 		 *   between latency and interrupt load.
 		 */
 		if (list_empty(&video->req_free) || ureq->last_buf ||
+				!req->length ||
 			!(video->req_int_count %
 			DIV_ROUND_UP(video->uvc_num_requests, 4))) {
 			video->req_int_count = 0;

-- 
2.39.2



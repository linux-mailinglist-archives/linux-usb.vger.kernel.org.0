Return-Path: <linux-usb+bounces-12484-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 847DA93DA87
	for <lists+linux-usb@lfdr.de>; Sat, 27 Jul 2024 00:03:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F16928208C
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2024 22:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD5B14F9E6;
	Fri, 26 Jul 2024 22:02:58 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B766149E16
	for <linux-usb@vger.kernel.org>; Fri, 26 Jul 2024 22:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722031378; cv=none; b=SCWCP5A4We77G5jxf070ed45OEyrwfNZZA+VsIpwqe7Qi8xN8fYylSKi3TGeEdVhZ3kKhoFJrc84/I7+u36itso9rUW1R9Alea1dPSacdR9KKypnVkAbtDJkCcIUCDi2ot+znrRNT/c5rX8AVlh6QsZQcgrDwyVhkdQ78RenBBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722031378; c=relaxed/simple;
	bh=YF8dKVRyhizjPiHy0ih4AgDTr68Pw1ZAnLHDUu9ERrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lUWucCLPwRJ14Oadmh6jQYGyrqHJ7m8IzKDeIXeU1VYmEllRxESmiMHiky0v3WtzBYQm18eZpXDncuKf5Fo2GdRJALKkfEeGlvtdMm/5sf0GxgFMiIk5gO4C03m+Dwh5+oW33837LIaQCwk5V3eg1WKQ0oQRQJZ+OCwQjtNuigY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1sXT1Q-0005Ml-RH; Sat, 27 Jul 2024 00:02:44 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1sXT1P-002Qhs-T6; Sat, 27 Jul 2024 00:02:43 +0200
Received: from localhost ([::1] helo=dude04.red.stw.pengutronix.de)
	by dude04.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1sXT1P-00FdLn-2a;
	Sat, 27 Jul 2024 00:02:43 +0200
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
Date: Sat, 27 Jul 2024 00:02:36 +0200
Subject: [PATCH v3 01/10] usb: gadget: uvc: always set interrupt on zero
 length requests
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-uvc_request_length_by_interval-v3-1-4da7033dd488@pengutronix.de>
References: <20240403-uvc_request_length_by_interval-v3-0-4da7033dd488@pengutronix.de>
In-Reply-To: <20240403-uvc_request_length_by_interval-v3-0-4da7033dd488@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Avichal Rakesh <arakesh@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Grzeschik <m.grzeschik@pengutronix.de>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=979;
 i=m.grzeschik@pengutronix.de; h=from:subject:message-id;
 bh=YF8dKVRyhizjPiHy0ih4AgDTr68Pw1ZAnLHDUu9ERrE=;
 b=owEBbQKS/ZANAwAKAb9pWET5cfSrAcsmYgBmpB0AGohv1n2w/AeHnH8jua9EG3TO0dshNYRLO
 enKfG3xjAaJAjMEAAEKAB0WIQQV2+2Fpbqd6fvv0Gi/aVhE+XH0qwUCZqQdAAAKCRC/aVhE+XH0
 q4RwEACeBnI5CnaavaX5aA7CBBlvvu/QMaK4B7JctaSfSr7Y0qT7z4CZ4PlxpnxjIENeVfIeeKo
 pKHl7TtkNzHwBWDtqWvWhv41L/nGI9dkIx+juIV3ej45jZ1Gt0aol7+nUfV0hRxyXVNRXad25mO
 hQqXmcKMNyp7000cQQRIjI/QHDAITkApWjQTY53R5YIx/5RIyI49w09kQmfWNPLbDbvzNMULUJA
 7AbiKK8eYgloFJkPGdZPGR6FpdI7z/j4RwIgUOqFQvB13Le0V2VEVwN8PCohMxhUazh7qiI3eZe
 1Q0YgGui5J2KDGO3DefBzVai400vVi8Ha1qWEt4AT3u15HDxQAKa08MhxetC94OnOZ6zTHwVWDF
 JZWtShfeROQ9OH/jrxSF6TibvSTRpijVYbJmX02pl4D55yU1MrNlafkgl1PR2u+9H9ocXsDsicU
 W7kz3YC+hzUaObV+AjHvrdY1zATS2O7/010kPsB47cThVnZdKfwSdkQ7u4fsnlRpDf6ngcjKzpE
 zb+hwK0rMJvEGhieK8lrjckxJ0HlX7PXMGobPmflDSW2w42Czvkd4gmXZOc+OM9oMKTGr/AsF8e
 LjMyjglbCWSnFPzD9oiyK47XSF4ABc5eT/sU1T2JseLHIcj5EUzFkUDaWRfasEbQQ7s1gbYYDj4
 GCSrCNWXZz62bfQ==
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



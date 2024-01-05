Return-Path: <linux-usb+bounces-4780-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7579825286
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jan 2024 12:01:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E9B7B22BAE
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jan 2024 11:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D8DE286B9;
	Fri,  5 Jan 2024 11:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Xsbh+3Wq";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ajKjWUvV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A1C28E10
	for <linux-usb@vger.kernel.org>; Fri,  5 Jan 2024 11:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4T60r61pbSz9sc3;
	Fri,  5 Jan 2024 12:01:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1704452470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=idHfuzk1L4byFbmshbzXqqyTFNd/Cu3KIoig5fKPOLo=;
	b=Xsbh+3WqD+Ezvv/PXFVsuCDsGaaiI2yI2+3dcsyOh8YHNQ8aGwdy5jY5USERtO7L0/vaKi
	9ax0y4dijHCEwxNSnOEDxQm3tAn8GSug8eaSTB4k4Tr05Y6HRys0qsWzHPPXgwUFwZ26pJ
	nvtGkXaZGWJ2GpoaPijVBC0NMgd9egr+ykjZkPPyf9dpIAdPub7sI1ZjnlUDrWyjTJH252
	lB0VWm/rqupY5g/j/U8GEqINIrpAYLULHiiCxn+Loy1TZcD9P5nJFbmlUeuuxbKp+/QINs
	a/jozf1vvEu8QWYquuMAgLPaPuDP5LHO/gSg7qBuku/FScWjrfLTURMTdrKoBg==
From: leonard.dallmayr@mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1704452467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=idHfuzk1L4byFbmshbzXqqyTFNd/Cu3KIoig5fKPOLo=;
	b=ajKjWUvV5E7vhPMxxavPM9AZ9G43YvDJVApPiPyglhu91WWX+Rh+xAVCa9IYIcCqnoxP4D
	NxgySoieXxRzpdJ1BoqbGEHFQ3gqkkJr7oDRtxkovsRNfm3OqliykCYWl+kECMgdaeJWQa
	dt4MtH0QJn/fP5x11B1HKNKygApz3oMAXyZM5b5Qv7tNG44l69eS5gf1OBPfC/pu+chadG
	krYKRBZ1q4g68ccMtWCMT6qlmFKXKdMNOJ82CyyDbQ7ROPJVzJUZFoSf3KOzoE0RnkRPnm
	hg3yT/MTxw8EnzhK1YSVKhQoInJnTtJGh8f1VTjx5Q2DTsTt/dXBxlEfgR62xQ==
To: johan@kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	Leonard Dallmayr <leonard.dallmayr@mailbox.org>
Subject: [PATCH] Add support for the IMST USB-Stick for Smart Meter device to the cp210x driver.
Date: Fri,  5 Jan 2024 11:59:16 +0100
Message-ID: <20240105110029.80421-1-leonard.dallmayr@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: znwgrxubhn9j68txbrie7xs4aun67j5u
X-MBO-RS-ID: 7f7d4d8c8475244dca1
X-Rspamd-Queue-Id: 4T60r61pbSz9sc3

From: Leonard Dallmayr <leonard.dallmayr@mailbox.org>

The device IMST USB-Stick for Smart Meter is a rebranded iM871A-USB Wireless M-Bus USB-adapter. It is used to measure smart meters for electricity, 
heating, water, etc.

Signed-off-by: Leonard Dallmayr <leonard.dallmayr@mailbox.org>
---
 drivers/usb/serial/cp210x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index 1e61fe043171..099cde4974a3 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -146,6 +146,7 @@ static const struct usb_device_id id_table[] = {
 	{ USB_DEVICE(0x10C4, 0x85F8) }, /* Virtenio Preon32 */
 	{ USB_DEVICE(0x10C4, 0x8664) }, /* AC-Services CAN-IF */
 	{ USB_DEVICE(0x10C4, 0x8665) }, /* AC-Services OBD-IF */
+	{ USB_DEVICE(0x10C4, 0x87ed) }, /* IMST USB-Stick for Smart Meter */
 	{ USB_DEVICE(0x10C4, 0x8856) },	/* CEL EM357 ZigBee USB Stick - LR */
 	{ USB_DEVICE(0x10C4, 0x8857) },	/* CEL EM357 ZigBee USB Stick */
 	{ USB_DEVICE(0x10C4, 0x88A4) }, /* MMB Networks ZigBee USB Device */
-- 
2.43.0



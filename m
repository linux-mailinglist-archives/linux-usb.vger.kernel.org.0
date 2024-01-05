Return-Path: <linux-usb+bounces-4788-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC7C825365
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jan 2024 13:37:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0937E1C22E0A
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jan 2024 12:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046B02C866;
	Fri,  5 Jan 2024 12:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="vhMQD9Rg";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xDAsfah/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDC62C865
	for <linux-usb@vger.kernel.org>; Fri,  5 Jan 2024 12:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4T62yh2lgwz9sSy;
	Fri,  5 Jan 2024 13:37:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1704458220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WxDl+Jqx9MvBnnn7WyGK6DDQLkShEXL5msiu40jDkiE=;
	b=vhMQD9Rg6KXCTx1toLD69Ui/WXZrB9NHEyA3V9IZMfba1k45fQYirboJQM2b/nfijOM5+n
	HAccaG2oLv4Bru52IPUdpN4+AP3SPS3haMiLbXXM5hju/f3tlFigy5JDCiSpGooncUbOgT
	2dc5ho50tFHvAu2wBGVlsfI8k8+vhLSzl8czRF+2u7w8suViEXfavVmtgoaFIx7NSllG1u
	SP8lTQIsKkthapOfAUo46g5i0DiIxjBx7ChLiETe7uIeQB0nj0cjYV6dbWskbPmDqe+H/m
	BrcXsi1TUPcygh9qGvV4J3o6F0Pm/hVwzW0ZuzIbhQzBXT5+b3eYHWRH0MG4EQ==
From: Leonard Dallmayr <leonard.dallmayr@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1704458218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WxDl+Jqx9MvBnnn7WyGK6DDQLkShEXL5msiu40jDkiE=;
	b=xDAsfah/jRniWrSw5glD8l39EwiznN7IY6OB8CjWIC2deSw4v5sP2X677YvGhNOJG2QZKL
	rG3StbO14mTBahDw4D9opNDkaVLksTnQo2GI/g+JqyV/WCnOFB4MrIOzuX4XC5hOlPqb7J
	OiyiHvMVI+fFKLblt5ek9SfxiiLK4l4+TNm2VfsK+OBTbJGeDrEqmfTB4lw62FHXnjDRJs
	elf5dOkhU+K5O8UN3sToNoLHoyVdcH23tOZ9RNGRwct1g+0eGUBh/9EMw/sNQXncSQ2XHz
	RfQanmc7D58M//LkeL1khWzAaDu8eHxHPBV0uJReAA8NdQHQb8fnf0DI3UJzEA==
To: johan@kernel.org
Cc: gregkh@linuxfoundation.org,
	leonard.dallmayr@mailbox.org,
	linux-usb@vger.kernel.org
Subject: [PATCH] USB: serial: cp210x: add ID for IMST iM871A-USB
Date: Fri,  5 Jan 2024 13:35:51 +0100
Message-ID: <20240105123549.87143-3-leonard.dallmayr@mailbox.org>
In-Reply-To: <ZZfrkSbmCW7vNCEZ@hovoldconsulting.com>
References: <ZZfrkSbmCW7vNCEZ@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 93ik81sodjspkr9f8nxnahc9s1hechmw
X-MBO-RS-ID: 6559916c47f0daa588c
X-Rspamd-Queue-Id: 4T62yh2lgwz9sSy

The device IMST USB-Stick for Smart Meter is a rebranded IMST iM871A-USB
Wireless M-Bus USB-adapter. It is used to read wireless water, gas and
electricity meters.

Signed-off-by: Leonard Dallmayr <leonard.dallmayr@mailbox.org>
---
 drivers/usb/serial/cp210x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index 1e61fe043171..923e0ed85444 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -146,6 +146,7 @@ static const struct usb_device_id id_table[] = {
 	{ USB_DEVICE(0x10C4, 0x85F8) }, /* Virtenio Preon32 */
 	{ USB_DEVICE(0x10C4, 0x8664) }, /* AC-Services CAN-IF */
 	{ USB_DEVICE(0x10C4, 0x8665) }, /* AC-Services OBD-IF */
+	{ USB_DEVICE(0x10C4, 0x87ED) }, /* IMST USB-Stick for Smart Meter */
 	{ USB_DEVICE(0x10C4, 0x8856) },	/* CEL EM357 ZigBee USB Stick - LR */
 	{ USB_DEVICE(0x10C4, 0x8857) },	/* CEL EM357 ZigBee USB Stick */
 	{ USB_DEVICE(0x10C4, 0x88A4) }, /* MMB Networks ZigBee USB Device */
-- 
2.43.0



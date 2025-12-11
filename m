Return-Path: <linux-usb+bounces-31377-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7043CB4805
	for <lists+linux-usb@lfdr.de>; Thu, 11 Dec 2025 03:01:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED1F1300B2BA
	for <lists+linux-usb@lfdr.de>; Thu, 11 Dec 2025 02:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59427292938;
	Thu, 11 Dec 2025 02:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWUJTTmA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744A233E7
	for <linux-usb@vger.kernel.org>; Thu, 11 Dec 2025 02:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765418495; cv=none; b=N62IItx+y+DZsPvI3Wht4L3wTMesSF+HJx9IdO3IT5XL8NCYDPDcJGRwv9eOzbJscSXal1RlOFp8CYi2FL6xBu2DYv1QSbwp5qyf9MZ69QEcoGP8t8HqLCjgKo2sVc58DhakCXOPlPHgdlVOkGtYc0KKCfGvLd3mEv8R2tfUAbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765418495; c=relaxed/simple;
	bh=jxlquEKWB4ovnxW0dPC9yXeJyMf7Zf/wpG/BjX1DAmE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IbGqOAsYFnMIAhI8IYjqG0Oczorpv1PVSEEEnOTmwX0+W/RieG6Ph6pr8W8TtNEqIZ4kJp/F/y9k5lcCGjOujZFTzpz8B0hL+2uDFSRX0tOg0PEVFkSsXFMT7Do4DgvAjGqhsjrcRElxPLlGGdM9qyRAI++bTS1Fc4p0Owfft8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EWUJTTmA; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-bc09b3d3b06so266225a12.2
        for <linux-usb@vger.kernel.org>; Wed, 10 Dec 2025 18:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765418494; x=1766023294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oDLOUoseKDsXrqrK/vpzGFljddjHVxFQ23qh88EWC7A=;
        b=EWUJTTmAepSwW1MhkSr/1QvvhrV3KKvBa12aQBa1W0/92EPx71rACU9tFKTG5Gfcnf
         nYRAqJ5EtiWrqRYqdGOrZmoEMS9nFublNuULGUayRhoxkKnuydwrVDbWoLQuRa5I3THa
         ArRSDmwBoiqvpvU7SRDiGxbeGskPIK2o36+zgI178PlkNwB6o3+e4tS782FIfkyS4+Bn
         lUTFc1fcRSkEQcZqRDDYe8ix4EQpr1KnrsYnkyEDHxXeSeLW9SpLfbucptzDOSmI3FuB
         3zOBFJQveGexgmzjSztbW63+t5Tfn6NK3kU6to5mYyjoyfNfHJ10b4evxuDzWtLeZkT5
         e/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765418494; x=1766023294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDLOUoseKDsXrqrK/vpzGFljddjHVxFQ23qh88EWC7A=;
        b=xAMj10ZZNvwGcfCC3CfWreLSZ9PauWjEj8nbvJi+drzEe1BT8sMInQY2yh002majTY
         a6w62obXDzN5FKSi4RGWcKac/85HGDxROUClzfes7ARkIgjuWKJec83Thcq6jvUcx7EA
         ZeVLehcn50nsujHDHl4P3JX7LsmVkfiGc4AhJJ51Koh7e87mYV+IxXPFUHh65dQN18uf
         P0N8aKm0jxt6l+2tIQ4cL3yJtskEX/N4Ng3yTCzyuB+uehXXyTJxFIn190hio9wX+3Bz
         nrT/pDFFBcVCbIcuzPclJGNgWdycbNufN6+qgoZelLXMtYPpTZpQchhBfR2MjkmZBmtx
         pW1Q==
X-Gm-Message-State: AOJu0YxjhujazAw9uD+NyqstqDQAzAGIm9PrydvazY2D3jpK0Ko6DMDc
	9TmE1ffvMGN4ijTC5Nc/hqlx3W5GRqnxSmLZHrDNZXveqvO81cwHIyPJfb+qm1yXPsKDBg==
X-Gm-Gg: ASbGnctFZU1GkIxp87fBf3H16DpKgr/fwMBErnvH1C/fEuLMhmuC7WBLLWUHjXTey3+
	85UgD2lK0Q50BCgn1Rnam8YWztgvcO95EVtQ0suNwwR2yf3JSuxxJwN2BcR8LM9+6+wpaedurwr
	SybviVWNLt3kc3vWpqpLX5bZvo6UYmai4Xu2BSQ2373N+minCE9R5m3juUZdl9DnJIbAx8aSjZX
	P24ZKWln5xLQPJD9iO1QZ6wPeZXfhEYB3/8eez3qzgnKej9apCpkZKm706KgvHyRe812bnQcYC3
	eSS/jfIwGAS7G7GApB4E/xYSf7uq7rE2NLElyfz6eRy89pdD6w+rQwOQOZVFD0PCFbLhtfFdmBi
	yWSz9irTlIExY1/DrQvUVzK4Hu1fmUoU2dYGukchfo4r1hp+oCBF0uwARL8eMO5tR0ub0dWC3zT
	tDEUXyNVQVWR7l3qRcw8GhRtAE6E6MVGxVOvznSidRq/61EaRZKBArqV0RaxIp26hkjTzYTb+pk
	w2qsSmztW3eubk=
X-Google-Smtp-Source: AGHT+IGQ7/gXmCOul/U9YXhnOAApYUABB4NLMUfjzK8VZdz8cwFkkhz18hi9+oy2iOuh5RZ7UzTfnw==
X-Received: by 2002:a05:7022:78f:b0:119:e55a:9c06 with SMTP id a92af1059eb24-11f296d74cbmr3701500c88.34.1765418493417;
        Wed, 10 Dec 2025 18:01:33 -0800 (PST)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb45csm3572116c88.1.2025.12.10.18.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 18:01:33 -0800 (PST)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] USB: serial: ftdi_sio: add support for PICAXE AXE027 cable
Date: Wed, 10 Dec 2025 18:01:17 -0800
Message-ID: <20251211020117.45520-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vendor provides instructions to write "0403 bd90" to
/sys/bus/usb-serial/drivers/ftdi_sio/new_id; see:
https://picaxe.com/docs/picaxe_linux_instructions.pdf

Cc: stable@vger.kernel.org
Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/usb/serial/ftdi_sio.c     | 1 +
 drivers/usb/serial/ftdi_sio_ids.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index fe2f21d85737..acb48b1c83f7 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -848,6 +848,7 @@ static const struct usb_device_id id_table_combined[] = {
 	{ USB_DEVICE_INTERFACE_NUMBER(FTDI_VID, LMI_LM3S_DEVEL_BOARD_PID, 1) },
 	{ USB_DEVICE_INTERFACE_NUMBER(FTDI_VID, LMI_LM3S_EVAL_BOARD_PID, 1) },
 	{ USB_DEVICE_INTERFACE_NUMBER(FTDI_VID, LMI_LM3S_ICDI_BOARD_PID, 1) },
+	{ USB_DEVICE(FTDI_VID, FTDI_AXE027_PID) },
 	{ USB_DEVICE_INTERFACE_NUMBER(FTDI_VID, FTDI_TURTELIZER_PID, 1) },
 	{ USB_DEVICE(RATOC_VENDOR_ID, RATOC_PRODUCT_ID_USB60F) },
 	{ USB_DEVICE(RATOC_VENDOR_ID, RATOC_PRODUCT_ID_SCU18) },
diff --git a/drivers/usb/serial/ftdi_sio_ids.h b/drivers/usb/serial/ftdi_sio_ids.h
index 2539b9e2f712..6c76cfebfd0e 100644
--- a/drivers/usb/serial/ftdi_sio_ids.h
+++ b/drivers/usb/serial/ftdi_sio_ids.h
@@ -96,6 +96,8 @@
 #define LMI_LM3S_EVAL_BOARD_PID		0xbcd9
 #define LMI_LM3S_ICDI_BOARD_PID		0xbcda
 
+#define FTDI_AXE027_PID		0xBD90 /* PICAXE AXE027 USB download cable */
+
 #define FTDI_TURTELIZER_PID	0xBDC8 /* JTAG/RS-232 adapter by egnite GmbH */
 
 /* OpenDCC (www.opendcc.de) product id */
-- 
2.43.0



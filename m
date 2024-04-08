Return-Path: <linux-usb+bounces-9017-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F7189B6E8
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 06:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74B391F21CEA
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 04:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0344E8827;
	Mon,  8 Apr 2024 04:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h7syqkAY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AF15244
	for <linux-usb@vger.kernel.org>; Mon,  8 Apr 2024 04:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712550657; cv=none; b=GAVkhvEaGValGo3/uZJG7duQ+JD6JLJFJ2x6KGaNZ/butsODfll7mcVG47OnBU1B+P91YOFJDcN1vcQHBWojFEVyCbulU0zGzFGoK+a71kKnSR2hTOl/NzxrkaG3/iGmaBN+9MUuvNyKKKF5p5s5JBzEEt+arl995GaANxuPkxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712550657; c=relaxed/simple;
	bh=ZsrBSv+MDk5+UD0MFXH26dCUwN5ObviBN+4pNMZ7Mp4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=trq1lYQCgclYLOjcq27oK+Hf3iHamzC+/VGvcH3tRcrTerIS+PAuswc7QElfLCmH1e2sedjhu5xvvVpmvysEXqewnQQbXZfD7B9Q7oVLFxNL/DK4bkKgnGdUVTDGkyo2ijswGz+5MqHAkZxzTAsAK1oRrWhvLeLZNn3AX+Ccb2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h7syqkAY; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d8129797fcso53302381fa.1
        for <linux-usb@vger.kernel.org>; Sun, 07 Apr 2024 21:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712550654; x=1713155454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hZG8/w6c2g2XY/SjpCMDmc9IC0Y93zEgxZp35QKFMDk=;
        b=h7syqkAY+eB220fxznDUJDkLuTNTJCgwtbpMTEWPgdd84Ywb40AvHEzWA412HDlMZM
         Oznei7TEFDHoryTUsc86sjLnLfo7niGLOjbrkyy95L2I2Y2C03r3z0W3MSr0HtYP44lv
         /7yxp27iHMcp5U6aJ4IyjnTTgTOM+FLy5G4t/j+mOpROKzpYHXiAtvDnKUYOkwPj+uVW
         us7blU+Y0Y30/3HOJMhfqrmyyH1ifTl4lR/erGqQcE+QWphzxQnoP40ia6e6bi2pIwCO
         wXL1il5oymCxWap4hyq3E4fA2+/Wf1y4CRVrWFgk5i0H40UW+6io3frA5bWf/imbjLZo
         LlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712550654; x=1713155454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hZG8/w6c2g2XY/SjpCMDmc9IC0Y93zEgxZp35QKFMDk=;
        b=sgOo63suJ70O1IXdOcdNwUffpdDyj7upLV/wrpVevD4pssZweJMGCcpZNWUS2KzqOQ
         iivW2TEox6CaL6f1MIahgkt7SQRCfu93ZMXCkuePgL90j9s9ehtAQ956lSLTPT7Z1Llq
         uCaYkBWLWWf4yxvkglNK96Z/wIlX99sfGTb3tB6TyueUeWyamKrk1AY6w8NFpiQLxr9I
         KIB721jjZIvTVOzJ8B9HBqh35WTywD4DfQr5hN4Ki5oV5sAbLk5gBZZf2sH+HJtHp0fZ
         GsUawQzPhdtWBU7HlZr3ymEsXZsvZMfGKhaml6PwZ5M2G5muWt5I1MP7wYpuzXcm+3Y+
         4Rwg==
X-Forwarded-Encrypted: i=1; AJvYcCXISVlmbeGWH7ndOtjrvk5U0acU7MzwBtOrl1uUmYZkdmSvVkmCOhgHjcseb5Q7Pcrzu9ZpFEqIfkEgyMWinqqUgAGVSZ/fa1v/
X-Gm-Message-State: AOJu0YxVQHa+hNIbkXWYT5SloZr4PVFR6H5NO1QWLaKwUUQ0FyJdQX+P
	SuwZ4OrAC+ehZuZzhnC8n6Sw8B0zZHQgLw64zoaXW+7zMxTDAK11BqX66f27/Lc=
X-Google-Smtp-Source: AGHT+IH3sW9gR8rxmz0Z7/CnW7zJK5Z8Krjj5NurPe1/ZRqtYoetQdBEPvORqLq8SB1UGBs86qWvKg==
X-Received: by 2002:a05:6512:485c:b0:516:c763:b4f5 with SMTP id ep28-20020a056512485c00b00516c763b4f5mr5368447lfb.3.1712550653727;
        Sun, 07 Apr 2024 21:30:53 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g13-20020ac2538d000000b005132f12ee7asm1033207lfh.174.2024.04.07.21.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 21:30:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 08 Apr 2024 07:30:49 +0300
Subject: [PATCH 1/5] usb: typec: ucsi: add callback for connector status
 updates
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240408-ucsi-orient-aware-v1-1-95a74a163a10@linaro.org>
References: <20240408-ucsi-orient-aware-v1-0-95a74a163a10@linaro.org>
In-Reply-To: <20240408-ucsi-orient-aware-v1-0-95a74a163a10@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2663;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ZsrBSv+MDk5+UD0MFXH26dCUwN5ObviBN+4pNMZ7Mp4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmE3L7KH6S9lSWKXRScQhis4OPHAVggX4qXjTVU
 0j/th5VbvmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhNy+wAKCRCLPIo+Aiko
 1RXgB/sEqkey8wBNfqOSKhcBZBtzrXky2hEub9ei/YuhmZ7GxQhAaglfwNEbPZCvEHzO2qzzaMu
 Z1ojxyKgC6bMXkG26x1AFEM6sMsqE/kBU3neRnLrhVL3YevKhHF3aEtUCP859ELvEKZSaAnGFP4
 2WmEJpN4KU9QjTdPfifOykuBLcg4GydSD4cIEWz7CCDD47ypc1D8dISaqu2uTgPKYlxOLsf1k3y
 oF6BQhF/JDWapmrUX2JG87dBiTpmS/YLmPPzgVMxqjnAB1rpiYoWVCRnClHNmBVO/cczkRcrytH
 90v7EARd3V+G8SL11n2bfTlxMYeFI02f3a+h6wTU4jXsiB6j
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Allow UCSI glue driver to perform addtional work to update connector
status. For example, it might check the cable orientation.  This call is
performed after reading new connector statatus, so the platform driver
can peek at new connection status bits.

The callback is called both when registering the port and when the
connector change event is being handled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 6 ++++++
 drivers/usb/typec/ucsi/ucsi.h | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 3106e69050cd..7ad544c968e4 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1199,6 +1199,9 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 
 	trace_ucsi_connector_change(con->num, &con->status);
 
+	if (ucsi->ops->connector_status)
+		ucsi->ops->connector_status(con);
+
 	role = !!(con->status.flags & UCSI_CONSTAT_PWR_DIR);
 
 	if (con->status.change & UCSI_CONSTAT_POWER_DIR_CHANGE) {
@@ -1588,6 +1591,9 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 	}
 	ret = 0; /* ucsi_send_command() returns length on success */
 
+	if (ucsi->ops->connector_status)
+		ucsi->ops->connector_status(con);
+
 	switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
 	case UCSI_CONSTAT_PARTNER_TYPE_UFP:
 	case UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP:
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 2caf2969668c..6599fbd09bee 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -53,12 +53,14 @@ struct dentry;
 #define UCSI_CCI_ERROR			BIT(30)
 #define UCSI_CCI_COMMAND_COMPLETE	BIT(31)
 
+struct ucsi_connector;
 /**
  * struct ucsi_operations - UCSI I/O operations
  * @read: Read operation
  * @sync_write: Blocking write operation
  * @async_write: Non-blocking write operation
  * @update_altmodes: Squashes duplicate DP altmodes
+ * @connector_status: Updates connector status, called holding connector lock
  *
  * Read and write routines for UCSI interface. @sync_write must wait for the
  * Command Completion Event from the PPM before returning, and @async_write must
@@ -73,6 +75,7 @@ struct ucsi_operations {
 			   const void *val, size_t val_len);
 	bool (*update_altmodes)(struct ucsi *ucsi, struct ucsi_altmode *orig,
 				struct ucsi_altmode *updated);
+	void (*connector_status)(struct ucsi_connector *con);
 };
 
 struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operations *ops);

-- 
2.39.2



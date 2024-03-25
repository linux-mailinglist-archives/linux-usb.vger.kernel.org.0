Return-Path: <linux-usb+bounces-8335-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F1188B569
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 00:37:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A8EE1F635DE
	for <lists+linux-usb@lfdr.de>; Mon, 25 Mar 2024 23:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B08A384D28;
	Mon, 25 Mar 2024 23:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aOF7QkmN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD35683A0F
	for <linux-usb@vger.kernel.org>; Mon, 25 Mar 2024 23:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711409854; cv=none; b=Z/Ed0+cOyjg5KbCW0xVxSmldaUk5xgTgYwTbct5dGVqwDm1zTbBy6OUeJuZitapv/kZexUKoReSofaKd9FSWsULi/C04QH8qhXNB/CrOt5OkFfR5UBvWpmx5CFq2E1agDgW7z3b4sKcIm3PrdK8IRO4lUlWqIFRqzu6DRp3z0mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711409854; c=relaxed/simple;
	bh=jbSJ8EoUHTJOt2gEIo2bLB7/XqaW9sPGoBPW7n04aM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XkV7Qb4mBV55wbSZaJ3Rpk/Z5QJ8Ijv3GNL7xtXejAgnsNbA3gDG9KuMoYz6680JnIe4fqDAGxCgzYJ1Hz+dd0ICZHHNlFUq04Hg1XnUtNVx64TDTX2J5Nczq1fyKKN2B5EWpE0R9sVlbuZdL3D6KkExbm1dH2AG8cH0zrg09TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aOF7QkmN; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5cdbc4334edso2316014a12.3
        for <linux-usb@vger.kernel.org>; Mon, 25 Mar 2024 16:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711409852; x=1712014652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cF9ERqG1zIS6eGrOVmXcQQcR69NGZdIYHtZJEychHus=;
        b=aOF7QkmNW6t14gHYntnsm58y4NZ0dUTkTwhcqs0w5cAMaeeNiDM/Mznq1Y+9img/cl
         9b6d7EjBgnza64JGLAZPctDBZT0xSI3gGJYNoA+ZL5cgDp28qGb/tZUCFITpEp+xpR83
         AIM20S9qKAu8NxMxLcbBgWzfOv7Y/0cvutPJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711409852; x=1712014652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cF9ERqG1zIS6eGrOVmXcQQcR69NGZdIYHtZJEychHus=;
        b=fu5JRWFspIXtwfLvSivVmK08Syvdc8I83ux5StyWqfs/Ta1q7WHNergj3XEogLAiMT
         Fjx1zVM9rJ9CG7Al3AijtdwA86PFJvwGPVJrbv0uin7VFVNuaRcEs1ZBj1CN5ALwUkV9
         ucax5GNADnp2fb5tecjexTUiKClDOCHNCbePPDbOQwcNMKtLsb6OhWlt7+bKGhLU3USa
         ZBFWDW0pDbxkA52mCCBKlP/1ZMsIVYa6c+Zogo8PGTLAF3SfUw0BiPNPw2MUNHonWrVv
         thUs0V80a6nSeY5d5M+DX38+lkMlvECLizVQK8NiUmuF9ikQEs2EA8CwUvlTw1JUdmoT
         jKwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxwXXGd1xr6v0quJeNGQURa1QwXEcl3GqqPpNUf++86IZGOMeQYspmzXcw77He+hVwEzpW4aEgYJxlTeMWY4Oqz4KbL948QvAh
X-Gm-Message-State: AOJu0YxL3I/fI2B9ISNgl+S0hzSi/nARdyWnrjkHb+kIlyeITVY4HjKo
	m8QPxr/QX1HbiYi4VqO9DIdSzRfwxyeoaqdx9dTj+xxEpj99kRMgagMQWdbp5w==
X-Google-Smtp-Source: AGHT+IFIknFZn12Y5kpDi6r+Yb6x3aRSrS6kXCzpnuoO03KZTCATHzV6Cdtk53AQr1VeQ0uVLJ+uWA==
X-Received: by 2002:a17:902:d2cc:b0:1e0:cd89:752d with SMTP id n12-20020a170902d2cc00b001e0cd89752dmr3079566plc.39.1711409852098;
        Mon, 25 Mar 2024 16:37:32 -0700 (PDT)
Received: from pholla1.c.googlers.com (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with ESMTPSA id c14-20020a170903234e00b001e0e2fde71fsm526533plh.9.2024.03.25.16.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 16:37:31 -0700 (PDT)
From: Pavan Holla <pholla@chromium.org>
Date: Mon, 25 Mar 2024 23:37:29 +0000
Subject: [PATCH 2/3] usb: typec: ucsi: Import interface for UCSI transport
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240325-public-ucsi-h-v1-2-7c7e888edc0a@chromium.org>
References: <20240325-public-ucsi-h-v1-0-7c7e888edc0a@chromium.org>
In-Reply-To: <20240325-public-ucsi-h-v1-0-7c7e888edc0a@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
 Pavan Holla <pholla@chromium.org>
X-Mailer: b4 0.12.4

Import include/linux/usb/ucsi.h and remove any duplicate declarations.

Signed-off-by: Pavan Holla <pholla@chromium.org>
---
 drivers/usb/typec/ucsi/ucsi.h | 54 +------------------------------------------
 1 file changed, 1 insertion(+), 53 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 32daf5f58650..167951538030 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -10,22 +10,13 @@
 #include <linux/usb/typec.h>
 #include <linux/usb/pd.h>
 #include <linux/usb/role.h>
+#include <linux/usb/ucsi.h>
 #include <asm/unaligned.h>
 
 /* -------------------------------------------------------------------------- */
 
-struct ucsi;
-struct ucsi_altmode;
 struct dentry;
 
-/* UCSI offsets (Bytes) */
-#define UCSI_VERSION			0
-#define UCSI_CCI			4
-#define UCSI_CONTROL			8
-#define UCSI_MESSAGE_IN			16
-#define UCSI_MESSAGE_OUT		32
-#define UCSIv2_MESSAGE_OUT		272
-
 /* UCSI versions */
 #define UCSI_VERSION_1_2	0x0120
 #define UCSI_VERSION_2_0	0x0200
@@ -42,48 +33,6 @@ struct dentry;
  */
 #define UCSI_SPEC_REVISION_TO_BCD(_v_)  (((_v_) + 1) << 8)
 
-/* Command Status and Connector Change Indication (CCI) bits */
-#define UCSI_CCI_CONNECTOR(_c_)		(((_c_) & GENMASK(7, 1)) >> 1)
-#define UCSI_CCI_LENGTH(_c_)		(((_c_) & GENMASK(15, 8)) >> 8)
-#define UCSI_CCI_NOT_SUPPORTED		BIT(25)
-#define UCSI_CCI_CANCEL_COMPLETE	BIT(26)
-#define UCSI_CCI_RESET_COMPLETE		BIT(27)
-#define UCSI_CCI_BUSY			BIT(28)
-#define UCSI_CCI_ACK_COMPLETE		BIT(29)
-#define UCSI_CCI_ERROR			BIT(30)
-#define UCSI_CCI_COMMAND_COMPLETE	BIT(31)
-
-/**
- * struct ucsi_operations - UCSI I/O operations
- * @read: Read operation
- * @sync_write: Blocking write operation
- * @async_write: Non-blocking write operation
- * @update_altmodes: Squashes duplicate DP altmodes
- *
- * Read and write routines for UCSI interface. @sync_write must wait for the
- * Command Completion Event from the PPM before returning, and @async_write must
- * return immediately after sending the data to the PPM.
- */
-struct ucsi_operations {
-	int (*read)(struct ucsi *ucsi, unsigned int offset,
-		    void *val, size_t val_len);
-	int (*sync_write)(struct ucsi *ucsi, unsigned int offset,
-			  const void *val, size_t val_len);
-	int (*async_write)(struct ucsi *ucsi, unsigned int offset,
-			   const void *val, size_t val_len);
-	bool (*update_altmodes)(struct ucsi *ucsi, struct ucsi_altmode *orig,
-				struct ucsi_altmode *updated);
-};
-
-struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operations *ops);
-void ucsi_destroy(struct ucsi *ucsi);
-int ucsi_register(struct ucsi *ucsi);
-void ucsi_unregister(struct ucsi *ucsi);
-void *ucsi_get_drvdata(struct ucsi *ucsi);
-void ucsi_set_drvdata(struct ucsi *ucsi, void *data);
-
-void ucsi_connector_change(struct ucsi *ucsi, u8 num);
-
 /* -------------------------------------------------------------------------- */
 
 /* Commands */
@@ -465,7 +414,6 @@ int ucsi_send_command(struct ucsi *ucsi, u64 command,
 		      void *retval, size_t size);
 
 void ucsi_altmode_update_active(struct ucsi_connector *con);
-int ucsi_resume(struct ucsi *ucsi);
 
 #if IS_ENABLED(CONFIG_POWER_SUPPLY)
 int ucsi_register_port_psy(struct ucsi_connector *con);

-- 
2.44.0.396.g6e790dbe36-goog



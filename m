Return-Path: <linux-usb+bounces-30557-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 67537C6333A
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 10:38:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 682F4346C1D
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 09:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AACA328601;
	Mon, 17 Nov 2025 09:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GW5Iv8+e"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A973327783
	for <linux-usb@vger.kernel.org>; Mon, 17 Nov 2025 09:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763371908; cv=none; b=pDjjRcOp0qlPh6dHdY/IcgAfUuTU6+siM+7pUtbMJ0N0rqdGyO+PRRs74MVKtTw2YlpWdQrr/V0Ld72HkQmcLFADSZM3o3BT6kLzFSlIasiuxD1yg04nFgjQ42oSrmjQBaIczh01QflT4Sul21trtUNNEUkSLBJfvluJRilqDKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763371908; c=relaxed/simple;
	bh=dXjhXxcv2DSmkvcEUVEFNc/Z7eefdDwfLTQ2w3IBppA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Yy6gn9cRmoJyH5C9oOoR/MgOq2hJmsglwKXqZN383LUYqpMsG5bOIyRhO5FzV3RtzD3Gt/9JetTppVwujZH3Sx4OMfKCQQiwA2Bn191Z0eMvDrb1Kn4W37IU8MhUkdjnIK6XcTHqiJKdyAYru9O5UGayXLb4BiXjqcwvanbAgo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GW5Iv8+e; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7b9387df58cso5622588b3a.3
        for <linux-usb@vger.kernel.org>; Mon, 17 Nov 2025 01:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763371906; x=1763976706; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PmN9wGkOssBXv1ykVPZxf1HrUIUqtqrMhWFWgBL1Lrw=;
        b=GW5Iv8+eaPSy+z+B9cAkGA5+s+RRblWm8jfMy98rsTX8casdzKxfug47n13miwi4vk
         s8SoZ0D6zBjaHGsfttEZojb85aORnlfIVrcqgpf8Rb6AcvOLteOieAoTWNZg7qDMwmVr
         rKopBIxDYGNAa/NxnriTFfBPE+naEKP87ekWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763371906; x=1763976706;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmN9wGkOssBXv1ykVPZxf1HrUIUqtqrMhWFWgBL1Lrw=;
        b=E7FrSlRZ0c1kgLLu6Hmjw5o5+vLpAHjZt5uUveh3Aq5sxJ9j/9M2h9kVoaCglpKfO3
         pFyc15Mg7DqNsmlSQpccUMSJYlRvjnSHuN2FBJpf5rlvKncYy+Ah+DpyMwDs6UG9b3+x
         D8oFohYuTTEfldEJGHWIj/uVWpfO3ZUzch9gnxI1fl0W2AZHBpwAAS0inhFv4EmeMD5k
         UCOcxSA4T/zkVVqBm+j709fo375QzawCC0IeMEju7uVnxgz0x3MKC1nU4x8NL37jEpZw
         FRM7P/z5xlIPX63Ce5EgPIgc0JK5LvjfoYx4x+tFB0z+oPLpfJ93iv4JKaG+kAc2RBbh
         /0iQ==
X-Gm-Message-State: AOJu0YyBoiAjGI8a7gZubnv04G99nuJzuFMY2Ct6xM69t1OmnNF9whPy
	+oB+eZA30PXM8BUegXKiZ4uQgQzE8SB6A9liM/gfpk6XyaJJNXqxxSs1NNxtQo1iZw==
X-Gm-Gg: ASbGncsx02p1+Ur4O0G6QtNUl31rYHzYca8fd9tPH5Nb1fyeti6rORtjvug5AUEDGIB
	zjNSMd23DYYiNpP0T0JNJuYiduYHcCtQ74FL768TcgeDnuctkM33w9AvLpy3WBfV//Fk40Yp39K
	wwLfY961yhxc3OBCCnaSMFKAaLRM3h9x42kn/HyWsvXkgg6c8BNZT5eLXk7khQqM/5jG2s5Hfsd
	uufJNY+iNg4FdCCYBjYMhHNJqZnYv6uvqOr8+1fFMGlNIghlEbF+RaqOTRRn8bB9z8qrODwB55Q
	MSsqoJBpDTp/BfZd37EPH6ghWTHpbYSjTv862igxiSfJkFn2MVsp+x2bv/vdChSvZrkV9b126mW
	bS7mL5YEegp0vdXHkOnKYDLCzZV/3Bx/+hpaO2ercdUbzLVl5/3sKnQguC0tHZtHJqXiCLq4yUl
	r5B6c07PcFZZJRgMUJuz+MU/uLE+7ve1MORJ33e+TlRCU++TSxgK+Ltw5QQkJbjlkZgzUsFIND9
	Slq/DHUubGzbqxoBMil3iJQ
X-Google-Smtp-Source: AGHT+IETxgyi9b03me3vPqS7pPWEHDlziAJ7UGXQh1YuS8eYyyreuanLOo8tykqNPIeqBIhxsho52A==
X-Received: by 2002:a05:6a00:c93:b0:7ab:653a:ca0e with SMTP id d2e1a72fcca58-7ba3b7a9fb0mr11046343b3a.23.1763371906545;
        Mon, 17 Nov 2025 01:31:46 -0800 (PST)
Received: from yuanhsinte-p620-1.tpe.corp.google.com ([2a00:79e0:201d:8:baac:e815:f422:b47b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927151380sm12530794b3a.38.2025.11.17.01.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:31:46 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Mon, 17 Nov 2025 17:31:43 +0800
Subject: [PATCH] usb: typec: ucsi: Monitor connector change before getting
 connector status
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-ucsi-v1-1-1dcbc5ea642b@chromium.org>
X-B4-Tracking: v=1; b=H4sIAH7rGmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0Nz3dLk4kzdZKOUtFSLZAMDsxRzJaDSgqLUtMwKsDHRsbW1AEOw0Bl
 WAAAA
X-Change-ID: 20251117-ucsi-c2dfe8c006d7
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.14.2

Originally, the notification for connector change will be enabled after
the first read of the connector status. Therefore, if the event happens
during this window, it will be missing and make the status unsynced.

Enable the notification for connector change before getting the
connector status to ensure the status is synced.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 3f568f790f39b0271667e80816270274b8dd3008..07290cd85b618b22cb989151079707dbe9f578a7 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1565,7 +1565,7 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 	struct typec_capability *cap = &con->typec_cap;
 	enum typec_accessory *accessory = cap->accessory;
 	enum usb_role u_role = USB_ROLE_NONE;
-	u64 command;
+	u64 command, ntfy;
 	char *name;
 	int ret;
 
@@ -1659,6 +1659,15 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 		goto out;
 	}
 
+	/* Enable the notification for connector change before getting the connector status */
+	ntfy = UCSI_ENABLE_NTFY_CMD_COMPLETE | UCSI_ENABLE_NTFY_ERROR | UCSI_ENABLE_NTFY_CONNECTOR_CHANGE;
+	command = UCSI_SET_NOTIFICATION_ENABLE | ntfy;
+	ret = ucsi_send_command(ucsi, command, NULL, 0);
+	if (ret < 0) {
+		dev_warn(ucsi->dev, "con%d: failed to enable the notification for connector change\n",
+			 con->num);
+	}
+
 	/* Get the status */
 	ret = ucsi_get_connector_status(con, false);
 	if (ret) {

---
base-commit: 6a23ae0a96a600d1d12557add110e0bb6e32730c
change-id: 20251117-ucsi-c2dfe8c006d7

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>



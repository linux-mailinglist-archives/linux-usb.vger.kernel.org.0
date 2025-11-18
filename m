Return-Path: <linux-usb+bounces-30652-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E28B1C67D78
	for <lists+linux-usb@lfdr.de>; Tue, 18 Nov 2025 08:10:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A34194F0ADE
	for <lists+linux-usb@lfdr.de>; Tue, 18 Nov 2025 07:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6FFA2FB616;
	Tue, 18 Nov 2025 07:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X9xbKzK6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C033B2F8BC8
	for <linux-usb@vger.kernel.org>; Tue, 18 Nov 2025 07:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763449630; cv=none; b=d3GNFpo7gRa+x2V9+IqmaNbZ0nwWZr+HprPARj4AN+79lrIRv/xCxTPxb7Gx1oEF4rlowqspaFtWXnKBdZz9GZEiLCsBuzApFS/c24bCT4rC4DEwoEWp5GKCp1/vjb3huSHClnArQMfLakEXZsc1P9+y/jGd6qSEDwxZBLJnGdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763449630; c=relaxed/simple;
	bh=umDOm77sBuJHCBd79yvi5yNQyz9vAqFLQFmlwU7STzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rxoANJVC+vQoA3z4oyPLWT6TlXU9Ep51H+ub89f3j538ft4B7J4uyhZDA9PxHmwuohr+nh+y7YqiloRhJ+z6UbzYNDSoXPr+lvBDjR/esDMMMPTwb+oC6hIMMMSiP9RwzOpLCF6GN2IqsUmTCR6YPgckGF/Q6CdBjanYt75QShQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=X9xbKzK6; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso4128984b3a.3
        for <linux-usb@vger.kernel.org>; Mon, 17 Nov 2025 23:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763449628; x=1764054428; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WmeCcJZflztJCaKUB58JB6X8Eme/2R4su01QsX8HZaI=;
        b=X9xbKzK60x9mBEre/UIoGi7mZcFP6ok7y4Na/cgw8q6hyu51Do2+GdHDAhz2AaVk3x
         JwfIOMP4f8v+NCvuRketKOL9M0hl26dsKrct4a5clD1IHHbOMEd0zvVHwIGlzFB8wwwD
         aP8Th7kzerH28nlrvgwaOtOPsHmpjQO87Zo+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763449628; x=1764054428;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WmeCcJZflztJCaKUB58JB6X8Eme/2R4su01QsX8HZaI=;
        b=nRnnZJUMDvXeJzvjQUJJiKdYWrrVaCHGTcQLivIcLi4NKz5RLhOAGj1PpZuKfHMg0A
         445XC2jMY7er6KoCnv6r4PR+vftIk0x78I8iCkX/kJnJ4cSRW7kx+AzuO69bc2nCdewn
         ibKqsSMfYHLVv5Eeyr1sTBfQJ5KDYIDeK0PSejLrrhHjnk4XTOm0g2N1M1CEZPmuD24a
         jOvN21oK2NNUHISX91lHg17/D/0/NoFUClvKUsbIpp9Vw2xcIVV0qSnl8oiqfcVtnro3
         IJzvYFYR7Cm1U85xNy+W9w4QlUDhw3xLjwKUTEYO5M3kyRKTMPXrTblegpgaJsEHbOVU
         rkkA==
X-Gm-Message-State: AOJu0YxdX4ZyY00zcsPcDollF70ZBFS7Rys/08oLIOueN5+zleFPVHO5
	Z/MVk8v5p+9RLBU0UETgjgchgUkJ91BGmz/cQz2DeHKc7w5FZhbs5p2bC1x6qHQzmw==
X-Gm-Gg: ASbGncsMxW7wQIzqSSy12sHPon62MGLVgCVBpyKfbAtuVmLu+nXtHsoqJunmFOC+fHM
	6acVMC51ELGvTXocZQLH1DtilF4VgUBVjAxMzAxqQsVAf+bhHwIa788xW4K4Br/zT9hjCfI+lTJ
	2kwYSCdc+iSbuA9DJ+2VISEjkqj1eAFOail86mMLaU+6zP7kGjyoLXXNn+EgTAWMMTZ1O1oGUzJ
	LtRJHnvbIoMjqfg17zTY7Q0gUnh7geiFjYRH8wBK7ZqfM0x1bGiOaCMKiQQswrhLSKP65K0Ujzs
	+49OpkcMzUBTvqrJ5Bk8f7pmUfXmw1xIqr3hxqaRyoYqL4Ozk7hyjJn8WSNaa+S/zf5V8gQbmPM
	aSiMHh58XR6KRkKHdP7+al11D/viUDQNZA3G5P/+3848R0xy3RqufmxipFbymUvWOF6tBXJeTjx
	2lUkd0c5xickkVx/sdfP8xsemArzQS3NXHmAFhfO2GqQVeRRPZEyXTEyN68Ns9XVtIF2cXPdAm9
	A==
X-Google-Smtp-Source: AGHT+IHwjROVr6/h7ZqbmhEvJE5+ufDX2LOv4LvA1aTtHelQJDQZ533Op61GOUMG0FN7FwY2wKcyHA==
X-Received: by 2002:a05:6a20:7294:b0:334:9b5d:3876 with SMTP id adf61e73a8af0-35b9ff88d19mr15606199637.4.1763449628125;
        Mon, 17 Nov 2025 23:07:08 -0800 (PST)
Received: from yuanhsinte-p620-1.tpe.corp.google.com ([2a00:79e0:201d:8:39d6:487:8eb7:3217])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927826d51sm15481495b3a.49.2025.11.17.23.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 23:07:07 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Tue, 18 Nov 2025 15:06:53 +0800
Subject: [PATCH v2] usb: typec: ucsi: Monitor connector change before
 getting connector status
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-ucsi-v2-1-d314d50333e2@chromium.org>
X-B4-Tracking: v=1; b=H4sIAAwbHGkC/12MOw6DMBAFr4K2jiPb4hOlyj0iClgveAtwtA5WI
 uS741BGr5qn0ewQSZgi3KsdhBJHDmsBe6kA/bDOpNgVBqttY4zp1IaRFVo30Q21bl0HRX0JTfw
 5M8++sOf4DvI9q8n83r9AMqrM4YgNDW1txwd6CQtvyzXIDH3O+QCiIm4PmwAAAA==
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
Changes in v2:
- Remove unnecessary braces.
- Link to v1: https://lore.kernel.org/r/20251117-ucsi-v1-1-1dcbc5ea642b@chromium.org
---
 drivers/usb/typec/ucsi/ucsi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 3f568f790f39b0271667e80816270274b8dd3008..a7e0023d6504921d5be3795aecf84b83d33c66d1 100644
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
 
@@ -1659,6 +1659,14 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 		goto out;
 	}
 
+	/* Enable the notification for connector change before getting the connector status */
+	ntfy = UCSI_ENABLE_NTFY_CMD_COMPLETE | UCSI_ENABLE_NTFY_ERROR | UCSI_ENABLE_NTFY_CONNECTOR_CHANGE;
+	command = UCSI_SET_NOTIFICATION_ENABLE | ntfy;
+	ret = ucsi_send_command(ucsi, command, NULL, 0);
+	if (ret < 0)
+		dev_warn(ucsi->dev, "con%d: failed to enable the notification for connector change\n",
+			 con->num);
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



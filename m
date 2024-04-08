Return-Path: <linux-usb+bounces-9018-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA9489B6E9
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 06:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DF591C20DB9
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 04:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C49F9E6;
	Mon,  8 Apr 2024 04:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ax+gMK+e"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E88C566A
	for <linux-usb@vger.kernel.org>; Mon,  8 Apr 2024 04:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712550658; cv=none; b=POtksZUNpa/a6GQIoTaa4cwRvlZ9Mteqpu/w/iAGPo4sl6WIUagqt7QTSJCbrigbFXHODOqUGmEiNE7XOpgzRuHY8bNaAIg1SgeIsKqFpgGAg9XPl78rvWBgJI5A2DNyu2XmicLZCck8pdbMBbYwMZiNXcYaY1HpFhnlDQncf4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712550658; c=relaxed/simple;
	bh=kO8dzpi4xvwBQro3NVL4pskyi7qzW3Wf3RIbzcN7iR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XH1KQfYCSCc0avnkBd0j0HPrb598D/UXd8aNAfqgqbtDYXA2L3Wsefuc5kuTGJUvuRbYxZVOlBYka/eREX386jhuwPnRYiTw0lnuOhDn/Ksp8BCPz/xG/bbO2F2FsVCsIhqSuoL+1G5d2HgtyNTl9wt/yXJdLpyzAYplHUAxmeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ax+gMK+e; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-516d487659bso3498599e87.2
        for <linux-usb@vger.kernel.org>; Sun, 07 Apr 2024 21:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712550654; x=1713155454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vaz5XoTM7xMyj+69kPNuDqaQ4j3uUvcbmmXoKXAw740=;
        b=Ax+gMK+eZKEPSdmpRkc4bOQR0SnEX17LAl1CdWjf6O6XyfZ9eAv4/4+MO9vYxhsYUA
         /axWE03EcvePHtn3ThFizJu4sGPHsmo6d3maQns0o3ar7BRaXKBYoLh5NwDuNNAmLFdf
         r51wUA8ZIs5kNzWdc6OyGtMz7jK49fzSkJVX++KCq9YVkzatNQQLyfwaM320aFzE6yj+
         zMLLdqgVG/hlMJyCoRawSF3aUFtxMADdJCn859RCsGkFJFZmZrOn2aOY5HmDq98BbSEa
         ywPL0gkJgeKYHv9Z73hojeLsbwbw29Qa4kQ7/VOGNpZNaCTCwwUC2w2ISTMb4s43pAV2
         PL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712550654; x=1713155454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vaz5XoTM7xMyj+69kPNuDqaQ4j3uUvcbmmXoKXAw740=;
        b=Wuo4TosfVfQ4db+g3PNhoI25P4547bqtTULn4lpu0I0RNflP9P5cuquVvhMPSdYHnJ
         zR++wHEkhYHzNka0uS/6isTA1rR8rjLjXdQ//p7QlRyoYTmjFf/Rdrj877Q+JTb6Z46Z
         LQcJpReCHbwTrl89jSn78GV6iImvesmntgtk4i01HIPCGdzels1XnWIMl6EQIRHmZplV
         4jJMeFY4XfAKxVr4Qplzu3x7PeG8JcBlox13IzU8uyvpRfraks3NIblZqwyVcUzS5hIL
         71cLI1mReI2vFYxqxE5VZiz/cTcY/IvvI0gHd8/ZK/Wn86/qRN/NV+btAStxoZrMaIoH
         pBJA==
X-Forwarded-Encrypted: i=1; AJvYcCX0hTjq1psg69GWhtuwLM9FYuVmbg8pLMTi12ozCV77f4eewC2TP9tGSj3fpAWjGBrzpv3dm1DA0M6pL2t6qJuv5RVAPyxnqAgS
X-Gm-Message-State: AOJu0YxbMJV3SkOua5G59tJtfIScU/hLiukarLLjdDB7tEhAb6kR11r3
	s+nn7E8bcnuCeSD46G7Q75N2IAoOox+6sI3uEvWG7nncGz76m+X8RF5OfG7z2U4=
X-Google-Smtp-Source: AGHT+IHfjApLCsylVm5+NrfypVA3w+etvzDIaOlBVzBsqVchSYo7Tz8s1egFMZlt1KVXX8dgto8bUw==
X-Received: by 2002:ac2:539c:0:b0:515:9185:652f with SMTP id g28-20020ac2539c000000b005159185652fmr4539995lfh.33.1712550654319;
        Sun, 07 Apr 2024 21:30:54 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g13-20020ac2538d000000b005132f12ee7asm1033207lfh.174.2024.04.07.21.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 21:30:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 08 Apr 2024 07:30:50 +0300
Subject: [PATCH 2/5] usb: typec: ucsi: glink: move GPIO reading into
 connector_status callback
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240408-ucsi-orient-aware-v1-2-95a74a163a10@linaro.org>
References: <20240408-ucsi-orient-aware-v1-0-95a74a163a10@linaro.org>
In-Reply-To: <20240408-ucsi-orient-aware-v1-0-95a74a163a10@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3188;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=kO8dzpi4xvwBQro3NVL4pskyi7qzW3Wf3RIbzcN7iR4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmE3L7X0xzuUtwSZrdRISIp3qyNIQL2XeAng1Ip
 APJ9DcGg6+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhNy+wAKCRCLPIo+Aiko
 1TurB/4jxdOt96tIeWpN1/TOaeGrWxhjZYTx7m+JWjmRtlZK4XgPgk4+H/LhDReT4KDCHr947bS
 zFgmqOWlCU7aL8NOwAH/bNpoQt+4vXoUpjTJjqAi84bxmjJjqG0syfa0V6Ohu88ZzsSmvp53jZS
 vXP+bq812IuRKFPx9qS7JYUkGDPWuUAqAdMkizVxPuuyA+fZZQPx2OzNoE5gNL2er7xLRhF5C3y
 XxOvAsfP2oQ/zRuEvCf/DnvmIXFPrAdgDQjtlb+DrZv8UEQFi6cPgUSpjBx+L4938AMCniqkxHM
 ITbjddgW87gQ8G7OhGRpAB1iFszXIdheRDCsqDm2FRX1+xYV
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

To simplify the platform code move Type-C orientation handling into the
connector_status callback. As it is called both during connector
registration and on connector change events, duplicated code from
pmic_glink_ucsi_register() can be dropped.

Also this moves operations that can sleep into a worker thread,
removing the only sleeping operation from pmic_glink_ucsi_notify().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 48 ++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 28 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index b91d2d15d7d9..d21f8cd2fe35 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -187,10 +187,28 @@ static int pmic_glink_ucsi_sync_write(struct ucsi *__ucsi, unsigned int offset,
 	return ret;
 }
 
+static void pmic_glink_ucsi_connector_status(struct ucsi_connector *con)
+{
+	struct pmic_glink_ucsi *ucsi = ucsi_get_drvdata(con->ucsi);
+	int orientation;
+
+	if (con->num >= PMIC_GLINK_MAX_PORTS ||
+	    !ucsi->port_orientation[con->num - 1])
+		return;
+
+	orientation = gpiod_get_value(ucsi->port_orientation[con->num - 1]);
+	if (orientation >= 0) {
+		typec_switch_set(ucsi->port_switch[con->num - 1],
+				 orientation ? TYPEC_ORIENTATION_REVERSE
+				 : TYPEC_ORIENTATION_NORMAL);
+	}
+}
+
 static const struct ucsi_operations pmic_glink_ucsi_ops = {
 	.read = pmic_glink_ucsi_read,
 	.sync_write = pmic_glink_ucsi_sync_write,
-	.async_write = pmic_glink_ucsi_async_write
+	.async_write = pmic_glink_ucsi_async_write,
+	.connector_status = pmic_glink_ucsi_connector_status,
 };
 
 static void pmic_glink_ucsi_read_ack(struct pmic_glink_ucsi *ucsi, const void *data, int len)
@@ -229,20 +247,8 @@ static void pmic_glink_ucsi_notify(struct work_struct *work)
 	}
 
 	con_num = UCSI_CCI_CONNECTOR(cci);
-	if (con_num) {
-		if (con_num <= PMIC_GLINK_MAX_PORTS &&
-		    ucsi->port_orientation[con_num - 1]) {
-			int orientation = gpiod_get_value(ucsi->port_orientation[con_num - 1]);
-
-			if (orientation >= 0) {
-				typec_switch_set(ucsi->port_switch[con_num - 1],
-						 orientation ? TYPEC_ORIENTATION_REVERSE
-							     : TYPEC_ORIENTATION_NORMAL);
-			}
-		}
-
+	if (con_num)
 		ucsi_connector_change(ucsi->ucsi, con_num);
-	}
 
 	if (ucsi->sync_pending &&
 		   (cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE))) {
@@ -253,20 +259,6 @@ static void pmic_glink_ucsi_notify(struct work_struct *work)
 static void pmic_glink_ucsi_register(struct work_struct *work)
 {
 	struct pmic_glink_ucsi *ucsi = container_of(work, struct pmic_glink_ucsi, register_work);
-	int orientation;
-	int i;
-
-	for (i = 0; i < PMIC_GLINK_MAX_PORTS; i++) {
-		if (!ucsi->port_orientation[i])
-			continue;
-		orientation = gpiod_get_value(ucsi->port_orientation[i]);
-
-		if (orientation >= 0) {
-			typec_switch_set(ucsi->port_switch[i],
-					 orientation ? TYPEC_ORIENTATION_REVERSE
-					     : TYPEC_ORIENTATION_NORMAL);
-		}
-	}
 
 	ucsi_register(ucsi->ucsi);
 }

-- 
2.39.2



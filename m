Return-Path: <linux-usb+bounces-11522-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B8D91160F
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jun 2024 00:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63E60B20A38
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 22:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607DF153581;
	Thu, 20 Jun 2024 22:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VQDyLY6S"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFF314F9C8
	for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 22:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718924131; cv=none; b=LnaaQQjdDZcbBZYd0Fq+0A7ThZgw0+Coz2gnGkqVIvpsGhxTnYb10fpMseLLKmUAhlBJKhE8OaSFVmWCqBIkBuuhdMlAR+ETOjmoMxEiJ38C7m9dUMciZd0XWxm//j54tSQPKsWxiWL9KWNfZMYdo8UWFWscnSaLJJ6QEaBh3N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718924131; c=relaxed/simple;
	bh=LOWb+Vw9/QmbxNoLHa2MHXOU60Fguix3lqbyVHzGXkk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Und/DVCaY+6j3dMqZd7zXK4Q9xebJL+xQelHXP8pr/NyKBPP3soVs+txF38ehD3BHtx8n0r7a+eGwk2x82hC3PAbbdrjHycu9iLPIyq18WLlI6KHyOdME4lockZFrUyJw+ttQ/s9LJkCDK1pr+2nJxV6hxy3f0Eiu9Wl6uSMcUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VQDyLY6S; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ec10324791so15746561fa.1
        for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 15:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718924128; x=1719528928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IR6olVBcDJAiFqvRlmHubkR26Doy6VX5UC/TUKocw0g=;
        b=VQDyLY6S880rP9ai6A+rWtNfymv2Pclt8h6KKcUdOD4GGtoZqsX2WtH686ez6FqlVH
         UU5iSrhVHo8q3DZs244TcdRmsMJCsFHESb1Xrp3sefX4BjME2iCXLHP1EWsYxAYy5xcI
         t3otpUwkfWlcByIIiZT9zyk7tXNJxcgMj80t6bI+N5UaHCrtTw7pLgx/NfoKyIga8yg8
         jqCaJAjbZm6TtH5v2q0tAvRa8fgIdnvv/nmGx+hllE/Lrd04js/EP9xs34pEEQ1/1iPf
         qRtV/+tG8V5nxNb4p0l8A4qDHqjlikRMCxiB/9wEidutut5xGppHq2v83R4SERcCXHSW
         IS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718924128; x=1719528928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IR6olVBcDJAiFqvRlmHubkR26Doy6VX5UC/TUKocw0g=;
        b=f3kFEjwDBX0mRU2l3EDwIXf3osXE9eQorGMATYJTQs9Zb+BriADsHNlRmb/ulETWNO
         iLxiC75XdfJQcW5AKoQY1SvphpxSWskAAmV2scjUTpX1NOiSTIgEwnztDDI3hVyusMGm
         pjG3LzB76zsb+c5kqt8OPbEytXuf20S0bPa6qLZRYWYe7pqVFidh9RobJUCubfaLa2/j
         9j8hx5EWbMROknoP6bsTkTQjGjwcc8O/rCDfTpdkg7C4Tpcc6qa5pc2L8yuw2hHSXEmb
         R1nIRjNYUOWPalfX9C/CbZOokxry+CihF0YmcSx2z2Mwok+aHssqjLdAt6cwmWgMuxiA
         ligQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdYT9UP/lUUuOkUtGkoh0leFxL5GdtckvbMDe0/UazMqw8zDPps5tT/DUP83KASGZCelCNlHhYk9Y22yTPdPxX3pPVwUmbOuUO
X-Gm-Message-State: AOJu0Yw0SjzkC6OBoAYZpW6wQV8inPy5enVaEH3j5HqEif4x27JHU7rb
	N/3JJKGfWONsVvaogHKIM3JaCDKZkBsJfyJMILm9D0cwVz4z8Fs2mF9FabsFRB4=
X-Google-Smtp-Source: AGHT+IHoxm/6bBTyOgi+zBFIRiNRkYizZyitnEFBjNxxc70xWD6BEN8Wul1ZDUIcnnkKkMaGcgzZdA==
X-Received: by 2002:a05:651c:b26:b0:2ec:4086:ea6d with SMTP id 38308e7fff4ca-2ec4086ec1emr49099931fa.4.1718924127943;
        Thu, 20 Jun 2024 15:55:27 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec4d60126fsm510461fa.20.2024.06.20.15.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 15:55:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 21 Jun 2024 01:55:26 +0300
Subject: [PATCH v2 7/7] usb: typec: ucsi: reorder operations in
 ucsi_run_command()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240621-ucsi-rework-interface-v2-7-a399ff96bf88@linaro.org>
References: <20240621-ucsi-rework-interface-v2-0-a399ff96bf88@linaro.org>
In-Reply-To: <20240621-ucsi-rework-interface-v2-0-a399ff96bf88@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Nikita Travkin <nikita@trvn.ru>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2070;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=LOWb+Vw9/QmbxNoLHa2MHXOU60Fguix3lqbyVHzGXkk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmdLNaauNrup2m6YbsM/7Td6FdrCda5Pnyu6yKM
 KQfN812DcyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnSzWgAKCRCLPIo+Aiko
 1WJVCACp9pu/iAzSt7ocCbeRjeF2QNEs+jrrsHD/b2EUMTwZj+CrEmvEUlQDxQXC7zXAd2CyulU
 2CHiKhJzIcdW+ivIcX1VN4T+ZHDRrmbijLRu1P6gOHjj+tVsNuagPseUbs7eBe9OE8H3zUTaYYo
 8uWyen4Q2yXas5QQ9lh5S2uxKHY2V0U7x3S+6KfUNySztOw7idFWM3qpd90cVLeq0MYDpC7Q0wN
 SdAXBNRai83HlLbWOV8IcsDtk8dTU+XqBv/pw1L8OveVRH3KmRlMU8fEY05haSv39zYydoJzZZL
 9sN9Gt9sVPpd8Uy2e/m9rG9PTHHXSLm+lHzaIslA0nG/PqPf
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Streamline control stream of ucsi_run_command(). Reorder operations so
that there is only one call to ucsi_acknowledge(), making sure that all
complete commands are acknowledged. This also makes sure that the
command is acknowledged even if reading MESSAGE_IN data returns an
error.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 691ee0c4ef87..02d7f745acad 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -95,7 +95,7 @@ static int ucsi_acknowledge(struct ucsi *ucsi, bool conn_ack)
 static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
 			    void *data, size_t size, bool conn_ack)
 {
-	int ret;
+	int ret, err;
 
 	*cci = 0;
 
@@ -120,30 +120,24 @@ static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
 	if (!(*cci & UCSI_CCI_COMMAND_COMPLETE))
 		return -EIO;
 
-	if (*cci & UCSI_CCI_NOT_SUPPORTED) {
-		if (ucsi_acknowledge(ucsi, false) < 0)
-			dev_err(ucsi->dev,
-				"ACK of unsupported command failed\n");
-		return -EOPNOTSUPP;
-	}
-
-	if (*cci & UCSI_CCI_ERROR) {
-		/* Acknowledge the command that failed */
-		ret = ucsi_acknowledge(ucsi, false);
-		return ret ? ret : -EIO;
-	}
+	if (*cci & UCSI_CCI_NOT_SUPPORTED)
+		err = -EOPNOTSUPP;
+	else if (*cci & UCSI_CCI_ERROR)
+		err = -EIO;
+	else
+		err = 0;
 
-	if (data) {
-		ret = ucsi->ops->read_message_in(ucsi, data, size);
-		if (ret)
-			return ret;
-	}
+	if (!err && data && UCSI_CCI_LENGTH(*cci))
+		err = ucsi->ops->read_message_in(ucsi, data, size);
 
-	ret = ucsi_acknowledge(ucsi, conn_ack);
+	/*
+	 * Don't ACK connection change if there was an error.
+	 */
+	ret = ucsi_acknowledge(ucsi, err ? false : conn_ack);
 	if (ret)
 		return ret;
 
-	return 0;
+	return err;
 }
 
 static int ucsi_read_error(struct ucsi *ucsi)

-- 
2.39.2



Return-Path: <linux-usb+bounces-10755-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5758D7918
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jun 2024 01:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F6971C20AB9
	for <lists+linux-usb@lfdr.de>; Sun,  2 Jun 2024 23:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8332482C67;
	Sun,  2 Jun 2024 23:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tPAmxdjW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E9380056
	for <linux-usb@vger.kernel.org>; Sun,  2 Jun 2024 23:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717370705; cv=none; b=NmGt/ZSoIW+F8jWWBkiHqhvPYi0nfgKKUKSiHDDzy1GQBut9hja/ByVHug1A/FGIW1WG+KdxZXKlx469LSvy2/Lc4cWa+NFdgXmBngue7m7GMPnMixlxjCwSgXx8xo8+P+zkrVPe3l8scbTG71XoU6Db9M5bROSrZAkB3SzaStU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717370705; c=relaxed/simple;
	bh=qwhd20pcT6mKmuOmdJvReDADwvss13IfbnCS0P5O90U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t5HBAmpyTqzeuHmdB8ZvauJMpozC3c7+flZEqdE2tab9Fksm/No3os/e+uCIwt5/F2kDyqStTyyGfbmLo1ygJLVo7CIs0khsmzWj56mW6Gm7DLRPaLzySFBZWZi8YJMupkU94oJVd7pzEmt38ecGGVJM9KVBWspKx733UIpKhTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tPAmxdjW; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52b98fb5c32so601507e87.1
        for <linux-usb@vger.kernel.org>; Sun, 02 Jun 2024 16:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717370701; x=1717975501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8Iq+3RgEig8Cx0iz/mpoUKg07pqVjSqpR5cr51J2sg=;
        b=tPAmxdjWhtIQBTKVcAuPpJpM6qNMEfAqaXzwdemOZl3uXnrwp/HfXTQ7kYFrj1DIRT
         sSAvsaR4fbm68vJhalIoHPqQROmBptZvdEsoUtOkjdKzRe4+hHLCrXmahJ0IlHSvNwfa
         TKd1I5c4wVxXITL5Au+IKwbI5g2/7wXCcyN3PClz7qdprzlHqTmHR+GKlRfk03r/KASg
         BcYUwllskBcTkkMDwXMZRYK6rDZXEP/TMzYoKVFuIjzMwuOH0wziXOy4m8+tEDuRq5hJ
         JLF8szIcL6CVOrhve4hsEgfK6p/ylpSKl9GZyCBZibFzlfcbhVJajEysvzb8uCYLL6gE
         kyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717370701; x=1717975501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8Iq+3RgEig8Cx0iz/mpoUKg07pqVjSqpR5cr51J2sg=;
        b=cuRuZ7g1JYxr0C1GMuryC5FKQStgC2hZG9yWzqACBnedy+8JWrPAXuTmkzbS6LGv7l
         O2ZP7BFogvQYY9d8Dse+6Y7C3OQDY2hGyzV/yOM13xnxyBO4fHd7a/ig1jSNrPdouMnm
         F8AEtQwgXe6CKYRNmyp1PvXKlehJqKY03mk03U0bLghkRcB7j0TscSgji4eKSo5q3gvr
         KFHQ4+qt9XMK26rCGsFBB3ZDXgBV5evAgaBfUujXt/LlEAMi7v1K5ZEFF2KxIm8kyqbc
         sQ3SLYlkm3Vt5xa7srQwfLQrv29rWubhxVVOvpmL44QJ40fcPp469MoMV1A0dDswe6E1
         oCIg==
X-Forwarded-Encrypted: i=1; AJvYcCU3QO6bmz78CwaVe7JwLkKXwmIzDZI7zvZhNIJCAXiuyUXvWL3ZV4n/+KUL2gRbe611PtVAVP6OAwT3cc2/UGj85rk0rIH/+mbJ
X-Gm-Message-State: AOJu0Yw1gtkzhI+CYSatjViAgjpRPZo9EIMqiDqhJaGJYUx2TmzHQ0vL
	w/UxcHDl652F+2HhXAvtncmLsGi+/aHJPTCWmex0w8K7w/aLSajbKWo/Rmf/Dg0=
X-Google-Smtp-Source: AGHT+IERXsZJtbptbub4OPpmYt4izzdy6vVE3d9VwxncjVETVSXMGoMmwAAaAqx2FFQoGX/3InI1uA==
X-Received: by 2002:ac2:58e7:0:b0:52b:88ba:da88 with SMTP id 2adb3069b0e04-52b8954ea17mr5935410e87.26.1717370701481;
        Sun, 02 Jun 2024 16:25:01 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b959008aasm392369e87.269.2024.06.02.16.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 16:25:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 03 Jun 2024 02:25:00 +0300
Subject: [PATCH RFC 7/7] usb: typec: ucsi: reorder operations in
 ucsi_run_command()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-ucsi-rework-interface-v1-7-99a6d544cec8@linaro.org>
References: <20240603-ucsi-rework-interface-v1-0-99a6d544cec8@linaro.org>
In-Reply-To: <20240603-ucsi-rework-interface-v1-0-99a6d544cec8@linaro.org>
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
 bh=qwhd20pcT6mKmuOmdJvReDADwvss13IfbnCS0P5O90U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXP9I9UoE+huJlSrwgEUi7zxKYLl7ib9SuXtkX
 fxqsDm1/vWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlz/SAAKCRCLPIo+Aiko
 1ZPnB/wJiXKUWKNGHNVrmNmaiYUeTXAzLFk/CckWZubxbjYiTn17Iv99ejxUhjRVFoYE2cwU8lE
 SxN7gerADf7/9A3HXwgOOU40QkmSFfc+FAo2sjoBUw8Nq7Lisst2c7LvRypbflv6wXu44KyYh+R
 cq4NC5KGZPlvD1io3PThZep4n5w7OrgFBl2deD0gg14CCl9W6NvMoYWarHh6jGN3G3t9Xez6JjP
 8iQ8r/aWZvXmBySF+7nS+Ohc6U0dC6AE4R3VSB8FCKMUUEACMEVU0mQlf4693IcOC0KvJRopr3x
 KVVbA1SK1EL9fbV1BpZSHlFPziFH+A+NPxqCFOlMsw/GUGwy
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
index 4d36a04dc63b..4666dec005a6 100644
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



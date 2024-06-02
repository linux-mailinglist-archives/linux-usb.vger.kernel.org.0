Return-Path: <linux-usb+bounces-10754-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E40F48D7914
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jun 2024 01:25:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98C391F21516
	for <lists+linux-usb@lfdr.de>; Sun,  2 Jun 2024 23:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4576982487;
	Sun,  2 Jun 2024 23:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HVHJWEv2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F244218622
	for <linux-usb@vger.kernel.org>; Sun,  2 Jun 2024 23:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717370703; cv=none; b=o19QqQxmy1J98pGtjm3zduVIruQXKG8Eyai87gVrDCuBi+D/rmGE1YFgrPB6vbj++nONecUbeSW3U9z3yd030Yznz3SHQ3CLoZI8RxudybrIu6XcVAUMmnZLNE7HiOKRTIG7Aaok6DpmwzGNsxa/szsR8PuD5KIDnzqLxGFSyBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717370703; c=relaxed/simple;
	bh=mrPf66+/PzNa3/0SVv6o28YNwb3VM608GVeFzUihyTU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UUt4/kX1FINixzz97Ps1QcPbPOiuCmky/IXiGqxhylE2lVY5/z8O7ouZEY2iMXQ7QDxLnCjBBFHjw4U/56nAruH9VY5UcsW/cMKRz6NGD4GWcfru/yOH8V1FsvMoe+fS1vbhOFzHf4ITuwSzM0IecwjqmzkNNUQ/smve34W79Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HVHJWEv2; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52b8b7b8698so2783664e87.1
        for <linux-usb@vger.kernel.org>; Sun, 02 Jun 2024 16:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717370700; x=1717975500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uMHRLla4ILsm5OyTHPffYpll4rFbwg7rZ0xiqfrtlAk=;
        b=HVHJWEv2axhMKd+BoNtPVeJxdLSDif/oNCAiZ5+mTslXnZFi2kOYzL4FTtPFDamuAc
         7t3OqVYVe4cipdQFnOaJh7ZFDBGsa3EoKLpjw2V+xjErUDDfL1p1bs6OePhxCTzGtM46
         w1iyKoDlOlyYMrTehTS+gosrCQPnq+6B7C/yRRsz/zRk2ywWPsk4/Aze+8Tm7hB+RkGw
         LK2hX0uPljt1rO03BflpZyT86E3RMBhBuTjnqz41oH6E+eR0FR8LhJRZCfGhh5yM5o+7
         yxclsFUhSkFyriTQmzafQtJC2Bnq6EMAPYAgw7WljqgcCkCwHuqxti0FXrXBVvuktVI+
         cbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717370700; x=1717975500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMHRLla4ILsm5OyTHPffYpll4rFbwg7rZ0xiqfrtlAk=;
        b=i86UJXosuYdmndLhxffBfVsW3D8cPqMhsemKzEWManFCRKszo/wxxOBh/JtabYF9JQ
         ZLvM+FxXDKbUQzD6TUCzeEgBRmSsmWV8FMFJrdDy6wh5ewZj1dcbe6VzcivdgakA7Vtf
         x/xiSiEzuv/eTMCo05e/fiPowrMuhqT2Mf+5fEYIhaH6EmAVuIM20Hmw/mU7ffuPmS4K
         KcjD7irxIElKIZMhaZaMiDI5TCwjZz7Z4Gqod4wHVxUVh9T9FfGawEAFtxhGXebMBAPA
         p1BcHIhztnOPzMot7Z59frmpdPu075v5odN0XdwTrqbeXB9o5+9D3gf067tD7SuUk1Ir
         y8YA==
X-Forwarded-Encrypted: i=1; AJvYcCXUNX2/PeVmSFht7XjF2UMbqDaU/UyaLJxeDanE0Jbt3a2XOLkfnR3dV4ENOq0OLjakrZnibfxMKmKM1ICHzug/zBxbJW8fXD/x
X-Gm-Message-State: AOJu0YymC/lNLjnDXGuXv3oOmszihjlmxWp7thQnCjusfMv3QmFZDpe9
	pfwDCn1x7JfGMj9YIuk+et6d8a0HANLPOdxFWMtbjU4mxuV0mrTafNO0bKgLUOA=
X-Google-Smtp-Source: AGHT+IEinySEY+8mUF5JebFptkGUEBHH1p6v8JTLm5BkjmrOYM/dSR6lKjEU8RJ2VRVXxIay7X04zA==
X-Received: by 2002:ac2:5927:0:b0:523:b19a:2602 with SMTP id 2adb3069b0e04-52b896c1583mr4583720e87.54.1717370700174;
        Sun, 02 Jun 2024 16:25:00 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b959008aasm392369e87.269.2024.06.02.16.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 16:24:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 03 Jun 2024 02:24:58 +0300
Subject: [PATCH RFC 5/7] usb: typec: ucsi: inline ucsi_read_message_in
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-ucsi-rework-interface-v1-5-99a6d544cec8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1606;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mrPf66+/PzNa3/0SVv6o28YNwb3VM608GVeFzUihyTU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXP9HAufR5oVjQ0LWVWAxSmYfDH5vS6wJiYuZ1
 dHGzcQ447iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlz/RwAKCRCLPIo+Aiko
 1WYeB/9JZcDHr+OF40i0unPYw6KFSmRQ5469nPCT2YTGknUhZXQSaNZ5MjbUZg7XLCeUYccokgJ
 y5EPZdDTaWFO+eXLDilcoFpoNzbs4Kowo86yEfvPVm2YzydiXpGCkvHSnQcEskFxHbUnI0wEQSt
 zspOCM051maHPSZLoGtbJ6mt/sZ8KJiTBfc0iQi+XER2c5/lwFA0rcfEXQXEfqECNWB8tn7HF52
 W23c3lkftFGNTtNSGwh46VWLlcJQ00eVChhByC4oPoyqS+taGwm4IM5ROUGdRbI8RhVxx7BcVF7
 mLr41IHkns9dAUC5Ut/0i3z9vQBkNOX6Jz1pOI6DlKLYaPg3
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

There is no need to have a separate wrapper for reading MESSAGE_IN data,
inline it to ucsi_run_command().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 54a2c505442f..ac4bd86b3fae 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -36,19 +36,6 @@
  */
 #define UCSI_SWAP_TIMEOUT_MS	5000
 
-static int ucsi_read_message_in(struct ucsi *ucsi, void *buf,
-					  size_t buf_size)
-{
-	/*
-	 * Below UCSI 2.0, MESSAGE_IN was limited to 16 bytes. Truncate the
-	 * reads here.
-	 */
-	if (ucsi->version <= UCSI_VERSION_1_2)
-		buf_size = clamp(buf_size, 0, 16);
-
-	return ucsi->ops->read_message_in(ucsi, buf, buf_size);
-}
-
 static int ucsi_acknowledge(struct ucsi *ucsi, bool conn_ack)
 {
 	u64 ctrl;
@@ -70,6 +57,13 @@ static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
 
 	*cci = 0;
 
+	/*
+	 * Below UCSI 2.0, MESSAGE_IN was limited to 16 bytes. Truncate the
+	 * reads here.
+	 */
+	if (ucsi->version <= UCSI_VERSION_1_2)
+		size = clamp(size, 0, 16);
+
 	ret = ucsi->ops->sync_control(ucsi, command);
 	if (ret)
 		return ret;
@@ -98,7 +92,7 @@ static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
 	}
 
 	if (data) {
-		ret = ucsi_read_message_in(ucsi, data, size);
+		ret = ucsi->ops->read_message_in(ucsi, data, size);
 		if (ret)
 			return ret;
 	}

-- 
2.39.2



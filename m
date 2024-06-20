Return-Path: <linux-usb+bounces-11521-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D9F91160B
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jun 2024 00:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC46C1F21BC2
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 22:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7CF2152175;
	Thu, 20 Jun 2024 22:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N80MIUB5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDD414388C
	for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 22:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718924130; cv=none; b=FphWFPDHPF07h0jbmND/knITa/NimuZwZ+keZKApIThvm7Hg/XGIl247UX5e/VngIZCFYSFkilNHdJ/3Jwn4kUoBXsuy0RIOaSqOFtm4o8/LtmOBOAVJGfJJ4NcRXdIPeRaiMNldzPOH2qyUbjvw8XvyQNZ6fkT1gs6k10Ck5M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718924130; c=relaxed/simple;
	bh=5JJ0FuTmJ51m3GFnw66fokeLW92y7ep22LnE63sLqV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nn1qKGoven7LUOYf5PgHQ3JUw0zdCEXAIj4IzIp0azubl+H/RxceH2a3ZQgER6i/x80UiHiZtysgPXq/3LmoC6znO3t9rd1F3AtiLhMk7hDeg6v0Xh5uByMPZV2kwRgiu5VO4TT0Znqw1vtj1vZIXWIitURktgBWc5HS14jI0Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N80MIUB5; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so14239591fa.3
        for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 15:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718924126; x=1719528926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQohNPpaTb5KYVE0BZu3/ef4lat3R4WjEfszMMJQNKU=;
        b=N80MIUB5+2q6R87c4+soEPY0/k1hd/AyuaiX4oyMjRurtONCYTe8WCzgZtGpBA0MEv
         LmvtQPhLZZDFaJoEhpG6+lqnWrNKoUYaK50U4nIe6pnm0BpCAGU8om5PQ1PFAK3xp5tY
         XyLS+jwwaCQHNM5U9PPw2ViFag1XLpmTEsLHuIhRj86rpecR46TFIgjzHqf9L0DHIzT9
         n2BfR2hPmqOdvXyg3SM8poo5kDXLcK7DyQ+6cskHXQHZcRHR+axLp2riFAUC0CSINgor
         BvlF3ZKlhLoNk2n5ixCYDcpX+8GfbS8a0vsn7H3RpAMa9RMQqoJrvIFFV2x45+lxRvYo
         FaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718924126; x=1719528926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EQohNPpaTb5KYVE0BZu3/ef4lat3R4WjEfszMMJQNKU=;
        b=Z+Xq+2yRvjyI2td7pADdWSkCncE4hRvOUzW9Ea43za9QIZJaeTtsn5rc6y/cgpeq7x
         vOwrIN4MNpt+zlfGFWY4vqcQhYBaKxNLTaC5gVEseF7U4J78uoi5Wm6rcKV0rwUhU4Ky
         3HbpD4OZj3QurP1E5zbaTBaAy7BTrbd7AE+AGeU3f3ukiafpEBBKOkHvQibJlmImNGJW
         yqeXnpo0yJ365/+JY5m35reA5Cry5ZllX3x4IoO4dTaLkhfmBN3eJ9qXC29C2K8gZ6xu
         1mbSer+p54U0TtyJVsN+ELO1yw1OTidE4t9uI+chCa2olXv/UIYEx1VbHcU9yCMbI+m6
         5+mw==
X-Forwarded-Encrypted: i=1; AJvYcCWjzscbVvbg2c+6qR23Ntx9DUvRW3jzzZMuXimrQeva2WXTx7A7vwIuNsLIQ7N/YCd5V2ViwH8dvaa4nXogkYS8/emNcMn2oaMV
X-Gm-Message-State: AOJu0YyZL6qQbWvUh3pE/vNZsMT+mOPGgo6sR/jo5q4BVntjeyrQ7gc7
	/e4PNeAa3p4QT/U8NBpEA4fZ4lMv/Q4Lr786KoaJrQS+/CWrAe2xjMxVVknyT8/dbYk2o85n34n
	sOz8=
X-Google-Smtp-Source: AGHT+IHiX4zKNBalbolTrJjjqJsWAjc1/tOmVInlXcwDg2oe43Um4+0q1bXe0brVi/wRnLVylxIuGA==
X-Received: by 2002:a2e:9e16:0:b0:2ea:e98e:4399 with SMTP id 38308e7fff4ca-2ec3cfd74b1mr42903741fa.36.1718924126551;
        Thu, 20 Jun 2024 15:55:26 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec4d60126fsm510461fa.20.2024.06.20.15.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 15:55:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 21 Jun 2024 01:55:24 +0300
Subject: [PATCH v2 5/7] usb: typec: ucsi: inline ucsi_read_message_in
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240621-ucsi-rework-interface-v2-5-a399ff96bf88@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1606;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=5JJ0FuTmJ51m3GFnw66fokeLW92y7ep22LnE63sLqV4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmdLNaDofb3amsRcu0qvjDc9UZGAvmIhod3B7mD
 g3oylyO/0iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnSzWgAKCRCLPIo+Aiko
 1QtNCACdBMXW0rp0duCVy1o696WTIt9Z8/8Fok4J2crdv8mHpLp/GVcEY0Ukoxe3RlnwPD/5UVu
 kxoogwkMVQAh4Dr1qvYAFY/Kte2dVgLzhY1tvMt+mBGza88/7dXk0fuXBKuqQooTBylLFIV/j3l
 LOozQbRYT9JrdTJ7epm7qs1OjKBfmG9qrKZ5hIf2Y6mhXA43e40xiBqBY+fwfjpWaJn+uUQTcpe
 jMIL3J/BU7/NkWKmtt9ADgm+4sxLJaPHfAwIAJQA5sMmD0kssmK79YxPf6lZNt3mI8OYZUkNC67
 Luoqk+ml0bImb8JxFgJ+JbQXLrTnXwVtQgWJD25MA+/Nbgkv
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

There is no need to have a separate wrapper for reading MESSAGE_IN data,
inline it to ucsi_run_command().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 58d9602bd752..4ba22323dbf9 100644
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



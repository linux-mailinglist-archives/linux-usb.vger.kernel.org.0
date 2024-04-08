Return-Path: <linux-usb+bounces-9013-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7795C89B50B
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 03:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D83322814C6
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 01:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B699A7462;
	Mon,  8 Apr 2024 01:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cDEAyx3y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A5C10E9
	for <linux-usb@vger.kernel.org>; Mon,  8 Apr 2024 01:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712538264; cv=none; b=rlcRJggJibuWwDSitj2kf40XJ4Xr2kCh+lTCGBARDhk/WTIXqvtmcSmeLAAh2tB0kddCcD4baZ95IkGYfBbCTy82L/z+B5SRwDrmhoUvYKV8H5jwIkpS/H9dmWn87N9CxBuWvPQDyfXP5A0mxnH4Zn5z4vSfccFGrks/t0zz+0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712538264; c=relaxed/simple;
	bh=8hCT59UUlPeFnsMSjNM7ogTa6Z0LB8n7G6EmCFREqF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t5zTRAbIeKLQgIYUYoYjwLfyr293GeFFHy0eQs3XfYAFZbd8N+2qt3mPrCO3HvrSaWJ4XrEaNExcoaCauMak56piRGo8FewPdBOj+4DMwcAFKzVmjw72qpxLEDaz3FqzGxnht4Di9AaKzlayK4OBQ0l0SOOuAfip0LbkO9pf/i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cDEAyx3y; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-516d727074eso2466112e87.0
        for <linux-usb@vger.kernel.org>; Sun, 07 Apr 2024 18:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712538260; x=1713143060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zKpZdrheuhj7yjl3RKCCkKC9ZeZ2qLZs4tSK1uWLKBs=;
        b=cDEAyx3yYjOvZuNmo7G0liXICcku2ZUBC3OtwM7qlRPRMyS4uhMVM08a0Cxoy48/5D
         2EpHoaohpgYTnUBVl33vb4Hdr3JVoD9vrZIN8JPM4xcZVuVN109L1pY/Kt35b7Vjk4eB
         w6aaAJSTM/SrtBvywEporD2Tr5HjkSmWjIQKzndveWCaSFxgzWJuoBwoKR5Ik/RuvuiO
         wy2IF5H+8IMLWMR8FGmmgiWQrvCQFpvxLe0q7UMJvRHgUK+du/FhNIuNzgzYJR1hWVgH
         INH/zV6qTgPpz8XS2TBY9qXHGdeT8tIKUXjzrMmxgfVWQnvOJx/aUED8Be528xTiziZZ
         RxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712538260; x=1713143060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zKpZdrheuhj7yjl3RKCCkKC9ZeZ2qLZs4tSK1uWLKBs=;
        b=rXRaHkFG7EUYJgnOsJ4mo/1GzM18xt1HwROnSWVRUE1VEtnZc3j6OPxYQD2LFpG2lv
         Mkthaju5Fy49FMZO3LD6AanwCSD+uXREl5Uj2Vnp7Omca+oReza1HVisdFax06DEDaQk
         tHoJH9HLGCytImP5KT16Icdde0+lQu7YeUZBRCadzAyq5l+SShWMaH3Zk/YMehgnY6fq
         ssbNbCAkQO5YvKRIvyMluOhVWZoJs5P2kwPsihf07C3DN86zwMc4CVSlW7JbEvUlmyQh
         dEVxDRD8GQ+SewUxnRsAkUYRhQj3QoZaY4W+rR2n6X87yZwG8emJrZfvXytt+/hXYKHE
         J0JQ==
X-Forwarded-Encrypted: i=1; AJvYcCW66NdnU6+F7aAG0ITOrMNy8PvZ8vjAjNnTq4/YFKKgFZn5ZiIETJcq2r4o+j4Vsb0FT/6+W/iltGHhm+Q50+0m9OT9h1efMz6n
X-Gm-Message-State: AOJu0YxrOCZ90tHkMQ3RlFJfpdffwpFhCbJTALoRhheHXnFAcAi1JzpX
	n6M4xWw1DE3tz3NNowfnvWEvwJf3ty3hcSnvLkwqHclDNuIRWWdYb1mnkc8y0XY=
X-Google-Smtp-Source: AGHT+IEknDaX8du7Q/ssV1kvpZL88uAGkrW8svlqZLvtfsXHUFPZG3+pXiRJUvXuQ7gv5TLHrtJG+Q==
X-Received: by 2002:a19:6457:0:b0:516:d17f:3c30 with SMTP id b23-20020a196457000000b00516d17f3c30mr5109276lfj.3.1712538260577;
        Sun, 07 Apr 2024 18:04:20 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m29-20020a19435d000000b00516dc765e00sm674034lfj.7.2024.04.07.18.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 18:04:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 08 Apr 2024 04:04:17 +0300
Subject: [PATCH 3/3] usb: typec: ucsi_glink: drop special handling for
 CCI_BUSY
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240408-qcom-ucsi-fixes-bis-v1-3-716c145ca4b1@linaro.org>
References: <20240408-qcom-ucsi-fixes-bis-v1-0-716c145ca4b1@linaro.org>
In-Reply-To: <20240408-qcom-ucsi-fixes-bis-v1-0-716c145ca4b1@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1725;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8hCT59UUlPeFnsMSjNM7ogTa6Z0LB8n7G6EmCFREqF8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmE0KR4Gv/bun7J1cWPuf9wHOsVk2HdV1AGd3A7
 cqPq072Nv+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhNCkQAKCRCLPIo+Aiko
 1UpfB/0U28BzqJs4QovjkmxtwMMgp8xDjJ1Tc6s5lcvnNZ5HwoiJwJLd/GfMuesG58RWjaA0mPX
 vvbROwnV9HiJK/mQBsG1qa33rN2FXw7++puWyiRNBg4YK6LJ1KsAy1q5yrw2CvuotGshdJPOUcx
 R7eNVEowzEpBCkTsaaH5/Xpi0dpRmWn+EM+ae/5QWEm6yEFPgEKYWoRgARPRqSaRZDB6Jgzw19O
 m4lhAX5zvyh5Pm4AWrDeHB8II+2P1CIq1BjRkoovzb+NgHjByXFgxNvbzhgUVMnGdXzZA40Ldwz
 eDHs0xi+sFbZDzHj/melI+w71Drvs7HiJCDaMr7OQjHGJo2U
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Newer Qualcomm platforms (sm8450+) successfully handle busy state and
send the Command Completion after sending the Busy state. Older devices
have firmware bug and can not continue after sending the CCI_BUSY state,
but the command that leads to CCI_BUSY is already forbidden by the
NO_PARTNER_PDOS quirk.

Follow other UCSI glue drivers and drop special handling for CCI_BUSY
event. Let the UCSI core properly handle this state.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 9ffea20020e7..b91d2d15d7d9 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -176,7 +176,8 @@ static int pmic_glink_ucsi_sync_write(struct ucsi *__ucsi, unsigned int offset,
 	left = wait_for_completion_timeout(&ucsi->sync_ack, 5 * HZ);
 	if (!left) {
 		dev_err(ucsi->dev, "timeout waiting for UCSI sync write response\n");
-		ret = -ETIMEDOUT;
+		/* return 0 here and let core UCSI code handle the CCI_BUSY */
+		ret = 0;
 	} else if (ucsi->sync_val) {
 		dev_err(ucsi->dev, "sync write returned: %d\n", ucsi->sync_val);
 	}
@@ -243,10 +244,7 @@ static void pmic_glink_ucsi_notify(struct work_struct *work)
 		ucsi_connector_change(ucsi->ucsi, con_num);
 	}
 
-	if (ucsi->sync_pending && cci & UCSI_CCI_BUSY) {
-		ucsi->sync_val = -EBUSY;
-		complete(&ucsi->sync_ack);
-	} else if (ucsi->sync_pending &&
+	if (ucsi->sync_pending &&
 		   (cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE))) {
 		complete(&ucsi->sync_ack);
 	}

-- 
2.39.2



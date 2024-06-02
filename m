Return-Path: <linux-usb+bounces-10750-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 150D78D790D
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jun 2024 01:25:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB4951F21659
	for <lists+linux-usb@lfdr.de>; Sun,  2 Jun 2024 23:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6A6C7E0FC;
	Sun,  2 Jun 2024 23:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yNaX5mD+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8379276EEA
	for <linux-usb@vger.kernel.org>; Sun,  2 Jun 2024 23:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717370701; cv=none; b=QKFHONJBtUDExm3ZCS2RTQIzSu+xaYBWZI8z2SLB+LoKNkrYLEzrZ9xvLW9GfAX/k4j2chaFzA696aG3f13w82uGuaT7/i7EzVCN/Xbs9mnCZu7UBlHI8Ln08W6BTN1UHwjmOSiLCcUxcmCSux9O1vOLgFyxh9qbAC72bGRdE5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717370701; c=relaxed/simple;
	bh=J3HQOCyfSVpr1YUtYQZItLe+bN2QWt7En48aq2hwcDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jKqheodsYAawRISBS6YfNronRnfsKG6pN94JmriKlNxKALdiX3KvLS66FV0Ob85WhO7gnqkXXn62BeGlL5n0S8ndvtqFIixNAGKWvYFGPVzMBpfcAKj/Htq0dzyg2HwmxlJrQDjIOfhIGGVbTdO6i3PvBdDOJTddrOi19D7XRXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yNaX5mD+; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2eaa80cb4d3so15728511fa.1
        for <linux-usb@vger.kernel.org>; Sun, 02 Jun 2024 16:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717370698; x=1717975498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/H9omkcKfSMWKhyxE8ouaq15vBQZtQgKk2aVI95FWUU=;
        b=yNaX5mD+ZHcJG2x0A5zcsz3WYkYeb/zQ4hQl/Mv61tOdX4y3na1tySyveXCJerKUbn
         WinAsn0wNpO+iGcfvIVYWuWOvUKh9APKVvTUtFVN4XYHydJTSpSrLthLVfmLc+tfKTfL
         GvEgjCfSYdPP0EzkRfiYpVOgBnT013WIax4BkoT9sQdvjC9y/YIteodT3YFURHwrTpel
         sX7LFopmtMfwrcw2Vuk0l4LRh+J09DN33oXCTO+fRN2qf4XNgELLdUFf7B16WjfiyKDC
         pLiye5PknEsd0vYtXngFdpi27EcUvEx2zFeFL3K/JnoPbvoPlSkKU219Tang11FhO+4b
         fQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717370698; x=1717975498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/H9omkcKfSMWKhyxE8ouaq15vBQZtQgKk2aVI95FWUU=;
        b=LuDBgzdkp/dwh+eJN21L/S1W+u2LdbPM2cQim28jied0O4fbLjfdCUFsr0JAPiTuNG
         NDwvBpyn0MwYGfdOPsddajdnQGzslJR6coKh7REREogag6geeWGgRughpt1lAAIAJdY0
         dkZF7qvx52MoFoWMWlDBqHV/kYX4ESUv1lcPiN01go1ObNf4gOmBaX5brZWHVs9BsJnd
         SdMvO+1lA/Ho97v6xwl8L6Ozo7DZn+TL666BCLvvSUXraFeIIKFJ1fpOnWsewht6ASBI
         63K7S0mGIXi8bFn5sfBfKI3A0/+VWrxi5/utLTMiLOFuaNRW2uvlaMDrJSUwFmdZZprD
         YQpw==
X-Forwarded-Encrypted: i=1; AJvYcCVsPkYL4UztSr2aszjIVnQcmkGaCAbS/ujaEwFl6L/d5O6XL00EMMUdtmUEg0HBPrJ0W29+RLO2u8pPucF3NklYSNKbJTvwqGig
X-Gm-Message-State: AOJu0YwNhxe23QdOEYwCm9pdoMN9nNmDlSNgqEoqAmr+wWH3zNRiSUC/
	waWRrbGpEvOT/1fYQO3v5jv1sJMtp4HyeW+unmWFzuOzARsHMgBDnlIAWeG0o8o=
X-Google-Smtp-Source: AGHT+IE2CkuVfuEeWibh2syHVvCT2BYHUAnYl4Dc3HsXN2GwvEWq+MuVV84p30lXkZjv/MWuXo6EyQ==
X-Received: by 2002:a19:2d14:0:b0:52b:9046:c44c with SMTP id 2adb3069b0e04-52b9046c59amr4014987e87.58.1717370697587;
        Sun, 02 Jun 2024 16:24:57 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b959008aasm392369e87.269.2024.06.02.16.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 16:24:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 03 Jun 2024 02:24:54 +0300
Subject: [PATCH RFC 1/7] usb: typec: ucsi: move ucsi_acknowledge() from
 ucsi_read_error()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-ucsi-rework-interface-v1-1-99a6d544cec8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1294;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=J3HQOCyfSVpr1YUtYQZItLe+bN2QWt7En48aq2hwcDQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXP9H/f3ba1SNbSVuQnOo1uz7VMfWjPKCe7tix
 noDzdNH6tGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlz/RwAKCRCLPIo+Aiko
 1d7IB/9MbaRNYHyugOOeccBgAd/6xgYFC8GC5EoakGOk+XO8fa4kUcKuCnypn9hKPcv5XYKagzt
 bPXUTZq47XUYgE1J2OW32LsWJ8dMV6Cw2Ue2hziAmhcMgc89R453njTxTc3eKF40ARb3FTptROQ
 xs3VZx2ERK741nPOXeoCPU79RmeSG7uMAZT9UFFi2yHZrrTfXV2g/IgAAmuNd0jQLCUQvGyFOcc
 G5i9jn4wNWURcR3K/mq8HTwfFr/kw5JW8Jtpeu3j1UTNSiRxVZMEjOH57d8d6thIm5tobzMtC0P
 e0YbXHJ8z8bldV5HBiq8FkRuTzcIgMVoIFCmG4pGI6WE2/w8
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

As a preparation for reworking UCSI command handling, move
ucsi_acknowledge() for the failed command from ucsi_read_error() to
ucsi_exec_command().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 2cc7aedd490f..953196ca35a3 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -70,11 +70,6 @@ static int ucsi_read_error(struct ucsi *ucsi)
 	u16 error;
 	int ret;
 
-	/* Acknowledge the command that failed */
-	ret = ucsi_acknowledge(ucsi, false);
-	if (ret)
-		return ret;
-
 	ret = ucsi_exec_command(ucsi, UCSI_GET_ERROR_STATUS);
 	if (ret < 0)
 		return ret;
@@ -153,13 +148,14 @@ static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)
 	}
 
 	if (cci & UCSI_CCI_ERROR) {
-		if (cmd == UCSI_GET_ERROR_STATUS) {
-			ret = ucsi_acknowledge(ucsi, false);
-			if (ret)
-				return ret;
+		/* Acknowledge the command that failed */
+		ret = ucsi_acknowledge(ucsi, false);
+		if (ret)
+			return ret;
 
+		if (cmd == UCSI_GET_ERROR_STATUS)
 			return -EIO;
-		}
+
 		return ucsi_read_error(ucsi);
 	}
 

-- 
2.39.2



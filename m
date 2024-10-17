Return-Path: <linux-usb+bounces-16382-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 905519A27D4
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2024 18:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46BC01F22A26
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2024 16:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F211DFD89;
	Thu, 17 Oct 2024 16:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W9I52Vqr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5B41DFD81
	for <linux-usb@vger.kernel.org>; Thu, 17 Oct 2024 16:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729180885; cv=none; b=OtpseTLn1WOX/e0O+EeQS2oDQO1F9hMKOrdFJbMsK/2TPqAMtYBKi00K1IqwvWzxcsWGxc5IsRX4KOsmqoXsdL4v4xasGLirqiVY4JD97crLxqshB/PH7XCEbvjKqGUCSG3a0pw/hQByjn+cJ9oAwo5u6m3vAAs9FZOvDVccJx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729180885; c=relaxed/simple;
	bh=8tYhk1/X9rTC5CRRriMRdyo9FAY7gz/olIfFEpVUSqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iLPOjjs5WOJduvIurI9gN5/uZpPJjLukddu0EvSSgxbx6tpT07VvDFAYk8k6SBr4hn0pDGflU8b9lHU9odmR/Fo/iy9RcbmNnFwK02czCHqUk37xwt9frKrVHZ13/jHgxky9CuGh4vtAThVzc4FrA6Ry7nHxoqeSQ80IcjJxS0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W9I52Vqr; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so12138075e9.3
        for <linux-usb@vger.kernel.org>; Thu, 17 Oct 2024 09:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729180879; x=1729785679; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N17aF7uxh0G6GGML6WHZ8HBEXLTUCV/jQt7rlNZei0A=;
        b=W9I52VqrAwjAtlvNPFc8Uf7KCI1P2Ijd/p6YEmTf0Nfu28fyX6X+ywK7VIhCtnCfzI
         mRXjM0zuieWktR62QRf5PK7+EUKIuSf5N5E0xfPMJ22AFQZE+9HNki/Fw+SufAe114FG
         tCCdFgJ0ad9cQM8N+MKia9wQMgoJLRt41h6S0ByTwMEQQK5lFomPl4isZvCldirqbvI9
         BLcz9bEU4oWW7GS/ngbffLw686OEgJwBC/yyiNB2sd/00IA8bVIekN85W37hfc9e5Nwe
         mkP2B4F3L8nHL5OyUYYRqEu937EGIvWs16z5PWTYOIbsT1aO7+ZTccFbojIUvzRKUIrB
         F8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729180879; x=1729785679;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N17aF7uxh0G6GGML6WHZ8HBEXLTUCV/jQt7rlNZei0A=;
        b=cfjL5VXZaukOFsUNJkdGa/F30PwTqaYRq3M9cu9QAoy+KOUAcyKQvcacliaFFw3zyk
         8A3NrOvKBlHzUb1sFa0uI5hG5Bq0jBnNMX0XV1FZulLuER7BKlSkuKbLqscQKOZnX+qh
         KqkkAvcy2dxRtg8Juyf1uGPXUhVRjHV1zJprHi3cyjDLr0w7HVYXaKicIj9MeqMR3UoE
         F/gGm9rIppA2dz+kxRhEmGuLWRtR5EdXEkIirHCQZYh9RW0gN0Ed6c3KvhoE+2xyhUko
         r4oKc5ki6HFWvCukS0SNwgg5R22w2BKK6t7my+fofSXG05A8wc7YJhhiMayJH1lkmwmh
         OKYA==
X-Forwarded-Encrypted: i=1; AJvYcCW0mErXn7T9KVSV9Fuq7i1qKAguGxMMgvNf+L10jSby8a9ZcDfQyyMyXJwyIAjqkHu8qwiq4R7qraU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBhcsL0NyL2E1vqQZ9lm7Sb3PNMu6yqfqN3EtjdvfntubqydaO
	LzwHGXN/6LHj1j3LuHbQTsHShpzHQReDtlPeQGhihHlKVONlejgjbarFp4fT8Y4=
X-Google-Smtp-Source: AGHT+IFBPyquqYu3U/ycusam+CJOvnQy8PGDhkcYeNxarlFbkDu6daoyWAcSns52Jl1oBt3KtvI9ig==
X-Received: by 2002:adf:e405:0:b0:37d:50f8:a801 with SMTP id ffacd0b85a97d-37d86d64357mr5772759f8f.47.1729180878429;
        Thu, 17 Oct 2024 09:01:18 -0700 (PDT)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d94626094sm2879927f8f.88.2024.10.17.09.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 09:01:18 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 17 Oct 2024 19:01:01 +0300
Subject: [PATCH RFC] usb: typec: ucsi: Set orientation as none when
 connector is unplugged
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-usb-typec-ucsi-glink-add-orientation-none-v1-1-0fdc7e49a7e7@linaro.org>
X-B4-Tracking: v=1; b=H4sIALw0EWcC/x3NQQrCMBBA0auUWTvQRKXEreABuhUXMZnUQZmUJ
 BWl9O4OLv/m/RUqFaYKp26FQm+unEXD7DoIDy8TIUdtsL09mN4MuNQ7tu9MAZdQGacXyxN9jJj
 VkeabAihZCId9MskerXXOgXpzocSf/+sK4+UMt237AdrDBXiAAAAA
X-Change-ID: 20241017-usb-typec-ucsi-glink-add-orientation-none-73f1f2522999
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1460; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=8tYhk1/X9rTC5CRRriMRdyo9FAY7gz/olIfFEpVUSqo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnETTA/U3r6RWF7+v6bA21+7iIdUM8vuV+1T/kR
 i+7DtVoe4CJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZxE0wAAKCRAbX0TJAJUV
 VrEkEACGayQYM4WKq/w2n8qQIvjm0A8YPWxzcHKPdeNPeAVefJ9k8RYxWVIX3ZPfT+2PwIeC9Ll
 7Hv+ApTjaa/1uT0nliWXnusInWEJS0aYw9lwtO4FvG90B/39qfnEdQpTI0ZVub/KWxmDlYUoaoF
 KniXIHpjI4QakeD9xQkYublNGsG1r0YXJzyxy2GH2G0JrYk0/UjPB9zptGtLzeCJnv4S+LYKrZY
 R+dPwKQcHkVOnfsvX1ix3bkNP1x6CQ7hfxNvH5/igiIu5bXPkSJ9Ak7ku153c3axRHJTXjT+27u
 HSjiSXniIdb8N+VnPskurc1/amV1316MfggfpVmKrl65d+/KFvTni8WSzARxhI3Wo/2AfxMrE8G
 TGpSHJwq1rm06XkUJPDtZsx/NViyNQhCGaRsvvhuzHoRhV/5NmjKvmiTvgSzEfxO003dXhxFgGA
 zZNkqgcba0vyl2JdS71rxSv7KPlMAvMDs6Dd/Kor9iIUpaxZJLv1iXgQO+hjEp8LMGbeYyP682H
 XQPrxJE1eEisob+2YlT1cemmH1+Ic/cthIAoYn/L+hw1IMBd2nqIerqyEAoB7wiydlPFymx1oqm
 PZ5ns2yAAcV0x7mGL9RIRw/loRimIWxnFrissjuuWyz1DhooOj41b14BsFhal1gSqf9vT84Ztzu
 XSRSc02Jv2kccwg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Currently, the ucsi glink client is only reporting orientation normal or
reversed, based on the level of the gpio. On unplug, it defaults to
orientation normal instead of none. This confuses some of the orientation
switches drivers as they might rely on orientation none in order to
configure the HW in some sort of safe mode. So propagate the orientation
none instead when the connector status flags says cable is disconnected.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 3e4d88ab338e50d4265df15fc960907c36675282..b3bc02e4b0427a894c5b5df470af47433145243e 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -185,6 +185,11 @@ static void pmic_glink_ucsi_connector_status(struct ucsi_connector *con)
 	struct pmic_glink_ucsi *ucsi = ucsi_get_drvdata(con->ucsi);
 	int orientation;
 
+	if (!(con->status.flags & UCSI_CONSTAT_CONNECTED)) {
+		typec_set_orientation(con->port, TYPEC_ORIENTATION_NONE);
+		return;
+	}
+
 	if (con->num >= PMIC_GLINK_MAX_PORTS ||
 	    !ucsi->port_orientation[con->num - 1])
 		return;

---
base-commit: d61a00525464bfc5fe92c6ad713350988e492b88
change-id: 20241017-usb-typec-ucsi-glink-add-orientation-none-73f1f2522999

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>



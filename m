Return-Path: <linux-usb+bounces-8637-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FF8891390
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 07:16:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C3361F2297E
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 06:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399C447F47;
	Fri, 29 Mar 2024 06:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rs2TP8Fj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E7C3FB3C
	for <linux-usb@vger.kernel.org>; Fri, 29 Mar 2024 06:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711692946; cv=none; b=VznnV+4zCvj+ga4lniXyatPORQZ7oB8OIWGh9XASPVOHaJtK7bxB/vBzIgbgDpAUdNEQOFqrr/M4m4qELmvQkKYvtr88pYwbNK533lGSISfytiDvWoRX9lwl5fkG4ia0n0not5VcifSNLSHtrhtHT2eU7o4agkitz1BfxgbllNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711692946; c=relaxed/simple;
	bh=MnPxRahrYakDmeCXkc8qs7yorS+UWF9e6ViW9LzxCxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LT5uCKCc6eYF0MqpsrvSse2684bR2ZOMruouG3+5C6yw910r6QZhZFpQWW7TXCR79uVDKWV0W9noABWwkW5AM239xvjYBFf0tJ/G3vJGlvqvR5S8a3QIgQnSk7b2eHVrOQu5anC88iO9fIPit+/byXhKcIW7dpZnSQNMpccURbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rs2TP8Fj; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d68c6a4630so17920401fa.3
        for <linux-usb@vger.kernel.org>; Thu, 28 Mar 2024 23:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711692943; x=1712297743; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VxdOEDIk+f0fVU9fpmARr44O3Tv96RmIzUOndubq/IA=;
        b=rs2TP8FjIIpLYe6UE7rI9+TxlvjAXdDnZKE465lIMdAQYSxSNchOTo/tLmQP64l1SX
         xGju6wd84WEB0/0OPbtxFOowYd5+1UvUF4rMElA59wt22z7tOei+sJ0JWgXywkLiAkB5
         f8zyR/WOQM0co3zCGCTrq3Qkj3cg09lHiNJuUlD5iS40XtVS4p0F8zCEoTVTZoQnNbgD
         BkUc6QthUXOJ40sIqUkcjui9hLIkq5NvFH9JfAvX/SbwjZht0AYpGejtBYZYaptDRgGx
         QiajVDYYrkOPYSdUstcL9YTrY4j/FN7z2B/B5vPZ+pg+duw7eSp4mb6AhLeaCSLz4cyQ
         zKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711692943; x=1712297743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VxdOEDIk+f0fVU9fpmARr44O3Tv96RmIzUOndubq/IA=;
        b=jin+QUgkl4lbfyCi+ZK7eBQP8fuN4Zf1f4JwxZgEEeylzCJgWgdAKdiIAEqkHjjgN1
         oCaum+6Edl0rLt97F5MHtnrzbiAjWQ52SbcFrl0wvM3DwFO/WfYLQK4OBNwpvwmx169y
         iSLqnA8j+cKUkePd3/Sbvfxef52hhvsaOjycIGB8mzSy7a0tB07onKBsXtbGT6dCC/1t
         uvP/l59K3RyMs3IlQHqilj/zmRfGvgeGgMcEvHBnd0yhOZ31j3oHoJGCUs2vltW5Fyhq
         fXTLfpwUdZJuELkWCRmotaMhYLpKre5edys/w8dVmCpHC+2lgYxtnjK/MnlEOoy/c1UN
         2S8A==
X-Forwarded-Encrypted: i=1; AJvYcCUzzLq1GGjuoXrTxNSNidGb52zx7Ik9pSoTbZKMRVKR0IXjzXryD07lTxCJ4kacsEZJ7w+4xgRi8I17vvY3rnluQySprWVIFvPf
X-Gm-Message-State: AOJu0YwpZZnW6C5iEtDngE01EM2uXqbK5I0U5IIzhgBLW05eFyQmiidY
	qHv8O/HhD2tlw30BmX3DOEHRExBL/6S79g3GhhgVnMcHClNaoD1XbChf9kj+94g=
X-Google-Smtp-Source: AGHT+IG6kUoJg0fosVUswnRTrw1QNG7p3z+GEZ2K/cmJL7ZtyaI/XV5kO9iw7SCrbSRPGkzsDvgFKQ==
X-Received: by 2002:a2e:300a:0:b0:2d6:c252:27fa with SMTP id w10-20020a2e300a000000b002d6c25227famr850883ljw.37.1711692943139;
        Thu, 28 Mar 2024 23:15:43 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k17-20020a05651c0a1100b002d6cdee339csm494539ljq.103.2024.03.28.23.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 23:15:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 08:15:33 +0200
Subject: [PATCH v2 01/11] usb: typec: ucsi: allow non-partner GET_PDOS for
 Qualcomm devices
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-qcom-ucsi-fixes-v2-1-0f5d37ed04db@linaro.org>
References: <20240329-qcom-ucsi-fixes-v2-0-0f5d37ed04db@linaro.org>
In-Reply-To: <20240329-qcom-ucsi-fixes-v2-0-0f5d37ed04db@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1061;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=MnPxRahrYakDmeCXkc8qs7yorS+UWF9e6ViW9LzxCxE=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxpbTHdGUNa+Y4XH4nKiwz8EzYvcaJU2e8cSu2dbv91JO
 fTSN/5fJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAm8lmT/Q+H34Ltfc2rp5W9
 3XloknJ8eJ/lHE6DrWzBKcmiW+PP/079m8lduGbd5pSksxfaG3X/11dz5GSusZjRdoMlROpmu0t
 4UbmR0yE7pkWOoY79aZ2S+5k2h9+5dnFxSqRrMfe3gGMLE1g+vbPI6e6d5yNV0j9tX13Nh4uPc9
 LbHtbsbcow/L9nbYSXWley3uxOXdUPf806bmml+x1d9TsyO20Z96bHzfd5eXKiam3SagPnpslnh
 c/5INJvZ8WjGcnuqSMmq8vT+9Ph9NuN2vw+xfr3+dPKjR3PZqwqlY15/fd6TZ4F9xGLoNpn3/6f
 PXvwaFYMx+rEqUrOHXOU3JsXt9qJPbny68DKD1r2yoEA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The name and description of the USB_NO_PARTNER_PDOS quirk specifies that
only retrieving PDOS of the attached device is crashing. Retrieving PDOS
of the UCSI device works. Fix the condition to limit the workaround only
to is_partner cases.

Fixes: 1d103d6af241 ("usb: typec: ucsi: fix UCSI on buggy Qualcomm devices")
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 48f093a1dc09..42cc1c0e2f73 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -619,7 +619,8 @@ static int ucsi_read_pdos(struct ucsi_connector *con,
 	u64 command;
 	int ret;
 
-	if (ucsi->quirks & UCSI_NO_PARTNER_PDOS)
+	if (is_partner &&
+	    ucsi->quirks & UCSI_NO_PARTNER_PDOS)
 		return 0;
 
 	command = UCSI_COMMAND(UCSI_GET_PDOS) | UCSI_CONNECTOR_NUMBER(con->num);

-- 
2.39.2



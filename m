Return-Path: <linux-usb+bounces-7911-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E743B87A214
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 04:55:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A33F52839F1
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 03:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5B210A1A;
	Wed, 13 Mar 2024 03:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pnov1oIs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E2214ABC
	for <linux-usb@vger.kernel.org>; Wed, 13 Mar 2024 03:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710302072; cv=none; b=PORiDk0H5iYgH3Siu1rgYf6xjqtm39u+bHw5mzgYoJVHq4qCJJU9+upeAVArldUCwMU844rrW2nQw/m3x8KkvG+7QN1twWWTA0OktqVaaASBiJOtFHjanEAKyMyCNIm5Kr08n4GIYvfOyFrsbCPM56EDp6aj8TpkS2On9T5D7Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710302072; c=relaxed/simple;
	bh=S06LW4XbXp4mNZRbX50ghuv/ngjWIPDbWauLWS0Z+FU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KKfPibMzfLJaV3fpMkS0FLdYLmaEB0QG2QP6CB4xDaK2KWaqXu8shavdzBsCZrENj9uhN5KaY+jLtKVnxr3Nr2E5b+A5u4sZKoqubtoFakAeQwX6CwRMubYOZqdekQm0/jv8EnAV1TP9CJf/r7RK/iLpMgDuzzAUdXmvO/G9h44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pnov1oIs; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d27fef509eso101134971fa.3
        for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 20:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710302068; x=1710906868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z632Vl9mGcaUD+E7Cpwdhyjpjxo2r7hLci9lVvPzHlg=;
        b=Pnov1oIssLpiTJqrAjLlU8ThYua0NravpFbBeOIHDnL1NiU9ugNF89QXqytmXt5rBu
         nw065NatFw/6ijseQV7HO0JtB3heAaTFJZZ/X4jNvPDvXNr2JIm3wHM5p8hJikLAuv27
         IfyvK91T82fWeJCT/myTLmLuJ1erJdDaXeMqZWeB+h4ShQUPGo7cDSh3M8YUkJfd6XMW
         9PTMXHT/oaYjCyFBQkCBXAa8C64xdbWJAyqRT7fnTlP0EQwP7EgXyhdoptJFlDCtdbkx
         8nxCzSH7uOwfyzkciHoM2W1AVIyulcb4EXXZV1BvTJpVmV5As6E788j1SQmEGVUpimhx
         YkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710302068; x=1710906868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z632Vl9mGcaUD+E7Cpwdhyjpjxo2r7hLci9lVvPzHlg=;
        b=Hg/x2UK/z0niAi2XZHIUhfs7ikkM3/cMldqpKYUSgly9W4RmAuyJ8bGseanD7uGlbu
         lNnHfjJQuRcii+KDr36hj2V9N/Xl9RZrJpziubtsjthu+ItRPfh6a0iBFSrojVwahZsq
         MWcb9aDBEc+gmQFWBM1dEockv0isoEePqxGNyRrjrWEWgEvKLBUDC1BtIXB8aNWG4Rhx
         cicEL5Os+Xw0EU/qWq2a2E28xK0ypvO/X4/TZABxY9LNCS2lwBJiQxK32f8/Zm3a0KKW
         0azNDtk4oXG6rpQg5CfVquG0jOZ1dwbM0CLAPO/NlMZyDe3IpVbDnSLHP4HvLfzOvNHo
         3Ifw==
X-Forwarded-Encrypted: i=1; AJvYcCXR3A8FKIe+mhrMOgIMBVbobpQWCurXKPpV2URQdhGA65NzsXNB5e7yFfpilpfXVKYLa9G9TT7Sq7fSRly67Gq0s7KkfgWrhhWr
X-Gm-Message-State: AOJu0Yw383Dh2/In6LQ0JIOFCQF/Pt0D+GS0vP31HyTKbWoEzLyfNTQk
	XyX9eCfcDdmR9XfSiwd7JeXon4tHvgLYtZ9kMAz37j7eD56fnF0AD5PM8bnZk8w=
X-Google-Smtp-Source: AGHT+IGT21uwfmDhENLTqEjyobLcyK/klC8iwxAr7x91U3iV4MBVqo6A+D5u/a3myRTNeji9AGY8rA==
X-Received: by 2002:a2e:b0f1:0:b0:2d4:4a0d:d48 with SMTP id h17-20020a2eb0f1000000b002d44a0d0d48mr3239650ljl.47.1710302068739;
        Tue, 12 Mar 2024 20:54:28 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f25-20020a05651c02d900b002d0acb57c89sm1854319ljo.64.2024.03.12.20.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 20:54:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Mar 2024 05:54:17 +0200
Subject: [PATCH 7/7] soc: qcom: pmic_glink: reenable UCSI on sc8280xp
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240313-qcom-ucsi-fixes-v1-7-74d90cb48a00@linaro.org>
References: <20240313-qcom-ucsi-fixes-v1-0-74d90cb48a00@linaro.org>
In-Reply-To: <20240313-qcom-ucsi-fixes-v1-0-74d90cb48a00@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=885;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=S06LW4XbXp4mNZRbX50ghuv/ngjWIPDbWauLWS0Z+FU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+pH5exzHOlrKmav+l5ZE3/7pk7Bumje/gT92sakcnOr+
 z475i/pZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEIt6x/9PjOXv3CoPxwnZL
 /882hZlvIuWPab36PneV8eaX2dtFfV+qacU01FUwytl8t16Z9L3D1vwPa9jl+PWhlYe7+u/Y5hv
 +Ycz3lnr2I5TNUkfrn9dvwwDe1bJJ+xPebTpwp6k7SS+gM/CiuT73lxj9hCm3JzClFD089Lvg+N
 0W68NhrZvCJmf7VAp/8quvXCIqvu2hvEpA49O5wVF57Bbhmre+B4haaAXY2PfoHVomurTcYfVUr
 zV7PkluCHvymIvZoKJg32P+9bNqjD22OSUWGvd4Gese5Z0jpXjitvapDe8dtu3icbT8s5rzzCen
 DNvZE77wHinmjjmesnAK7x7RfX9vBd3a8G2KkvccGY31AA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Now as all UCSI issues have been fixed, reenable UCSI subdevice on the
Qualcomm SC8280XP platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/pmic_glink.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index f913e9bd57ed..e5a591733a0f 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -343,7 +343,6 @@ static const unsigned long pmic_glink_sm8450_client_mask = BIT(PMIC_GLINK_CLIENT
 
 static const struct of_device_id pmic_glink_of_match[] = {
 	{ .compatible = "qcom,sc8180x-pmic-glink", .data = &pmic_glink_sc8180x_client_mask },
-	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = &pmic_glink_sc8180x_client_mask },
 	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_sm8450_client_mask },
 	{}
 };

-- 
2.39.2



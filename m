Return-Path: <linux-usb+bounces-8647-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8246D8913BE
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 07:26:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CDFA287E4E
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 06:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D19E51C43;
	Fri, 29 Mar 2024 06:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jXsr+PT6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C1E481C4
	for <linux-usb@vger.kernel.org>; Fri, 29 Mar 2024 06:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711692954; cv=none; b=MvnEeW+B5FiKZgAS+m8kRcsot19vl/h/DgeRPZUsYKD4NNEizSuxmtA0lcSyrUABLa/yvX3jWRdHA85Yvh6WbniafjFzzkukFy/Hy5x0EuaD37BXsgunLb4NIe+CkAZDktrvYcI6v5L7AnnMbUsCHqojYiWSlQgE4ASWPh6xRHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711692954; c=relaxed/simple;
	bh=vcAN8k/qAhd5AWrkE59lTd3x26sbLY85MvdZDgX2n5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PDa76nGdkVCoYzL/wLMugaBGiAGwY5SHQwBKDi8GVPu0EkZ5NyGe9L7USoe+ikhIfGdeni9luDbwkgzAsKAcSu+yLCaaUjoO1MTPwT8Qv1UyOitXVwJdg/eAb1RNU/x2Em2JRzuPncRJJdMETwLT6WwAD1MZsGCw9OVMjYfjqUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jXsr+PT6; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d718efedb2so2723441fa.0
        for <linux-usb@vger.kernel.org>; Thu, 28 Mar 2024 23:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711692949; x=1712297749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ic98WBfAimS8nmcOgz85H93UKGeZiY2SCA6nsjQm3Ik=;
        b=jXsr+PT6yJJwKjqzAVaPewFEHqMUloFH6kaUHfVYZU2SY8+/iXhTkmXtEj7eHXuKCl
         CtAuu10+cwXr12zpRNF1Nya6PUbU2NmW+lnEIfQRpvarpAHtgWxJQvJ8Y9MK1X+wPkC7
         Un9R09gl8rk7m6hqmpntmWSwKfHEmKJkutj4CEkRM325Ticnabb0mAWW6o108nfKkf8u
         UarKhhaPWKMj/HUIWFA3x3xbpn2kQWGx5N7ow/2O76Ulguaz/3FbsXJF7NjpwRTH6uwX
         qNWhp28o0O2JKXQrGwm66KbMQ1GRI5hinH4x7nl+vcYSB4ofyQcjnqttbwUQUs+vTNQN
         VV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711692949; x=1712297749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ic98WBfAimS8nmcOgz85H93UKGeZiY2SCA6nsjQm3Ik=;
        b=cPSyxwZ0mWKAeGw0HLiEAEksD9iUlo6xFVCUKlCvcq9bVvRAxEqXsS75V7U+sphlJB
         DHl3WW89Y2cegxbHVnrsyEDurBAd6Hn2xTcu/MtoFVYDLprw9CKeu3FUnD6K6u5ljWYx
         Ak4e+4h1bI1s66uCCfcN2dAyCCTdDhNsugeGOZAJg8NH18UqnflD7nNcIEFOaKYGcXz6
         eH73M9qnQgrDsFzCBcWWU+TyeifvQr6OwLZR1S0cYpSi5pUOH2EBG/KalzfrxalqhSXf
         yCQX90f33BkXV8ZEd/9xwJILXV0LS4HGn/PD+nAxy3k0P2YJQiZJxqwMbtNML8RmWyCC
         Xs2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWkwrve2Zqx/ibrlJ1VBMyFC4YE+LRfojJ1L4xtfo299OsS9bBp1Cjw1C/6Wnyw10NEKrnlc2+eZSLlZR4kAZCfZ3fsxgemfcc6
X-Gm-Message-State: AOJu0YwI5+cQUVxBVzq3VAitLpN/se73mjyDE1rOryNByDwV7JTi2HaF
	7DPJTd/FnLf6nKGUJ6rB9+qrRw31+a8kkaXaV0ofal5YJmTxLJnaCvEnQNB71DE=
X-Google-Smtp-Source: AGHT+IEFYkb4xSCTNgPAqVSPz+PbQkpovAkPslV+zAyYbPg+7kdK5UTIJTQpBnjSZ5o9T3cZPbmXhg==
X-Received: by 2002:a2e:b904:0:b0:2d4:132b:9f21 with SMTP id b4-20020a2eb904000000b002d4132b9f21mr814571ljb.6.1711692949338;
        Thu, 28 Mar 2024 23:15:49 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k17-20020a05651c0a1100b002d6cdee339csm494539ljq.103.2024.03.28.23.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 23:15:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 08:15:42 +0200
Subject: [PATCH v2 10/11] soc: qcom: pmic_glink: reenable UCSI on sc8280xp
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-qcom-ucsi-fixes-v2-10-0f5d37ed04db@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=949;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=vcAN8k/qAhd5AWrkE59lTd3x26sbLY85MvdZDgX2n5U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmBlyNiO9Qu1rh3SLEC8ik2TgVba7ZgDE8JXX5a
 Zu2Zy/bkPKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgZcjQAKCRCLPIo+Aiko
 1V4KCACTpq4/5OhmOM7xLV8GT0LEzymqnCMbTAga9RdLB71GxbIr9PnkzJnio8TdmXzk4rI4Ckd
 oOgkHcXSRxRhiQWMNqQDZVAKLDjiCt0chIB4r8X3NRKjhuSjwYa+WGqDENIDphakc+5eZ2X7iMC
 /LiiMVd7An0FJiI1sZgVgCqi9zGZSvzsWfdEQEOsi7bBWwuvHdF/D1SjHjhA3iuX6e6N8akNpPK
 t3L39Tu4HUxgTDxOxHBc1yD21aTzjJMQG7O/g21wUvL0PcVaWBmIWRrCc/TiLc9Boc3c5g8kOSr
 rcqjbNcc7sh+mvq9qS5AfReVKhM0+E249WTNd6Qenhn0D8tL
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Now as all UCSI issues have been fixed, reenable UCSI subdevice on the
Qualcomm SC8280XP platform.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
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



Return-Path: <linux-usb+bounces-8638-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF1E891394
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 07:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0D921C2111E
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 06:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09A244C92;
	Fri, 29 Mar 2024 06:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MYXYCZDA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2EB44C9D
	for <linux-usb@vger.kernel.org>; Fri, 29 Mar 2024 06:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711692948; cv=none; b=oZqJrqvnuKA8XDMeNN07yzFOuv1TpwmImPcLVTqDUKO+MpeIwki4ZM6e7Ki6GXiFfO6XYOum4VVS3+aSfhxik+iNYMWkRi8v7jOV7FK3KwhbUBJ3EiE84AwiAB93d3oM/KXbrD1tPamBkjWioshdRlfY5S6uNGZV0rPp7jG1220=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711692948; c=relaxed/simple;
	bh=mv/0FMb4uejFpK/85rtje4ZTRBtEhEbil7GSiWyR4Ns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HnArQuzujsXEC44lXEPlLMiP/KCmWLu1/kZs3Ee/yOGzFxdg5MHOQBo8d/XR0INwkAaa50HLIidcZE6y9Sl0YBsYnBv7jJCp+q3WznMvaC0Uz6OHsWrOthFTPCQqDcDTJEnjvtWQbM6Vc+bOnKhYCBLWjCzk2fWanvtFZYX0XJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MYXYCZDA; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d109e82bd0so21520881fa.3
        for <linux-usb@vger.kernel.org>; Thu, 28 Mar 2024 23:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711692944; x=1712297744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U360Lb4JkccxQYaLDcFFBG6Tk2HssdE/Asbl4utQkOM=;
        b=MYXYCZDA30EFHdSFfx9K/sxYAPpvncZrCb81cbxXyX8DLvljKtaHKuOxqhBTK6nOG3
         WsT25CoE+gOWle+mln5aBNvK84H4znpvNAzjOLlA1fnTVCHJzWkp7cBXGNZb1o4cqpd2
         9uJ7dK2b/7k3+bDm1NxSz1/5RqXS438fxL1Q44RuXLGVuAmQ1OvIUyUFGU9w6vSiQTdP
         bTKLZatdgOD3UTmn0gLQvl7CTeMCWTRjwfAYwdw5hPQ+KIpbvf1Y2TSVC+IZ7whAgfp1
         J/jhxuG+XaDz2vvndFSM/VDXqL8RPuJas4pQs+qEFHt1Oh3Xq2dYYFJgUhB1A9Kjd14Q
         ozmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711692944; x=1712297744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U360Lb4JkccxQYaLDcFFBG6Tk2HssdE/Asbl4utQkOM=;
        b=gXTo/IulRcIDLlLhSTcscQJchzifPSVW/qbxELJFq4AgQVGvcEy1qlMfR3k95EzOvl
         3Tg6kskzWy+v1jVwj3FYcTK6aqva7d7B8k34sw58rPYivHJgikWfOkUhdDokN2yGZbYa
         bIzTmhMlgvvwkF5nHUPjKka3IMvWYG7cMuaZzZ6eSUCcKjEDgU7W5NJtqSd0X2Dn5pg1
         OV/FHUhl1+eL00B47ZiSeMwK9XJb9zZMixiU1dvJVhdwXFpHR2RHerBoLRMTQ3tNBget
         jLsjOU4oH0uhs/kDCuUncN2zzPZuccK9ReEw7YmW/RlvKh7h1GqIWPGU4CYBKujSSa3z
         X/JA==
X-Forwarded-Encrypted: i=1; AJvYcCU+K1StZG855fw8KCVqAVspI97WGR/HbAIcoiO2jBIOIXh3MEVwI0sd2AuaVSIzdZ/SVJyW0KuzlTkmozElgCeqYcqWOEkioqBu
X-Gm-Message-State: AOJu0YwPPsYfmsZK5hE18d32g4MjWmPeZnUQqFzTuK+GYNtQt237rUIj
	PPBXWUXFnWa4W4fr4eMi6imk6MO3i7zzrcVm26rU+wVPYfveFvVfPTPvwp2x2Ys=
X-Google-Smtp-Source: AGHT+IH6ZcGTfzbNFfmBE+ZuNEBmN5fcom1ICOQrycQSnuBBttDo3ENTpApw80rBoRKsokLikgH17g==
X-Received: by 2002:a2e:9f0e:0:b0:2d6:dba1:6d37 with SMTP id u14-20020a2e9f0e000000b002d6dba16d37mr759556ljk.11.1711692944622;
        Thu, 28 Mar 2024 23:15:44 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k17-20020a05651c0a1100b002d6cdee339csm494539ljq.103.2024.03.28.23.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 23:15:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 08:15:35 +0200
Subject: [PATCH v2 03/11] usb: typec: ucsi: properly register partner's PD
 device
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-qcom-ucsi-fixes-v2-3-0f5d37ed04db@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=938;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mv/0FMb4uejFpK/85rtje4ZTRBtEhEbil7GSiWyR4Ns=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmBlyLlXmkrNkyBOSKD/CH4GoO9UuJxuuZPjrh1
 AnTZt+6EN+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgZciwAKCRCLPIo+Aiko
 1dt4B/0fpEWcV0L4JUnCnaosYjxvSCPjnmrEG7cBeHUZokEO3F6kw/cXPsTt2RCxFaIMRvSNG/T
 sN+Mu47P0XAPk8UUI4m5tBpc56EJW6UqHQs5kiRgHfQhpuMIdTnWQUcfqy8xtBBAWHnqH2E87/7
 q9XmE24K4OP6fvbpRsPxSWdh8Xy4dHoYiHiMADy8tQQkT9ZR0G3rfwm46ZlcZzQk7cUIeXfDj5p
 kLk0SfZQcnlp9/99QD7CMMtDUhEoCadnnnQdpRExokEUP34Z+Ou9ablM3Wy14LOduSYMTbhkHuF
 jv28/AhUllZQr7jAaJ/kk6KYBwhVfMFeaLrB2tL66fI84hEp
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Use typec_partner_usb_power_delivery_register() to register PD device
for Type-C partner so that the PD device is nested under the partner's
device in sysfs.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 92886b3b0167..7666142d8bbb 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -811,7 +811,7 @@ static int ucsi_register_partner_pdos(struct ucsi_connector *con)
 	if (con->partner_pd)
 		return 0;
 
-	con->partner_pd = usb_power_delivery_register(NULL, &desc);
+	con->partner_pd = typec_partner_usb_power_delivery_register(con->partner, &desc);
 	if (IS_ERR(con->partner_pd))
 		return PTR_ERR(con->partner_pd);
 

-- 
2.39.2



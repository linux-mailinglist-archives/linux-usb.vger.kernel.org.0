Return-Path: <linux-usb+bounces-8639-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A966891395
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 07:17:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5789C1C23924
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 06:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6327B4879E;
	Fri, 29 Mar 2024 06:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RF5D6jNJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8E844C71
	for <linux-usb@vger.kernel.org>; Fri, 29 Mar 2024 06:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711692948; cv=none; b=EhfjbeId6WPWPq6R+h2y0gfHTraggfphj4iLGh4EjFS07OHf/hoIzf9pJ+XD7KQpNcG75gH3zvpDLlI6EWLpKb1iVL2hpSsUPc7ItcFI2hRbNl3SJW0a67hmLPlJ9UHFAWUq0EYN0oLudDbJf91D77gOv3pF4kcbR8uaIJ2DdRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711692948; c=relaxed/simple;
	bh=1YXtXW57tTxFBEzDGmlGAr9GqbQ7HEPJ3F4/AfgmRvI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=piWBsyfXfQGdnzpCAFElim1vZTcg5QWWTcjwPGd9KZZkS/sSbHvIVSNk3kpvQ63+Z3RgOTFWbca9Qwa4G7DJaMb6YlIPupbb9wROwnplQHH/cfsoUAPP7vjOrnu7SR25MDifbJluJWueMTmzCCzalCh9eVqg7KSj4OB6RSJgR+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RF5D6jNJ; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d4360ab3daso20581401fa.3
        for <linux-usb@vger.kernel.org>; Thu, 28 Mar 2024 23:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711692944; x=1712297744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xc5E/NYDZLjfNoXG7DGNM4m70S/ss7sBgBQIDH4LAuE=;
        b=RF5D6jNJYgCe+TdD83WIPjyaxHd6YerkAb3h2psiY0nr9WrvN6r0OHArN7xh755QFB
         8lGSuw6YxGn+89SyVNgGHaEKGlyMm2ptvDnv9V2ndan+QpCXBQXG2pYerSGEzh6KdcJZ
         zt+XeGSlJaIn4K9XeGlcGhpNWbCno5AICEFg4FGcIjJZwXHtI5Qx1SmpaOH86mKcD6DK
         eLKwOa+ZxrqCwwwW8dKKiULlmMs1AG/DuvJn25K6zg0cwTe6QTXFnGrhMaFqVQ531Efe
         kAXVZFe0iNL2ah+dpRVvsxiQmoIMWtnhhRHGlOKgOB3+15rphJ/b2RK8zGFE3I9x1D9x
         H1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711692944; x=1712297744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xc5E/NYDZLjfNoXG7DGNM4m70S/ss7sBgBQIDH4LAuE=;
        b=DpmJL1Q669vSCCRNMsmZZdvwTRpg3/I5r5WZhPHj8OQD2lt+TSfVqtZ6JRG6gVPvQq
         WJ3DwyvJFjHmuD+gv8DnQmR9tzqwcLGFts3aUjX0QFwr6bqMkFNY+rGiROHcIT2lueew
         oJUzFlq163FqLvh647ujEumM8R3j1rSA0uFrIbjE24vzXOnwUeKiahpH4iHG2Ka/0//e
         +VgN/7HG/NlWk5zK0bRd3cBtMnDGkU3kJcCiGLmFeSK8HuT3DAOiqoe0uvr50ahs8Krz
         cHcmq1J9/eL0jjQfp0bvtmTIRAyG/UVz1OXw0WvjS32glUlwJqhYaAY0bZqhWluU56rO
         sTbw==
X-Forwarded-Encrypted: i=1; AJvYcCWtfE3/rxoekA7pSl8vi5qtBAciad112EMXTmZBO+V8Uf3d1OpbmvtY8nXWpGKJgrJvPYpPUUTX/IST4TMh3MLruYUE45NZBqG2
X-Gm-Message-State: AOJu0YyQpsjxrCl2duH4bGteUslnGsR3ZSNv1Ix3tHEfVlBH9NmY/+Ni
	CfwSAmYDQTd6WYjf86RJnJw0HoRAVTT/EKaP/tGtGMrYQjAWdWqh3Xi2CdvHeeo=
X-Google-Smtp-Source: AGHT+IEePaz2SnD+UFN6/qc+sV/+qt4MnAgsQx6Bz3mfnwBq/eCIcdwQF4nRgtzAAAODjIon94073A==
X-Received: by 2002:a2e:9151:0:b0:2d2:4108:72a with SMTP id q17-20020a2e9151000000b002d24108072amr701748ljg.12.1711692944006;
        Thu, 28 Mar 2024 23:15:44 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k17-20020a05651c0a1100b002d6cdee339csm494539ljq.103.2024.03.28.23.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 23:15:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 08:15:34 +0200
Subject: [PATCH v2 02/11] usb: typec: ucsi: limit the UCSI_NO_PARTNER_PDOS
 even further
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-qcom-ucsi-fixes-v2-2-0f5d37ed04db@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=1YXtXW57tTxFBEzDGmlGAr9GqbQ7HEPJ3F4/AfgmRvI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmBlyLlz+21OUfH25DMiB9TiVLwHkYmQEer7Cs9
 JeVTaNTXkmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgZciwAKCRCLPIo+Aiko
 1R7vB/4s3KyFor76g7wvPJMF8SzMLnr0c+3iKrJ2/dnyAVVtjZHza0uXd3JAfyM7xkQ64qlyX/d
 eKvoDtkT/kpgG1HzWkqzKnLmtNDcLAto0XgBFQkgpyrHaryro2FlkhjFmvyKdrClY6jdx7hs5PH
 zyeYcEVDMJEbXNkkQWKb0z+LPL8WqTzy8uW6RMNk9PxB2i15VHpnsmLyMofXq3cUnCZZPCh9bji
 cTvHbHLWHVyHJSNBYQIFFWt96LxHFE/+oxvMjBASU3L+cV1pNpjunhQpbjkjFDYMs16iI+Qy0oQ
 LUa5ESLcRppKHSgyy9p69SJvhHiCvvcn38fxT8J8gAb42Ub2
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Reading Partner Source PDOs for the consumer Connectors appears to be
working. Permit getting PDOs in this case in order to populate
capabilities of the connected power supply in the sysfs.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 42cc1c0e2f73..92886b3b0167 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -620,7 +620,9 @@ static int ucsi_read_pdos(struct ucsi_connector *con,
 	int ret;
 
 	if (is_partner &&
-	    ucsi->quirks & UCSI_NO_PARTNER_PDOS)
+	    ucsi->quirks & UCSI_NO_PARTNER_PDOS &&
+	    ((con->status.flags & UCSI_CONSTAT_PWR_DIR) ||
+	     !is_source(role)))
 		return 0;
 
 	command = UCSI_COMMAND(UCSI_GET_PDOS) | UCSI_CONNECTOR_NUMBER(con->num);

-- 
2.39.2



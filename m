Return-Path: <linux-usb+bounces-23399-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6C0A9A78B
	for <lists+linux-usb@lfdr.de>; Thu, 24 Apr 2025 11:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 895E83AA76F
	for <lists+linux-usb@lfdr.de>; Thu, 24 Apr 2025 09:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C92B1F5402;
	Thu, 24 Apr 2025 09:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jfFXZpEO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A11D528
	for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 09:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745486364; cv=none; b=J48TiXXJPUOCPF3psoHzRPG0tx6v06C33ZSPpSX0YQmyVn7pO6xFXeZ5fySzeL9X3lluJlhS4zEkhC/Wbd0JxU4u4S6CYXCkyBUpL6Ka+CfSavJLXlM0ayi4m4J9wTB6DU4jSPgm5tONgCq1y4KXcPM66D9nAUe/IAI3vtaprQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745486364; c=relaxed/simple;
	bh=Ir1Jvv53Ubmo4YXZyDCLSFY2lgyS+XUOg5J1w4AVzKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jyTj/HoKUMSQwnJEFH7TjZjotK+PggiR8V3kJeMd9x+VYr542KlYd46KwbuXCdKZ+I/KHUKZ2h3xnzv0VPCtmtavU5o14ZPG+hD+h2FpXUkkXkjJ/WXkdSpKTr+SwVECw6EK/Rl8cN0nrpVZCipZX6JxW3LMaUmgXlSyR8E1mA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jfFXZpEO; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39efc1365e4so350319f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 02:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745486361; x=1746091161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m2kW0+6CHGLKL7FENV7NWKpK8lZHJRM9oiM1y4rvumg=;
        b=jfFXZpEOxr2funEq160vXy5Yv9V9BfaIo9snqgksscuEW/IZ02MVMiOKWoia1B+zQz
         /EGDDVmZHqqnnEKtcLjQUhvUF7j3h69tDHWYmk1UO+8Kq3mq0B1mTz1qR8yJUKccXCZS
         iyJt+YM8HgoxBapQEX5teRG+qPCDDG4Pg76UbrEnRdNJswQS6CuL74Y45viBqVGM/+JK
         eaRklb7TC/xxn4+b6ch+fyk/LffCfmWtZQgVm8QQrzxi3mqtvXEX8JmNesO8Irsgrr+o
         KEXSR0Zz5+cssBhuaJPWffpr5irZvNgqiGRwqCDz3BzqsYuX+e6w55VAfo9gS31Br6Ug
         2K0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745486361; x=1746091161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2kW0+6CHGLKL7FENV7NWKpK8lZHJRM9oiM1y4rvumg=;
        b=ikyIEcYRBYYNGNmFo0HTsqxVRxNbYvBGGc5nrjmURNK3/dNzwqMtKhr5CrVzNrx277
         d2RiBy+fleAwpZBz/4jXqHSPoD/Qm2rk+mfff7DzVTKObq9xS1CGFyilEOW2LPBOaya8
         30TMkbc0JnuzYLLcebvcItPNw8mRlJwIAlKXwKtnfCPwQhlaf+ippiGnWRuQmF44ad3u
         JLj/0a04EAcd6ca8H72ROCI2wrl3GJivhMABt853J2fTqeIdN1ZZPgQTI9Fy2sBvuXF/
         /B+PJqSk3Dv6/OSdnth8kEl341fEPwSBUm0dNUELt2yzbcIPQGxd3j8nzeKuYDJTmKiE
         dRjw==
X-Forwarded-Encrypted: i=1; AJvYcCUt+8yMIX//KLC85aXx96r7Ksw2/OttQl5SWLijUIxNHlZ7+NJphj+cYny1FgS61RvZQYvknv5Szcw=@vger.kernel.org
X-Gm-Message-State: AOJu0YypmAC17rxonPWiuAL881FyWZPHFrWW3OWPCvO667iWCMheZ7lT
	lmwwbZdPESJWBJeuY13tLpCnzE/2hA5/RSprXMzk6UZS81atBj4o/cY3vvI8L80=
X-Gm-Gg: ASbGncscvEWRbZqbGKK8xOpSsXSL8vzPzaXVLlsLF+oOhjAfMaa6gXk0Qi/63tXs3qT
	rblXtskKaQRvKK3i5KnlRInXzhulF+oHZ70bPoPvyJK04004pSj9wFfUaZazLTAx7lWY6WqksnK
	OhyqXkNhAmkzv/f98UbHofhBQq2GBcmCSbLDEHw2Mgel4hBibCmbL3RjFnFyxkgEXkAfUnCZE65
	DuML7e4y2yCfnE4/73ALUpugrxhwb2J88sQjDAHMbHAxGmCB6NPWO5Mr4Xxe1PE/JWjDnvHuMnE
	DjZQXLBO+mjnVfLrcA+JwLzxvwyeaH6ZJaZKSdgCXmiTg3WxwSQGSQl1uJn9hQjYi2iASWMZX1w
	=
X-Google-Smtp-Source: AGHT+IHiYzswPwaJ/0SAVmL+W0eRZ953Xly4wt23DtwwVQa1Ic7tlX04pjm26M0T7Q4RrUegWntzAQ==
X-Received: by 2002:a5d:6d89:0:b0:3a0:6b06:5740 with SMTP id ffacd0b85a97d-3a06cf63917mr1302662f8f.31.1745486361074;
        Thu, 24 Apr 2025 02:19:21 -0700 (PDT)
Received: from arch-thunder.lan (a109-49-32-45.cpe.netcabo.pt. [109.49.32.45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a7ff8sm1473940f8f.13.2025.04.24.02.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:19:20 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
To: "Alexey V . Vissarionov" <gremlin@altlinux.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	lvc-project@linuxtesting.org,
	linux-usb@vger.kernel.org,
	Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH] usb: isp1760: fix set/clear pullup register field access
Date: Thu, 24 Apr 2025 10:17:05 +0100
Message-ID: <20250424091859.1073201-1-rui.silva@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

We need to access the register HW_OTG_CTRL_SET mapped¬ on hcd regmap
and not in the udc regmap region. Fix the call in isp1760_fields_set
from the isp1760_set_pullup to use the correct regmap fields set.

Reported-by: "Alexey V. Vissarionov" <gremlin@altlinux.org>
Fixes: 1da9e1c06873 ("usb: isp1760: move to regmap for register access")
Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 drivers/usb/isp1760/isp1760-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp1760/isp1760-core.c
index af88f4fe00d2..1eec4b21b54f 100644
--- a/drivers/usb/isp1760/isp1760-core.c
+++ b/drivers/usb/isp1760/isp1760-core.c
@@ -109,12 +109,12 @@ static int isp1760_init_core(struct isp1760_device *isp)
 
 void isp1760_set_pullup(struct isp1760_device *isp, bool enable)
 {
-	struct isp1760_udc *udc = &isp->udc;
+	struct isp1760_hcd *hcd = &isp->hcd;
 
 	if (enable)
-		isp1760_field_set(udc->fields, HW_DP_PULLUP);
+		isp1760_field_set(hcd->fields, HW_DP_PULLUP);
 	else
-		isp1760_field_set(udc->fields, HW_DP_PULLUP_CLEAR);
+		isp1760_field_set(hcd->fields, HW_DP_PULLUP_CLEAR);
 }
 
 /*
-- 
2.49.0



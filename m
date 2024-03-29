Return-Path: <linux-usb+bounces-8636-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B3689138F
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 07:16:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA18F1F22956
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 06:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D000D45943;
	Fri, 29 Mar 2024 06:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sRoNSO/f"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4E93F9EA
	for <linux-usb@vger.kernel.org>; Fri, 29 Mar 2024 06:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711692946; cv=none; b=HAeO2TrJnN+hibm1ccte5eBC2RNf527/ctiQOPmnWjomyV/Djw5ZF8gabBlM7taPM2XmbD/na4I6DKuBd5qmNczmndEtgdgL1r0m31fIRXe07vQNlaVgCuiium0ujE/kyKzQ/ymdkxVlXsnvkZLd2FOgtkl5EZSkHnOQ8Yrwm+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711692946; c=relaxed/simple;
	bh=8VURQvqHgElRal01VCxfreaQz0r2PHAENWmGfuWdnwM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kKU+UYbYrA1fAYfpTpkjbCST5cKkgwiwYYsWV6GfYN7FjT+4gyUjZQJLiMpkaFUGP2e3cS+1hyntpg35fXOLJCvlLn5+B8Axm+Vb0fYudMKleZgAHMDU9j7cwTeEgR9EGeSLw6yIzG9n522VZj4Nz6gNJbTPB5L8/8+C3Xe8afY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sRoNSO/f; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d6fc3adaacso24574321fa.2
        for <linux-usb@vger.kernel.org>; Thu, 28 Mar 2024 23:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711692942; x=1712297742; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=05Jl4TFSpb/J8CtWryAsZpfPiC+ue5/NnEIfTzyep7k=;
        b=sRoNSO/fXXJAjtvkQsI0IKyp39eOGq68vDSffte8enPYryfrN1W+LWB3aXWXJf8rLx
         dMs9A0uqqjyIHNb+ZX+MteeRovGYn98jZP4gPmwaEhAQUZ2EJdicvWifIvX6QQJnwwXK
         NTzhhhMBJVZ6jXrsKknm43NgEL/Asyrcj5bWKGZnRO+XfR3rPvLPZT5U271thzJOQv4/
         kr5uqG9+Bzu+KahePmWWwuD4d9L3iHIuM9FVCU4S4h1Riv1MP8ddROgSiO/22MKtdCGv
         qZfTI/NEkxiA8ZfTJoNAMxq2lTHpWo8BmQLtEfUbHL8BSOdkCTmiA75MVdGg8lN7qyEz
         lspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711692942; x=1712297742;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=05Jl4TFSpb/J8CtWryAsZpfPiC+ue5/NnEIfTzyep7k=;
        b=n5YJiXCt+0J8ve0AIk2prZFcpNtFYdAd0i+rp/Vc7yB+SKvkY2hI+rngn102jjANKQ
         5O7u9unFGkqE67Bp17pedCMOoFt3JdpTBbCmBikDhVueiuVNuWY0kA87HbpAx0EX1Afe
         mNk5RS6t3WWX8Yqk3X0aB++AFe/Ck41e+Ev9GfVoJ+3jB7SgngX9ozsyhGE6wbYSQztk
         uAcnVghtFyUhzokWD7GQ0ewj+jeHg/SvQWy20zSR04U9Kt814rg5BPyb/9ih991uZNeP
         jIlUkYAfYM+s8VU9W+59RzPU6gpi3tHCyxJUIYMX+agKEmQS0yAT1c1AV+Yw3DYKwQXh
         dpyA==
X-Forwarded-Encrypted: i=1; AJvYcCWhZMORzNmlH7Xm7IMD3niJ7+r+eEpCO1hjnAeYK8HdcPZawhKM7PYBp3CZeWkL1sw8HuIChFSAulcDFkyhEr94QZj5sMdr8NcO
X-Gm-Message-State: AOJu0YwXT5vhKvgzRN+yqiV2lvOffz7j/+dEMauph+WOrCb0AST3fPqa
	/DSCLn9kOYFk2+42oT8n4hMQjf9oF+aaYxSjlF1wxnyVrd+54+IegIXhz14VG26Hjg7vOczQeGp
	R
X-Google-Smtp-Source: AGHT+IHLh1rQm4JDYo541UPTjfWuEUYCmhHfq4ITPbkH3yhAEStET4DvT5V8s1Z4B8T3T5epbcWM8A==
X-Received: by 2002:a2e:300d:0:b0:2d2:3fac:5fc7 with SMTP id w13-20020a2e300d000000b002d23fac5fc7mr576677ljw.45.1711692942298;
        Thu, 28 Mar 2024 23:15:42 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k17-20020a05651c0a1100b002d6cdee339csm494539ljq.103.2024.03.28.23.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 23:15:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 00/11] usb: typec: ucsi: fix several issues manifesting
 on Qualcomm platforms
Date: Fri, 29 Mar 2024 08:15:32 +0200
Message-Id: <20240329-qcom-ucsi-fixes-v2-0-0f5d37ed04db@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIVcBmYC/2WNzQ6CMBCEX4Xs2TVLqQU9+R6GQ/+ETZRqq0RD+
 u5WEk8ev5l8MwskH9knOFQLRD9z4jAVEJsK7KinwSO7wiBISGpqgXcbrvi0ifHML59Q7drOiUY
 ZRQaKdYt+LYp06guPnB4hvteDuf6mv63mb2uukbCVbk/WyE4THS886Ri2IQ7Q55w/toKCzq8AA
 AA=
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2134;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8VURQvqHgElRal01VCxfreaQz0r2PHAENWmGfuWdnwM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxpbTDfb5wuq60M9NET4LrG0XZ+0xn6NQ0ZJ45F53e9cm
 J605p3oZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEfFey/9MuylKZUr9+XaaT
 sPMFnS8tYq3i0oo1XiIyn6/ucDxtGNLwz2VNkZ1U2Im5CZras+6suy96dZZEtLj2xLhuI725855
 ttTjv8MTgx5MJTzhjeOpeWNeWPnmjsSTp6/75QbP+PI+b8T3H4oumWaC8v2xi4bLJNrEB1SXlls
 dXPv7x9GWzW5joHS3xfsVrkS3ssZ9cItL5Llxi3ebleZh1Yej6kpDLNWsmaKk6cGSUsDemiih+m
 pWquDBgZVvJ7hdzjuptDr6sGjvf7b/hjZecSmanjvD2nkx46PnTM9GSXWRV7aOPz7eui9OwMwuc
 nWpzrcLYvOPIhzk5iQueGAvyNe44Xsx8qME5QOFKrwE/AA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Fix several issues discovered while debugging UCSI implementation on
Qualcomm platforms (ucsi_glink). With these patches I was able to
get a working Type-C port managament implementation. Tested on SC8280XP
(Lenovo X13s laptop), SM8350-HDK. Lightly tested on SC8180X Primus devices.

Depends: [1], [2], [3]

[1] https://lore.kernel.org/all/20240315171836.343830-2-jthies@google.com/
[2] https://lore.kernel.org/linux-usb/20240320073927.1641788-1-lk@c--e.de/
[3] https://lore.kernel.org/linux-usb/20240327224554.1772525-1-lk@c--e.de/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Added a quirk to delay GET_PDOS / PD registration on Qualcomm platforms (Johan)
- Enabled UCSI on sc8180x after running the tests on the hardware
- Dropped the ACK_CC patches, replaced by dependency on Christian's
  series
- Link to v1: https://lore.kernel.org/r/20240313-qcom-ucsi-fixes-v1-0-74d90cb48a00@linaro.org

---
Dmitry Baryshkov (11):
      usb: typec: ucsi: allow non-partner GET_PDOS for Qualcomm devices
      usb: typec: ucsi: limit the UCSI_NO_PARTNER_PDOS even further
      usb: typec: ucsi: properly register partner's PD device
      usb: typec: ucsi: always register a link to USB PD device
      usb: typec: ucsi: simplify partner's PD caps registration
      usb: typec: ucsi: extract code to read PD caps
      usb: typec: ucsi: support delaying GET_PDOS for device
      usb: typec: ucsi_glink: rework quirks implementation
      usb: typec: ucsi_glink: enable the UCSI_DELAY_DEVICE_PDOS quirk
      soc: qcom: pmic_glink: reenable UCSI on sc8280xp
      soc: qcom: pmic_glink: enable UCSI on sc8180x

 drivers/soc/qcom/pmic_glink.c       |   5 --
 drivers/usb/typec/ucsi/ucsi.c       | 139 ++++++++++++++++--------------------
 drivers/usb/typec/ucsi/ucsi.h       |   1 +
 drivers/usb/typec/ucsi/ucsi_glink.c |  17 +++--
 4 files changed, 74 insertions(+), 88 deletions(-)
---
base-commit: 845042eeeaca808537b4dd6e1de3f19a0d747fa1
change-id: 20240312-qcom-ucsi-fixes-6578d236b60b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



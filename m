Return-Path: <linux-usb+bounces-5663-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC1E842CD6
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 20:33:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4234D288958
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 19:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849E37B3F9;
	Tue, 30 Jan 2024 19:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kdd9OqWn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440097B3D7
	for <linux-usb@vger.kernel.org>; Tue, 30 Jan 2024 19:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706643190; cv=none; b=I9xhgztyiRaeTKq/kTdwlZMjp52FIfhpbprRiNRxKJQ0PvmvraY23tBm5Y4bfB0ivoWdWFayXmIMGWwb1y7Po1hEudTeTDsOsXqfE85Ws6uV6FjpGl1UV1bHydW2f95tOgu3I4Rq12mFwn83sRgYNdN0ktHOBSAUtC7u9O6XURg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706643190; c=relaxed/simple;
	bh=gTALmY1ibvA6Jtkm5qB1yZj76kmQUeK0FP623MAzOGQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aACph37IzMrJgVjOgWEA7pX1Kt5TAYtStV4bzBdnTJj9H78PN33whmeAIGTSZkVwKpMAPisLavrxE0hfBpbgHe3lGtvgC+FLyeBQWOdxY5vGC4hRQeL6+iyanjFYmCY/BWwwF1a3DTOjzOZSFEaZMoc7VtOj7Phl2MCTdq1RIl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kdd9OqWn; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5100cb238bcso7911601e87.3
        for <linux-usb@vger.kernel.org>; Tue, 30 Jan 2024 11:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706643187; x=1707247987; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tEnSLoLi220+mC/dDdMZUm59oVdTAXtir30jTLPlVL8=;
        b=kdd9OqWnLT/FARqT+RsnA5Cqy+B3mjfAZkGTL3Dm140JFNXD62vvfC0mKOV8/CWQpA
         KG255Nb+n9pDfGfDt0dY/9GeExfbkCMHcpRtLpQVl7G8paU0HaZ2Kz/Vrl6bCSP6zUcl
         /45N255VPgqLpS9c8TtvA4WNU016pjOn8z89/hVDKE0xcrainwkwlyfO4jzWSyj6CxWx
         BgaUy13/jU7WvfGykXnQhf94cHSs4FrbOG9FI30AAxb1z+hCc18WkGtCEg4oFMs0PGQI
         6ingeajqde1wlcJtJ3UsTVK4+TGgz1vg8FVnHw7doqz2KYqrGNvz0haWgoFZ7WGwjklC
         EdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706643187; x=1707247987;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tEnSLoLi220+mC/dDdMZUm59oVdTAXtir30jTLPlVL8=;
        b=ctCvw+EQYOWIprfAJowsvso5jfvSS6SiMyThvE5uVprU3RNa87JLshcr8wHqcjsBw2
         2CIcNArsrcNVPv1l0yw0dU53XyiItDSL8NATwv21S9bZCnfFiRWCbcaco/ehPV9aJWDI
         omHM5LtDioOBA7jaGVJlVklUOK0HA00rk+IpTpjStrIzqmkdhPKZlBwEXiz42xDUv925
         yeFoFLhNd9e4u9JQBrzullWUZluTc9uEERfIk7pDTyLByZTXSANaXvNlLA8Q7QCcoIyI
         HSgj4xDqG3FOWoDVBkAAmeUoiXx+sU3fQYsCnLmeIKxex6Mya9Yvx5KIl5Gtmdu3nMRM
         35sg==
X-Gm-Message-State: AOJu0YwHPgathv4tRgRtRCAeTPR63xXU9v4COqJ4n5wBw621O3JU/8u5
	ZelTQEB8oWinla7HWjHqpYvEPQ+pw2Cw8XXG35pI8tUjTq1ncdFUiVLvC5cg6Ck=
X-Google-Smtp-Source: AGHT+IE4LmyyKrYFNUgc2u4caIRB+1DkAm9YREubGqYrnHtiuhsnJgv7HXCPy+ds1gyzL506r76+DA==
X-Received: by 2002:ac2:5b11:0:b0:50e:6c1d:5dee with SMTP id v17-20020ac25b11000000b0050e6c1d5deemr6157961lfn.33.1706643187329;
        Tue, 30 Jan 2024 11:33:07 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWFstMsJWadz62lZvjVYfOqBwvQLKPeVs4uhdxSYFBbrJWlUNH+Kq7VIuhwAKHhgppKE2qZ0PUCjUUCrvpt17A1ufW6H7d3+hdTPGpsj0ZIJhLXToO2GWOxAUYvLvtN01MWAzHGFLvDjE82L2048gRbs8Mn7NKX+Ox4b8CEuSQqSbzq4UTor0lK+AMgMCdqDDVL4gOCYnqPtN93w4JIAqFwj2SEu2/tVsU2LT/OBbyv9QtKcrP1WNdmbHFGGoQF1D8EKL2rsDM1Kg6EmAgTREHhtHw7lJycq2vn4/8KFQ26aMen72QCIa90NOhMkSINrMowOdlCZiWf2dP3zLs9plxefTV0jYBIcoypR+NGF6TlOBlqHgFDVQEwaiwx1BpWj1+ceoFH4dyeNB6Hnwm1Pz+O1bTk5EsknXVa79uwvah9zK5+MwRmYImf8DthaLp5rNlYqFfi3wIDcSQ+d+Iw2IszPfAOY18acTafFcFy0FM14mx3cV/k/2zROyZWVoeSbg2gLGfbdqjZhqavaxPr5rsAiJWSc2uOLxDuqhee8VTtcf5FU86IjB2m3YVIQtTcVm5h+GmHSSIP6vgMav+0hXqhQ+V9x57exM21uti2ntaF45rqnlDAGmESzWSsAzIFDgE2FsllH8HEn8AaB7DrMyNk9zd2/Zm0kgDer2M2+ZSE/ZE+9E17r2ql53I5NanU
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u25-20020a05651220d900b0051119371e7csm366525lfr.120.2024.01.30.11.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 11:33:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/6] usb: typec: qcom-pmic-typec: enable support for
 PMI632 PMIC
Date: Tue, 30 Jan 2024 21:32:53 +0200
Message-Id: <20240130-pmi632-typec-v3-0-b05fe44f0a51@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOVOuWUC/33MQQ6CMBCF4auQrq1pZ6iAK+9hXFRaYBKlTUsaC
 eHuFhIXbFy+l/zfwqINZCO7FgsLNlEkN+aBp4K1gx57y8nkzUBAKaQE7t90QeDT7G3Ly7ZSiKI
 BrCuWEx9sR5+duz/yHihOLsy7nuT2/iA8QklywY2tTGdK1aDC24tGHdzZhZ5tUoJ/NeRa1mAar
 YVWz2O9rusXaA0/uecAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2777;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=gTALmY1ibvA6Jtkm5qB1yZj76kmQUeK0FP623MAzOGQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBluU7xxwlT5ScISdUnOHH2TX7uG97SJ4h1IgCX4
 40Ct0ayn3KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZblO8QAKCRCLPIo+Aiko
 1ekAB/9hUMv/ndpN+V2jmP+9lAodWkuJrLYMysXc1D3Z/rk0YCazA3gsQ8N37Cber3CS7JOc9rK
 SEHcCbZpvPEGtc52IRvFgByp76Wxcj6dFFLb3kRBNyrQ2ZxzgaGDmDUz97JZjejjM9Xa98fwFnw
 k6FHCvY5aZ8u9ldnb1TtsRh5HBgd4zuZAsWRyHO7v+YRQdgb3x0PRCUjqVksszJ7oe4rZdy6qDa
 rNwMyAZIR472Z4N8hPuNw7CTWou3GT+x0KVjeu3VhLrhIGQgMnZPpwm3Aqr6yE4rbE6XBGWDlDg
 8vwE7Fi1nEpOjABQTOR/IMkxBx2TeLVZKOVGTNKkMxV1vny3
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The Qualcomm PMI632 PMIC (found on Qualcomm Robotics RB2 platform)
doesn't support USB Power Delivery. However this PMIC still supports
handling of the Type-C port (orientation detection, etc). Reuse exiting
qcom-pmic-typec driver to support Type-C related functionality of this
PMIC. Use this to enable USB-C connector support on the RB2 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Added constraints to qcom,pmic-typec / reg property (Krzysztof)
- Dropped merged TCPM and Qualcomm PHY patches
- Link to v2: https://lore.kernel.org/r/20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org

Changes in v2:
- Split qcom_pmic_typec_pdphy_set_roles() changes to separate patch
  (Konrad)
- Simplified devm_kzalloc / sizeof() argument (Konrad)
- Made start / stop callbacks mandatory (Bryan)
- Reworked Type-C port handling into a backend similar to PD PHY (Bryan)
- Made more qcom-pmic-typec data static const (Bryan)
- Squashed usbc PHY single-lane removal patch (Konrad)
- Further usbc PHY cleanup (Konrad)
- Fixed order of DT properties in pmi632.dtsi (Konrad)
- Instead of specifying bogus PDOs for the port, specify pd-disable and
  typec-power-opmode properties for the connector
- Moved orientation-switch / usb-dual-role properties to sm6115.dtsi
  (Konrad)
- Linked usb_dwc3_ss and usb_qmpphy_usb_ss_in
- Link to v1: https://lore.kernel.org/r/20240113-pmi632-typec-v1-0-de7dfd459353@linaro.org

---
Dmitry Baryshkov (5):
      dt-bindings: regulator: qcom,usb-vbus-regulator: add support for PMI632
      dt-bindings: usb: qcom,pmic-typec: add support for the PMI632 block
      usb: typec: qcom-pmic-typec: add support for PMI632 PMIC
      arm64: dts: qcom: pmi632: define USB-C related blocks
      arm64: dts: qcom: qrb4210-rb2: enable USB-C port handling

Vladimir Zapolskiy (1):
      arm64: dts: qcom: sm6115: drop pipe clock selection

 .../regulator/qcom,usb-vbus-regulator.yaml         |  9 ++-
 .../devicetree/bindings/usb/qcom,pmic-typec.yaml   | 32 ++++++++-
 arch/arm64/boot/dts/qcom/pmi632.dtsi               | 30 ++++++++
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           | 50 +++++++++++++-
 arch/arm64/boot/dts/qcom/sm6115.dtsi               | 44 +++++++++++-
 drivers/usb/typec/tcpm/qcom/Makefile               |  3 +-
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c      | 30 ++++++--
 .../usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h    |  2 +
 .../typec/tcpm/qcom/qcom_pmic_typec_pdphy_stub.c   | 80 ++++++++++++++++++++++
 9 files changed, 266 insertions(+), 14 deletions(-)
---
base-commit: 41d66f96d0f15a0a2ad6fa2208f6bac1a66cbd52
change-id: 20240112-pmi632-typec-4c7533092387

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



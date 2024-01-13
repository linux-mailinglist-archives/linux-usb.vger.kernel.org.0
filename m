Return-Path: <linux-usb+bounces-5011-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E04E82CE82
	for <lists+linux-usb@lfdr.de>; Sat, 13 Jan 2024 21:56:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D87AFB2220E
	for <lists+linux-usb@lfdr.de>; Sat, 13 Jan 2024 20:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF64D17740;
	Sat, 13 Jan 2024 20:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cB8Ct2dV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63C8CA69
	for <linux-usb@vger.kernel.org>; Sat, 13 Jan 2024 20:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50e6ee8e911so8801983e87.1
        for <linux-usb@vger.kernel.org>; Sat, 13 Jan 2024 12:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705179354; x=1705784154; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8H3lEOLtQff6kh0Ma41nbBlczO7GfMuk2Ro8jq93iTk=;
        b=cB8Ct2dVAmdNLoRljr/eoBADkOQ7VJvU06oF+yP5Fb5n3G7q9oF5tTPytpS3q3M4WY
         cUFZ9+ShKNDA2suPwX5DIcNEQ3KcvESOzBgLHvFKlMLdfGLA+/n0XiO5JOA3WtQhcLWr
         rjMCdMHG6Zdhh34iZw9WZZGjzUhv6Pa+/5yVXhCXNToF6zhT5YScUCsVKENoZyZQJ8bL
         GUah6qjdYPNoOIXSuqyJexOOyxFrWn4puCA4hIkZDM8ogYURSJuGnRdlN0RDVU8j+1Dm
         bGWbbid/l3CF9x7PMez8IyFpa1Eo+iKz0v6FYzEKDppEYJz1xGKMNcpvy+FEroAvpOb/
         qp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705179354; x=1705784154;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8H3lEOLtQff6kh0Ma41nbBlczO7GfMuk2Ro8jq93iTk=;
        b=j8mNMC0g5WgiE1PoFiIIeQnGWxLzmG8o0sAmQhVmWiWHhK4CTfpbydxl3WFa8nFPtt
         ilzPwgCQ8joMYZ90CKL1S/F1Un9U7CJvEGYJZhUd8DumXFCkvpTWUrhP8RVUKT1Xikq5
         RzzUTK0UxfjcXRkYXJsWuy0BHZNFmoYDnPeW6xajeCoqVqKB7X1G00qAmWrGMiLPMpK1
         i0IzA2xG5a/rE8TaV7x53byCp0diO1CgD0NbfWM9bv7ok/QJcevDfx9EGKkAUElDis42
         B2ZLL1te3QBudQy/fqnsYbyof0qIE+by1ExZYAWiu0Oar0qWIJ1gTohDkvRQrcllmxH1
         ifCg==
X-Gm-Message-State: AOJu0YyyynCXZRWAcex8/qL3iP67cgctziNBEpwN9I8K9qGIPL9PXeB8
	AMRN/lMCGbGH98amQMe4gUk2u0AgfFfI7NGd0KNLu7cu26jisYR6
X-Google-Smtp-Source: AGHT+IHYTf1qpzeijG/IAVOHBC9Svr8p0OrVPy2HbaZQn38lIRbpcNldfpa+W+dMGhsU/h3uV49Cjg==
X-Received: by 2002:a05:6512:3b90:b0:50e:935a:ca83 with SMTP id g16-20020a0565123b9000b0050e935aca83mr1825970lfv.91.1705179353618;
        Sat, 13 Jan 2024 12:55:53 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p14-20020a056512328e00b0050e9355d7eesm919802lfe.103.2024.01.13.12.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 12:55:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 00/15] usb: typec: qcom-pmic-typec: enable support for
 PMI632 PMIC
Date: Sat, 13 Jan 2024 22:55:43 +0200
Message-Id: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM/4omUC/1XMQQqDMBCF4avIrJuSZLSpXfUexYUkow60SUhEK
 uLdmwpddPk/eN8GmRJThlu1QaKFMwdfQp8qsFPvRxLsSoOWupZKaRFffEEt5jWSFbU1DaJsNV4
 NlEtMNPD74B5d6YnzHNJ66Iv6rj8I/6FFCSkcGTe4ummxwfuTfZ/COaQRun3fP9vsOwapAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3797;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=CS9SbNxFzGdH021lW0ayb4u0wurDARzzELIZIOoEHYs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlovjVgTNg+7k1nM72B6joVl25KPM1s15T6Nfw/
 KHDh5ovnJeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaL41QAKCRCLPIo+Aiko
 1SNWB/4gB8dpPDVvSXPhjV9SucMh7BkyGVx2mhG29317CtS0V62KEIOYwaFP9YIEQYzOoc1gpJm
 HLoIJAgORJ4eWCciCZlkdmXS4XjtJ6xJPiczt7G3s1QFLqsWgHBwJEY4JQWDPAuXOSroRNg8SRv
 OpxbPqRuZWByNn7KTKHkQCHO09Tyc5YB4E6S/N5FynMkgobVXWeFRJbdLANoDYTA3FNsk1BnNtG
 4r4Ul+Tai6qZ/RECBSi/MI7tn8sySUZrRlO3IkZ465GoW9xrhqS3//nYhLsEr3QfQU8X9G4gOGC
 Jbacdkfp2lPCCcRAdBCtVlZ2MvrghilYCW8xusv6w6gMt3ZF
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The Qualcomm PMI632 PMIC (found on Qualcomm Robotics RB2 platform)
doesn't support USB Power Delivery. However this PMIC still supports
handling of the Type-C port (orientation detection, etc). Reuse exiting
qcom-pmic-typec driver to support Type-C related functionality of this
PMIC. Use this to enable USB-C connector support on the RB2 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
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
Dmitry Baryshkov (14):
      dt-bindings: regulator: qcom,usb-vbus-regulator: add support for PMI632
      dt-bindings: usb: qcom,pmic-typec: add support for the PMI632 block
      dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: split from sc8280xp PHY schema
      dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: support USB-C data
      usb: typec: tcpm: fix the PD disabled case
      usb: typec: qcom-pmic-typec: fix arguments of qcom_pmic_typec_pdphy_set_roles
      usb: typec: qcom-pmic-typec: allow different implementations for the PD PHY
      usb: typec: qcom-pmic-typec: allow different implementations for the port backend
      usb: typec: qcom-pmic-typec: add support for PMI632 PMIC
      phy: qcom: qmp-usb: split USB-C PHY driver
      phy: qcom: qmp-usb: drop dual-lane handling
      phy: qcom: qmp-usbc: add support for the Type-C handling
      arm64: dts: qcom: pmi632: define USB-C related blocks
      arm64: dts: qcom: qrb4210-rb2: enable USB-C port handling

Vladimir Zapolskiy (1):
      arm64: dts: qcom: sm6115: drop pipe clock selection

 .../bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml    |  171 +++
 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        |   22 -
 .../regulator/qcom,usb-vbus-regulator.yaml         |    9 +-
 .../devicetree/bindings/usb/qcom,pmic-typec.yaml   |   28 +-
 arch/arm64/boot/dts/qcom/pmi632.dtsi               |   30 +
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |   50 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |   44 +-
 drivers/phy/qualcomm/Makefile                      |    2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            |  323 +-----
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           | 1169 ++++++++++++++++++++
 drivers/usb/typec/tcpm/qcom/Makefile               |    3 +-
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c      |  254 +----
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h      |   27 +
 .../usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c    |  157 ++-
 .../usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h    |   94 +-
 .../typec/tcpm/qcom/qcom_pmic_typec_pdphy_stub.c   |   80 ++
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c |  290 ++++-
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.h |  172 +--
 drivers/usb/typec/tcpm/tcpm.c                      |    3 +-
 19 files changed, 2058 insertions(+), 870 deletions(-)
---
base-commit: 9e21984d62c56a0f6d1fc6f76b646212cfd7fe88
change-id: 20240112-pmi632-typec-4c7533092387

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



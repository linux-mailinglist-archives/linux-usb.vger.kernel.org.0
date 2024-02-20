Return-Path: <linux-usb+bounces-6819-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A332E85CC63
	for <lists+linux-usb@lfdr.de>; Wed, 21 Feb 2024 00:59:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E57B28440C
	for <lists+linux-usb@lfdr.de>; Tue, 20 Feb 2024 23:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93FAD15531D;
	Tue, 20 Feb 2024 23:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U/vdDzVr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2C4155303
	for <linux-usb@vger.kernel.org>; Tue, 20 Feb 2024 23:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708473537; cv=none; b=P/jNUyFadrtNUw3uW0Rp+bI95CqherXJ3oN1HuVSdoG8ve8MD88jQRXTJy+TmKAo7oVMFm77P4WyWqwM08bna7AfEoVLKZq4rXobon7KGkjc++nLXBwImqDUQcHj3lplWzyVguVJNmIH061SPsD/CVXQ1HrUpp4isWcJdO0V1fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708473537; c=relaxed/simple;
	bh=2G9nSogr8c74B7MEi/HjwQ+O27W/ZFykawWXB6X8Jj0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FIuf5s8K8W1PWXEYZ7RLmRW/32Mv9gC1fVTPXRs06oiDq7AxF6/RhUg8+v02f9HhgRN7KmpFsBHvU/m2VcdSzBQXu4bQHY354Naxv1AioKCXTELCubo7RUW0Coxba+5254+dFMfLeRH6sRkMMfzzuWJ58B1e6TzPznYy1qJbVOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U/vdDzVr; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-512b700c8ebso3481738e87.0
        for <linux-usb@vger.kernel.org>; Tue, 20 Feb 2024 15:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708473533; x=1709078333; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BtcLO9BOs2cWJAWCnVizVenwlOZis2DVv36N2x8QJ7I=;
        b=U/vdDzVri4fgyQIOBEPpWPnkQoyBgN/n/pAiFfo70sqIMystSjvbpaE5TXR3c0M0f2
         UcFsqYgAXj3fAISU3f0yjPCh4SyM1lUcDWLQBePDRoCteFG+qk4N7S6aYzdeDJZlBPNS
         J3ekJkAObCr8AgDsUE+TPI92od1eB3YW9dlOID4pEk7psf/YBetlS2CEF4ExfgeF1oi9
         KlGjwNrwXKNZJNw4H1Z36wtBH9yaTS9yDxfSdlmjTEUBIFvtNNgHAhx1P3vuz5YS6Hea
         VHotperyR7PRsqlJZ69Eu3YBk5SlWAmYycU9Odw7cgNQdBkC/iQFuH0nH8RL8wYhcK9N
         MKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708473533; x=1709078333;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BtcLO9BOs2cWJAWCnVizVenwlOZis2DVv36N2x8QJ7I=;
        b=OlBiumMwzVdzI4uA+ZLlOYU2hWeOIk7bPg5LPyMSUPK49geYA3e+CH0acRUbNIZwYI
         e7HLfTYVp095zYfKBsKJwW+txSmadF+2O6uqxPPdC+PsQWr8DpSQSMbbjlx5KlHKELmt
         1YvukPUNJlf/ohnVMY9CO+mYXAyW9m5KKL5GFG2/R2dm5uzmYl0K4wY/lAYkSZeQo6BF
         bzvEpOJuwolJgiSe+sDimwZ1qnq78yvWmBWF1nVhrjVxoG5sDZlBqtmmD5sjbg8m5tRi
         7CJpcZ6M0B6m9STX0C5TZD797VUxMqkKcz9m4gPjgT1pnqGUILZIz4sCQUieuy0Dqbms
         q0iA==
X-Forwarded-Encrypted: i=1; AJvYcCX5dvwe+GU5WcjXjUMrEoXU059RWhCIjXJau5ZRkTz+rqZ0qGsoj4TFUCGosO/MuWajZZqaKE0SmGYXWx3Pcj5oVbZsEJZ+gsoX
X-Gm-Message-State: AOJu0YzFtzran0A9OEmbW0uOFMA3fS4jFewDF0CEAO2zFUek24lDiETg
	kyYBi7Bosoa7GTZfg4jvYMqBf8j6Sh7cmW5P+i6ZHdg+0yvkQ/Bd2NONMxa2kEk=
X-Google-Smtp-Source: AGHT+IGK9SWwTqY2ZtVV8T3/+G0lzTnYhUYGgvskyOWliKYS9JAwb/A3ZCpMFRSeHp9/oEKd569qOA==
X-Received: by 2002:a05:6512:3772:b0:512:b90f:fc4e with SMTP id z18-20020a056512377200b00512b90ffc4emr4031749lft.46.1708473533079;
        Tue, 20 Feb 2024 15:58:53 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h27-20020a056512055b00b0051167de8560sm1438831lfl.38.2024.02.20.15.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 15:58:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/3] arm64: dts: qcom: qrb2210-rb1: enable Type-C
 support
Date: Wed, 21 Feb 2024 01:58:49 +0200
Message-Id: <20240221-pm4125-typec-v3-0-fdd0ee0465b8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALk81WUC/12OQQqDMBBFryJZN2UmKkm66j1KF5JMNdAaSSRUJ
 HdvlEKxm4H34T1mZZGCo8gu1coCJRedHwvUp4qZoRt74s4WZgJEA4iST68GRcvnZSLDlQKw2oD
 uyLCiTIEe7r3nbvfCg4uzD8teT7it31ANx1BCDpyUBdCShNZ4fbqxC/7sQ8+2UhI/u5w/WxQbh
 ZRoVSvLSwc75/wBmEetzecAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1436;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=2G9nSogr8c74B7MEi/HjwQ+O27W/ZFykawWXB6X8Jj0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl1Ty7BYeJxRWk8ojmdlhD9jIZ/z7At/oGQQlV4
 AUIfiR95KuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdU8uwAKCRCLPIo+Aiko
 1eXsCACX5cZavaDvU5sIr1jrA/RK3odBt+/hnoegNbTdNYKePVJ8vJm3GA4ospHpcCnXfaJMKh9
 1c7k0QThaha2NmgNwEGj2VYOMejDDrBohBWw3m0MRuHmWDCBsBWrbYzIwSeeHCBFZ5yXEY2Ocft
 rQ9Dd7z/MU7Mon4kWEBnc1+KGAaYuqoRzjDXxFMh1XxcBkyFNnDGqyhUyIsBw7E3vFA/qYepy+d
 0oErM7gjeQy+coHukU38lZgPxvj7VobYDJP0cpTYahNhBtzA+UcraJkoI7Hj4dykPiS3XVEps35
 imrQFYIjc3fVTm6nX5INtIPKGytNRfN0ni/9357RD7bj5eIa
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Reuse Type-C support implemented for the PMI632 PMIC (found on Qualcomm
Robotics RB2 platform) and implement Type-C handling for the Qualcomm
Robotics RB1 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Fixed the commit subject for the regulators patch (Mark Brown)
- Rebased on top of linux-next, dropping applied patches
- Link to v2: https://lore.kernel.org/r/20240202-pm4125-typec-v2-0-12771d85700d@linaro.org

Changes in v2:
- Removed unnecessary conditional expansion, covered by existing compat
  string (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20240130-pm4125-typec-v1-0-e8d0097e2991@linaro.org

---
Dmitry Baryshkov (3):
      regulator: dt-bindings: qcom,usb-vbus-regulator: add support for PM4125
      dt-bindings: usb: qcom,pmic-typec: add support for the PM4125 block
      arm64: dts: qcom: qrb2210-rb1: enable USB-C port handling

 .../regulator/qcom,usb-vbus-regulator.yaml         |  1 +
 .../devicetree/bindings/usb/qcom,pmic-typec.yaml   | 12 +++--
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              | 42 +++++++++++++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 60 +++++++++++++++++++---
 4 files changed, 104 insertions(+), 11 deletions(-)
---
base-commit: d17c63c5000f53307cd2a509b216dd197948ae80
change-id: 20240117-pm4125-typec-8800d9c09aec

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



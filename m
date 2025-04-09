Return-Path: <linux-usb+bounces-22813-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C53A82DDD
	for <lists+linux-usb@lfdr.de>; Wed,  9 Apr 2025 19:48:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66D771B64A1B
	for <lists+linux-usb@lfdr.de>; Wed,  9 Apr 2025 17:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A236327702C;
	Wed,  9 Apr 2025 17:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j0nP4u0c"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850551C84CD
	for <linux-usb@vger.kernel.org>; Wed,  9 Apr 2025 17:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744220911; cv=none; b=HGTlgVYap85KEc2w23/YaZs5QWHEXgxaZyhZCMZfB8ed3ba4XQI1fvyxS4o1V9qGXsGi4Eyrp/e7EGkS51R5wFseh+7Q3F2M3XFPVlEmzP9c1WPgr5ooLYLB/gFgqi+itT3at3H+KjbUCHxboYNpXorNNy9CHH9kX7Gfp9HgVcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744220911; c=relaxed/simple;
	bh=hc3zIYh7JSINeCh8Z4mm9tEk+Au4y7knpSnk7GKAv5E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mhdBu84xlbuJikQfhprSMo3IorbaKDw3hEamprTuihbKazCrYi4YbEw3+UUvtmtR5HusEZOBcrXLTBnVhn/Y3znoU0rLbriUxOX/btY92Iip6qtqo6HwLWpd3UEyKYPOSy81w/y+esUIqyjomteCVi45BvMMSBQ9r3b1PhC/rM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j0nP4u0c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5398pinM023950
	for <linux-usb@vger.kernel.org>; Wed, 9 Apr 2025 17:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2xGb6Lh+V7STeCHTaCEpkP
	9K8DWgoNDGliAnks1g2Mw=; b=j0nP4u0czRkp9AcpCO9Brqv2nI2Gzkg0BRZ3BI
	uun2N25YYL+CMIOGSq5AUri36yKBlQKgn9UEHutP7w3jRDEeUrPiUxjQhz/QplTl
	wtrxasWsDi/whtixf2qB7P36fmVwGvp5WnjhpNZtT2Aj4mi8sb7QGeD5qgCpTte5
	MCteXCOdpMp5DeByXbzyoQpIr8MpBPA2b0FDA3z3Nh3KwGTo7jqcrQznzqeb2ly0
	yTKvTaXGdBnK9gaXUD4sD91CarcBJlKLBAQoItJDg+r01Qzlxjy1yEg6D6rJBrE5
	9NQtnvrbD2U9d5WL+L6nztzSFQWTNLLLC7HmjEPZQ0Gtc5ZQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkm54u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 09 Apr 2025 17:48:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22aa75e6653so29958625ad.0
        for <linux-usb@vger.kernel.org>; Wed, 09 Apr 2025 10:48:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744220905; x=1744825705;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2xGb6Lh+V7STeCHTaCEpkP9K8DWgoNDGliAnks1g2Mw=;
        b=hz3e7MnOgEjPgegnmTcK5RgoQw7/Wrt/WS0nvPjd9QuigVBmpE9bo23qFB8WeqACqr
         omHu9ijyt+vE0NjR0u//q9vZ84ZiCBwHELzhypkZ/E5Ltl4iaTIFh7ALUoP5UWJdsBuc
         wghHBfLN1kwNUGDZhMHgfp1tfNAcypYiQY+pq1bdbWCEJp95wTvy6zsmh6kpHUjllv6c
         OPF256+Ww+SyFVg6ggHciqLCRTboerDJBfZSqNyDwoIzqpGzL9C+lchdMgF4oUiea2O9
         VK6MIJ5hG/yWjVlS0YN+TID2COpuLkMylBWQ+uz2prC6lJ8/MsxD0GXg180QO3tUquQO
         vvaw==
X-Forwarded-Encrypted: i=1; AJvYcCWowmx2QYHGtbEo49mr7G93sYRDM0NIzSqlNh54GD1AtrE9DGhaMMtWV2UPjT56l6KYqoEi0d8PXeU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4woufaNJSZh/qcUBJYbfjkNtBlXF96eh7njqjnN6pqemmwd2O
	OdAhPZ5SF0E735QwaYeym9XmJCp+sDbUFVCy3ZwhS0vg5kWnBa+LSaLhVzvFHWS04o+/df8ozrs
	A/s5D4nvHQ/NpJO3F4SvVDllB/UVMi0egLmjCXoZKfP7QAwa0nRcdCcWxWMY=
X-Gm-Gg: ASbGncuLXP4LFmxNNWnVVV1q3KD2plu8YtUNjX80bZ/P+RO+5u8FwZmeVfG3r+KQXg4
	OYGK5wXH+XcG8imsTrqS2Be+dyL8StlFT+BBEOh3VVeJmPKZDd8ctL0ta7WizRdQVrnuLLUDZ3v
	9lKZ2Q/TrnjlQxa7a5UB1/pacZ3Rbtvsab5zlNqgdad6wyBCHl/TWu1en9cU7seKui/rVUQ4Y3i
	j8lwBCEFpInpptr65rD+IHzK+lSvSAqN0aNaDxBY/qvB7tm991+eYAL2UhlH4hyISy8TuaiDHVx
	2JPhw4Tj+jutkVSzkwmJ/+MmiuPVLLpW/acjEnVD8+5STet2XLUkTJaLpK3/YEK90Ic=
X-Received: by 2002:a17:902:e750:b0:224:256e:5e4e with SMTP id d9443c01a7336-22ac2991b3dmr44828575ad.16.1744220905529;
        Wed, 09 Apr 2025 10:48:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0DTV9cBjuEu2MIM4VNLNiQsiktOF0HLT4+M1oyrikXvXe/d3fV2RaMyWqc4EXrShjavyy5Q==
X-Received: by 2002:a17:902:e750:b0:224:256e:5e4e with SMTP id d9443c01a7336-22ac2991b3dmr44828135ad.16.1744220905102;
        Wed, 09 Apr 2025 10:48:25 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c97a1bsm14964005ad.148.2025.04.09.10.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:48:24 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Subject: [PATCH v4 00/10] phy: qcom: Introduce USB support for SM8750
Date: Wed, 09 Apr 2025 10:48:11 -0700
Message-Id: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANuy9mcC/23NwW7DIBAE0F+JOJdoWTDGPeU/oigisDQcbKfgW
 Kks/3uxc0iq+jgjzZuJZUqRMvvcTSzRGHPsuxLUx465q+2+iEdfMkNAJRAlz62pKzjf8+Xc2jx
 Q4gFrS74O2itgZXdLFOJjNY+nZ070fS/08CqvMQ99+ll/R7G0y0UFQmxdjIIDh8YGEt5hhepQP
 Bc7t3d9yxZvxJchQW0ZWAyrG2ORtCHQ/w35ZuCmIYshJEGjvTMm+L/GPM+/19zZdVEBAAA=
X-Change-ID: 20241223-sm8750_usb_master-f27aed7f6d40
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744220903; l=3325;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=hc3zIYh7JSINeCh8Z4mm9tEk+Au4y7knpSnk7GKAv5E=;
 b=zw2dUOA9Z5fTRvpUid1hCtpl8B6Q8X93pzTd7rkqWGMA1r8H1zd/4CmdV5ZTN89UxJK8IxJB7
 WUCArCpEc9IAjj+Es//Eik6NbyfCoICTWuBufEJReoHQD0JlOuU43bJ
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-GUID: 6HI3O3rM7uGOvqLj7UkN520NPppN_wzw
X-Proofpoint-ORIG-GUID: 6HI3O3rM7uGOvqLj7UkN520NPppN_wzw
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f6b2ea cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=1rs2XOWFaH1SNEFhMLQA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1011 spamscore=0 mlxlogscore=876 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090116

Add support for the PHYs and controllers used for USB on SM8750 SoCs.

---
Changes in v4:
- Made some fixups to the M31 eUSB2 driver
- Moved TCSR refclk_en to the QMP PHY DT node
- Link to v3: https://lore.kernel.org/r/20250324-sm8750_usb_master-v3-0-13e096dc88fd@quicinc.com

Changes in v3:
- Split platform DTs into separate commits.
- Fixed up M31 eUSB2 PHY driver with feedback received.
- Reordered DT properties based on feedback.
- Rewrote commit message for enabling EUSB driver.
- Link to v2: https://lore.kernel.org/r/20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com

Changes in v2:
- Added new QMP PHY register definitions for v8 based QMP phys.
- Made changes to clean up some code in the M31 eUSB2 PHY driver based
on feedback received.
- Added bulk regulator operations in M31 eUSB2 PHY, to ensure that
both the vdd and vdda12 regulators are properly voted for.
- Removed external references to other dt bindings in M31 example for
the DT bindings change.
- Split DT patches between SoC and plaform changes, as well as the
PHY subsystem Kconfig changes when introducing the M31 eUSB2 PHY.
- Added orientation switch and port definitions in the DT changes.EDITME: describe what is new in this series revision.
- Link to v1: https://lore.kernel.org/r/20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com

---
Melody Olvera (1):
      arm64: defconfig: Add M31 eUSB2 PHY config for SM8750

Wesley Cheng (9):
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add SM8750 to QMP PHY
      dt-bindings: phy: Add the M31 based eUSB2 PHY bindings
      dt-bindings: usb: qcom,dwc3: Add SM8750 compatible
      phy: qcom: qmp-combo: Add new PHY sequences for SM8750
      phy: qcom: Update description for QCOM based eUSB2 repeater
      phy: qcom: Add M31 based eUSB2 PHY driver
      arm64: dts: qcom: sm8750: Add USB support to SM8750 SoCs
      arm64: dts: qcom: sm8750: Add USB support for SM8750 MTP platform
      arm64: dts: qcom: sm8750: Add USB support for SM8750 QRD platform

 .../bindings/phy/qcom,m31-eusb2-phy.yaml           |  79 +++++
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |   2 +
 .../devicetree/bindings/usb/qcom,dwc3.yaml         |   3 +
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |  24 ++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts            |  24 ++
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 164 +++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/phy/qualcomm/Kconfig                       |  16 +-
 drivers/phy/qualcomm/Makefile                      |   1 +
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c          | 325 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 223 +++++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v8.h     |  38 +++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8.h         |  32 ++
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h |  64 ++++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v8.h    |  68 +++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |   5 +
 16 files changed, 1065 insertions(+), 4 deletions(-)
---
base-commit: 46086739de22d72319e37c37a134d32db52e1c5c
change-id: 20241223-sm8750_usb_master-f27aed7f6d40

Best regards,
-- 
Melody Olvera <melody.olvera@oss.qualcomm.com>



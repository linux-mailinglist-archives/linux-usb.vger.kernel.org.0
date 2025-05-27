Return-Path: <linux-usb+bounces-24336-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C6CAC5BD7
	for <lists+linux-usb@lfdr.de>; Tue, 27 May 2025 23:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 542CF4A670B
	for <lists+linux-usb@lfdr.de>; Tue, 27 May 2025 21:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E25D20F085;
	Tue, 27 May 2025 21:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DRbTNJar"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D0220B800
	for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 21:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748379899; cv=none; b=apdLfMJTxL6CwTxTlJeq3e16+l+Gq3IjxMoTfRFS8t3YXpkvY1gUNKiSflHC31Yjx/j8cGrBXTnIyVuIe6VJX7C6aWM0hyPbBV+JPKRZ9MAoAFkVSJt+T1I1A4fXK4E/0sozRHPG/qBVl2ClR0KA3Es/uBuxr+32n1wPVZYk5Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748379899; c=relaxed/simple;
	bh=4Otq5/SJ7I4zFyhmnnZUzoYm2viVKcjqEocffO3PcQc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gcimCaCEr4QG8wulDkCKmnJTwKjyBtWECEYLN8THdY6Ka9mv8ZQDOA9MlkOS2WbPFlpWHedaOWW7XhMKq6Aw+gYgrbdHDsSa6UIbWwiJ2GiM/2sJ2iudLO1ugSIkB45ghwTT0ZDCgPBxzumYc+xSAm2HytYVE/zsq9LOt6Q4lX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DRbTNJar; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RJvJvi014923
	for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 21:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bUgdbJ9307iGvajrrAux74
	w044pWeNfiJuOUqJnpRyc=; b=DRbTNJar+C5jzTqjz0fhcFOQgRQwEmccbbrprc
	SyKZTwdfPF740nsBCno0MK+GANalIHP7oX4PNbRELPijnFfFv+Wdk6WePrrNXmTl
	5w76DtRXr4EdUmvyczsVPfY8ZFvbKPHvpbHwq+8J22LTLxIMxijWjsrDuomZZnb4
	GOnH2UE3IaCkVOu+aoGJWhjlggwLmgAdNOOTMo71faUHv4fRLuv7DRT1OQsRZkyU
	Nl6TugCKC7OD0yCwb6q7IyM1VQbU/xv7AmTAF6XU5iYiD0cAkIZIWPdse7GgpVlO
	PQdlXWBTNGSutKdW6UdgjwFUxQM/WDc9lxvjgGV/gQJG9woA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u66wgf4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 21:04:54 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7370e73f690so4565557b3a.3
        for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 14:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379893; x=1748984693;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bUgdbJ9307iGvajrrAux74w044pWeNfiJuOUqJnpRyc=;
        b=U+F0R7CTd+z8X6WeCH/G/MmuWenHdv5Fp504rYfMqWJ8djcNw88bqv5wjQdRhp6e1L
         f359YvQyGSKuFgaXxZHs4DngtzwAlFy65qiAuXrnF3qJRocB+oj8AtcP+G7as+v4Y4C3
         a9xQ9S5sMS+psp4lGOXc2lqidXmPYKpPq/0GoUW+J3BHPSARersKNU7fpiprdOqQvBLA
         FMx8b3VOMMYdkchlFpiFimZUrThYQqEDO2co6LxXcvlP5wHvGC5u+m52WAUvAVquu632
         qxuRLUqzX8ZxaL5pTyokEeS/hz7hjIm6abBNkSFYLjUozXlMfMqGBKc7IVOLMK8it0SP
         tD/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXr2CIQ2u/05QW/C07+878+RS1jPh2UEo0g1cgC3FPBMrqoBlwoH/ldk90AwJgszhtb86+uDplAz/U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx8vleTbEr5tIl+nTcokWOon7i348AIj9c2XInKda6CO0jcu1n
	KnwML3/96N/w9YEHOHdpkJT0tycjp6MooSI8OPKf3wGlPzD0RpUPIqEFXRdTfD0VRF5/JFnuJaP
	nS/dr8XC2UiAlxtsLW903skVFMiWsFuyo0lb8gyh04W4aDSAMhbH6LmlMWbWqRmY=
X-Gm-Gg: ASbGncvw4okw3SrWk3NQuAElUbtYEWBQC0/mBqQSFwwKVeG+wehBESodLdjBJheML4d
	XzNo8BT4y7qgxDyEE4yk5XZkMQfCX3MLiUaocWRgk11Ti4fvqbWzK8ue+9ybAeMuPxtnyiqoj9k
	bjxbubP4cRdiqgxAbXNUByTXvu7OFDhGH7Fk4AD5QfvJZwwibV9TNkEFtVXn/I+2XidXGaQImXR
	qUlv+Dt82foOPAv5c/12vR3Iv1aHfBQxBbxCDbtO1p+xyvUvssPGImdVy4VTe2Fv6GT6w5GeQwj
	FHgU3Xo0Vv1/F6JLfZSzSsC0XkfHYiyjTpFReS17z1k1udb6YvVTOwCLMSyxmgw33IM=
X-Received: by 2002:a05:6a00:17a9:b0:746:2ce5:a491 with SMTP id d2e1a72fcca58-7462ce5a712mr3645286b3a.10.1748379893434;
        Tue, 27 May 2025 14:04:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdKiWLumEIDy3APCQkLZekdpH+dDZdoDM6L3VDfmiSlLCJgjPEV4ELcOqOm5byIoxyev5IRw==
X-Received: by 2002:a05:6a00:17a9:b0:746:2ce5:a491 with SMTP id d2e1a72fcca58-7462ce5a712mr3645231b3a.10.1748379892966;
        Tue, 27 May 2025 14:04:52 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7465e64836fsm29167b3a.26.2025.05.27.14.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:04:52 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Subject: [PATCH v6 00/10] phy: qcom: Introduce USB support for SM8750
Date: Tue, 27 May 2025 14:04:36 -0700
Message-Id: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOQoNmgC/23NwW7DIBAE0F+JONfRsgYMOeU/qigisG6QarsB2
 0oV+d+L04MjheOMNG8eLFEMlNhh92CR5pDC0OegPnbMXW3/RVXwOTMEFByxrlKnGwnnKV3OnU0
 jxarFxpJvWuUFsLz7idSG+9P8PP3nSLcp0+NWXkMah/j7/J352q4XEjgvXcy8ggqMbYl7hxLFM
 Xsu9G7vho6t3oybUYMoGZgNq4y2SEoTqHejfjGwaNTZ4DWBUd5p3fp3Q2yGAFMyRDYUOYXcGX0
 hdRxS2t8m+52NboPkC4S8BMkMoXSNIQ/cAxagZVn+AI3etQ7jAQAA
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748379891; l=4181;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=4Otq5/SJ7I4zFyhmnnZUzoYm2viVKcjqEocffO3PcQc=;
 b=N5YNjaqcDY7JTLuV4mDpZMezmd80Zbmdr5qoIeetMTUmjJ5V3glufVSP0s5Jx+8BXdoJCWBiM
 7rWoHD82fw5BVmhNiRwkJKfYYRBkOPyMbFSvArSZh+pZ8BhQMUVpisy
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=aYJhnQot c=1 sm=1 tr=0 ts=683628f6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=dNz1S4BQCA6GZfmXsroA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: DUYvD8HhIj3vaSGvuOBGZsGJq3m7UKjH
X-Proofpoint-GUID: DUYvD8HhIj3vaSGvuOBGZsGJq3m7UKjH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3OCBTYWx0ZWRfX29Z1zXT7ezZH
 9cQS5GWQwzUccenVSAjM3QrgZXKnjQVIY7tQcdTmv9YatLwFnP62gOBsKBd1dGWkDg2N0sIJhF2
 NwRQow26PMrkSo+mR8S8dJ1dbIXB/x9w3K9HlnAkDLWz4yP9/ekpTwr4xXGZ6Xx2okq5iJFP9ly
 YaPYtiTxHjnyPDz/2zUxI6s00mNEHlzfg+uzSsy+iLH5QDolAHgBk6eM/aPoyxo+CARfrh3X7iU
 g/vjhaBds3LM1rvzM4pUGXERCucmgTcpLmtX+TAftklPaLpG2FAN4Pwt/JfVt1qyQHEBYFOANHL
 24i0mO39oh05zC+8HxrmaYMMKPk7z4mPjND3PYNvytqtmSoRq5rIyHWxOoOSQ0ZfpHINawGxdLq
 8rkCkZsf6TgBZwnmeAXko9/m7hLyFxGU4CmwnfDUarGPPGHxQj1ycsmrNIZWXvU1wY5qJBVC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0
 clxscore=1015 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270178

Add support for the PHYs and controllers used for USB on SM8750 SoCs.

---
Changes in v6:
- Change readl_relaxed/writel_relaxed calls to just readl/writel in the readback function
- Updated languange in the defconfig commit to specify SM8750 as a Qualcomm SoC
- Link to v5: https://lore.kernel.org/r/20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com

Changes in v5:
- Removed refclk_src from the QMP PHY driver as that is no longer used.
- The decision to move the TCSR clkref property from controller --> phy
node was made in v4, and the refclk_src was a lingering change that was
meant to be removed.  CXO is the parent clock for TCSR clkref, so CXO
clk will be voted for as well.
- Relocate the SM8750 compatible within the qcom,dwc3 bindings.  This is
to take into account the change in clock list.
- Link to v4: https://lore.kernel.org/r/20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com

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
Melody Olvera (2):
      dt-bindings: usb: qcom,dwc3: Correct the SM8750 compatible
      arm64: defconfig: Add M31 eUSB2 PHY config

Wesley Cheng (8):
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add SM8750 to QMP PHY
      dt-bindings: phy: Add the M31 based eUSB2 PHY bindings
      phy: qcom: qmp-combo: Add new PHY sequences for SM8750
      phy: qcom: Update description for QCOM based eUSB2 repeater
      phy: qcom: Add M31 based eUSB2 PHY driver
      arm64: dts: qcom: sm8750: Add USB support to SM8750 SoCs
      arm64: dts: qcom: sm8750: Add USB support for SM8750 MTP platform
      arm64: dts: qcom: sm8750: Add USB support for SM8750 QRD platform

 .../bindings/phy/qcom,m31-eusb2-phy.yaml           |  79 +++++
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |   2 +
 .../devicetree/bindings/usb/qcom,dwc3.yaml         |   2 +-
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |  24 ++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts            |  24 ++
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 164 +++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/phy/qualcomm/Kconfig                       |  16 +-
 drivers/phy/qualcomm/Makefile                      |   1 +
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c          | 325 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 221 ++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v8.h     |  38 +++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8.h         |  32 ++
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h |  64 ++++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v8.h    |  68 +++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |   5 +
 16 files changed, 1062 insertions(+), 4 deletions(-)
---
base-commit: fefff2755f2aa4125dce2a1edfe7e545c7c621f2
change-id: 20241223-sm8750_usb_master-f27aed7f6d40

Best regards,
-- 
Melody Olvera <melody.olvera@oss.qualcomm.com>



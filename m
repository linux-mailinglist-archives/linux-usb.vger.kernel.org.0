Return-Path: <linux-usb+bounces-23269-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC7BA958BD
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 00:02:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BB9F1896A0C
	for <lists+linux-usb@lfdr.de>; Mon, 21 Apr 2025 22:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0B521B185;
	Mon, 21 Apr 2025 22:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HilkUqmW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CB921D3E8
	for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 22:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745272843; cv=none; b=jM2EroUetGF8pwkdQfgz54CYm+WS5FCXX1/PrspTqOldeSpzqeuLceIs7otpjDvpvEuLj9SpWGFx9cturQffmlMeHE86EZXNbHm9gd1IUbUW1+Z8CadJVOkzxibIIvKT5CGIKXuW+7VuaRzOHkcT/i5G2729DHOaFgWgNiFZatk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745272843; c=relaxed/simple;
	bh=Fz5Xv5kyUKBPX7FBV3s+Hc184GjMe84b+FHiXhLBQqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cy6W5I9XI+D005KT89wHr536F0IOLc2+5LlrsNFIihvhHx2F/D4EFkmbVi8nSNO0bBZaytDDrrcEzRmv1zkKDSAflJlINgLrGuMBcaHvSUa3Brt2v7gdvNvRWzO4suPcO2HROSMCh4SCPz4aAsyy8IgEFfV9gaDG4pKPkcNlFRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HilkUqmW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LK3r4o031593
	for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 22:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWhw1LvOhszFsVVXvJgT1USSc8+4N0aEBK16X6WxLSo=; b=HilkUqmWXxAwE28F
	Viqe2dXhxLlb0IxwGEVep9mG4tuUu48kMS3H2cbv9BRJPX8nZiiH7i4do0jxXPID
	Zei4XhACINfxA1KXR+SvSDzLohP76oMTVabm8odlLYo+YcTwzWQa2Wq6UdeDp/TQ
	CGgRXX2gfiV0imKXzV+BX9x6efyem/16Pak6azTdXI2vS/XVzji6pwIR4xTNvIfl
	deGvcP6QZFdLwR6nMoegyymR1H0uGr2dDTh6Ighp3WAO0HzNKdjlHZ2pmGW4DJtP
	XQ8So+lYXg6lFwg7Wr0fdaojG7AWzBwbET4rWz3ZUtAFon9C6B/sXG3WdVAQ6uGG
	BbcheA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4644kjd8ac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 22:00:40 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-73917303082so3041761b3a.3
        for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 15:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745272830; x=1745877630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yWhw1LvOhszFsVVXvJgT1USSc8+4N0aEBK16X6WxLSo=;
        b=MnIk6owexovCfN1I/DINkStJYd3pIGuXSEi3nc58FaonX+TtMSKMKwZVrRXqb3r21I
         ovdljBjACreweEQDiuJ+eRo+ug+30VNeO4z0RK3GjiMkWpfvR+e+P4u+AjpRKmd77ELO
         NTSKxtjfjdYXxpiDHhTN3QzBqOKqxh5QWTZMNbqGFB9p6tdEGamQDBXNaRUnf3SB+KNc
         0LtNaYf3WB5WjFwMSAT/V9TMYVIU/oph2czfX9r2OfGq2xYNMcfBzCKZ27GbmYscMszv
         0Klyc4gXVHeNd1B4x9JnXtZzW2KSfId0jQrlmMXLq6/aDxKDX+OWkXPXGk+Ycd+mkDyQ
         52sg==
X-Forwarded-Encrypted: i=1; AJvYcCViZrhfCqrcgJ5wd6VhgiKVKxOkQI1TTrKGikmBh3z5wv2yLW1Pji6mLN0//aCsTwaBJA0Gr05x1mA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfa2osBL9LcPVuIduonhDUKIH2kYEOqgpdx9mumZ6s4Ji5Pdnl
	ALQr9v1Eyp06DaeUrbfT4/yjC5R99edXchah5kzkiRYCpXforoljJ2Vm9Q1NpqDvasgKURomrHu
	OK0asE8yGigOBMjqBJiu4KzYf5DTcOLPsxV7C8s9d/dU68vIUSMifRe7Rfks=
X-Gm-Gg: ASbGnctTThB4ASJC0Nz5mxdLanI8aQ6G9Xv7R3+xvm56QcjpUvgSbJAb8mZzPgyHw6I
	K40GyCZ+43Mu6PdL43gZSNiFUyO3fYAnWwWhS4HB8+ki7cNp4H4bD70Z3ZVejStRELZmw2JzE9z
	NPsmQY4w9k/AcOOe+ITYvQDP8oX8gEugeMnjRRQky4njaFMsmxkJC6P6Hgr67zqvRK8VDxLpyUv
	5IrhOPxBNRgfvgOz8RAypM1TBKQRGkRZ7KUigAc5Mv0TH3b6nVDwno1uuc3f4anQG/jmXc1u4R0
	r7qloI5OJwKw5FqmzC79H7/X7+932MAK4OBFULNQgxBzAnNBH0pMV3ChrmDKvZ/LOWc=
X-Received: by 2002:a05:6a00:98e:b0:736:5c8e:bab8 with SMTP id d2e1a72fcca58-73dc144c7aamr20385407b3a.3.1745272830074;
        Mon, 21 Apr 2025 15:00:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4J8IINuI6AyXzme/otRBuArMyNq7mt7WxH5Fyest1FG90iDOU07/f3k4YrNeQTPBFvXAHvg==
X-Received: by 2002:a05:6a00:98e:b0:736:5c8e:bab8 with SMTP id d2e1a72fcca58-73dc144c7aamr20385326b3a.3.1745272829473;
        Mon, 21 Apr 2025 15:00:29 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c04c5sm7107917b3a.24.2025.04.21.15.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 15:00:29 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 21 Apr 2025 15:00:09 -0700
Subject: [PATCH v5 02/10] dt-bindings: phy: Add the M31 based eUSB2 PHY
 bindings
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-sm8750_usb_master-v5-2-25c79ed01d02@oss.qualcomm.com>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
In-Reply-To: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
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
        Melody Olvera <melody.olvera@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745272824; l=2425;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=Wud7UEFHXJQ0decZnINKeSi+hAdh0llCKpYCfH/oedY=;
 b=wiSsNBP6n3SjbBERNylScCBtTJlneM21/7EzLO8v2iwkdZFE1SInRBkCTbCfb6uv759DgDsKR
 s5qHIbAdL55DeXzCxEHZ1VzgkSDumKF59mzN/WW2mOURwT77Xj3/T1U
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-GUID: dOztEUpViUSB3qEJD_5P5JrRuBQIt3yt
X-Authority-Analysis: v=2.4 cv=f5pIBPyM c=1 sm=1 tr=0 ts=6806c008 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_ZfBLJ5mcqDn8hZp9PAA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: dOztEUpViUSB3qEJD_5P5JrRuBQIt3yt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_10,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210173

From: Wesley Cheng <quic_wcheng@quicinc.com>

On SM8750, the M31 eUSB2 PHY is being used to support USB2. Add the
binding definition for the PHY driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 .../bindings/phy/qcom,m31-eusb2-phy.yaml           | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c84c62d0e8cbd9fc1c0da6538f49149e5bc7e066
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,m31-eusb2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm M31 eUSB2 phy
+
+maintainers:
+  - Wesley Cheng <quic_wcheng@quicinc.com>
+
+description:
+  M31 based eUSB2 controller, which supports LS/FS/HS usb connectivity
+  on Qualcomm chipsets.  It is paired with a eUSB2 repeater.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,sm8750-m31-eusb2-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: reference clock
+
+  clock-names:
+    items:
+      - const: ref
+
+  resets:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+    description:
+      Phandle to eUSB2 repeater
+
+  vdd-supply:
+    description:
+      Phandle to 0.88V regulator supply to PHY digital circuit.
+
+  vdda12-supply:
+    description:
+      Phandle to 1.2V regulator supply to PHY refclk pll block.
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - clock-names
+  - resets
+  - vdd-supply
+  - vdda12-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    usb_1_hsphy: phy@88e3000 {
+        compatible = "qcom,sm8750-m31-eusb2-phy";
+        reg = <0x88e3000 0x29c>;
+
+        clocks = <&tcsrcc_usb2_clkref_en>;
+        clock-names = "ref";
+
+        resets = <&gcc_qusb2phy_prim_bcr>;
+
+        #phy-cells = <0>;
+
+        vdd-supply = <&vreg_l2d_0p88>;
+        vdda12-supply = <&vreg_l3g_1p2>;
+    };

-- 
2.48.1



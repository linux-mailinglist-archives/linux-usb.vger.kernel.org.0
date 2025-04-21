Return-Path: <linux-usb+bounces-23270-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A3DA958BF
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 00:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA5F43AC387
	for <lists+linux-usb@lfdr.de>; Mon, 21 Apr 2025 22:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719F4221DB2;
	Mon, 21 Apr 2025 22:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aaGE6rkC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40E021D5A5
	for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 22:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745272843; cv=none; b=lFX6+ukqU9K1rfsklSBOGjdPAA5W5Wh9hco1zomKDG6HYFDBJYqVGP0yLrRnfGmHbs7RwLy+nLBt6dUqhJCSsquBOg1EoMiDP4haC4pjbVFnlnLO0uraFsV32/j6rnw9QYoCVn29fr4qrFegl/DDS7Mpev7b7cnu4aqyzW2o8lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745272843; c=relaxed/simple;
	bh=/teLQKUqqqqInwDBMhtvz2ZoYlg5NLp/HJndy5aOQCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U7TlLr2LaV8ijL8mVQm6jQxXccBe37/KxaOa6+IKAGyJ2T9QfcEtmQpRxEuv1fGEEBInna2Z71p1PZ0WIObKoay2pCYitt39SPSBlE79i4e6igr9LnwZ2Nut8j4Na4Ev4ae6rtwScIn1tPYKq9irBmoMXdhZLT7Nwmm7kpheYGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aaGE6rkC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LK4HZX000680
	for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 22:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	85FTf5dq3WUxvPAL+FcZsdyjl6Gon2Kpy0Ag/qYK1so=; b=aaGE6rkCZtdvG9tc
	a1qJ8uhw3iP4HEmPkIB9O7+6NRD1tTXAbC63ftEebmgZjiue074qGi4ystuDl6U+
	DsnqM26bSQWEJeZUgC+/1Vwm0JTGiko1mm3gy7ph+P4ZOFZXnNwrhurZ3uPD+lUU
	9uclUqLnPUgUHQ6aK6vJFSTuN0raWCwWKmK0TK1y8GGqsbZiBoYoXVmpRdylZ87t
	VjlHmU//+4TjwtmPTnKPADrHpNu9ygdOEMuZWAv+mQyX1vc5li5G+Fd09UmfeKx2
	uI5b3z5l/gcd3RW5dSnU3TpHpVUIOgbEHk95ECd4RxhwGqoAcZXC5+GWu+42BCHG
	MEbuxA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4644kjd8b3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 22:00:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7377139d8b1so3077221b3a.0
        for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 15:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745272840; x=1745877640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85FTf5dq3WUxvPAL+FcZsdyjl6Gon2Kpy0Ag/qYK1so=;
        b=uwV5A2SsrvrjtNaIEvubfPrkmN9QmRzqVQkYIKjFb4nO0/xf5djXbIcEYVtAHlHySq
         iRNN0XFNKh116Pxh6RtPqqDmgf1VcxOWb7Irt3qj+a42nMSQYb8fOdv6xSK6jjoEcbOR
         uAJW466fvU4+CrnwQoUSCebyNiR2pE3OPEEv1ii9rpOvFPT2Naza04b5LHBIgWfBwgm1
         XzFKgiqIDAHddr1oX5859cSnGswPMZ0XvUBjqf53aHMEdyZX8AVUN3K+x0fYmSHmgJM2
         nUXwzYtautZcv7zujY7r0OnGj4CTYfSvG6Fce33XXqonrGFEzNyGEqksNgxoMctWt48z
         XzvA==
X-Forwarded-Encrypted: i=1; AJvYcCXPdp74kiNAJIIv1eMoIsUqF85YZfJv9MeneXIVUgMZpIMY7LFo3N31YNze628vf46OSAj7lAFDA0o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0wlE08J5BD2yaZ0jK+7dcmdUo2l+66VffAeaDl4aF2TKy50PK
	wA1+uPucAzXCN8V9ibm/WqcZ9Zy82unHMTQIs3gWh3O9VdKO2N8TS3L7NzWeVcQugzvdX/pqNhv
	uyiaCmVfkgguKq6a5Gv7RuQ3Sy1Oihxt2GDF0HNoOsL/NLCvlc0APw8VStzM=
X-Gm-Gg: ASbGncvN55DJMfCBYMXJAZWom7wwY6NBcptVJHSQ2UWFVOuXhgtxcL5D3Qfv90KYcvY
	/03+y+R7ZbbC40l4akTm4yVRrg2FzX+klkfuNNO6bF7XXKP2+hFz5yZ8Yat3wL9nfShOihzrL1X
	8RWIytt/kQkuVe0YMujICa5XiRqvbDt1Ad/8Jt6kFEixF/057qwWIZkV14A/INriSEj1fHW+Syx
	m7WFMtqr+jSBcw001j1SylFn7onjyExaEEkTfVUtFbxR2me/ae9l0rlu0dJZnIuUyRO2RpzTaJk
	CghhGBXoYnJsdJiUs1H5B72KekzuK9YoWdNJgeqYgz1TCNmWY236uXYdMFNYNGSyAr8=
X-Received: by 2002:a05:6a00:2182:b0:732:5611:cbb5 with SMTP id d2e1a72fcca58-73dc14cca88mr17001106b3a.11.1745272839443;
        Mon, 21 Apr 2025 15:00:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsdbfJsm0KdV60HiBE6DxPravmfAWBBMxUJAVErJZ8Mc6PzUneSapkKYNVVusWvrtS/jXXkA==
X-Received: by 2002:a05:6a00:2182:b0:732:5611:cbb5 with SMTP id d2e1a72fcca58-73dc14cca88mr17001010b3a.11.1745272838817;
        Mon, 21 Apr 2025 15:00:38 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c04c5sm7107917b3a.24.2025.04.21.15.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 15:00:38 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 21 Apr 2025 15:00:15 -0700
Subject: [PATCH v5 08/10] arm64: dts: qcom: sm8750: Add USB support for
 SM8750 MTP platform
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-sm8750_usb_master-v5-8-25c79ed01d02@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745272824; l=1288;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=+b6x2t1UZ9tBSOYbcUj0Sk6c/9sXGEBZ/MeOUGfqqx0=;
 b=soft0JCqQzQ4F8eO5+nGm1bNhAoWmg05DsdBm5joEmpWCGlAn4jtQjnOkgw73BUZ0YG2wzdbV
 MIzfiTfDUVVDzggWNSMwA7WyAd2Y4JqKHO6Gfg+pWQ3VJBsB2Wx28pV
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-GUID: kgGvycVMd9syW9PCRp3JL-JzULW3m5Tb
X-Authority-Analysis: v=2.4 cv=f5pIBPyM c=1 sm=1 tr=0 ts=6806c008 cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Tsvuh88POXG944tnl6EA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: kgGvycVMd9syW9PCRp3JL-JzULW3m5Tb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_10,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 mlxlogscore=747 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210173

From: Wesley Cheng <quic_wcheng@quicinc.com>

Enable USB support on SM8750 MTP variants.  The current definition will
start the USB controller in peripheral mode by default until
dependencies are added, such as USB role detection.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 72f081a890dfe49bfbee5e91b9e51da53b9d8baf..d28e45111b8d01c2753493a7a4ee248bbb334aa8 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -814,3 +814,27 @@ &tlmm {
 &uart7 {
 	status = "okay";
 };
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "peripheral";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l2d_0p88>;
+	vdda12-supply = <&vreg_l3g_1p2>;
+
+	phys = <&pmih0108_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3g_1p2>;
+	vdda-pll-supply = <&vreg_l2d_0p88>;
+
+	status = "okay";
+};

-- 
2.48.1



Return-Path: <linux-usb+bounces-24343-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C296EAC5BF1
	for <lists+linux-usb@lfdr.de>; Tue, 27 May 2025 23:06:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8441C4A7DED
	for <lists+linux-usb@lfdr.de>; Tue, 27 May 2025 21:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE472192F1;
	Tue, 27 May 2025 21:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXLFu+zJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254B6218AA3
	for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 21:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748379909; cv=none; b=ns+k1F5WW0/SsKwfuiLU+xZ3F0tACLEWKJ1aZuRcOS7APQacHF9aii4k/ErOERf5rKxBMhBTGzkV8S2mQ1naC7GasxBXshVmCW22KVSfF/Xfy5dIZNYo/wb1zEwlR61VgXq/syAG7ydXZLERLymYrhRpQeVfLkj0IJoVCmfXvuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748379909; c=relaxed/simple;
	bh=SzHbHz5W+oX3YfTw8d3BpgFZXwsUINC/XLP2fP7cIaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sRGOh9cXe/cLS7d0HCzprOlvhXPaLbf1alXUqRhBF71j8dKnuEqu6JKkvK0d0clIrekuqpHWbbKDaoG442RK+A254YMX8KWM2NeT9Py6OIE8Vojrnt2zo0aWjcvYBbLos7q3AYNfibjA5TByoenoSYz/0p26vfkR1nlPuSwCPGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXLFu+zJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RC56av005190
	for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 21:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	teg98KnCXRHpbibmB3t0iTGw5Sr71vWVJCSu3Gc6TZo=; b=XXLFu+zJIXzaJOnH
	6MmY7OJEfvk+vqpjXwDNKNhnTFbtvufAnTxh0w43zpikEqqTLCYhUKVa5MY8XzVA
	XBJAD1aHs+NBai6fjOp52Bx1RzbDkUatBByTbzuPgJPwfMLFpVgb3Sg+OBnHvkA/
	oidME/ep06EwgmBqQCMHpldraWVqtH46MEqXGm/cDll02vDhM9tqtRNubME16HPs
	eXvwB16TAaTZTGAow/4+PY82BOZt+CAxfoeQ3g4lgi0gGrlOs+YoQG+zookZh7Qs
	0rEtKo694lDbsfnxz3eDjrRTZBJxvSeklAkL6fncQHDV5vP9IV+ZEF3QLKGRcvSq
	kKqKaA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u79p88wd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 21:05:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7375e2642b4so2797358b3a.2
        for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 14:05:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379906; x=1748984706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=teg98KnCXRHpbibmB3t0iTGw5Sr71vWVJCSu3Gc6TZo=;
        b=vF3aICMfiH+j3oKtJW4Y5zgt4AtGHQXl1GnudE0srHU/Evvyxb7lhHreTzOzksWIqg
         FAkWdlilHyMScJD4djlDWahxOsvTrg2VW6ZG10zpCLBriJMWaO9QflS4SmxDzAfJvlLF
         nLMx24/UOrZREc10xahznri/AO+A7KavxE6+yo5RDAGjDHyZA2m1S3bUNiw5rXPc2Xqj
         uJPjDi+HIg/VO2SX5afA+vTrJO49yXHbMNc+JCMyBet/YV4B0scnFsv+YCsdJGetA8Ju
         rujrqnWZWU6rl3269NjVaaDW6uFTpj9F5542igZI+KT9PSX3SfF1gsHKiMRojKxe1ytk
         jiTg==
X-Forwarded-Encrypted: i=1; AJvYcCVH0a0rcde/7KBsSIKRwSiNbqIZR+ElWCD1ulhdIvXBJ7z/IY5HGtN+IeYALea0URfI1ycfuto7eXY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfl3NztvMxZIOyrnkKTGth8dP3WBvKLL3/JBWdfUx0Pnr2QMdE
	8z/qzqUVohBhRFr56j+5MYs0JxI+GtPNjLP099XLQo/Kp1/CRRmGimGYwo1QscMgCzk83nM0WbA
	rzc7PQN35L4L/dJ4bP3DFOhm/8TI3as2tMPyvT3AkS3HZ+TNJHDR8V2i8fhrwBLk=
X-Gm-Gg: ASbGnctj8/0QSd4vWdd/7d77IOkBIC4/TExFI8ea4J+Hl4S+zoZ9SaXcn74Fv14pjsk
	8/fY4aJh6nrMUqS85Q+Xo1wj9KGebjWtNXgxUaWBhf44Y3n3AmHxbOJZXSHEt8QFMrprjCgDWMv
	di5lNh5uUIOZDjEKxxggVSd167XXNQUth2DF/Ss7+wpu40FW3uUdi7NUDLxQ2xfYqiPUwCZ2cSt
	5qOiO9djZHJV2cGIdPPW0hohXXaHCbBJgbmWdw8HvD4qhSQGWdZsf90EuXJiicQMAynk3woFtwF
	/lvJNG7MBecTcZMapzCCHPrDYAdmzTbkiHbubaDVQDDvxpqKNspJ0cb7azKywgQrv2c=
X-Received: by 2002:a05:6300:210d:b0:203:c461:dd36 with SMTP id adf61e73a8af0-2188c20df49mr23718622637.6.1748379906511;
        Tue, 27 May 2025 14:05:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFurMh4Ktwpp0qvzyqJkXxlrwd4QWROOgS0twx82tbgVIupB84blzpNgeeLHqbI8CEKvbsTDA==
X-Received: by 2002:a05:6300:210d:b0:203:c461:dd36 with SMTP id adf61e73a8af0-2188c20df49mr23718567637.6.1748379906065;
        Tue, 27 May 2025 14:05:06 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7465e64836fsm29167b3a.26.2025.05.27.14.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:05:05 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Tue, 27 May 2025 14:04:44 -0700
Subject: [PATCH v6 08/10] arm64: dts: qcom: sm8750: Add USB support for
 SM8750 MTP platform
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-sm8750_usb_master-v6-8-d58de3b41d34@oss.qualcomm.com>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
In-Reply-To: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748379891; l=1355;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=Nx4I/ZG5m1Kxa6LCnqamndwPnsXvis3d+v65oICH37M=;
 b=Hp/G/DtacnwV0EhGyfZOVZRkpEebZE/+1C8caI/kuGc9Mek4iJ/VNGTuOQB6QRMqQZR9IOssZ
 3IGYp9vp5sFCd3IY2cf3mgW1K0ADTPQeQ0gcHgh7c9fof70ePb4DYOm
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-GUID: HRMkXp-ku3ob8-ePKsHRhlDAo0QW2cYF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3OCBTYWx0ZWRfX3sXgJck5npqV
 GxicQGYwUtsarrgloszqVd96ETbulGQMWUeBG0cPR2JC/VjwOf+F8LuWxt7s9UStsu7RCK6zlT2
 kZE9GrJJBIbS6NbcytlkrbMJTptLLNLeL0RxVobJQjiMVO/KkmGmDOsXrFngDSo1n3KVY8bRqq+
 T4BjgXB/TR4Arb3g+C2zgoppgWfcxwdOp2YHc01m9haFSrh2FPROAm21CNFEpq38prfqpChPxGI
 MUTWj1WBm9zJsH6SqyGPyYgDfVCDNvWQaqXlPGEKCO7YbFarLnOLOvz4e4nUjNmAj7NEFL//Sst
 SOLhSi9I7F8aMvkTsT9W8UNy3rgMJGS7AlxDP0MQcvXx31n3Dqt3Vc1iCMesXYRXOkvQKFbAfQS
 ihhDFho9JD28gQWTpBMtha3Nhgcrkqc7pZSQ5ypg1p4fj0Blrh2SdkDGkhhLRUBFJN8vbZbE
X-Authority-Analysis: v=2.4 cv=HNnDFptv c=1 sm=1 tr=0 ts=68362903 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=Tsvuh88POXG944tnl6EA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: HRMkXp-ku3ob8-ePKsHRhlDAo0QW2cYF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=760 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270178

From: Wesley Cheng <quic_wcheng@quicinc.com>

Enable USB support on SM8750 MTP variants.  The current definition will
start the USB controller in peripheral mode by default until
dependencies are added, such as USB role detection.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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



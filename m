Return-Path: <linux-usb+bounces-22814-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EFEA82DDF
	for <lists+linux-usb@lfdr.de>; Wed,  9 Apr 2025 19:49:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD478460AE2
	for <lists+linux-usb@lfdr.de>; Wed,  9 Apr 2025 17:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7C72777E6;
	Wed,  9 Apr 2025 17:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NHnxggZ3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC11D26FDB5
	for <linux-usb@vger.kernel.org>; Wed,  9 Apr 2025 17:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744220912; cv=none; b=D9N0PrtBE9xT/c/LJiMSvlnGR1vt0b+lDZhRYwmyDMiOikeZc/GX+IS1vgO7oSkr2AutKuaruumwzZpHRjDnP0X28ogvtwgFa3ES5K/Toy9GdB4Yr5w/0etwXIqcueQ+K3UsuxhKiZ1vuPHx9uSw9U/2mOG6c3L0/DHYgxWEDo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744220912; c=relaxed/simple;
	bh=5FExpQUZ/FHZEchRY6UIA2qfjFJXzxNKpcsVYOWNwso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LckbFqralxarSloIq5b/SeeWAk90jtU9s9cnJVWntOtpuCey9cmGF4zUlwXs6rapfSF13NBES7Drj6lL6VO+1rzcimqALxzDDuWMTmWGVblqNSU4540DX5+uVmUD6G7sgkfCc8NxIOkaXAn1HYR9d9PxSr0QPwwofsQ4Cp4ZDp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NHnxggZ3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HVT4S007204
	for <linux-usb@vger.kernel.org>; Wed, 9 Apr 2025 17:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	63TelnMaZLywwjt0ZE9rQRxentiOmbDDz3cY3YJGWYQ=; b=NHnxggZ3HAyg23tX
	XexEu/d4b4xHNZpkZ+FJyFtExBOWgu662MfBiO8ZQunB+D3A6X0K9s3HAcUgCNJG
	Ug402U/C5zkYbyCqagEaz2pRlOSJnLbs0OJbtBaCHBUjUyftvpI2R8ntLowUEhM2
	slRDlDiuZiKQSQTbze8L8btwepDLMtOY/0Ce45s9E3SpoKO6MHznm/HHMYmi7iLy
	Win3sHeaCLquKFIUPb8nvsOxBYTBw40gMDA+n9yDONuw7GyAkBFl6nxB7prMHLa1
	NaIG883o+xMztiAmvSqleD3xB96wSTQFLybNNBwQuS6J3xcC1wW+5EdxbLYYUte4
	y85X8Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3m8fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 09 Apr 2025 17:48:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22410b910b0so52949375ad.2
        for <linux-usb@vger.kernel.org>; Wed, 09 Apr 2025 10:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744220907; x=1744825707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63TelnMaZLywwjt0ZE9rQRxentiOmbDDz3cY3YJGWYQ=;
        b=Y1yUdzRqkBXsgoRI978ERUc/OkCmQpQ8JsENiQihb6pYSQS8qlU/JrnnM9KbbRMkCh
         ns0s+3R9SK3jODDh37g0LWw3/8SpzSPFca3kAba8HUDLnoKlkyuvdeenePKgqXDYh3ob
         D4sJj+DL/6ClgulNyhDsSleC6bZdOKBr+5H8pS1PyGRpVjHzosuqsbET9kE48RDGcctp
         lrRQI5hVJyZ2CBhU5uSeZu0MAHiqE5o29tCCohtEfwmwqg+aq0Ke+bZSXpRZsjf/BToo
         CPqtzKO8+8IUEGt+iY2dHyKLugGKvyaaOJ2ggtqefE0j1VLsQBxp8AEIBTKgjlqBdMhl
         Wf2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVaKIMcQxAMVgpQ2/M5AQ24s4IVgpswev2wl6wzNwFiDYUgkCOnCn3C1+mCg1G+1qT2c5V3mNjvrQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZxhxHEJlE0i49QXP8jzvoeoeGig+ff86PNOf3OyOK6Cn+MgT9
	nOJWGhyxKb2F+DhQcg0KVKdaxQkeC54L+PxrH+0wCq5f6sp1eAs84bHEVYZ015oD0KNipCfSIVz
	3tgIFSms5iFiV51oYyaUGaIG8YnD5LBwWhZ6pV3EWUVCYqASH71CcC5CnuRo=
X-Gm-Gg: ASbGnctF7Y91N6cwtxjmEGUecE5V38JJWxYgys+myn+pGzhaSlSL+g7Fx0rZv6t1HdZ
	h1mf/ms8iT/g9s6TUCJwlNGJsWVs9AfnQIJOHWRYwMzFsuUlXO6KVot07ToKmKdtb7VXIo5sBjl
	JuOm88bh9iJBO1YCSex1RH/n1/LJ8EAtbFaY5TWOo8pkFZIkK6FyqpvUKgWpdmrf16Ngk1gw/O9
	KQ3iKaApOuWUIQUG0dLIe9qwmiubNAGa+nuGyiwIwd2FY0f47Dp55aVY1c4tsmFdNJuS/Zz6lqO
	iwWJcdyWCggBULVZ+SUaUPbEUOFeXivtGc42JKtKnnGUt3HZCtJcSdhZJlKV7I3Wjqw=
X-Received: by 2002:a17:902:ebcb:b0:21f:45d:21fb with SMTP id d9443c01a7336-22ac3f321ccmr48818525ad.3.1744220907099;
        Wed, 09 Apr 2025 10:48:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgKvx8lBdm1FHNuXnyGtbdi5VXYxEdAcXoc4DCrdY78oYm92MjebgYjMMTxhRh0F50+1wKTQ==
X-Received: by 2002:a17:902:ebcb:b0:21f:45d:21fb with SMTP id d9443c01a7336-22ac3f321ccmr48818185ad.3.1744220906692;
        Wed, 09 Apr 2025 10:48:26 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c97a1bsm14964005ad.148.2025.04.09.10.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:48:26 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Wed, 09 Apr 2025 10:48:12 -0700
Subject: [PATCH v4 01/10] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Add SM8750 to QMP PHY
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-sm8750_usb_master-v4-1-6ec621c98be6@oss.qualcomm.com>
References: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
In-Reply-To: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744220903; l=1370;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=8DqyV8lJU3L/SgQ/5n/G4b54XOO0JVKsEdNPv+HKEao=;
 b=77LNm3kHo7uIXLbsObMXwziEYQuHIhUNWEB4Y7oRJvpIb5WlARQPc7NSdgr3i0EeQnCMOqJMj
 APzL7x0yD/FArLp99KEn0e1azIyV9ttlUwnKo12dm6hc1W4QmrwczOQ
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-GUID: 01vJp7qp_EW0a50eDgyxVFFxQYnik4E7
X-Proofpoint-ORIG-GUID: 01vJp7qp_EW0a50eDgyxVFFxQYnik4E7
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f6b2ec cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bbY3M6C_flAL0yJJl3cA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=764 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090116

From: Wesley Cheng <quic_wcheng@quicinc.com>

Add an entry to the compatible field for SM8750 for the QMP combo PHY.
This handles the USB3 path for SM8750.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 358a6736a951ca5db7cff7385b3657976a667358..38ce04c35d945d0d8d319191c241920810ee9005 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -29,6 +29,7 @@ properties:
       - qcom,sm8450-qmp-usb3-dp-phy
       - qcom,sm8550-qmp-usb3-dp-phy
       - qcom,sm8650-qmp-usb3-dp-phy
+      - qcom,sm8750-qmp-usb3-dp-phy
       - qcom,x1e80100-qmp-usb3-dp-phy
 
   reg:
@@ -133,6 +134,7 @@ allOf:
             - qcom,sm6350-qmp-usb3-dp-phy
             - qcom,sm8550-qmp-usb3-dp-phy
             - qcom,sm8650-qmp-usb3-dp-phy
+            - qcom,sm8750-qmp-usb3-dp-phy
             - qcom,x1e80100-qmp-usb3-dp-phy
     then:
       required:

-- 
2.48.1



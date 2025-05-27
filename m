Return-Path: <linux-usb+bounces-24338-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 285CFAC5BE1
	for <lists+linux-usb@lfdr.de>; Tue, 27 May 2025 23:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12B1A4A8033
	for <lists+linux-usb@lfdr.de>; Tue, 27 May 2025 21:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A940520E718;
	Tue, 27 May 2025 21:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FEmTkq5A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7E1214229
	for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 21:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748379902; cv=none; b=FK8g65a84XY2qqlP1prHOTGfNc6iCiydD1vdAiQPx6cYRxy4V/ObFGe2KcsRWJpvJst4w69/JaRwzBFgvsPxlXyemHrzdAgWiSUJxRnNzYAABW+yuGARSxYMyC22tKdOF2ZF/mUcnVeOAy5APA0GTfOi7vH2SGzt7zH6rEmSfpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748379902; c=relaxed/simple;
	bh=NhOsYBi6tADTMUAiHJ0Qk3HAGnZPId0WGmI4bIdXuV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VoGJQoV2xZdebjaKDtCidN3Q2OdRY8gZ1FOJe8RP8RaatUQi89nJkqCzrZIFiQDMeIgg0R+2dEeA1q4hWpd0jmBgCeEJBZ7SHN68d6LwQfPpcxI1evJWmIbeiLjTkmf1Yg5j7PjwY6lJkeYcB6rfv/9vetP4HcnwP9a7kf5jU4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FEmTkq5A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RAncWC018828
	for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 21:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8gIhfclnLH073VsLY1ttHA/tXRnGUkM9HdwYW3xYCyA=; b=FEmTkq5ApBPdiyy7
	fYfR93tebQ/gtSyFOXu9QDIhyhgfbwvc6f4hTt2Wm6kIecV/JYbRXGycx+Eh6suM
	MHaef/GAhoUyd3z7Fy0l09g4yLPwaZeGfU3zp+JLI/vyh+pu27QRoN0ckzPPByNO
	mWw2yZieD6yxPQLqZ72AHmDkq8Si6nEfvWhZnsZSGu4IKJlx80icxvPhkdKJjMmf
	C+P0znTmdcovkywfsnT2Mplic/KYKztLXEcdV2PtITKXgAiZ6t90wZwfftUH1X3I
	1IF0WFfn1k0J+B2ZMR1tBNc+drLGFYDwYLKETg+XwARFFsZnGWMoJ6Dns8LjlR1W
	ttVgmA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vmgcvpx5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 21:04:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7425efba1a3so218278b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 14:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379898; x=1748984698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8gIhfclnLH073VsLY1ttHA/tXRnGUkM9HdwYW3xYCyA=;
        b=jhCFP3sHUfY8moaldvI2G8Ea+wZMoLC5+vyudAJw2Q9RO7wPFWmU4Fs/AqlnZjZgkX
         qAuy2WeE37kLdyXeSbxDHfHH1NZQCIXPkMwryU3L2eFxcXEWX0w1RcmpBNs8BCkAwfT7
         2gIJA8D88TVsDY8DQ/f7eXxKOjbl3Gp3QpVyHzb89g+UQcUXVKw8u6Z9CsP3J9eCIFBf
         qitfq9nGEcv0oN1n8HwkxTJeFe5hEveIj6oHHpJHFw361j/BSJlu0LG2ck8JGxC2XQX1
         61c/YcZ7dW/PM2PPMv1FDuI7ViOXdr0zTBQpvcoxwvoPh/b5n+ZweCCbclLFLgDk6Y3T
         ODIw==
X-Forwarded-Encrypted: i=1; AJvYcCUTNpzuWHDRSozg77vXdd5iCPZve5r8fOSE+XIQ6mwB2NB7eISQE7MkGq+XL8Cs2YVXUbHDIx8I2tk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0nqduHJoyCIzKelkuN6FEUBzK+cxMIkro0iWonVqKteU+RBbA
	OFF9mBn+tLQ/xcFEPczlL2kRqBbnlQalsWAx5e10BDZx+cDRGq9Vado5LWACaycPwyou8JdTjzs
	CIuoiV2me1gKDgg/VzNp954lE8RWUFzouUvk1j6VG3OK5eN6+nFj+CzcKGJM18nw=
X-Gm-Gg: ASbGncsclkj1tZG9yT357rNLyIn502Z28r8Mc0R7a/+dUR9lVgp/qpmE/yphEwLpxaI
	3b67x22WUsV+zWHUC0JJQV2bpKqVl6bT+vTSz/dg0UdtyIh1Y55SULiRwDwvRPoemYwBaMox0qE
	gGiIGdDdusWCRyqZKHDBZWRVe4mU3lXwGG06ZojluvQYufuV2PSA2ldwjN/7GfdeD89MZeyyb49
	XoiXh9zChJp05OUtfFGiTSGM7EqaET9t7kR5U5HXfgxoNNik9luXMdUzimt5+lcZj/y13EtTs86
	1U33e5rqwAif/4fwCp/49OxyfW8F4dznQ/c0Eh4HbYs04enBsPIEa1XqlbNaQKiEXUQ=
X-Received: by 2002:a05:6a00:3ccd:b0:736:4d05:2e35 with SMTP id d2e1a72fcca58-7462eae8737mr2671729b3a.3.1748379898161;
        Tue, 27 May 2025 14:04:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErVuSX8VnhDC5c80QonelHr5ry9GAhDcphlE+t5DRrIAcd4JLsqfnIcR34CNcLszXepePuHg==
X-Received: by 2002:a05:6a00:3ccd:b0:736:4d05:2e35 with SMTP id d2e1a72fcca58-7462eae8737mr2671698b3a.3.1748379897734;
        Tue, 27 May 2025 14:04:57 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7465e64836fsm29167b3a.26.2025.05.27.14.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:04:57 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Tue, 27 May 2025 14:04:39 -0700
Subject: [PATCH v6 03/10] dt-bindings: usb: qcom,dwc3: Correct the SM8750
 compatible
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-sm8750_usb_master-v6-3-d58de3b41d34@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748379891; l=1199;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=NhOsYBi6tADTMUAiHJ0Qk3HAGnZPId0WGmI4bIdXuV8=;
 b=lobSYcFGVwh8sfpUcLjkgbtPofAxzVDKJAfkDY2FUYjTHx3YXT1XBfydR+LmUIt7NbMLEs17M
 4Jec41PnZl5CSCqn6HniNcEqQYvBtscZOhyooMC3wXeStWPigeWIgmT
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-ORIG-GUID: 7DUsFnpO0Ol-E_7mGWY1VgxgBJ_ekncU
X-Proofpoint-GUID: 7DUsFnpO0Ol-E_7mGWY1VgxgBJ_ekncU
X-Authority-Analysis: v=2.4 cv=Ws4rMcfv c=1 sm=1 tr=0 ts=683628fb cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=qiVRAF7mJj4RLuWAUSQA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3NyBTYWx0ZWRfXwD9Gn6Kj/NbW
 oNu9Wpkx5owQgk/13N3PeHK/wPXffVN5lsVVJXCBc3JsqwVg1T6fvJ4RqB9UssPeXqXYOc+ZAub
 0f5Q6SJC9NRA7vB3Mrsc+lCnfdBS8VzZccu8YHICUNUOtq4IuI3LWYWfldHb+TWiDRso/gkfGTp
 N3ViKOXKBpzuvx7TXTnQGWftwFFLd2bDrMKKloa6oOVzzUvA4BwlA8W7TBD0Z0LOm1G2IqgVheZ
 Jc2DnAfsyLbBLuR4Hna/Xziu8g8t48K8vBOPyPsAPOEmaEs4DrE3imiLEUVAgDr/J9IjezSwJkm
 whjPrUHS4YSG0DGYqPkMMwyLeDe81Imz+aMK8FbXe7JNESLjTr/QxHYfx6ptfsU9kDPn9aQ919g
 donosq4zDPD+OGMiFhyQFHMckQNi+ZkI/T5JP3XPfEXlQsMN0MSqi9C9AwKQQbHTLPIwFqUd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxlogscore=435 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270177

SM8750 does not require an XO clock in the dt as it is the
parent of the TCSR refclk_src, so move the compatible to a section
where the XO clock is not required.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index a792434c59db2e6ba2b9b3b8498ca43f0f8d1ec4..298b1472ccbc4cfeb04927da29ea40b9883d03eb 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -227,6 +227,7 @@ allOf:
               - qcom,sdx65-dwc3
               - qcom,sdx75-dwc3
               - qcom,sm6350-dwc3
+              - qcom,sm8750-dwc3
     then:
       properties:
         clocks:
@@ -366,7 +367,6 @@ allOf:
               - qcom,sm8450-dwc3
               - qcom,sm8550-dwc3
               - qcom,sm8650-dwc3
-              - qcom,sm8750-dwc3
     then:
       properties:
         clocks:

-- 
2.48.1



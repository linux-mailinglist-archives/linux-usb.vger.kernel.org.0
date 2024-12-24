Return-Path: <linux-usb+bounces-18770-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B1C9FBAA8
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 09:48:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6DB416673F
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 08:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05271A8F80;
	Tue, 24 Dec 2024 08:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y5BRSDQC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8F219993D
	for <linux-usb@vger.kernel.org>; Tue, 24 Dec 2024 08:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735030003; cv=none; b=IOplasygZovr7DDMJ4IcnOjpKX1Xk0gPMaNjwtzG0m9OLJAyPyU/5dFSk3oDphEkiutzYednMxFAEbfp4ccdwYY9kA9lm+iKl8d+h0LrH0EmbXe2ktipAKUJAN/dIWDrkT0ulboFhtkA7VwKZ4LRpi6hP8opCuhPYQ4vfCbU1F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735030003; c=relaxed/simple;
	bh=W0N4/coitWW0xWo9nsJOENYp9jOBCJOQx3Uafy8U+OU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UDcr+ivAiI8KKRnSmhfxCR3hyusxj/CUK83EtA9cheVuG657EgWOVvlUtaBvyGFg9Fy3pPPVUaA3s/HGTxQl/iTmLVxaRgfmumY0zXd1trkZmmUhj5JduEUt5L/PQfikvcm0GrmsaUdzXFnHa+qWd23L2t/kYmeU1oB+GXIPaUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y5BRSDQC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BO0mLk5027920
	for <linux-usb@vger.kernel.org>; Tue, 24 Dec 2024 08:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=n7Z58j+xEKX
	XWkqjkJYYjOVgfCNeO+sM2+/LbnVc+Ag=; b=Y5BRSDQC3wDVCZxJSt3Z1u67wyw
	jKadBy8SGRiS82CnnUOAXL8D1iKv8pjNB2HY/fryxebSJuiYH+VNFavBFH8nkHZG
	drE10mxhA/OtWNJYj/ypNiLsslDh1icE+7sQHCbutnbGAnwx6k/pQTnYk2ee1kpX
	AV0w1ir638jTRG0W30cEY2jnJTQ2/6/nIaQP8M96d3kvXsAtjFet51mSQopjxXCJ
	KlT7lZTy1Z0/KDdB8tnkFLUM1HGnWr9nu5vAZlepbi+/wZxMNozL2bzEhJSkZ/ju
	1jgnm4PK7T8nGNgPtDILNJ+ue4yzfk1Qz5TFFKSRcytVcmovNbetLaQV7eg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qjqvhqr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 24 Dec 2024 08:46:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2163c2f32fdso81307605ad.2
        for <linux-usb@vger.kernel.org>; Tue, 24 Dec 2024 00:46:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735029999; x=1735634799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n7Z58j+xEKXXWkqjkJYYjOVgfCNeO+sM2+/LbnVc+Ag=;
        b=oWgvMmv2XJx2CDDh4bc05bV1KY9Ep4LLSx9AuwsUfDGqFuMs/J/yJIrU6w2KWUp0hQ
         fUI6h+2ch3otk47NnnIDyVsqwNdqkoDkKuXeIafLtu6Q80ac6ACJkH7k8QaZJhEjtM0K
         Z59/WSQO+Gs3+QPZCho7ce/YD6EK2T97i8fgu8BtJGfbha9FRMc7ng/x8ghuXK0dUD+6
         Kk7qa35LQijHwffKbvOAoJkIYgPfuJRY1kB7vL3oKsgbeLF8qiT7jUl1lB/iMH2pimbU
         5dV4B6OUdZKIuxwE947YQQSi22etNsGpxoPF22a0Ejvy+0pwyQjYN8yycdklKV1dsncf
         fzsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXWhvR05SzQauzxyK98Y/H6xRt6KzCEc+P5QN/K01239t0pVOp/UOLc5YMpfS8S6+cxcvF7cxu88U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWpGwLp6YmSrY38mVC0w7E0gkUfBYz2KiBiohFwm+kusijHZqX
	dphChvRRdHYycw4VsOC8xPa7tO2fGYnAYtcj8cQ9T8g1IFc81gQ8Or3I4KALeVsCgEIqSAWy1Wq
	cRVAQEbbX1A7QOvO2/wCxyd2O8auMq3ffAhXJ1W7qsVcBTMokqzUfiFin1pQ=
X-Gm-Gg: ASbGnctSP5gqwMi3gibsWKmwQsKUuHnbCucB/TQXdOOsvXbw5aPIqi9rbMVkR0Fpf9B
	alEX8WnWid65/ZBeoDmB2KqGoCiiCrXd7Lk/YQuOQsq2KG2tywy8Gv2i+skyu3aIrFZRKAmRRBa
	MOjkiqXzQIlPZq9mhmw704f1Lkj0FWJUtJOwqXJz9R3aP+I53oUe/5CepqYX1shfABesbxePyVh
	qYtbttB64LzfYeQuPrIeo40n/5AgiqvDCYtGkTDGmIdo1etq+g3J6heBJnPSxVzuj6gO5ahNe6Z
	v44vq+8S94O84fOcGOg=
X-Received: by 2002:a17:902:c406:b0:219:cdf1:a0b8 with SMTP id d9443c01a7336-219e6ebb28dmr230534125ad.30.1735029998721;
        Tue, 24 Dec 2024 00:46:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+AYe3lv+lxwHtcSMXIlO0zzvIFAqhtir5DVDaVD4dsPaQwqh+CNLDmptIavydio+z/Bn/XA==
X-Received: by 2002:a17:902:c406:b0:219:cdf1:a0b8 with SMTP id d9443c01a7336-219e6ebb28dmr230533865ad.30.1735029998348;
        Tue, 24 Dec 2024 00:46:38 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f692fsm85471195ad.216.2024.12.24.00.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 00:46:37 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, quic_ppratap@quicinc.com,
        quic_jackp@quicinc.com,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/3] dt-bindings: usb: qcom,dwc3: Add QCS615 to USB DWC3 bindings
Date: Tue, 24 Dec 2024 14:16:19 +0530
Message-Id: <20241224084621.4139021-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241224084621.4139021-1-krishna.kurapati@oss.qualcomm.com>
References: <20241224084621.4139021-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JKAC3t2crFxi4aJGxmG_mfJbyGAS89Lz
X-Proofpoint-GUID: JKAC3t2crFxi4aJGxmG_mfJbyGAS89Lz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=578 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412240072

Update dt-bindings to add primary controller of QCS615 to USB
DWC3 controller list.

Although this controller has a QUSB2 Phy, it belongs to a
generation of SoCs like SDM670/SDM845/SM6350 where DP/DM is
used for wakeup instead of qusb2_phy interrupt.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 98bb82c795d4..8fd02e8aaaa5 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,msm8998-dwc3
           - qcom,qcm2290-dwc3
           - qcom,qcs404-dwc3
+          - qcom,qcs615-dwc3
           - qcom,qcs8300-dwc3
           - qcom,qdu1000-dwc3
           - qcom,sa8775p-dwc3
@@ -341,6 +342,7 @@ allOf:
           contains:
             enum:
               - qcom,qcm2290-dwc3
+              - qcom,qcs615-dwc3
               - qcom,sar2130p-dwc3
               - qcom,sc8180x-dwc3
               - qcom,sc8180x-dwc3-mp
@@ -471,6 +473,7 @@ allOf:
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
               - qcom,msm8994-dwc3
+              - qcom,qcs615-dwc3
               - qcom,qcs8300-dwc3
               - qcom,qdu1000-dwc3
               - qcom,sa8775p-dwc3
-- 
2.34.1



Return-Path: <linux-usb+bounces-23266-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B4FA958A9
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 00:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1393C18968B9
	for <lists+linux-usb@lfdr.de>; Mon, 21 Apr 2025 22:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410D021C161;
	Mon, 21 Apr 2025 22:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L6WRdDE7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470551E261F
	for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 22:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745272835; cv=none; b=i/2jJLUrDMU65OZgLOGZy4DOvbdTK/DCuSaFclOd3DoPtbgpTV1QuYADAu61SQOEkE3ztlhQn9z9UPMmcAS/Tgb9UlvL20ScTQgDbswvuYhLSVjNHeaTMJC9Q6cwExWeSqO1m6JhTx7afbFsdiFqbks7INf4rSU/Ylld3j2ZxbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745272835; c=relaxed/simple;
	bh=/pdn7VV26vHsdyRwPkDqqfr5a2aFBupKx6kIrHY3wNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hc5RLNdc//xkrQSWeT45LO2RXi7Vmdpma1S9sTdqUGh02d2J8vMX/w+JKb8skV2bev+YhCeKkFe9F8v1bt8ZaNlBodldS8UEHgt+CIb0iYSiBDASs+owfvrmnSr/nUZTvobCrTbQxdelIAWq9GlpGlvRuA/z2JXTcsnF9J/wY6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L6WRdDE7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LK43th027952
	for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 22:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uazp880WP4oSz5grWMsfUwvLFejN9KQ7Ij/wBd9lOUk=; b=L6WRdDE7droB3o9E
	B04i06qODKi7BaJnrV5JDgmzyap7qPuQpEledEvraihkC4zlBRCKs8FY5w1OSveE
	VxIh27XA0rRHsCENI8FTGCeNxi2gRIsWhoOCIS+cFgl0TGXvRomDcQalPnbvivEJ
	cCUTxbFKaMmoOd2N7UHBtc/5a8d6/0b+hKsV5InABEigbyb+mRL/hYxfUI8tt86S
	MuzTQawzDnGrZVN9zwmP7O2uZrwP8GUEJ3NlT0xmcGmeBJq7TWtkS19z0FJ2+7Rt
	f65X3v+bN/ElDmRcYy0V0AyvdrEc6DK5P+LO2ZgtHOm1/os+Arj52zwyYTufFPCA
	VeVZ1Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4643wwneyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 22:00:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736fff82264so3331558b3a.1
        for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 15:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745272831; x=1745877631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uazp880WP4oSz5grWMsfUwvLFejN9KQ7Ij/wBd9lOUk=;
        b=TNeFNzc+mZ6tKmDZHmGGVfMzOm6gFEBL8lWSNo5uKswidDCGe/CknCJ/A8wRtesE0F
         Q9xLaC1960SmKjMJYZ8OcObaUfZEvSpCT61ouDhp5Tz57uB0ALEasdPggJhoBhk9zWWp
         d2gSXLkLHN/hwZPmlLg56xr3bBOJE0K+o1Kf3RjDtz2+3J5vxeWnIqLQ3bUuDupXuvQ+
         VvY3j62ngdD0bh3iL+qyC4YRg86MFw8jSy1RUoTTexC8F2VpXBE6SmmZursCuUWEdox4
         BGeZOW93UemhNTCpxFpZbZDwNaVUNlthR+P0V9h3WWtTYhAErMGdp2JaRxuY6jEgbZS1
         igLQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8urUuvYd6gd0sCwaEmBbj766EuRVE6AfmrTkApEcWgcB3NsSW9Tn6/EVUju6K/q/dJzG/1C7u/7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVh2G1akx1yOabqeAyG9TTR0IQKBYKOu09yOSRhdArl/Z937q7
	cwOwQPjBI/zKJAb3NiFbK2sPU01Y5r6F8QdySqhffG5K75NyTzjqOx7aM51NkGMKFfcJlDgJIEJ
	N/8/jkHj1frK725J/f4zH+UdfVZ0GDDUN1tS5Fg3/Ald3JDiT152rYWB99g0=
X-Gm-Gg: ASbGncvEDBAKihJqdZcnhxaOwhCytPnA7sYuFR0b0WE1Xx2eFtSR7bz/V1GBY4i2Hka
	K85e52sEcD6bVBW6t4L2RxR3dGIWY+RhioyUCRSbZNnOWr6XVPZh4V8GuV1oGkqQnoxTNOpjb1o
	3r2t6Fpp2+idnQlGoG85Cbcr8jBVrm74V49I/w4Unwa0Gyr8usYvfekChtHQQgVGT5JfhcJokbT
	qTEFv7DF5mieQJUC4lyeqhGJzh66bIClbAysWeqMz0yPr9SvVJwLyHwte7HqFivVswcUO0bIIeD
	NgRjqw/o/gR9+Rl0pmR969/vVrVHvVjR5klGw22i6zKqYs7G/Dzi58kb3c5F8srDFjs=
X-Received: by 2002:a05:6a00:3a0b:b0:736:b400:b58f with SMTP id d2e1a72fcca58-73dbe33a010mr20742278b3a.0.1745272831504;
        Mon, 21 Apr 2025 15:00:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd2JaFZ5xayiBayYrxFjaq77QJEeo7B+ROQTO4klSPnHDNhSnBxzHPeGDowAOPB7q2goChHg==
X-Received: by 2002:a05:6a00:3a0b:b0:736:b400:b58f with SMTP id d2e1a72fcca58-73dbe33a010mr20742217b3a.0.1745272830983;
        Mon, 21 Apr 2025 15:00:30 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c04c5sm7107917b3a.24.2025.04.21.15.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 15:00:30 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 21 Apr 2025 15:00:10 -0700
Subject: [PATCH v5 03/10] dt-bindings: usb: qcom,dwc3: Correct the SM8750
 compatible
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-sm8750_usb_master-v5-3-25c79ed01d02@oss.qualcomm.com>
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
        Melody Olvera <melody.olvera@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745272824; l=1135;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=/pdn7VV26vHsdyRwPkDqqfr5a2aFBupKx6kIrHY3wNI=;
 b=OAqbWj2tMbT4LgbPTEZ+OhAfWcf4RBdXsny37UizI+Wabc/Oo8AxHA53vPNaePdUIDjUrBa7P
 7DF7jHYD2JyAUiE6QUvCqENTZL2NqByI0QPi/nizK8adtYPYXfTumae
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=IpEecK/g c=1 sm=1 tr=0 ts=6806c000 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=Y21Hm-oE12uJT_c86xsA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: fbuL4aMFpnIvSOmiQZPnPllvtiPk8u_e
X-Proofpoint-ORIG-GUID: fbuL4aMFpnIvSOmiQZPnPllvtiPk8u_e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_10,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=413
 impostorscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504210172

SM8750 does not require an XO clock in the dt as it is the
parent of the TCSR refclk_src, so move the compatible to a section
where the XO clock is not required.

Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index a681208616f3a260086cff5a28dc23d35bd96f9a..ccf4f505913b0eea12e7cd58958b43013451f46f 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -216,6 +216,7 @@ allOf:
               - qcom,sdx65-dwc3
               - qcom,sdx75-dwc3
               - qcom,sm6350-dwc3
+              - qcom,sm8750-dwc3
     then:
       properties:
         clocks:
@@ -355,7 +356,6 @@ allOf:
               - qcom,sm8450-dwc3
               - qcom,sm8550-dwc3
               - qcom,sm8650-dwc3
-              - qcom,sm8750-dwc3
     then:
       properties:
         clocks:

-- 
2.48.1



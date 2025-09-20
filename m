Return-Path: <linux-usb+bounces-28352-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 701C2B8BE07
	for <lists+linux-usb@lfdr.de>; Sat, 20 Sep 2025 05:21:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B191B17A001
	for <lists+linux-usb@lfdr.de>; Sat, 20 Sep 2025 03:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34C522D7B9;
	Sat, 20 Sep 2025 03:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R/Zf1bqJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A93225A34
	for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 03:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758338480; cv=none; b=OplxeiKrQEnQPTwIdvraAofz9545ZaFrlSblQRkIala32THzBpaQzEdlukdpNjQ6TPEKuElDm5y3YAKrLtDBmji2jAXcI8wRPN4LOhRQ1IJMZACB9x7LGPQjPEitg/mVadOeJsld2rs5mUbfc9yiA9qYMZA7typ/yZ6a6IOO/oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758338480; c=relaxed/simple;
	bh=FChmN2K25IEif5KaRFlunR0xe4GViKFxw/PGab+7yIw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VSYTZkDMJX//RBylJmnCHtJ6Rh/vH8V2fCudqN3f2+lTjmTZILDL8Onl7SNZtIjvuQDl5gBvZdruujFE1D84KCrqW9sdSSoC36yrzAUMA+r8rkoFBXuBVAoMl3TzjrUxMo0dxpZaJrSb7ZTZlrtMXWOKW6M8BULyntySK6EW4hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R/Zf1bqJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58K3FXmC000527
	for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 03:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=v5tmMdZXUOm
	Jw/ggIyYVsmTSYyBwUp+iA2AluiqlOBQ=; b=R/Zf1bqJRVVYzeOtR0sjwOUS/v3
	IGwo1v+5nWeo5+Lb7GTgNTJNAHDVDGVdfhI0xllGRsk6CDB03tQWalWi+0IKlGAf
	2SPbTEofHdOigiA3PSqwPzdBFtIH33Q24q7Ibrnhc5bYMQ1mCca6FA1lzdhOyRwB
	l2drZvOYXJI8BhGJI4H590RH+ckv2lkm/gqbw4soyrlr9aeGT7Tj14I52DS5AdZ3
	bQ2HPh3+MiPuxn9oEYdmlfFQ/zFeYkww0VZl0PnzSVuhC1Af7105vXss2m1hqzHI
	ZTzhuTyZ4O6SwlMSkQBXeCoPT9GLgGs2orf2DzGB95XjlDI82xKW/Jk2giA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmng8me-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 03:21:17 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7761dc1b36dso5173822b3a.1
        for <linux-usb@vger.kernel.org>; Fri, 19 Sep 2025 20:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758338476; x=1758943276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5tmMdZXUOmJw/ggIyYVsmTSYyBwUp+iA2AluiqlOBQ=;
        b=p1HfMK276igQDxiGQPh1I77Rv1TEgKyIgxfQBTid47pA40J2fEXQLw3VMyP1iMKmkS
         KhSOE+6ihfjVXhMijDVffkuR9PZyC8hg4lm211YBxGULrzFLWbc/AfOuz5aDhTqTZ1q4
         DiQNsXc03OHZjFaySFXV6XchIEpFygFbvHTDsiL/56jPkvar1H4jqP4xk0PjduEagMeb
         fDw8XJkP+f4NJFyZWH8FVC57ViOdXy93a36PdiKGe71S/CXw85xjAnAZCJn8vzXWHk/E
         WXT6ayQNnTPEuMsPG7E6sdnAt+PcJyC3T4IAUvIyKvkPmkyfwO/NM6FrUoD1sXJC72rX
         OAag==
X-Forwarded-Encrypted: i=1; AJvYcCWZYuTM3pkNrbhBb+dqmZ/UngPoc7JMfO2YaUcX7O4wtThpBb3+JCSyWwpWUv2weFoz73J62LerZBM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF7Cd3YTFoO4Itj5OjMJfEivMuFXi9NqN5uq8xwwVBI3YIXcga
	hI65g1MUp/TNYyWdxCkWA9AXHbd5yZd03IKtCljeAupDHJ+HIuQsgA0FobXeCwm4bfkAzx9NOmR
	4JLy3KsPWPuYIdDjdkYDVPo9Lir5w9VYNTAzlc637JaL/GgAMrpSkiuyoEn8zJJw=
X-Gm-Gg: ASbGncsNrmyqfDbvxzZomZ4RbcEIox8VrbaIQ72/XU8B2egCAkNWEGJq8LVxLc+QOA8
	q9p6TxOGWNZE10TCJpWGtEobU2A6o8dX+V/x3qMxG3hvHZzE25+64Ak/JuogijCdtKnDLL6cOXh
	rLzIvQWyqbkJUsQU8kvmbzQC7NVmjDpoGSnlXB4ZfTfFLCvWEuZbnHP6YCdzu4sAddcZmUHWX10
	DDpMyNN+Escvh9atEck2OrFEJ5CFkdWT3NKo1cpEgc83yxwp5bUaB8y/gZoLLsfjPJL38mbDGpk
	qJYWLXctJIdbp6QLPE0NcabgYMctxXsrCc3rJMwSLyZuuyG79Xa8ViaerCo6vIxJE+wYhjLXcX2
	Pvadz9UvnZuCHv8Zj
X-Received: by 2002:a05:6a20:2444:b0:24e:2cee:9585 with SMTP id adf61e73a8af0-29274fb33c5mr8251254637.54.1758338476472;
        Fri, 19 Sep 2025 20:21:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOqZ5VhtjKbilxthQa6bXSwR4zCDyXQKASkb4d3QLk2LNVbpxHxAtIPLoxjj1rAPuc1i5rzQ==
X-Received: by 2002:a05:6a20:2444:b0:24e:2cee:9585 with SMTP id adf61e73a8af0-29274fb33c5mr8251223637.54.1758338476056;
        Fri, 19 Sep 2025 20:21:16 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff448058sm6178807a12.54.2025.09.19.20.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 20:21:15 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH 2/9] dt-bindings: phy: qcom,qmp-usb: Add Glymur USB UNI PHY compatible
Date: Fri, 19 Sep 2025 20:21:01 -0700
Message-Id: <20250920032108.242643-3-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
References: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68ce1dad cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=6ooe3h3ZW61ma_5lk_AA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: lz1tdDMaoQuoWA2CoWIwMYt9CRvRAwD1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX+yvQLREZ9JYZ
 Po+ncfNjKxuHnpOjiIoniZK5VChe7fYPVxQKpV4mXzvbukG4VK7XtQ6u1wsJWrk75nW3p55yGSu
 Bg3DQqCoALZRDbyCEzdbcjrsYfr2itVC6ciEeUNpT7IA5mXvGoW7P8WChfSjxipfFGjLmqlDOau
 6YsKvMJS/bzVLsXOPAq7y3yMr06UM+wWF5o55W3QhxAMjGL6Lq8Ts8rQj2ApMMey3hyZyLUOpW7
 u2v9+jcJ9TNJGoIWN7dZq35ZPbJUVVxz//l1gC7OhnIItz5q4WDgMyxv3wZeKEuYbvcNmRY2/1k
 /Fg26MGDeWGMQyFNDi5jLuzE5v44syFo9K2IN3juTLhq/Nuoac+BkxSM6M7ra76CzT6MoMsCfO5
 cy7MGmCn
X-Proofpoint-GUID: lz1tdDMaoQuoWA2CoWIwMYt9CRvRAwD1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1011 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

The Glymur USB subsystem contains a multiport controller, which utilizes
two QMP UNI PHYs.  Add the proper compatible string for the Glymur SoC.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml       | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index a1b55168e050..772a727a5462 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,glymur-qmp-usb3-uni-phy
       - qcom,ipq5424-qmp-usb3-phy
       - qcom,ipq6018-qmp-usb3-phy
       - qcom,ipq8074-qmp-usb3-phy
@@ -62,6 +63,8 @@ properties:
 
   vdda-pll-supply: true
 
+  refgen-supply: true
+
   "#clock-cells":
     const: 0
 
@@ -139,6 +142,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-qmp-usb3-uni-phy
               - qcom,sdm845-qmp-usb3-uni-phy
     then:
       properties:
@@ -147,7 +151,7 @@ allOf:
         clock-names:
           items:
             - const: aux
-            - const: cfg_ahb
+            - enum: [cfg_ahb, clkref]
             - const: ref
             - const: com_aux
             - const: pipe
@@ -157,6 +161,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-qmp-usb3-uni-phy
               - qcom,sa8775p-qmp-usb3-uni-phy
               - qcom,sc8180x-qmp-usb3-uni-phy
               - qcom,sc8280xp-qmp-usb3-uni-phy


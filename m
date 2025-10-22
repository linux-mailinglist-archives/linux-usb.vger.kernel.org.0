Return-Path: <linux-usb+bounces-29507-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D26BFA538
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 08:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E898A3AC5EB
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 06:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E6C2F361D;
	Wed, 22 Oct 2025 06:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MMgqM8N9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B752F28E3
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 06:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761115836; cv=none; b=KXvdYUza7fh6xA6Kia/6OqtCBXeukKj1ImuqMdMR3yPA9PV7qveb2uUCE3yvuaW0LsfW2Cra97eROO7ZuDn+K8CT3GGwzrgZpaZMjuVtFJodIP0+DLi+DR3Ea0VAjaItt8VtcqoBCDwkCiH7OsBvric7VUcIfsb7hPPS7rVtjFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761115836; c=relaxed/simple;
	bh=bMveLn8qXGEXMOOXqLmYG2oX6+KBs0Vzyv7XgzdwA4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q9gPNYXy1mxJATESAgg4WTJmRXlG2ilgReorDT31jmSSrgwiR1UXS+y1rHiumzOrqwTCJUqzothVWFiSRSfGr3ua8gMMLobMMPFX31UIfbLPehXdQxewx4Eapu0gWr4Bhrqb5z32pJk0cRsvFcqQHz6v8tjkiXBq/YjGlAQmSa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MMgqM8N9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M3TQml026973
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 06:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GfF19aO8xny9L39JuzD8Gu3or8NnMTbYbN7iD67kX3Q=; b=MMgqM8N92f10wjjQ
	3hWg5vMx/IFvH7roUEaeSLuVfeAkuliOuRgyNytcolmYTgqk5T72Bgp/T/M94S2l
	5Ne/uJKCur3t1nDuzHpzsaDlf3JJSQ2ZWJQSejrPpe7L4lPyEsF2sF/+vrSxU2w8
	zodJbSJ5RvLCQ3rscebtK9D+igwahWDhuK1ccx/KEnsibVXxtQdyT7ly6KJ4E9wy
	78oREBay6JoavJi4tH6GaIPwNGwmTMUGUfSbHankmXC8zbSwy1YBmH3uzyTiAuMh
	+2whizrPlDJd97JOrq5cT1Dr4iKXUdLI45YuBtWaWZA/Q4Dc7FFg4tf8/eLlNeRt
	7j385g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pkssv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 06:50:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33d8970ae47so3757620a91.1
        for <linux-usb@vger.kernel.org>; Tue, 21 Oct 2025 23:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761115832; x=1761720632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfF19aO8xny9L39JuzD8Gu3or8NnMTbYbN7iD67kX3Q=;
        b=DczhB0FnXMdiDyjDuEtilcPQxrH3dORht50CU4u0AenVoRWz9rnn4z65nYKUqLYvM4
         qs+q9RbRYB0KsvFX2ix4bCvqt6e0Rt4bPl1H7wnpcKriylOTkWirU5PdBn2xHwQh6wZG
         01pM3HiIxKVPl5RBxoXjjMsMg3BHpq12JSUD3orRg24YgEXKdvaw5lRsq1ZzDg9TwSkr
         /14ExXEWBvynhY3vx1uNA/aX5K9Rm/Ix831cvHsOawfw0bub1kMDcDHQ6u/AIYNqwyt3
         dNO2FX1ZbcE2naM7+Sh3y6K8ztPmEoELVC9AZqN6qXH6PZyAnKnMX2HDOKyzKJl2mKpt
         z0Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWyGRNP1WjE1AgnCZ4y1GvlpLNyfWDZRKdSGGs9oKaot1wekp2NONWpcYbt6JK+mZfp6D2w9lcJcGM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWVe+ZGOw5Fe+oHVwHA+KVUr1V/b0Sqashf41tMu4mEHi/sALR
	iLWIB8Ryrc/eJrTl5Luy8PQ+hHO8/GsrXdCjBZL+DaRnzT6N2EeS7R339EFnQT7EKrdisGhmb0e
	uzF67MLsW8ZBx7o1aTdjqcFMoQ8xU1SB/ApiHRoOQOytzuCYxOkaMCJYBrTu4yqU=
X-Gm-Gg: ASbGncsHSbf5n3ATDUdVPItZoSH8MF5cBqgHckm7hdQExVtYdLdQmZEjea/dfwX1my9
	y6aCZJRE82QOgsvpAwR0k0PcsdJqRVed18Uwql7H2m0cIp34UPtNsy6SqrDJjtM5aHM3mOA/8n4
	geBvWqIAPVDIRFIkFWJvDE4/Q5qwdjClutx0UhNIek+CU6bEd0vuF4Oi+esLGU8KwEcAjzAf6Ch
	B+tqjvFmEdgI6+r8wdTeihVgDloGvgG1mS2UTbsZJOmV7o2q+8qkqW4nrr2T75iF7RThaULoCO6
	NdhXQ6iu+1caZMzY7M1emtsdTb8XTJt/93IplrtBnV8TlsrVk+u4BJ/ql29+j+nPpb4co2PGqHo
	LIcbjcfxpTfdQp5QpvNZ/aXjN9D+wfmat/2IcGcKp/XRl3GPHtA==
X-Received: by 2002:a17:90b:2d8f:b0:339:f09b:d36f with SMTP id 98e67ed59e1d1-33bcf8f8ca4mr24582323a91.28.1761115832268;
        Tue, 21 Oct 2025 23:50:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyOzdwa6M6+VonTKVpn/1dRGshyVGeAEj3HtpwTzivtN28WxG1KsX0bk+9YqsiFARG7CtuNQ==
X-Received: by 2002:a17:90b:2d8f:b0:339:f09b:d36f with SMTP id 98e67ed59e1d1-33bcf8f8ca4mr24582286a91.28.1761115831768;
        Tue, 21 Oct 2025 23:50:31 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223e334fsm1560285a91.8.2025.10.21.23.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 23:50:31 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 23:50:27 -0700
Subject: [PATCH v2 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Add Kaanapali QMP PHY
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-knp-usb-v2-1-a2809fffcfab@oss.qualcomm.com>
References: <20251021-knp-usb-v2-0-a2809fffcfab@oss.qualcomm.com>
In-Reply-To: <20251021-knp-usb-v2-0-a2809fffcfab@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761115829; l=3168;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=wyxSRIp6b2YrRKpZKlLcX2lrCBRNwJtuTyhh+0I06cw=;
 b=WfGOp1rFR/PQ0DC7AXBJXKQ5YWGLmn3QByRcDCNfXH+p43IEdWO+k1Zkx/lfO5PztnyG3o4bN
 dSW/2yFfwZTC6ouw9RtmFBhOxE1Faix6EtiB3S19NbYSpwSTKzdKx3g
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX9jXKP/OCkQ60
 iyYj4FbB4x5wJFEnZku/P2IcGDU5b9mac4jn4xZzmy24aBfQZ3HcqfZ4lAMdxss4YCewYT23ufe
 evY8iBkYJdCsOR2ryVZm1YajkzY8DMVuIA9KVwrTIRl01VPofQbIQBXtVBXzTgZyjR140arfEzO
 /R7KWOje2wA5t5ZeJkBgnLqAEDl4nnitldBnbylzqGzmh+tzQnsncB1m6ojy2q5wZZpYzoyVvNp
 SZOVnU6PeJzH5JIGJMJHXHtlaL8sG9JQG2t7eicvdRqQUZJb4MCtRqtCjdAxj8x01yTdmZ5poCk
 2a8cURDWLvpunSxU9agNK+XjTSTuP6bdk9Jc5WXDVI4dFsjrMkyTqTg+NijDpRluBFhs94dJwiM
 WGb9xzbXKYxaCRDPw5lPgkJDUmQejQ==
X-Proofpoint-GUID: gUbIl7GLc6TlY6SCIXhedu3aNvKa8mwn
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f87eb9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=2IkYd7TCTIqYiAcLhPQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: gUbIl7GLc6TlY6SCIXhedu3aNvKa8mwn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>

Document QMP combo PHY for Kaanapali. Use fallback to indicate the
compatibility of the QMP PHY on the Kaanapali with that on the SM8750.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 54 ++++++++++++----------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index c8bc512df08b..8fa919ea3318 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -15,22 +15,27 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,sar2130p-qmp-usb3-dp-phy
-      - qcom,sc7180-qmp-usb3-dp-phy
-      - qcom,sc7280-qmp-usb3-dp-phy
-      - qcom,sc8180x-qmp-usb3-dp-phy
-      - qcom,sc8280xp-qmp-usb43dp-phy
-      - qcom,sdm845-qmp-usb3-dp-phy
-      - qcom,sm6350-qmp-usb3-dp-phy
-      - qcom,sm8150-qmp-usb3-dp-phy
-      - qcom,sm8250-qmp-usb3-dp-phy
-      - qcom,sm8350-qmp-usb3-dp-phy
-      - qcom,sm8450-qmp-usb3-dp-phy
-      - qcom,sm8550-qmp-usb3-dp-phy
-      - qcom,sm8650-qmp-usb3-dp-phy
-      - qcom,sm8750-qmp-usb3-dp-phy
-      - qcom,x1e80100-qmp-usb3-dp-phy
+    oneOf:
+      - items:
+          - enum:
+              - qcom,kaanapali-qmp-usb3-dp-phy
+          - const: qcom,sm8750-qmp-usb3-dp-phy
+      - enum:
+          - qcom,sar2130p-qmp-usb3-dp-phy
+          - qcom,sc7180-qmp-usb3-dp-phy
+          - qcom,sc7280-qmp-usb3-dp-phy
+          - qcom,sc8180x-qmp-usb3-dp-phy
+          - qcom,sc8280xp-qmp-usb43dp-phy
+          - qcom,sdm845-qmp-usb3-dp-phy
+          - qcom,sm6350-qmp-usb3-dp-phy
+          - qcom,sm8150-qmp-usb3-dp-phy
+          - qcom,sm8250-qmp-usb3-dp-phy
+          - qcom,sm8350-qmp-usb3-dp-phy
+          - qcom,sm8450-qmp-usb3-dp-phy
+          - qcom,sm8550-qmp-usb3-dp-phy
+          - qcom,sm8650-qmp-usb3-dp-phy
+          - qcom,sm8750-qmp-usb3-dp-phy
+          - qcom,x1e80100-qmp-usb3-dp-phy
 
   reg:
     maxItems: 1
@@ -127,14 +132,15 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sar2130p-qmp-usb3-dp-phy
-            - qcom,sc8280xp-qmp-usb43dp-phy
-            - qcom,sm6350-qmp-usb3-dp-phy
-            - qcom,sm8550-qmp-usb3-dp-phy
-            - qcom,sm8650-qmp-usb3-dp-phy
-            - qcom,sm8750-qmp-usb3-dp-phy
-            - qcom,x1e80100-qmp-usb3-dp-phy
+          contains:
+            enum:
+              - qcom,sar2130p-qmp-usb3-dp-phy
+              - qcom,sc8280xp-qmp-usb43dp-phy
+              - qcom,sm6350-qmp-usb3-dp-phy
+              - qcom,sm8550-qmp-usb3-dp-phy
+              - qcom,sm8650-qmp-usb3-dp-phy
+              - qcom,sm8750-qmp-usb3-dp-phy
+              - qcom,x1e80100-qmp-usb3-dp-phy
     then:
       required:
         - power-domains

-- 
2.25.1



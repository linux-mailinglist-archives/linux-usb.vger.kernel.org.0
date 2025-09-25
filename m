Return-Path: <linux-usb+bounces-28652-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C36B9D294
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 04:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4CF2427380
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 02:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53EA82E7F02;
	Thu, 25 Sep 2025 02:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NU3C+jqN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B272E54BE
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758767339; cv=none; b=EGrYvz5IKkwQLvzX7Qgj10fl9fqRstykq03pESFYlXRlDAwP67ncy0bxHIuk/Uf9YnbYvpbWa8abyh2GaySoYXdK5YabcKecj+e2F2uwxcygLGU1kj3YFocQoWOxbnJM6NQu5wkIVjbME8DLHXODJf5RUiwh77r9gSiz52ZfsM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758767339; c=relaxed/simple;
	bh=hRao4UrERcNdb8WEbncfpT8mndQ9UcxF3KEWBpC5u2Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O8+a36kh5w3zZ6d0tUVnHwYnbpO+Lv9q7oIkXBAAHDfe15lKohpkhRswlIUpwEVnlTiGVpftT0v8ScjsIiuxbV1NPZjMl2xp3rNxcungqtI+SyQZzxZoRtRDAZNF19ke5Gz6CzQqXy3wLRBrBzKanDVdTRLT8xnQh6gFCCyWWY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NU3C+jqN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0HjaL021489
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Xn4sEHzNAa+
	rFACXl1zYTLnQ9MM2kFlvsIN0wm59uEQ=; b=NU3C+jqNPZacV30BvLQjAJXyLUa
	Ha9UuAi21OPzL78F4peQ7R2+UpVCyq8q/RqMUrFUVZrlPTuRWRHSmou8CP/JoRlo
	GvyhSdpbulTjrwiyie7YNASuENxa73PmvIMylnmH9qetR3PBZzlovik4X+jupowx
	NNKIiODvep37KvZ1BzKIqGhrftqbvZSsb1y6aadu8LXLOoVlbdAUrQl/OF2B3CdC
	xdv3CPEUxs/aUseEejWTRyW9VOLVlCfch+i1aWoSxMStywL8JbiVIYygW64AjGa+
	/j/IpptsWSvMGYsPllwhsX6abcjP3I8wdstjVb1MAB0B+u1rNpKUycI/Z6g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budae0cc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:28:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33428befc08so890856a91.2
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 19:28:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758767336; x=1759372136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xn4sEHzNAa+rFACXl1zYTLnQ9MM2kFlvsIN0wm59uEQ=;
        b=Tj3bNZKTkYHgFgSZwUf1+QzHNV31RXv0MpilUAiSp7N3pGq1rhosHnz5oJA/MhjRjR
         e3e5qEIiwanETLrWgXalJFAUKgSexYuGJEbVIDn32RioHY+FkxrvGSLPwThKouzVlVMb
         a6fND5oPn3k0BLohpEKYAt27zOOf+inEyU/M8ZdFSVpZmHK8yCofW+Nh0IXrsJOqxpIr
         9GaGFxYkqy9u4u9ZDMnuS8DIzo4QFhZhyJgFxnqY6FZAzbIFDgbGc8m6Zrrt1cYJ3D4F
         KyyVTju4NSZ0AUBMa+motU8nXBZ7V5IQyK5EIGFmrgW9AjLNzADj6muRPc0/P+woAyr+
         V4Ig==
X-Forwarded-Encrypted: i=1; AJvYcCXhuPkCMQgXqn0O5ZChxpRsq065KxsyCa5VRpfeuSBfpUtE8ZGWQrztowaZlpLuUQNVNRSVCvv2OcY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoE1dOnjoHIe081QHEe4phtwXVn2jF6V53MnuJ95puaMtEUUAt
	Z72Z0IKuFHLSmNv4USt3wpm5CR2NuBALgo2KNCFI8dQ0hhUNsbKTv4n06MnYFuh9k+P7FAreS1E
	+2LmCTmKxlkBaIkHCv0szHMpj7DqbaGBcDNZXY5oMj7/OYbzHOh4e1Ek/L/JmsiY=
X-Gm-Gg: ASbGncuJRPTJxeBsnzvLodNjjmdSU/0rEeez3C0OA25saw7s8NQgu8wwSS4A3DviDay
	PGYMnHFDC6aIGj/e93kZjqiLgXxKgE1LI1BaFWRny7Bd6UMJs+Pb8fSR7ycabRiZuDRI8WoC/mk
	6t4nkSuUIKmcTgtHTpcXbMRm/5xymVztJhrFrNRoiSutv/hK/xhtH8FyMtUlqXfwpLz28+IZVYE
	0Ods6aKUz4s6qq6SONWBntcdK+AFuP2Q8Psh2dAxb/Ns7HDU7pGWuyWZe0BW1LiQs71CnvhvV7b
	mCLOmqP7VPZepkkCGhFBdJrmSVxFQ1emejwfbRyCV0uzZjxzWFX6Kick1bDMWImXNytUxEvi86r
	lgVbW/QtfUPWAEf/B
X-Received: by 2002:a17:90b:4c86:b0:32b:623d:ee91 with SMTP id 98e67ed59e1d1-3342a79339cmr1495554a91.27.1758767335542;
        Wed, 24 Sep 2025 19:28:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgXeMBQTVJUw09Ed16G9vpiBcqbEqjObxvR8uAyaAS4aBdffTCSPvxaIOoG4hdBmWBMeZxSQ==
X-Received: by 2002:a17:90b:4c86:b0:32b:623d:ee91 with SMTP id 98e67ed59e1d1-3342a79339cmr1495526a91.27.1758767335040;
        Wed, 24 Sep 2025 19:28:55 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33471d711ecsm499881a91.4.2025.09.24.19.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:28:54 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v3 01/10] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Glymur compatible
Date: Wed, 24 Sep 2025 19:28:41 -0700
Message-Id: <20250925022850.4133013-2-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
References: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5GhGAB4JNUSoiLH04nXZTAC2Wv7BesaI
X-Proofpoint-ORIG-GUID: 5GhGAB4JNUSoiLH04nXZTAC2Wv7BesaI
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d4a8e8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=tYbxrAoMRz_Rh0uxvwoA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfXz/oB/o2fgbAr
 Zy/LeQqdTALRSc5dPkYLmlTSZQ8/FcynPrQC7dAJjhMt9qbtqQFcs35b/hbhPV05IVanokQqBC1
 57iccBJDKpa42Ee8U3X9v5IJtS9fR1Q7RLQJK19+gIKHJ0lyYzr/qjXxdkFixKEwLt6M9KUqNDT
 TA+jP09E0UddOivAWhBERV3PO6SEbvv5qyaRZe1LuAX7Qb2x7bRMYuKwieuRuEbIq4+AyuygtM6
 wnQs3RHZ79+rd09WT6tkNuMBkqkUE7vIQjylcSkjyJF5Lv+2cqDyjAq6uyv3OnUE5c35/7ZNFG7
 Br4+5m/8RFIiDEdiV5gvJvS8IWo7pQXuM3bfFoszPlw9316NgwmV4sSGx67SNzMdw4ATvy1iWo0
 yn/6ZkHH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113

Define a Glymur compatible string for the QMP PHY combo driver, along with
resource requirements.  Add a different identifier for the primary QMP PHY
instance as it does not require a clkref entry.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index c8bc512df08b..2f1f41b64bbd 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,glymur-qmp-usb3-dp-phy
       - qcom,sar2130p-qmp-usb3-dp-phy
       - qcom,sc7180-qmp-usb3-dp-phy
       - qcom,sc7280-qmp-usb3-dp-phy
@@ -46,7 +47,7 @@ properties:
       - const: ref
       - const: com_aux
       - const: usb3_pipe
-      - const: cfg_ahb
+      - enum: [cfg_ahb, clkref]
 
   power-domains:
     maxItems: 1
@@ -63,6 +64,8 @@ properties:
 
   vdda-pll-supply: true
 
+  refgen-supply: true
+
   "#clock-cells":
     const: 1
     description:
@@ -109,6 +112,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,glymur-qmp-usb3-dp-phy
             - qcom,sc7180-qmp-usb3-dp-phy
             - qcom,sdm845-qmp-usb3-dp-phy
     then:
@@ -128,6 +132,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,glymur-qmp-usb3-dp-phy
             - qcom,sar2130p-qmp-usb3-dp-phy
             - qcom,sc8280xp-qmp-usb43dp-phy
             - qcom,sm6350-qmp-usb3-dp-phy
@@ -142,6 +147,18 @@ allOf:
       properties:
         power-domains: false
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,glymur-qmp-usb3-dp-phy
+    then:
+      required:
+        - refgen-supply
+    else:
+      properties:
+        refgen-supply: false
+
 additionalProperties: false
 
 examples:


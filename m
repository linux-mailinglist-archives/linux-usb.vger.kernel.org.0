Return-Path: <linux-usb+bounces-29637-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D49C085FC
	for <lists+linux-usb@lfdr.de>; Sat, 25 Oct 2025 02:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5EC4C35533A
	for <lists+linux-usb@lfdr.de>; Sat, 25 Oct 2025 00:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 141D120311;
	Sat, 25 Oct 2025 00:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B2bqQIeQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ED62F4A
	for <linux-usb@vger.kernel.org>; Sat, 25 Oct 2025 00:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761351020; cv=none; b=oGUZi4wn/Yk9LrSSQoNzUTLQYXYpKX/mIDneEhOqySlJ0EffGZoG+gQzbuEF/MUBmyfiUlmjKC0xEAZnxdUCBkApW5IVSDv+DNaXda39g662/iMqEjfVQ4XaHoUOZMLS79IBi/zYyDK7VkD5cl/cNIbRO84o+GFxH2y/Rj9tmzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761351020; c=relaxed/simple;
	bh=8PnTazA4dzV2y9nHuOhCjNJe3e82OR5ccqp936rFihg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=SSyWe1mW2WuUwAcppL6TOUDvN8zxYMrCkVR6HfRYxje2bPGDmC3S10so0klP9pmN7UgtnwTyAzdsQg434Tp9nlAW2XL1YaV10cmTzGJZ7stXg3wwtEDRxwBAbfGGgyucy0jXKK+tBWgfcoQ0M3HMeOb/iYFS+PVnHjtvuwmeR2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B2bqQIeQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OI9JM2003119
	for <linux-usb@vger.kernel.org>; Sat, 25 Oct 2025 00:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ANsLFbLhxWAijrZcc2ERGH
	28beR1/GNXIV7Rze9qcn8=; b=B2bqQIeQ6bU/64Y0+jVb8+csXbc35aBVVytB1Z
	3uRBzPpweYI/aGGCkl30cW9lrTgsvRKjOMgN9H4LF+0/OLhDWMkZhMgqCc4dc680
	rkt/TGtd5/KzxNQpTeYmuMh/fFf7ybLLxfW/xdtBKtxXGlsn8YcdaQy3ECluK4hB
	EZQGC/HRbwtsCJg4usV7opAWzwi2qfmTKaugZpjKhS46X5+Ri2A3XWZrCuezCtpa
	cc6rvTBckqQyZNuNZ4qQIlE43DyUAzRCA+lS+jWto/6tS+gH1jLeKvayA8msBSFa
	cXTXGpLpf4ax0avw2hYErZbA3r9qb3BpSm79yLG7B77Ayy3g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y524frjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 25 Oct 2025 00:10:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3304def7909so2085852a91.3
        for <linux-usb@vger.kernel.org>; Fri, 24 Oct 2025 17:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351017; x=1761955817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ANsLFbLhxWAijrZcc2ERGH28beR1/GNXIV7Rze9qcn8=;
        b=R6cNCAuNhGXZhsIb1SR9x+iJyRKmbAOWMitezNBGleP09sj6CjIeAjIuhBTznjxPzV
         dZSYcS2Y8FJ/XN8xvYYaoezRnd0vJLT2r8gadhfzaLJwAI4TyOKv2gqkA5OnT5ER3UfG
         dxzbnMjkCbvRiVTlqFm2DxFim+O2ZJ122llNUMJNaZCt1uGmmFciETIHyp/0GXM9f6LL
         MjGIMP4zX1WzHF4yZmm78gA8nYyYfsd5w0mkK7W1JYmKShQb7NyspOrboiWgKKoIWCTB
         wP6L0LRVJPx1Ry8xupvBLf3jgpGVw6NacewsNCcL53qo4jn4pmCUOoRtEgff1ggm1ryT
         p43g==
X-Forwarded-Encrypted: i=1; AJvYcCU5gozkgh4QWkZ/tVBvf3w8RntimiwgnoA9Zdezym6a8mrxgl1usttVu+oFL2W5g53x46z3AZYA8aw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHkP4fV+25TUER67jWHDAw0Y20DbHZp9Kh62Wk5E/ZvSROpYo5
	LatY3jKSSN6K3wnlL3LGv7FZqHezxeF+AR1U6YmNrXZoHfjtVPn18YxDhNRTLSoWEhf+5h9b/8k
	0gWxVLmQeXiUUfAphuVSkt9a+MG8Uj+IzyYK6y18L8Mv2+79TXYYq/Hz0ZS26r3E=
X-Gm-Gg: ASbGnctrXhMvCMWS1o9MavLnChB4T9iQ/NTJ+5z5Jj+8O5M20eelW9bEqHT+MSX5S4C
	gN6c1ELUnwxYwQLwBTX8UfbUDmb6ne8j0B7za9KugMFO47f7/PHMK7whOhuzpY8TIaQKuowYzh9
	0Hk3b1a7mFi5tlt0BUkqznSxiaJxY0QnnapZ8feJIDPuX2Nd/lIwKVcDutAxNczvWIOuj/bSF3k
	TNio4TjpsesRuyifE6m1h3FrkymG91V8/a1xsQKGaUHkmwzyIfijYN/ami9JNw/h3T3+Pis3Ozv
	y6e4dsxncInHoPQaeAVwfIPCwmiQ3Gki44MMW+8PF2Xi+H92y2IdpzG+GA6Fi+CF7Q1YUN5UlhJ
	34MgpeBZ3qiyZmUXCQVJge7CWdYTKtZOYBd9J7G/BIFlZIpMenQU=
X-Received: by 2002:a17:90b:3f8d:b0:32e:6fae:ba52 with SMTP id 98e67ed59e1d1-33bcf861b1amr37765327a91.6.1761351017424;
        Fri, 24 Oct 2025 17:10:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSm8h4NvRrjWOJX+Cx7vUoe1BpJGKUKqYtf8siu0vobIYTvOkbI39G92U0hrTcdKBmU0SyBA==
X-Received: by 2002:a17:90b:3f8d:b0:32e:6fae:ba52 with SMTP id 98e67ed59e1d1-33bcf861b1amr37765303a91.6.1761351016968;
        Fri, 24 Oct 2025 17:10:16 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b7128885524sm374772a12.19.2025.10.24.17.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:10:16 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: usb: qcom,snps-dwc3: Add Glymur compatible
Date: Fri, 24 Oct 2025 17:10:14 -0700
Message-Id: <20251024-glymur_usb_subsystem-v1-1-bf6faf63b566@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20251023-glymur_usb_subsystem-6ee90473506e
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfX09c081OEo2XB
 8FAEjn+J7mL6/f3j0bREhESXUSRVnkKihgWzLkFbgCTk3uajVZNfLzrjkHCUHJeuCJkA8Pu7cHJ
 DnDvVQR3kFdbxGUeeJb372jUt0e6YXk4ju8+knL30Vg3TMzBaoLSIqxv0t7XrPg1Z00eAsyDp4a
 C1147aFBPQR4P1B5Pz3NBS8uKICh91Ee12AdG/hU/Y8INISgLjXni2jCXTXWdlhrfgpApVQ2u/V
 UIlY/s475atILtzzPHDbPnFZ3aSnNcl6dN4G1AKCeFfS6bDgZb80xc/yBlW7HIUORvzLHSSJdgu
 cjefQvqEnBAlDVYTEFajdaZojh9v/AhAP4v2qB+tqj6D4PeIzb0f4IDbA0C8rL9CaPQ+yvkdWXR
 tPqn8vWBqjKgCb/YdmkBxbyTgWUBtA==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68fc156a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=d0k8rClLaaXxmoyBG9AA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: tMYRJouJ_7sb_PvqsbOiMiDU6ze3eKac
X-Proofpoint-ORIG-GUID: tMYRJouJ_7sb_PvqsbOiMiDU6ze3eKac
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155

Introduce the compatible definition for Glymur QCOM SNPS DWC3.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
Requested to split from original series.
Link to original series:
  https://lore.kernel.org/linux-usb/20251006222002.2182777-5-wesley.cheng@oss.qualcomm.com/

 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index dfd084ed9024..eaa0067ee313 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -24,6 +24,8 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,glymur-dwc3
+          - qcom,glymur-dwc3-mp
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
           - qcom,ipq5332-dwc3
@@ -386,6 +388,28 @@ allOf:
             - const: mock_utmi
             - const: xo
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-dwc3
+              - qcom,glymur-dwc3-mp
+
+    then:
+      properties:
+        clocks:
+          maxItems: 7
+        clock-names:
+          items:
+            - const: cfg_noc
+            - const: core
+            - const: iface
+            - const: sleep
+            - const: mock_utmi
+            - const: noc_aggr_north
+            - const: noc_aggr_south
+
   - if:
       properties:
         compatible:
@@ -455,6 +479,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-dwc3
               - qcom,milos-dwc3
               - qcom,x1e80100-dwc3
     then:
@@ -518,6 +543,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-dwc3-mp
               - qcom,sc8180x-dwc3-mp
               - qcom,x1e80100-dwc3-mp
     then:

---
base-commit: 5d603d197cef9339ba640089f17aa415b514dfaa
change-id: 20251023-glymur_usb_subsystem-6ee90473506e

Best regards,
-- 
Wesley Cheng <wesley.cheng@oss.qualcomm.com>


Return-Path: <linux-usb+bounces-28351-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2673DB8BDEF
	for <lists+linux-usb@lfdr.de>; Sat, 20 Sep 2025 05:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E66816AE53
	for <lists+linux-usb@lfdr.de>; Sat, 20 Sep 2025 03:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07BED226165;
	Sat, 20 Sep 2025 03:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RD62JpHU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEA4215077
	for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 03:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758338478; cv=none; b=d2EitsismLVAzZ24zE062cwgO+XkjsVavU2kFK0UQZhkxumVFO1NdloiTGddeotiI6RrzFh6xNXM6YFjHh9FZ+tG3zmI1QXzTJ8ffxxVbJQVyQTn/R+4z/SJ5CNomP3RxqAg6K5M73aXP7dmdHBrQ9a39CbtWIGtU7QvzGeakp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758338478; c=relaxed/simple;
	bh=YDlSoeRw2VbtYRMNUeSZVwJW+SmI0llmlSIr9kcNQWM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CzDJ78XkDw0Vw3yCIkE2WvNefoqqVRXPpeKq+CRFz+7c//Bz0qWl4sMAcr+u+644/vd9jV1GaV16XntOpcg4moDEhhqTK4VjECzRwGAQWRFoQ5bgpbwcvZvqCMss0DnKvXAMClG/vup38sELeZyXvxmkYUzc8BrZ280xdEDED/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RD62JpHU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58K3FVYG019820
	for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 03:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=P4afTs2BZob
	5xp1NXhLP4wPYTnI4iHBaCCe4NNMHtss=; b=RD62JpHUQDrLOassI4J3yoVNtA4
	Xpfd5zUsF/IkTIdzVGulZKCQZvpHKcXFoep/5QXSItxcCXg3CcNvLlk918glR11l
	31hneOnrWcaeS5nnlz9zw5OPM/N1we7G/muPyXtDwOKp1Q0kkD4SfrgHNLHpGQ7C
	GxL37cVPtNsVoyQh5nILm6qJCAx4zV+TUh3xK0uVl/jJyoJir5tsTMCZh/op2QPD
	yMEP93rS/TRF8skqZ7NUkYKvE56XtXE43MysOF/PZk63L1dvSmxmn3B1tqzvAgoQ
	AQnbMd4PsPGu3T70HG+53huNp6C0EpDzragSEGsm+8J2gMdfiLi7pmihWeQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy14fg5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 03:21:16 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b4f86568434so2032847a12.2
        for <linux-usb@vger.kernel.org>; Fri, 19 Sep 2025 20:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758338475; x=1758943275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P4afTs2BZob5xp1NXhLP4wPYTnI4iHBaCCe4NNMHtss=;
        b=Fksrg/1Y5ek1fA4Z8QI0zsxe7M+qHoo9ZOCsi9YHHJ+3YJ3WPKPRljd7zC/RQCoRHj
         rWJWz6iSxTIuxdimDsvQLYMQ/vH6TNOvb0qLV4Dqw3WQNdKQNF7QyuWYUYsymjQDMt98
         n2uCbZQu06/zH1Y/4XaLHg9UNlmvIhnQ+Iec+XXIRi/TszaocTV98sSpbDltSkBCqrG2
         lHoEeF2OUzV57iHPNOBphqZCUK61iGaVnxkpSFnGUWbfBJpnDazBBNpMSzCv6DgxqWkE
         6adst6UVBnleTrI1AhefoMgAP2zsE5xonzBg8EZDaFAVtMjTnvs7Qg/N6QUT4FC0VQVZ
         KzgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlIE5gAXGYtxa1sLQE9VSWChdB2jCdAZek0lfBrgDr//vFJDk95NQAdPAxjC3B3+zZsjAS6/6vqOI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZzNSSQK3MAJBAgUsPl5Dqv30YZzkUG/E1McCbMiUd1s85jMO+
	AeN4WqHNyV4EJv7B81RtF1hzZixt19BB2wLPV2LI1FCP+3Yy71eLLxyuVGEnnyox8YQJHjQyR5C
	C3yt4e+Km3GiqvCV0HvFyzjPxGppivZUICAQnSw72xTbP1Agn8JQ5sXXWmStoDqk=
X-Gm-Gg: ASbGncvPTwjFuOmcVW+4GQGcvdgvwvyoDyKyDwqjJkY4w9InK1E5mobgN3IAF9sTbCi
	YGSUAEBUjI6+KXLdAS/etA/lbkPaH/M3VvhJG83oGpeug/i7yWn7nm8L58Fqc0qBDaW9/Okttfw
	chYokfe2NMHj1o/5I666jTqnHxodSeO9U7huvk8Siw37hNRJWy6GMnuJ0j4DBEaY24HRmXOIKaW
	f/MmDbG74lBfGa1JsZjwI2kf78CGo6OTVXgDiSozQzqFBro//IF4lsfEXs/z7k1Ozk7Ri5WA47W
	NtaLT2l6wZBN239vHeMSGrKg6KEiNunMJWXpKzO++4BOURuQiTu1+T4ZLN5+jd6xUglMFtV9IDb
	Q4Ddm5kt8f6FgOGnC
X-Received: by 2002:a05:6a20:12c5:b0:250:e770:bcbc with SMTP id adf61e73a8af0-2927480f320mr7972236637.50.1758338475167;
        Fri, 19 Sep 2025 20:21:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjG+ljXA2NFGb12pwEQzj9q71gZ/HW4nxBM/YVfEycE18N8jKbIJHZotVnXmuXiSTZeajTQA==
X-Received: by 2002:a05:6a20:12c5:b0:250:e770:bcbc with SMTP id adf61e73a8af0-2927480f320mr7972210637.50.1758338474766;
        Fri, 19 Sep 2025 20:21:14 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff448058sm6178807a12.54.2025.09.19.20.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 20:21:13 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH 1/9] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Glymur compatible
Date: Fri, 19 Sep 2025 20:21:00 -0700
Message-Id: <20250920032108.242643-2-wesley.cheng@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: v34uG39eDyC3Khi6W_yLKWxyBDqoutxx
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68ce1dac cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gJ-VRbHUVreD3CQON-0A:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: v34uG39eDyC3Khi6W_yLKWxyBDqoutxx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX+hXdqTlMc/pB
 LDx59lvGvl2oEuIDED558MeWvbi4yhvEsyGFad5dJzab00/vEKwMpKxN8BjKilp3mwKTuwNRvRa
 whyRETJ7Cv4LxvmHO5Sq/O8DVgEgNhVum2+D5aQbQByG7W0VIxaezSr5urp1LfmcPKPA5XEIYLP
 S4tcfDRtVdtLQeGztxc1RcXCZHrRG9VqsjkhvfD4gOcWxAPWnp27wiM/b8FQRizOspw27YFWOu+
 SsCXlznK5uRlZ5yEU4VpNo+hl1WflnrpaXCnU+0mZnRksaVSybg53SVD32NVrT7kMH7eLrWpop4
 XFfR0ywUtNqZ5l5DadDx0NL1c5mM0DP9kopm51a3fF/oNOuQLgmPjtj7DRl4mcSQDdQw6sW/05n
 fHu+lbaP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

Define a Glymur compatible string for the QMP PHY combo driver, along with
resource requirements.  Add a different identifier for the primary QMP PHY
instance as it does not require a clkref entry.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    | 45 ++++++++++++-------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 38ce04c35d94..e0b10725a1c5 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -15,22 +15,28 @@ description:
 
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
+              - qcom,glymur-qmp-usb3-prim-dp-phy
+          - const: qcom,glymur-qmp-usb3-dp-phy
+      - enum:
+          - qcom,glymur-qmp-usb3-dp-phy
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
@@ -46,7 +52,7 @@ properties:
       - const: ref
       - const: com_aux
       - const: usb3_pipe
-      - const: cfg_ahb
+      - enum: [cfg_ahb, clkref]
 
   power-domains:
     maxItems: 1
@@ -63,6 +69,8 @@ properties:
 
   vdda-pll-supply: true
 
+  refgen-supply: true
+
   "#clock-cells":
     const: 1
     description:
@@ -110,6 +118,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,glymur-qmp-usb3-dp-phy
             - qcom,sc7180-qmp-usb3-dp-phy
             - qcom,sdm845-qmp-usb3-dp-phy
     then:
@@ -129,6 +138,8 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,glymur-qmp-usb3-dp-phy
+            - qcom,glymur-qmp-usb3-prim-dp-phy
             - qcom,sar2130p-qmp-usb3-dp-phy
             - qcom,sc8280xp-qmp-usb43dp-phy
             - qcom,sm6350-qmp-usb3-dp-phy


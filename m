Return-Path: <linux-usb+bounces-28851-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE52BB1EBC
	for <lists+linux-usb@lfdr.de>; Thu, 02 Oct 2025 00:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67CB92A539C
	for <lists+linux-usb@lfdr.de>; Wed,  1 Oct 2025 22:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B8213128CF;
	Wed,  1 Oct 2025 22:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VwPLdRDZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598C63126DA
	for <linux-usb@vger.kernel.org>; Wed,  1 Oct 2025 22:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759356346; cv=none; b=SYiNJR/RUHimgElLbMir52fyvFrJybp4opJK3h0tLzUTPNwJWCQUYyxhTv+sS3I2/+4xJp4F4d65d78+3cSxLqLzjP/WAdZXGd0dT7HTR+BaJ0QbFXzcvA8wIZ9Ah8wxH8VkmLLpk3BIhmuJCS1FWWa2Z8XiAHmhEyttBckW4Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759356346; c=relaxed/simple;
	bh=cfM3s21T8CQ3sOfi9Dc1sx2mJ27UuKxMJmEc0kjDpws=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nIrzw74RKzGuAK78rDQ1GGVhnlTKG6XIBsjzj1fLiv8EyDE6BZNcgR4vvfoMfXTu/sLIDN0nZsiUFYQR1nANuq9Xl29pxiGIVnnR9fFruUAj4VVHm5MkQboq1SDu9HdQ8pTzCIMaYLbggqQhd1Sw4kpoFJTGEqIYCedzmfKYeOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VwPLdRDZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IbwsK017629
	for <linux-usb@vger.kernel.org>; Wed, 1 Oct 2025 22:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YaQd3cF9DM3
	ZawONJKkUUZT5oOk1utb/PQbw+Tb9ZII=; b=VwPLdRDZx8FXXZy/LdNwLw7sWso
	nNXohyNnyerO+pbHcfUtgzYc47FUOfVpoQQwyGk+uECmqtttjLCxfaQnfcuiMKy3
	COPDcecXaKKtbiRMxxTaa/NKEJDeeUj7X9rodNSdC09vJFbV18sQWiHgGRmTu4RR
	Y5IeOAYXUy9XZO9qAkUwZzYEQMHnI/DQOTt1aRtQSLurRyeU5HC8OhqfJhybPEbg
	emV7DosVkILOfae0zWqIBZQE8tOfTQqI2Qa0xQ5uZGBLA4bVgYwZvYdoda5haBrW
	tzuMNTj30oAma1cX0li8t2rht8QpPYfu6sz0qZNLTT7Hb679cAqJekVCgmQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrf7hb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 01 Oct 2025 22:05:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-25d21fddb85so4978535ad.1
        for <linux-usb@vger.kernel.org>; Wed, 01 Oct 2025 15:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759356342; x=1759961142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YaQd3cF9DM3ZawONJKkUUZT5oOk1utb/PQbw+Tb9ZII=;
        b=gJ0KerBt6rAO7vOFbIkYZvNPGQE3gGiN+MjHnxDmeq4sufz1sj1xPqwBbb3xWBDB05
         SBK5HHpxFkZIpWvKS6VOvBRyZKYXhztjXqIhInxdIm6kU3vaP6LsfsI1GW2Ng7ljEVSk
         p+X3vTZYp0A4+J+TtaEaRMAoXbxsyByvPZRHlFDTGeUqsMyqEcxBZm9uP7gV5faNKLaR
         6UkNJuSQ/eAQRE8Q3sOg240uWweXJK9ky5QRzUEKVl/dh9lyFrK34owd0FKknmWYBFMy
         bKgl8A2vga4H1zr+gI21SlLsQYYZ1iHE1IpyWTiazFicrWE5/L3F7THh+49/dijWJCqc
         aK0g==
X-Forwarded-Encrypted: i=1; AJvYcCXZBTYi6Wm8SxnmGBhoYxjmc73F0Q2sY90787O3utLl1XyO+hltfl9MXNTF4aO03yTFHPNF8gdv7AQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJTRZLjvZ3HiV3T17eUb4PLeN/IeOfJ5vyW/WLkuGsV9Ptxotc
	jUfNNfjS2ywFrISupcNcCnJFHJrfrw0jE5b3hiPULMSVYVSHzEnprdZQYFXpsYjkCm9YkNoYt0r
	rGwjSWZ0oB/ecFQXvuYqG6rqnu6i5kpMlWsgvqXcyYwYCXOOhiVsQ1eanSyJDVmY=
X-Gm-Gg: ASbGncv/y0nCkpl7TLYuGMzeEoIYpiZ+VWozpOUvK2+uiUjSNK/JASsXz956JSvEwfo
	12y6Jn5dTDEFFKXUoKGvQCvUjm2M33ByWFzi3Y5gK8vncNWAbEqd+HP/+AGajdeLbBEf9bAUFlR
	sDzPAcLboW4yef/rjDBsAK19eKDLraJllubnf2tlmbfSDxEBEXVAYkgKbfopLipDW2bdkQnIewY
	lFIE3pkA/E2RJwYL/6A3KY/aV/SR03iUPdToLEut9EQ4549aTSnXrH6hTNlx9+SQdbnRNE9BzOa
	Ckv3swuW4791h5FQrdLNDwyfuz7a3A6EzyN6HYc+k9UDj3yfKqbv6XKCi4rK/BOuV3F5fNBRifl
	ZNUP+hpOlVALRHprWkSzk9w==
X-Received: by 2002:a17:903:144e:b0:27d:69de:edd3 with SMTP id d9443c01a7336-28e7f2a2aa3mr55519225ad.20.1759356341899;
        Wed, 01 Oct 2025 15:05:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfcBhsPzH4uOaOTsLowdy78HnwI16bUIuuSFnXJDMrE5c2ZqQJDOV6y9FJ6jkCyNo9Jw2ddQ==
X-Received: by 2002:a17:903:144e:b0:27d:69de:edd3 with SMTP id d9443c01a7336-28e7f2a2aa3mr55519015ad.20.1759356341468;
        Wed, 01 Oct 2025 15:05:41 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339b4ea3c3dsm702085a91.5.2025.10.01.15.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 15:05:40 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v4 03/10] dt-bindings: phy: qcom-m31-eusb2: Add Glymur compatible
Date: Wed,  1 Oct 2025 15:05:27 -0700
Message-Id: <20251001220534.3166401-4-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251001220534.3166401-1-wesley.cheng@oss.qualcomm.com>
References: <20251001220534.3166401-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1GT3nnn8O409RqwlolYNRozO2JsXZPEA
X-Proofpoint-GUID: 1GT3nnn8O409RqwlolYNRozO2JsXZPEA
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68dda5b7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=dJG6SERxbJy7wEyxA2sA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfXzghX/5eEFlqv
 OopK2am2ZsN22Hu6i5+SLvR7pQiE+i+KsNM3lMX5xhNU2yxBxo9o2gH/M45UAhuh9W+b0lVzYsv
 DZmbqFW24HDRBjPxvhaqW/p6M3ggung5g6hR0wxMT8UI66jjqAGVfmbSm+XG6ziaUR71wgzxPS4
 njBX4OwAd8B/YWGAMQzRyqAA26HlbVRUi21BZvGI9/jLLPiFHlqXth2re2wnYCdFuxLWcHiGKiq
 NZQOJzAJyqxU4mbUADgOx9I3dWTqvJAGUfrYBDddRCNJ/XE4YDMOYkeDHNJL1tRwX85rtSsLl2i
 F3bZOznO6ryCSXcU8GuFwmmzgb0iP0IDuQC/XxGh/w/jjvpMbfrZWAhCzEakBqUFgF3tBDOuk5Q
 IEo77guoAGZ3d5gwT+wvt2mEjKCF2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175

Add the Glymur compatible to the M31 eUSB2 PHY, and use the SM8750 as
the fallback.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../bindings/phy/qcom,m31-eusb2-phy.yaml      | 21 ++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
index c84c62d0e8cb..0d5db71e0ad8 100644
--- a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
@@ -15,9 +15,12 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - qcom,sm8750-m31-eusb2-phy
+    oneOf:
+      - items:
+          - enum:
+              - qcom,glymur-m31-eusb2-phy
+          - const: qcom,sm8750-m31-eusb2-phy
+      - const: qcom,sm8750-m31-eusb2-phy
 
   reg:
     maxItems: 1
@@ -53,12 +56,20 @@ required:
   - compatible
   - reg
   - "#phy-cells"
-  - clocks
-  - clock-names
   - resets
   - vdd-supply
   - vdda12-supply
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: qcom,sm8750-m31-eusb2-phy
+    then:
+      required:
+        - clocks
+        - clock-names
+
 additionalProperties: false
 
 examples:


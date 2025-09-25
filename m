Return-Path: <linux-usb+bounces-28655-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C55B9D2B2
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 04:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E393C2E805A
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 02:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524FE2E8E1C;
	Thu, 25 Sep 2025 02:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TgTyJgEz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4122E8B7E
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758767343; cv=none; b=cVUshtiTiECAuhcAGaqlaayThyBRTd/h5LsOfVU12EyUdqQd9uR4RSr3KY6iuzRf/5TPnPV08tHoA603aCPZC6sTRy8qvp2zLKE7BzB2YhSl6+DJfjSqYMpk0K1IDlSq17EXLInGsVCOVKrhn6IC2a52MgWTFPuRS+8zg0HvuS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758767343; c=relaxed/simple;
	bh=y84fa6fvuCZpJxjEsWR6XfroWoXIZOXTyVARiLBoUh8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JE0PKCx+k0vdf4j8S46S3NDK0NZod8zut7JStn+VwMlNeYFgebgc6vj/TOGHZipctPYJWPKVag109D6HBdA82L88+gw2uxFbcKYOzqEOAQdU2tE/ArCKwU3o1ERprB4UBQaXYls6AUWgykbOhvvGXYlrz44YIIRJsa+FLmXLIlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TgTyJgEz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0Kfb3003961
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g6hGIMMv3wb
	uPomMpx8H8k/GiKEKmx7JPEl9gfJaIng=; b=TgTyJgEz5m3fgPKD4Sl7yF9a9ZV
	TAVlyJzb+FBraXJmeOMvYMgh4Nvixsx2BSJgtQ1dLDCIFdrhvmEqreb9wJaE6sKK
	0P8WF0Ip2xQVyGz4TeT60GwAEivy9JynXu4eFlYiE92HuVxCb8rIQVigRa6IgdlW
	Oy2criHyD8gRzubKKH/iLjWfnfcs4j5VdLix/eJ4qtX6aUlEU992zwPrEURjHe5F
	5YqkvCC+i+mnDOP0WphR6eoRxeUNsZTTW7Q3Yf1CdiaY+fO069rHNj7U0gHP3eUj
	v2vzpbv3daSFvq2E5DYNTv6MeCpHuoqrK//6pqI4NIH6BipcEDZEMR5Bf2A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajf0yty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:29:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-324e41e946eso759819a91.0
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 19:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758767340; x=1759372140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6hGIMMv3wbuPomMpx8H8k/GiKEKmx7JPEl9gfJaIng=;
        b=Q3M7b080KHt8wV0hp+jHD9MslAzQt86PRPtVmSWpr+3Hp3mM22YK3Ao4sRcRY5HqWu
         1kMLoukly0rURLwvYhoeV/zAwZL44glz8NYVbSLKiL2zjMka1QtidIIKQmNmCLz0Vcom
         72VL7We2uqMgugcv00/Wg4rd7v6VPgXrnYKr4ILmMy5ft1kNzUheDelyfX6gmfsqaWe8
         W7KK9kdqiuPxP8QVUiFVjDy+IR/E/L0yOd1FLAvtGusneHb084Q78XaFzS7pG3rCIL1G
         RYKA2Q/f6qjpynT8erudjFIaVqwmdaETrVD/v7mV83XUcfxe3fynnagbv//ONlFxvXJo
         YO5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqIfENwh/jQVVN0NmUSdil3kM55+sPS4NHS240o9gJHfvaiZKhtd/VrdAmD8axqW5z7mnXRec1dXY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi9rc0bozeFpVbIfiZWb6PHtZcpD198vyyk1zAuL0T5OGuo7R9
	E15n8CrRPHCcbStTU95FBA9XH+MpEpKEvE3W08I2PUh6rqVUd+VtNogzw/xsrSevvQtF5AXyGAt
	6DSJjNiMrIVjaSR/7DmRZAzSbUZvDYZ03OrK+hxrm2Ot5CcGhllZkaAkJ4YE7peI=
X-Gm-Gg: ASbGncvbpHGR28DxHst18pdPpLxRLVCAzjCR0K/rnpksoFNyFl16wb8hGwDNXuOYzfU
	sHLsdOjqRZHQsexdNHD/mwcCHFyLGAdE7GbYP43EyJVGtlVYJBKpyBSfIJiajNaTmfaI2dEHzIw
	2vAJReBtm9us38MeIqvQPwIVoUZm31vWY4aszb4rjcBmWcVSdFOhrDhYppHeSy58loElftvEyka
	r4EcvdVyoobV1ZSvo3gdyaKSeZOcJrQwMtStPA5fWDsaNN3e+t1uG43UBQcL+EX/L6nOO6aKGAS
	F3Gqh7bAKQR/R+ZXm3EBrYIbdZYUNeLo7vSRCmOU09a0HI2rma3mh0vg+RWG6WtW0NKdRS/hFTs
	MckSY+Xt933qNQqPa
X-Received: by 2002:a17:90b:4b43:b0:32e:e150:8937 with SMTP id 98e67ed59e1d1-3342a98796amr1499470a91.6.1758767340242;
        Wed, 24 Sep 2025 19:29:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgS7ZXVL1SYRcZLxlWvLQ8xVEim5+C7vl+IPW388/ukbhvZuVXDcTXahI9NwjzjZtEvK8rZw==
X-Received: by 2002:a17:90b:4b43:b0:32e:e150:8937 with SMTP id 98e67ed59e1d1-3342a98796amr1499441a91.6.1758767339749;
        Wed, 24 Sep 2025 19:28:59 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33471d711ecsm499881a91.4.2025.09.24.19.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:28:58 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v3 04/10] dt-bindings: usb: qcom,snps-dwc3: Add Glymur compatible
Date: Wed, 24 Sep 2025 19:28:44 -0700
Message-Id: <20250925022850.4133013-5-wesley.cheng@oss.qualcomm.com>
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
X-Proofpoint-GUID: JQNv2AVQYNzLOUe3XL_tH3rih6SlGyAr
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d4a8ed cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=JYTQWVwI1XGucIoeipMA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfX4G1HS3+trh74
 Gb0T1U4bVVils+vtwcWyCtt1g4LYSwXvuYBdA+CqtnAq5UeQaXy9IA72oT2JSNkDVbvLfsCwLDw
 2/rTMyRhrQ2LmYozkJFtpRpHQtD1QOek0ZOlzxOPcU3dXuWpZrf9QV+2GSPsJRpnytEXlLFkm5d
 7xOUnZjogKfb4qHeB2loQapYX86lJN6NCVyV5VjVMuJHXQf3hUCnGJKfRGa/ps6Q3z432/WRVyJ
 eHstBksz1JjKuglVLxeZZaDl1laSmtnc7LS0KYLxuyroUTl314fxxPVxNMVKuEaw3fAI73ZpzOz
 +iz+5eURzIH70nYxWxvCBgHHNqyh2p3Che075U5M9rvEsbxqr/Iefr5Y1bMVpecLsmJKlPd/8Z7
 g7fDf2/y
X-Proofpoint-ORIG-GUID: JQNv2AVQYNzLOUe3XL_tH3rih6SlGyAr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168

Introduce the compatible definition for Glymur QCOM SNPS DWC3.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../bindings/usb/qcom,snps-dwc3.yaml          | 26 +++++++++++++++++++
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


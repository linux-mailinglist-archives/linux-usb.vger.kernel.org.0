Return-Path: <linux-usb+bounces-29834-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 826F9C194EC
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 10:10:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BB17256464C
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 08:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534E732143C;
	Wed, 29 Oct 2025 08:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="diyhMgSD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kqeS/cbh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466E7313E13
	for <linux-usb@vger.kernel.org>; Wed, 29 Oct 2025 08:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761727163; cv=none; b=Un67YJhf1jN81FLH5SS3RyfOJ0XPfrQ/jn0o2w+wt7oVyNFmwtyjAqJWOKV0tbedsskR6qo2snfbAlzNnXj/jxRVvxSUgCM5qZunDTjaPnrK7LpBQwlNhSYD59VUQ9IrB9QR5QGCx2yE7sWfX354nqVY+GTknFph1zG/On7oBt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761727163; c=relaxed/simple;
	bh=YVxhcaXTQE2kdQCpafdkbntvUWAijtEj8SyutweUyP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HFEmtIcnyFh/GTDxQ7L4wHTRNfbGyGDP3YUb420ZMNFLmYOwfkJu6iAKjhk6yJPwaSGwGJ6atk9MFM6Tdk1LcD3FbUneakX4D/U/22TCKStvq7/MvV55TOvcAlJvZUQziHXgdkZwMLhft+gmtcrhqtDvj/1aO84Ii8zb1q65CNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=diyhMgSD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kqeS/cbh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4vKug3755689
	for <linux-usb@vger.kernel.org>; Wed, 29 Oct 2025 08:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sNBgwn67duVytbvZ+JF7p1
	ePAMjl/91R+GX2/HjwkOk=; b=diyhMgSDDKTuDXln6ISoVyeaD0nlo1B+v74NPv
	lJivOV5yWg1aFgAGCndA7X573gCJxnjixIy42zw5nM8ArRaWpv92iG1+xMQHjDfC
	MwTd4vxcJ6Fwec3I4b6t3AvHHomwoEogI5/zC61KarzQIj0DKK028IWQ2cL8RA0c
	YDCceU3eKlZdnJ8+W/NFe7no0GagINFv4N8Y0uJtnohJ36RXgUPVigO+DNpeG1ls
	2HW3JmTmL817GcDp4GATNeaqeIMHKwcKzEFJ7l4BUnLUtM+7jwSqigNUgQ91pRJW
	mDFYohT9Tj5r2nA462/kwnrxUxKvwXl5HnWALAgK0Z8WRwmw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a01ubh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 29 Oct 2025 08:39:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-269880a7bd9so72345285ad.3
        for <linux-usb@vger.kernel.org>; Wed, 29 Oct 2025 01:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761727160; x=1762331960; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sNBgwn67duVytbvZ+JF7p1ePAMjl/91R+GX2/HjwkOk=;
        b=kqeS/cbhbF0DJ8m4lh0MMewNF8TBU25n6txb1ZsLGn/7dOrbGMMu73hGuwEWnjuzhE
         Cf8hECU8b/gprzdVQWWW6OCn6ZX7S0N0ZuO14eorwyKzjUyaizzlseAC8nHdUVYfH3at
         8G8pjXEcu3JTvIvwXnQTumphqgPZ7fA+RxuG3lS5Gt+JhfJ4l5uQtQwJ88c79shn97rg
         JyfmkL1/7gWKfgW+M4QO5YToj4/HWDoBOSjDh3h+pmQh6i0EZ4F8xdGRnD1tbGcAIPih
         E5tT9r/biePsh9kq0q/ghUSlWwt1JTw15LbiFqRophoCBy9TIL1TXeE6LJl6xExXtsxD
         pIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761727160; x=1762331960;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNBgwn67duVytbvZ+JF7p1ePAMjl/91R+GX2/HjwkOk=;
        b=Q8ra1FicNFMG0GE8UtlkNgWuPObSl/nqZs9LmLg4EQ56uN+dNBsniKj8eA9rBDeCHA
         /acbCeKeA8CHyK8wK+Zo8dTVDc+1RuWphwycTT/6jjdrJz7ipxnWHy4XWE0KtaZQiOYa
         75JWhTYZtnoRfrR81Ey6Eexpt+qNQls3AupGqZeMElW4OLcT9jaj4IIYMCOLvmmZ45x+
         QBXcOSlbyz7lrgh4d7sggcu+ygGDlm81YoTV+6+rXDNapg3GAFJICqy4LwN9fBTk7Lkn
         X867cf6QC8T/ciFmqn5hIfyt4JcLwzJoD8h6xZItOuWT43Txei2CTK8vdv+dHvMGTDB/
         FKDA==
X-Forwarded-Encrypted: i=1; AJvYcCWmbu9k+PY8F2zLS/ru4WXUij+YWthNFEJXdOWJq76VH+IvFrdZhYwtM0TcXu02abZowvFE0yPP/Vs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzslMbpADd2KnrhnmfnhBkV5sKf/oOyqD94AZIh5W6ShKR21/hi
	ydKTCThF1iVKMjbcE4/zJztZ7awlQJJcbCS/IIJBL+lyW8TfcLQbOEK7cC58vSTwEWzPdAjSmiw
	ViJfNzjBcLfPaZfTiAMZ1DG5OrlG9tGQNC7y/H537LKtTzKpGs8MsvI2+gmdL+6qC1cx9Qk0Swm
	pZ
X-Gm-Gg: ASbGncv91T3Wzj8REgoURty7yWPHlRigaAkLP1nQ9k5bVgM6QIqNLB4iltsIB8bAQXx
	kQ4DCJivLUIM52HLaX9fHWVcqPVc2HcuuO5vy/tSDfoJcHNSbVpLi+gBOIU3IBjqTPFAJqp2VQk
	diE6EuAbRqKyds5rXByq566di70uDy47vHyQpacHiWToI8xouMv3v38VR4vrMKzfCizLbwkpK8h
	lCBWRbXwcs5vz87PLxA2mRGoN6U+4Q5H0G48koSgygRvirJXUrdpRMSoPskQENqXxACI0WQSleX
	aI6lVaGIvi43XWRWx3/3dm7Q4y8g5UWpUADxZTxlhv42YG9ySoilC1It7qEHcJnKARVd8prGRNs
	KXfaT074RKGRt3rmjlVGfIA1cX5EqXLk6YQMbd1zGLsVj5jvimg==
X-Received: by 2002:a17:902:f610:b0:294:ccc6:ccfd with SMTP id d9443c01a7336-294dee1d1e6mr22969545ad.24.1761727160306;
        Wed, 29 Oct 2025 01:39:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiC0ghxyCDMRkuDpRLriggn3jkQhIdfOtGlVs5hwNwmV1z5dFKTu/i0LL2ag+APQf+7gFtrg==
X-Received: by 2002:a17:902:f610:b0:294:ccc6:ccfd with SMTP id d9443c01a7336-294dee1d1e6mr22969315ad.24.1761727159739;
        Wed, 29 Oct 2025 01:39:19 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e4349fsm141948685ad.107.2025.10.29.01.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:39:19 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 01:39:17 -0700
Subject: [PATCH v3] dt-bindings: usb: qcom,snps-dwc3: Add Kaanapali
 compatible
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-knp-usb-dwc3-v3-1-6d3a72783336@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALTSAWkC/z2Nyw6CMBREf4V07SVtkSiu/A/D4vYljdJir6CG8
 O8WEt1McpKZMzMjm7wldipmluzkyceQodoVTHcYrha8ycwkl7XgsoFbGGAkBealKxCK8700eOC
 1YXkyJOv8e9Nd2swKyYJKGHS3SrJArrXO0zOmz3Y6ibX884u/f5JQAcojb5xz2qE6R6LyMeJdx
 74vc7B2WZYvMuMcmMEAAAA=
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761727158; l=2009;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=gZOzH0g70aJtkALwak5Bqgp+Oq+eYJFCuxGX681Vaj0=;
 b=pRlzO53OaO9KtMJH5Z07DZOgf+rhoicJmDAJMjfgp4QMHG+tkVU2/AFKb/2N4218HqY2u0VHE
 RRKgCUT7+KuBdBZObKlPPJN6l77VEFH1GxqsEC0lhzuFiJ5VmQTvJyA
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA2MyBTYWx0ZWRfXwzexe+eApcuW
 KJsKH4R/Kkkn4p5nvqc/fj/iGjvSgAHHPvjK0HYMilqlBaI0l92uBSqpF1Fum7f6sdYlyD4ouU9
 zazkxCCP4R6e4lfXXZa2ORPWRXYj/p/STm9QtHG7DEP/+Ojm9fLwwTtCM/jAKTx5o6e8gxCP6BI
 otvw70lef30fA4+5o6UtDzt+Cg5bg+1zeraValX6+8ip03gM36HF629uta3F7Stylog0DlaCQ/M
 Hv/Zt9t4uRQUhVUQwfDq/+D58xtWMNTEEaGr9BlBTwzJyuwfTi51K4BeGOVwwggJAcW/ZhiCiGK
 Aqz3V7RFH13ZBa0jUXR5BqPAz+c2KOzW9y7Y7Qk/nx8es+yVoabbdwqd6Sa6Op2qoEsK1M06RcN
 B4x+AgK50dyBZiQs0MpQn4JO2gkZwA==
X-Proofpoint-GUID: uMVNpsnIu0v5s09Tlz3Frgz-2faDCuiQ
X-Proofpoint-ORIG-GUID: uMVNpsnIu0v5s09Tlz3Frgz-2faDCuiQ
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=6901d2b9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=A8WZL8nXqXftsXHg7HYA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290063

From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>

Kaanapali uses a single-node USB controller architecture with the Synopsys
DWC3 controller. Add this to the compatibles list to utilize the DWC3 QCOM
and DWC3 core framework.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v3:
- splitted from original series.
- Link to v2: https://lore.kernel.org/r/20251021-knp-usb-v2-3-a2809fffcfab@oss.qualcomm.com

Changes in v2:
- fix author name typo
- Link to v1: https://lore.kernel.org/r/20250924-knp-usb-v1-0-48bf9fbcc546@oss.qualcomm.com
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index d49a58d5478f..8d1ef81b3962 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -32,6 +32,7 @@ properties:
           - qcom,ipq8064-dwc3
           - qcom,ipq8074-dwc3
           - qcom,ipq9574-dwc3
+          - qcom,kaanapali-dwc3
           - qcom,milos-dwc3
           - qcom,msm8953-dwc3
           - qcom,msm8994-dwc3
@@ -200,6 +201,7 @@ allOf:
           contains:
             enum:
               - qcom,ipq9574-dwc3
+              - qcom,kaanapali-dwc3
               - qcom,msm8953-dwc3
               - qcom,msm8996-dwc3
               - qcom,msm8998-dwc3
@@ -479,6 +481,7 @@ allOf:
             enum:
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
+              - qcom,kaanapali-dwc3
               - qcom,msm8994-dwc3
               - qcom,qcs615-dwc3
               - qcom,qcs8300-dwc3

---
base-commit: aaa9c3550b60d6259d6ea8b1175ade8d1242444e
change-id: 20251029-knp-usb-dwc3-1b0042da705d

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>



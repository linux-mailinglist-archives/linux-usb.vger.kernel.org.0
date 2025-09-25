Return-Path: <linux-usb+bounces-28637-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A96B9CF35
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 02:54:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09F35420CC7
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 00:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A973C2D94B2;
	Thu, 25 Sep 2025 00:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dO3JsxhK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555332D9481
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 00:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758761569; cv=none; b=PnwsUgx8/ds7vwy+eQN6OWyVw5rCcdfJTWVMLSlMv3k/afsW3cLUs5JaSAXb47/hnQYC0UpQYn0+9ux8pM291HIufqfEdVBfzH94K2S/LSnISVw684TsuzZFnAv7aqQaI084nCbOV2bS978yTMeVhmEUgAeqtHWUKj4pzrHbkLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758761569; c=relaxed/simple;
	bh=OkC1mLtz16qVJoq2dcpPz2WMUUNz5fHtzWVOhSAQHi8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YBywnvXfYGcGZO50/LqGFglABHBlI+/TqQgEP6U3byPDN74ThZh7UYuhi8V9JdZHJhBpRJ319l1OSlyKTnI9RYYuvglVGS6eRsSb7KD74+5xhs7B2tITbUJWRhnmnvT/X6rLbYo22LkEoG6uIpQpciqjl2V7hRTrgy1M1H/hzIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dO3JsxhK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCwmFf019910
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 00:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GwDc2ByWl5B
	YnzIa/5w++Oacjx00R55NFfYXUv0r7SI=; b=dO3JsxhKNWN+4cYw7704EKXh4yT
	kFUPFg/G4A7DWjNhpCIH0KksUXQIVmGFBDWH6b9yqhHum+qwgjEWUhk/0XlHTSRH
	A2tlwwft1psIeIOHoyPqEYutUNKX+Sm1YiQXedjMXXhTych870gi0fpmySb6YvmX
	KisY3hqqE2REgRzuU/9swTJeGSAsjsBIJIwxGqeio2b+3GtcK3P8jxLLJdruXffu
	CKp03Rci17cjRNn8blbuJTywYzjVLSbXquuiDJ0aafzZtwk1tMHxARaqRcdaYuRT
	ig3gpLJPKv6rrT4KuIwuVMgSPtpmCXMi3OexB3dMPqXZEtrZA1/Uv286Ccg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdyeb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 00:52:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b55397041dbso431037a12.2
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 17:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758761566; x=1759366366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GwDc2ByWl5BYnzIa/5w++Oacjx00R55NFfYXUv0r7SI=;
        b=ZpSSd4ajoZPr0vHl13OfUR5AD/Tcu3xQbdUbPOaoKchETvQM5iiADropTMNC0loqIY
         YcNuPC1r0tUz3lET94mxxQlvENhHAt69vDYQkCM3Vgtj/r24smJNDKRp2IY9gOp7bBxr
         8gh/YYiINn9M1NTM2IUQ9+rklSgHBUGgwVSzdG0P/CkL9X3e1sYgPdAX1xqVJchk/0LJ
         65fea5JjI+ySGXcJi4skHpye68vagHg6V5/wnoeg5D22r1rJyy9t8Fk0uv60k3Pklxcr
         p37C+9FnbbqCDy4KXz53obMmK5BXk41o5Bv9nwRHGSpokPnej86eGZz149RPP9GVLWtw
         nB/g==
X-Forwarded-Encrypted: i=1; AJvYcCX4in8WDnw3d1P/iZWsxBrqtz7JAR9zhlyPf9oG5bYpjYODKXYvtvxj613WqOhJx4aYv4/S6WIfVA0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJwNulubra5QD+mgIc8Nkhqtgqjyr1bEUjeMIcASV7hrpVbYgS
	e46dAlspz3QlzP9ywxrmqOig6NRBoYeodrwZiUj0A6kFnBCKnj0hb9Iy/+Kb6vK7dPOVWBdoue1
	JsZz0MQkwNU1KtqE1qatcxN3IJ3T9L7tGYbnXpenJ//+GLDKgIs4qqxggckvHxz0=
X-Gm-Gg: ASbGncuIcKdvYtJwZVrxIvv1OoJVoGxYBFT6PN1Rg4Phl0HjlV33SP4iBwaAQAvwX9A
	eG1/v3WI+Fq6FwAMle+t7YouGqVNYe+sVRNj0AAQuDmDqm881Ktmp8YRTrXH2/r3GFz2Oz0EzKu
	r9qMBcZL6onmXh2MdZ+BCRcLmKO45HjYlUFaxCFyS2eQrk2kYhgw2UgudRaFYB8V4E93ZzYSmiz
	3a/g4SLFQxHS+O2gkJ/zciU1ncis4mLt2ut8UiMqxnQ+IWZxeMwnQCPesIKpnK+VKMcAJS5bi1O
	Y0Pu80pP1VE2zDo/T4OVSV7/qXfbgp66iOEzmbA84ss2e3Twm0Sctt3L6rQvJJkb3AJygWR4yRk
	fYK0QMxZlmRfaxPYs
X-Received: by 2002:a17:903:2783:b0:270:ced4:9116 with SMTP id d9443c01a7336-27ed4a30d4fmr11198055ad.33.1758761565572;
        Wed, 24 Sep 2025 17:52:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1NU8ZODHNZkc+l42a5mkWmjFbo8+OfeRkITd+fOUaYxP3TJQUCBdNmqivTPnUx/dYUusvcA==
X-Received: by 2002:a17:903:2783:b0:270:ced4:9116 with SMTP id d9443c01a7336-27ed4a30d4fmr11197875ad.33.1758761565129;
        Wed, 24 Sep 2025 17:52:45 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ac27d4sm5238105ad.135.2025.09.24.17.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:52:44 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v2 09/10] phy: qualcomm: m31-eusb2: Make clkref an optional resource
Date: Wed, 24 Sep 2025 17:52:27 -0700
Message-Id: <20250925005228.4035927-10-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
References: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bUxH_fXjMhRi458LH4t5FPMN9ubPIqJy
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d4925e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=8inbgvmG2iPteTk8MkMA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: bUxH_fXjMhRi458LH4t5FPMN9ubPIqJy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX/Hri+T6UPdPD
 e4z7AQgvRdoSpypMq06jG8TO5+JTi8wmlV4cp+m0uzvwtLwPylG9FKy2nhlPh8j4GaS0cyz5rkg
 dyQG7DWi8jq3OruBLvgsn1hIqdD2MzV5SYAOh2Z/NaZv6C9QgWHTf8334prU07QTJuntJHJRVuT
 epeL1j6PODOK8AQJGJXNmN56Hzt4N+aKImLB/vzd50O830xzzbOTLwUM9mLhSOTWH5EhvMJdHrH
 gyPWmBL+xx5LZLuXNvGEyWy4jZoEzNSubPA/NMP+Jpdb1WvQoMsjHj6AZPu0SoevzOi1hOdtO3f
 FEiCRcyTAc4KNBld9nfDFbKTGtlcEHEcTN6Z81yjFK2VcZUhnUCRkfXwFN0K7v/zojV2x56z1A8
 rwbwCyYf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

Some USB subsystems that utlize the M31 eUSB2 PHY doesn't require a clkref.
One example is the Glymur platform, which contains 4 USB controllers that
all utilize the M31 eUSB2 PHY.  However, PHYs associated to the primary
and secondary controllers do not require a clkref resource.  Due to this,
mark this as an optional clock.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index 95cd3175926d..f8a00962f937 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -267,7 +267,7 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(phy->reset))
 		return PTR_ERR(phy->reset);
 
-	phy->clk = devm_clk_get(dev, NULL);
+	phy->clk = devm_clk_get_optional(dev, NULL);
 	if (IS_ERR(phy->clk))
 		return dev_err_probe(dev, PTR_ERR(phy->clk),
 				     "failed to get clk\n");


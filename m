Return-Path: <linux-usb+bounces-28638-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA51B9CF4A
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 02:55:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5597932854B
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 00:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2543A2E0401;
	Thu, 25 Sep 2025 00:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fH8h3Y8w"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9701F2DF152
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 00:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758761570; cv=none; b=m/ro0u0/yMwaY0i6TUznz/NCcPpcv6DPcPtz2cbnwpSw8cWxaCatUM1q9KWYtnOJN2XkkLvsC58j7j8vSG8or67K0f+dbEk+CsA+Vqhp1rmWsKHDc+hUxFB2oaR4nuGkkdX6oYiGB2+zqqIc43KvjTarRvkvoCi2sNI7iivTvUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758761570; c=relaxed/simple;
	bh=JenK+/zJgrkEgu7BAw2m2ucWcDL0lFzE6vWEQjcaBxU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f6t4Z3sUa17aitKBr6BpI6U+DLQ/CQbyNxbKN0NWDGrWDCu2T1jt3ktUK9nREEq3NvrYzT/D9mDgrjX76tiRS59Y5VId9VxFPqn66APDykX8OyvDei2n39Rvx6yu4WJb2uhPek801OeRvE/UV+a0aKEMCKpWZ1Y6zWUq/lW44G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fH8h3Y8w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0XfFI025591
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 00:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oQ1clu+8ZKT
	yXqEd3c9pCyX/LD2tCG76qdlEPx0yVao=; b=fH8h3Y8w9C9p0PcQYFv5koeBng2
	PxN8cGE5WWbq9wSiB1d2S50AR6cwRU/kSXUOOjWGxBrK61pf46cXcM8VZqsFRNew
	5/WCNAY8plUHvBJA8Mhh5Z3FE7TWjqrfwj7O3Nnh2yDuhsVCD7rhrq6W5CitSjYg
	ETOHaamsQKeQY/cHC7kYo2OZQnaD5HGLvC9FVxaGZ1aoHBSS72vBXRdHwAI9Bixy
	GBjAWtsOdNAzmPK18lZNg0cTPGxbqdFJI0PLbBwBxsci5HzgCZ1dtXQDUVz3kn/7
	KhVUIAl14CILLJhjPG83yUGLbztQF3UgQEeTy5ZCluxNaazXx7EsJRwQCiA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyexhqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 00:52:47 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b54df707c1cso256992a12.2
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 17:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758761567; x=1759366367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQ1clu+8ZKTyXqEd3c9pCyX/LD2tCG76qdlEPx0yVao=;
        b=Jd9W41Fz3lcP6BFmfjqvXRooyVBXApw1yKQGT1dDAEaFFw5edMyryVdV4a05swXkPB
         nW8iC3S6fUbU200OsHtGuauNZq2ENGYzyjkDZDx4E6n50MEEFt43rWxYnsw8u+NV57yC
         PSQ7p2DpUVatIv5f4EoUm/MUmTwA81YvkeLGs2C0irFaRDjLIBx5OI5DGUCA3VkJkqtN
         AWgjHv9K9cTAcTyaOBtDbaBBiweSiXa+ZM5frKENItCEj55SB0S0q0BpmCTukB79VtK8
         ox5QMh6lKFI1wNZ+E5NUqObduLEsegEDl1IEYTcq6bJhjwUOD1kCns63mADvMY05GWaa
         8b8A==
X-Forwarded-Encrypted: i=1; AJvYcCX3yYhi8S8ES105/iQku8cghozUvxy4/2KUqKuuh4MNEknM3ryLXN4tI/6jcsubjFkPm4eM5N1/dac=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhrYGkqY7q7qQ0gly6J4miPW3p6Md/xbvmp4Sz32wcFQAFEtgA
	5rl4OJ6vddg3HyMWqG56YWSSN78+/vkMNLFVMS33K789mJpD8VSGzVFcAn1Yj35XSW+yxHlyLMs
	OLiu67EmjQdZHvnymQKZwsF0OTHz2wzwe01TYPOaaXjR4DFKERTqZwBBZfJF+xhI=
X-Gm-Gg: ASbGncsKm+cpCb7Qs0EGE0lso+8ci8TBxq0jaP4FJ93npjFMKnPCcXei+9p2fA4ogyW
	wbxY6PATdS/hs8BqP80DNeTHfI/tg5RKmnBK3UQ8MbEzj9/+324eSxZT6IEyfQV9pAMHTDs5Uzx
	/cfqcpQyuWcNCqL3TLzdfeyE3kzZnU4HYrl2/fMFs8O4Ky4Y1ytbuMVWaXKWs1OEueqJvOP1Edi
	073n+3xoGHUQjROVWtjZOAbn5y15UB3GtjDijCLvYUD6EkfY+oOgkkIXXdaCepI8mW2JdanxYse
	OAL7H6/Exh97cxt91cLmhK85vtsCmkg7JHyHeyVtvHRhEt7OZgWsltToAot8IRn+bklMSW5F2e7
	vyramVu9tDqlFKZE0
X-Received: by 2002:a17:903:41cb:b0:267:ba53:8bd3 with SMTP id d9443c01a7336-27ed4a7f36fmr18185225ad.28.1758761567020;
        Wed, 24 Sep 2025 17:52:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+WVAjn6nkapon6wWWzR245K/fiIlGiNBXHDyjGbThoY6v94l2NAtZ+A3xiLpl9py7sDEIGA==
X-Received: by 2002:a17:903:41cb:b0:267:ba53:8bd3 with SMTP id d9443c01a7336-27ed4a7f36fmr18184925ad.28.1758761566547;
        Wed, 24 Sep 2025 17:52:46 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ac27d4sm5238105ad.135.2025.09.24.17.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:52:45 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v2 10/10] phy: qualcomm: eusb2-repeater: Add SMB2370 eUSB2 repeater support
Date: Wed, 24 Sep 2025 17:52:28 -0700
Message-Id: <20250925005228.4035927-11-wesley.cheng@oss.qualcomm.com>
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
X-Proofpoint-GUID: gct71uma-cdwxF7ZUKyIoRDQq9oPSX2k
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d49260 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=PEmB9FCP7AcuBCYBmm8A:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX2xmu8ov5gu4U
 aFjPmA6DJJZahWEfFjGaiKLMcP1BryQR6f9GHZo8lSw+Qq71toy0vieI2c98iuqbkEJkZc4efhS
 3POqIDD8sq/Ar3U1XcTH979l7gUQQFs/od1PiI/CT3WreNMv9o75IvRhCSEzurDWP7l9lhijdPh
 3IQbGvMoPpdZ74C8zzUjc3XzrYqWoF8GDpzMkykbxt4HcWO4XhVS4AKKYmx2OK9Ie+CjgbnfUUP
 yF3n/XKGgbGbXp4M4d6WSIgwEn+xug4TqtAz1XzsS8cPE4anI4V4tFKZbnK1IJMST9mMGTYBilR
 TlPmJPPikbrmS5os/3w8CNgub30zymJQWRQh9A7R5XkEzDQGS3Nejz3jpPXeSKhifV421VKoUmu
 2r9TVSq+
X-Proofpoint-ORIG-GUID: gct71uma-cdwxF7ZUKyIoRDQq9oPSX2k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

Introduce support for the SMB2370 based eUSB2 repeater.  Configure the
proper repeater tuning settings, as if this is not done correctly, it
can lead to instability on the USB2 link, which leads to USB2
enumeration failures, or random disconnects.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
index 651a12b59bc8..441996480a67 100644
--- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
+++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
@@ -75,6 +75,13 @@ static const struct eusb2_repeater_init_tbl_reg smb2360_init_tbl[] = {
 	{ EUSB2_TUNE_USB2_PREEM, 0x2 },
 };
 
+static const struct eusb2_repeater_init_tbl_reg smb2370_init_tbl[] = {
+	{ EUSB2_TUNE_IUSB2, 0x4 },
+	{ EUSB2_TUNE_SQUELCH_U, 0x3 },
+	{ EUSB2_TUNE_USB2_SLEW, 0x7 },
+	{ EUSB2_TUNE_USB2_PREEM, 0x0 },
+};
+
 static const struct eusb2_repeater_cfg pm8550b_eusb2_cfg = {
 	.init_tbl	= pm8550b_init_tbl,
 	.init_tbl_num	= ARRAY_SIZE(pm8550b_init_tbl),
@@ -97,6 +104,13 @@ static const struct eusb2_repeater_cfg smb2360_eusb2_cfg = {
 	.num_vregs	= ARRAY_SIZE(pm8550b_vreg_l),
 };
 
+static const struct eusb2_repeater_cfg smb2370_eusb2_cfg = {
+	.init_tbl	= smb2370_init_tbl,
+	.init_tbl_num	= ARRAY_SIZE(smb2370_init_tbl),
+	.vreg_list	= pm8550b_vreg_l,
+	.num_vregs	= ARRAY_SIZE(pm8550b_vreg_l),
+};
+
 static int eusb2_repeater_init_vregs(struct eusb2_repeater *rptr)
 {
 	int num = rptr->cfg->num_vregs;
@@ -278,6 +292,10 @@ static const struct of_device_id eusb2_repeater_of_match_table[] = {
 		.compatible = "qcom,smb2360-eusb2-repeater",
 		.data = &smb2360_eusb2_cfg,
 	},
+	{
+		.compatible = "qcom,smb2370-eusb2-repeater",
+		.data = &smb2370_eusb2_cfg,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, eusb2_repeater_of_match_table);


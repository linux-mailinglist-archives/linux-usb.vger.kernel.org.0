Return-Path: <linux-usb+bounces-28858-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBC3BB1F03
	for <lists+linux-usb@lfdr.de>; Thu, 02 Oct 2025 00:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DEDF2A5EB3
	for <lists+linux-usb@lfdr.de>; Wed,  1 Oct 2025 22:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D68A31329B;
	Wed,  1 Oct 2025 22:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NcV4KpZY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E169F313D79
	for <linux-usb@vger.kernel.org>; Wed,  1 Oct 2025 22:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759356356; cv=none; b=AxyqqO9JqKR5H3bN5Cv8E0gkkOabT0X0fOjZsrzpajAwzPDEl6erlGqTbcoccRfWghQ9lyu9ufJnXspLGUi49Sa3sfA0qiPqiFR7v+XTftPPyozQ9urdkTWU21VEZ2SIzJvEfBXFRGbrwvWr0U3OyRvcw1k/reaphu0wRXIvnMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759356356; c=relaxed/simple;
	bh=KRfbO68RqNXGYUxEscJ9pAB4g2zVH9KTs2sCuSCOkhg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=drvbtZEAQGS8/sXnJZLyRi0q3YPthZhUGKi9R+JquooM2P0mgfxof/hhUtlXBCbXt2PW+KlBfuUoFSGxXTh8JRf/dCYCiJ6KPxFERiusa3pxqSU6A/g9VxM6c+xrCkPVkmhgNOFZ9z632xk1qyNOgqOxFMWk8alGR8wG0zxLQXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NcV4KpZY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IbxOG005645
	for <linux-usb@vger.kernel.org>; Wed, 1 Oct 2025 22:05:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NVYsIQDhA8R
	ySLuD9P7ecPi4IEalfEg3vxqe/TJrcfQ=; b=NcV4KpZYz8Xya/lAqkwjI8Lx14D
	feryq2JW3z6hAaS8oD8wcT5f/SPxN0osxdtXPEIPBBnPB8NsFTfQR8bGh4MC66K6
	pzWZ14yvwe5T5aTtlwZKBG0E0J966qKCrqfDvGTgG1XASKrZe1KoxS7mdjHcofb3
	QoV19uLa0TZgpuVBo8j29s7ghiVIFIjxf7I0QWhP2r/Q9n/xEFeRZP850dG7gvd0
	rx+ZD2wV6Nuw9Jn02vfTDEPF6U6mtrvIgECbq1J9G4cnyh7pr8v0ZWW73PBTqg6D
	+41JHmW7wKFSUaWhK9HfSNXhdW/zTWuojaJQm1Ibm5378miKohr2XGeiOvw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdnrhc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 01 Oct 2025 22:05:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-26983c4d708so2206395ad.3
        for <linux-usb@vger.kernel.org>; Wed, 01 Oct 2025 15:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759356352; x=1759961152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NVYsIQDhA8RySLuD9P7ecPi4IEalfEg3vxqe/TJrcfQ=;
        b=pvSgWPe2kBuG9ksPkMEvsinVGmB5UtpPjO6DYwcHzANgn9g4trF9mMYK6e+GHIeqIu
         p/F+T4y51bbbMH9no9Tya/E0AKyyyAabvjJn5WpPZMRLb2ffT+Gltbp//Mrtx0KDefMJ
         ltIhPagndGA6rxA7LUtHx1QEiVrRMqRJjsBA6B6hyEddo6hVhMguhLeLylt4pG/QPz2g
         sGStTKYi5LC17SrbcpJNGoyAI8zNlNWFRrr5BXzLiedgutsHc42biq8Oq6ubn3lwtPgW
         o6jjpnKPa597H0JJokAWW++Ta0xdoDRGtOWJspJwA5+jppQf+spbak+AsvwoRTw0gdzg
         19NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx3SBqpEeS6XxiMED1NDCbrx094AjnVfJV8KYDzIOrSsXIc5aTq/EqCFPmdZxWhd5EHwyrTd+pCHA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvtm4u8FOp3ThXLmoVQBYLrbTWyTbNLygYNURHWGafjVWGzhpZ
	ervj8LTPE90VkuDGcFEVl5Cawz9FL7mvJt8X2u81pp30QYuDi5sk5rVN0GWsbdTTjeu+IFcn3Be
	g5+DUyPLb8nvy0x99VBotINugsYi9bTth9zIKhq/9Px3bFe0/djoM0c93JCwevoE=
X-Gm-Gg: ASbGncv1vmkhf1KVYZLww3gTlhgDDTvhW3z1JEeySGTizhrrXSkQ8zL9bSvk4YyIxfr
	KOVna+N85Fu7Fv/D9Gj/hXJp2p1406TJ1m5bSebE3nSHff2gaf+CpuRIEFvu2kLKuNuW5HlIop9
	U9lXrmR6Ris6FOrZV/rVd5BBaVybU/yJG1/KfN0MoRYV1iMAO5bGBmVukAq7v0cxFmL5i9ULqeW
	dt9bBvOQDqqxpzz6gJjlbV+lr57rXKOiubjuDBmEHaz668HotE2Fux02EFofCrLnJSL6WFzqgjm
	0auiKtSpXyicXsq+GZI529BS8YzO07qYzeWdgdcGDHo0FKXvTDHNhIDKTKYMsY1QM3CIbkO9meA
	4OggR7Q15QmbInWRXmqz5ag==
X-Received: by 2002:a17:903:22c2:b0:25c:46cd:1dc1 with SMTP id d9443c01a7336-28e7f31092cmr55935975ad.33.1759356352131;
        Wed, 01 Oct 2025 15:05:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqQqqXsWfsPcB2aMVgjy1eDaAlKWRk/y5Tw9L6ueOyV8a1NgF119HAYRfaqcXDXa4fmR6VmA==
X-Received: by 2002:a17:903:22c2:b0:25c:46cd:1dc1 with SMTP id d9443c01a7336-28e7f31092cmr55935695ad.33.1759356351699;
        Wed, 01 Oct 2025 15:05:51 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339b4ea3c3dsm702085a91.5.2025.10.01.15.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 15:05:51 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v4 10/10] phy: qualcomm: eusb2-repeater: Add SMB2370 eUSB2 repeater support
Date: Wed,  1 Oct 2025 15:05:34 -0700
Message-Id: <20251001220534.3166401-11-wesley.cheng@oss.qualcomm.com>
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
X-Proofpoint-GUID: asJ6NPw6AGUVo8jrmG_GWh3vqomMReY4
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68dda5c1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=Zq12RZiOzp0PcbRnEbUA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: asJ6NPw6AGUVo8jrmG_GWh3vqomMReY4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfXzwq/t2qsdLll
 qKVnQT2CHNRSuGftkRpIjG7jCWMuRzpb+Yr1J+29IgAPDOXQib54tH6JbiX0tjm+WyVbRZhN9Uc
 ecw0znyuvapz8/fKVbUntrqOcQh6BsQ2G0nX6NiNwnsftOslqYkLk1Xcf0e+8i0PuTb88shHusO
 qmyNG9v6oFnQ3hnBy1Kk2z+ZJ312lky6/Xvq7/bXNuNxaBnAa3nHPSMf2JLB7M3evIUjyW+6UFZ
 J2eqkKFESLuWc4szsYky1sB+yo+qCNz9B/c8TV1IgqOV71UqaOyhqWKoAPv1NLm1V4oJ+A1ZrfJ
 RO1S8zPdUa1/ORT9IJVk28v+3qlxmXHOWAef4HVXXr7+tBFXicy6mLUo3jqnvHv8A8OjKn2S89r
 f2p3ktv8Nklt5gZUkrF6hTzlD1kPsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036

Introduce support for the SMB2370 based eUSB2 repeater.  Configure the
proper repeater tuning settings, as if this is not done correctly, it
can lead to instability on the USB2 link, which leads to USB2
enumeration failures, or random disconnects.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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


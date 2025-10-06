Return-Path: <linux-usb+bounces-28930-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77967BBFB04
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 00:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B39643C59BF
	for <lists+linux-usb@lfdr.de>; Mon,  6 Oct 2025 22:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 460FC2E03FD;
	Mon,  6 Oct 2025 22:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bEZcXWu8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BBC2DF15E
	for <linux-usb@vger.kernel.org>; Mon,  6 Oct 2025 22:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759789226; cv=none; b=enobk8jjwTKNjkAi9WqI0/1VOnFEmi/pPKdbupGKkPCaN7wSKJWztqB9rmH09lsfQhkbhPR2ZXnXYU/DVh5LIiGOCCZfvj495VmeE2oFBPKCjtY21D05AdgtTQbOBKyyItg5vZZREPYzsf5hGXMkVmgQK7Wu6D3s6NrBGiANZnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759789226; c=relaxed/simple;
	bh=KRfbO68RqNXGYUxEscJ9pAB4g2zVH9KTs2sCuSCOkhg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ppYTzqIvaYw2YI9xqzE63Mj9kkIFfgcmgpBZ5e5k+4AhpK0kFU0aoXXH0SgtIzsjfoHjJjSC/ZDn3v2bnEHpjVLfcJj1Ps7PVLuMTX57vSNcPltJf/p8FIiRzYXzk7EznSJz2nrySvVV8eRRfUHufmaPOYW1thohnXDEikcyf5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bEZcXWu8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596F1uES017137
	for <linux-usb@vger.kernel.org>; Mon, 6 Oct 2025 22:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NVYsIQDhA8R
	ySLuD9P7ecPi4IEalfEg3vxqe/TJrcfQ=; b=bEZcXWu8NYn46iYEKSdylzHMVZy
	gooOnhtZQeHCkoXjGF/y0SKEH7q34nM08Ra7APR3HaFpGpUfSRnymRLhRyRsd5HS
	utkBW1Wvn10t51JG9uRC7wrN66j9X7nRK3RRlf7CB5GDWH9hLW0wdDKRqu2Iv1Ap
	zSSVk3Cpom/EAnpcJWyMYo6XNTHm454L4Ab93HbU7OagYHNByUwYFypcu+/6Mfpy
	EEl8724bZapd/NQKFvUMpcfEfZaBTT02iuaxcKfnACJsEg1DxtQoLZh3C6wi4tu1
	enmxOhzdg7rtPBqZWcDR+P7FiUizwnSLDgrL2rVCfZKZdaIX+84nShcPcNw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtk6wd1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 22:20:22 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-780f82484faso3734947b3a.3
        for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 15:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759789221; x=1760394021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NVYsIQDhA8RySLuD9P7ecPi4IEalfEg3vxqe/TJrcfQ=;
        b=DIEwwHcTGpU+M1BV3xLg981jqT4I4xfjn5LZo+CIXSRisGK4gj4GD8CVpxWtx89X7z
         citDDwJuVYRO4Tyf2rYI9LN+N2G4dj8WkN+iyoDMvulmTI84s0LXWXk16FBJJRVrbqef
         CtI/BrntKSSGyW5p7dPFPhN772Z6fOJEEulc3qBhIjNhbZ7uoEwdYV9FtpbjVAQbjYSC
         kk1DBdeq0ug9SNNwHGtS4aI2BBGwxyq5ftYwO2M9jnWH7Nltvcu5Ok9mojSKfAzJoJzh
         lz1T+fiK+nFNtnl392noevsO7x8H71OVwN8ArNyAgbFq63PQ25y9SJ7w6oliasoCtxZy
         LGyA==
X-Forwarded-Encrypted: i=1; AJvYcCWuOxeNaMGaCMIVEVeVA/k9Jih378krUklWHldBl/ETtMsJSen+8ppuaXSCmCFOEu/C4eaX8IvobOI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqIlI7aJBXN4k4Fc8ek+FCAWgf8TggcB4zPNn6ErzNfCT6AwZ2
	Cn90/42aIyQFiNt77WYDSu8K4GIeA/WD0f5tQKslDuYtc1Haux1j4nEsTpYH6E89V8+IPfUTsS0
	mT5oB+5nvbp9O/TKVtG5XPiuJxUULIKEspCqHs6vWM0gk0vX7qIOAviUFVULpkZo=
X-Gm-Gg: ASbGncsPBSuu2PMofAhPTU/wqIPq/sQhwzuE3fzJ8AuLBS4H4BPkmdOQDO2/HQRnGFc
	9XwzVpt8V52Xy+Mc987GAg6brabQxhZBWlreddQ9+b44dE++bVjt9RK0jn7WvXWABo2YgLZMFOZ
	WS+Wlu+doZOx4WyJXxMe01sysopx8g05uLLKA7q8V6GmM/Ky5PUM69PIKmbDcoIVQpz3zswmBQk
	TmjZlb1s6jfiL6OxI1shdu3gvzpW++cAxwhYAYstJoZt4XnzU/tmGO6DrwgwGzyQAC3x6Pk/vA+
	eYNImS3TMxa6Ppl1i3nQ8MCMHCtRQ5vfByo1VjzWxEq8IukIhtlXIWKEtt9rPKR0Hpw7towB7A1
	7wu4bNv1n75jG8e+XsSK1kQ==
X-Received: by 2002:a05:6a00:2ea7:b0:781:24ec:c8f4 with SMTP id d2e1a72fcca58-78c98d3303amr13937014b3a.3.1759789221379;
        Mon, 06 Oct 2025 15:20:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmbjvu8YGs2epcEfo1RGDSZj+PsWdieVwkMJHJiW2v7Dd75B2hyrpkavb8BTk22/5l9Ds/9Q==
X-Received: by 2002:a05:6a00:2ea7:b0:781:24ec:c8f4 with SMTP id d2e1a72fcca58-78c98d3303amr13936990b3a.3.1759789220852;
        Mon, 06 Oct 2025 15:20:20 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01fb281bsm13734968b3a.37.2025.10.06.15.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 15:20:20 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v5 10/10] phy: qualcomm: eusb2-repeater: Add SMB2370 eUSB2 repeater support
Date: Mon,  6 Oct 2025 15:20:02 -0700
Message-Id: <20251006222002.2182777-11-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
References: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNyBTYWx0ZWRfX5JGKWJcNysNn
 PmV9IfyRYodeHKXgb6msaF9PUnstaHf6MiznniHJJj+xQ3k3Qf2WE628BpBsIcx+eCFRzhfZxoE
 dYNeFDfm1tfn8GMxor4DcV4e91vOCyP1UeVof1gRmzsGCVFyY1QuKKEYkKaImHcz9sPwnVXkXBL
 3R9vdqsh0mHlMWODYvnYD1m8+At8enRS50RWWMxDTOvvOr0fLXIDZq0NHdJJLhvdva1WQvAiyVp
 k+5pg4TX4VEk52wjGk4eZZoLAPv4YjQAEk3Sf8kMSePv1c9U8fipk7rS8BtdcbTFUre4HgOmguw
 /7r+TyXnmDDN61n0bzQzJlT+N7DIZOvfuJAC6Cm9iNuDKprDAMdC6OAjExZuy/yeufyQM2EaJny
 fBKv/phQ3qIp+GRsZXfTwQUHqiwBqw==
X-Authority-Analysis: v=2.4 cv=do3Wylg4 c=1 sm=1 tr=0 ts=68e440a6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=Zq12RZiOzp0PcbRnEbUA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: ccWhxa1pkqRZLpbJcUT7B6O37uoHH_DB
X-Proofpoint-ORIG-GUID: ccWhxa1pkqRZLpbJcUT7B6O37uoHH_DB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040017

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


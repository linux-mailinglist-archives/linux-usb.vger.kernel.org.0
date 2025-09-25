Return-Path: <linux-usb+bounces-28660-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06047B9D2EE
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 04:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA43A188A122
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 02:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7ED82EA75C;
	Thu, 25 Sep 2025 02:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FoDhhdoE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587822E8E06
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758767351; cv=none; b=IIeFzM6arAUxN3GJRvpt1kjKQhwGKopFgrw/OIbrmXrcA2DiMHK6rVBjuGBCzviSyp19YmLipQH3h2gYQoKGHYBB0j7vkY0lSDv1FBlZdOt0gHxlHXY9xio2ibiDmswui3CeK7w8ItwrPfI151/tus2cLGTQR/Y0VSJbpKPvWIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758767351; c=relaxed/simple;
	bh=OkC1mLtz16qVJoq2dcpPz2WMUUNz5fHtzWVOhSAQHi8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bLWkwo5YmhD/U5rVr3+tPFvQ/ES3b25mdm1WUc3DhFFSdteqWjYd7upiyNi4EtAh8a5HrfDZg87yIJPMXP3hEMbDBrk63oML2t0Rfo7vUHkp/B5DvQbsovSn4ImRl2ifDDAxXZDafGiy165XqZO85+EQ3ypjQ/4AiIDTN1U1uK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FoDhhdoE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0gtOT002665
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GwDc2ByWl5B
	YnzIa/5w++Oacjx00R55NFfYXUv0r7SI=; b=FoDhhdoExc/E0oa/RjY6gsGt/Jh
	V2wlsOgUWGGySNr0nKBxTNQ524GE66k9a1tr6uGHvlhxYOvuusqqfuZLoufZv3E5
	InFF9mK4clImcK31E4vXy8zGJVaNJqtlN89+4ziPsWF+sBh/Fyb/0rglEyVf7kpf
	inT29eT8B91jGnDgs+Z4Hs8fU/7w+O5tj2hTyPzX2LQnF0USyrqITFnnJd788LiD
	fy+eN5IEcV9c+OEkHuyMuMceYfWRyZiLCCpThAe4EZlwC7x3NdR4u7Qe2H1H3Di3
	k5Y6MgAqOai0gDG/WUj/SnTuhQf5TOhNwvGjBTBFJ6n0SM5L2MCrshKsYmQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajf0yuh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:29:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-26985173d8eso7355985ad.1
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 19:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758767348; x=1759372148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GwDc2ByWl5BYnzIa/5w++Oacjx00R55NFfYXUv0r7SI=;
        b=mgiRCFFL4Yik8h7KZX0OLM3RoAa7Ef8lbAM3ScbqPcd0PghTRlbEf4a0/a1Gz4Y/7o
         oFBiQB5UO8rgo0nqWeR7dTZ/Y+YeXhPH0IDR2q3tIAbnSwbXwzZOr+eJWt+0kb5/HOPM
         FkymkpERlLx6GpRWKqhYoCf9n03nL3+75ImsbSdLCQkKLfi+oM6HpTzRnfjWcyTAx4Zt
         6/aW1cj61ry4KMJDnLDPNIVjhwYlJvfp7sw/q8G8Q9ZO+KITodUYEX92OffjCHIvxbdO
         HAduHzKnRhyE8fJ8OgacB0VxFGjREKz2YLa8FZLhpOLmDmkV2eryPhmIS0yHV4HktyQR
         hHZg==
X-Forwarded-Encrypted: i=1; AJvYcCUgWSRznkuFohEiu8FPl1Rnt3RUK3M6x0jmqCr7m+twwx8Dq3wiZkIDr0DZHfNTKf0k6jhdtIHcpO4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ1BvhePE+pM8b//F0xHeXmfm8ZZqYYY8jYvA2mBkimw2mlhX6
	H+4vkmeE8RolfXbIf2eYfoFOsuEtv6Md00DyoF6pirER8Di5p9sTgDQW3O6axhWWCjBxbJJHDpI
	SKQwzD4ku08awLp0bnGlJDz0joco3TPFnlOxM+VPH3SDiCe7GzNeepdtQqygSEBg=
X-Gm-Gg: ASbGncvniNN6NCv1bqEMya9Hro1xVP8dzCEj4LyUgiR7XmwIWJvkT7JW7B1L1RbfD3V
	u9nKCNPEa7nxM2015ADB91waVxZ54Y/j+xrxVafQ8dc3mnrhPXcLGdlQn3JuAv7hVrgQO9dgZjW
	o/vqR8mr/g3bJwYkHuh59wcgwnZPztxtP6qW82/N71av0paHDc9PQgga18pqxyZInmQBdEH0/jr
	yeHTxZdTrUFsVCrWZM6pK3tTxZQEbO9XyA7aosTogqV7+maGIXHPgSMzPh0IBI3y1mT03gtvoRe
	eCkBaCbx9W8Qo1V7lHTrSr4Zg/X5VHSRNmYbifg2wwcm5J0twWWDCX7P1XHRbTtDlECqK4uQ2JV
	zaUoVydHX9weA5r7r
X-Received: by 2002:a17:902:ebc6:b0:26c:4fa9:64d with SMTP id d9443c01a7336-27ed49c69e2mr21780805ad.5.1758767347714;
        Wed, 24 Sep 2025 19:29:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvMKdq/R1VOIoSCgX8QYg7ZQfJNKKkQRcAu0k1AT4ZkR8KlDibAwSZZsHxhiLM+nIZarqOfg==
X-Received: by 2002:a17:902:ebc6:b0:26c:4fa9:64d with SMTP id d9443c01a7336-27ed49c69e2mr21780475ad.5.1758767347265;
        Wed, 24 Sep 2025 19:29:07 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33471d711ecsm499881a91.4.2025.09.24.19.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:29:06 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v3 09/10] phy: qualcomm: m31-eusb2: Make clkref an optional resource
Date: Wed, 24 Sep 2025 19:28:49 -0700
Message-Id: <20250925022850.4133013-10-wesley.cheng@oss.qualcomm.com>
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
X-Proofpoint-GUID: 4uAXqn_GS4dkiqiDja59qgEeAWf-Dzb2
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d4a8f4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=8inbgvmG2iPteTk8MkMA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfX/9xnJtMQglcf
 pzOMACzKP34U0c8dzKMHZd6UsOYok3RrBG9VzM8JzEUdUiSHVEIVnSQiAYs81iDUXVHvEeGJZoO
 SgwIV5W5Zhh8SxwJ2wuzefQKSj+Yn1iWpRsEbV4hKt7FzRz8gcxHfGAz18CRNybffJXDlk1qqCh
 WeIZ/+bnnHCc75tTf0MtvG4HQT2yPlx+eUOrROKpW/KOXK6GjezI2VRUNWekCMFjLOpQAHbfCSZ
 ntj355zt7XKrymJmIdzfqjfbqvGcipQR2MBqA1uEX5Fu81AJoFx0cbHUrwrSg4F7ZI/CR5xHHEh
 PMtewGYUk+re87ugHDlvxuhSC6lfG5oEE1pexSwYbts+CO83TDbWMf98JuPVYsc5WqKwTxgmZRh
 zg5au5mv
X-Proofpoint-ORIG-GUID: 4uAXqn_GS4dkiqiDja59qgEeAWf-Dzb2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168

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


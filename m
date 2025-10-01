Return-Path: <linux-usb+bounces-28857-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7BCBB1EFD
	for <lists+linux-usb@lfdr.de>; Thu, 02 Oct 2025 00:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95237188B506
	for <lists+linux-usb@lfdr.de>; Wed,  1 Oct 2025 22:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D644B313E2D;
	Wed,  1 Oct 2025 22:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MzHbIRzT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414F7313D71
	for <linux-usb@vger.kernel.org>; Wed,  1 Oct 2025 22:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759356355; cv=none; b=j+x4n5MrEN+modVYkiH3yvd2UN2Rj1LUxjsdYlPdGrC1gI2g1H96GNAMSoxva2OfXGKKDuRnq+3QCVAEEFni3bteIiuba4Yx/X/5bZLkrOCNGSaVzOY77sKvfAoGci+CsSncXxk+OHHwnXp1/1erg99DL5acmL9XTqBg7SiiaEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759356355; c=relaxed/simple;
	bh=wwAOX22I0FMwc3Zh3TmwOoD6CIPx68eD+c21Q+iR4lk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F8tfu0n3bLCKJTtUYafefVlC40wwX1Qbh83AH7uXrMHCBmKkg27gWPsB9AJuKRUl9T4be6DABi2YsuON+kTzj9nlnUgCn62oCpDfbdeStxrbKH6p390KctA04kFSmtmRE0+L5hvWzPSU3QHCkFOcxB7NC4fIlO5h1nyKcYSzIys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MzHbIRzT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IbtbI023326
	for <linux-usb@vger.kernel.org>; Wed, 1 Oct 2025 22:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fV/4QT0VA9Y
	jNuWz+QmsYOyq2W7XTcB2wF0sRRRIIRY=; b=MzHbIRzTXcx0eDmkqISGNJMbVyY
	hTBgZTG7esS5c45IStBAEl3hkYcHKJk3gsznEEvUfhh2m0WCEUmoz2tAcLcWKkC+
	wcrR6u+noOJrNi0nraDv/acNAjVFFoIqiUgncMkKf3PJsTgEt2eDpuvixoXUUssh
	ZcpNJ/hkrlpp1ff8EQ3/d4WZ3kGQBGK5J0ddjCdUn63bRB/txEs3qhTMI49RpuMq
	Ud0VUHd9dVt/6YAUPiKVFMZRrvThXn8fmzlCDoGI1994JD7rQoBt5toyKyNDOXsw
	gf1DVUeKpPq/Izwgmusi1psKBhNa1GaAhRQ5GiBnNu7/nD2OCc8KkO3WCKQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a660tj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 01 Oct 2025 22:05:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32eae48beaaso347278a91.0
        for <linux-usb@vger.kernel.org>; Wed, 01 Oct 2025 15:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759356351; x=1759961151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fV/4QT0VA9YjNuWz+QmsYOyq2W7XTcB2wF0sRRRIIRY=;
        b=T4hPZydCBjD7JOXwPayif3XnDIwqB993+utoqtmjtXPo4U+xrETzkOalJ0rKVfTW2f
         3PdLLQwt5PdHGc4SnF/vzt+1lO/bCyyMES2F4Mr8fxdWqnuSEfpsEbNhv6SbEejemWB9
         b5Sf6wgKZeqZXB+hlS11zCAHQ4r1NJztVxbJuk2LHKEujiWuHKHktPGzL/bbsQMJwPC5
         UZ0Me87d+NhnNHpKrd1DyqDy9iJUPQgdyXn8rOVyb8tiZyfiLsfM30abZ/LZZJO0KAdv
         CcYysOsU64MueiNczOIollnd/c+YAVVB83LDQ2LGQeemnrqnF0TRjlh4Jl4Uou1js59+
         XplQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk2ZU59xJ+WfD2D7jwcBJhihpc76uaknsrdVDfqZXadUCtJR8+t6xuglMLlzN6hug7tfiOyDQ5fas=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAkmB3sdTIhc+vCCwqvW9XJJw1naKx0e5FXqwUwwpZ4xFc7DU/
	QhAshG/z5eD8dvKIkKaDR0eewNXKyndtMI19bV4rEo8YqASi32ufVIc5jrE4BAqdbLgV0D9s7R/
	8KYowD89X74TcauuWQeeTx4ulkRBFaMtWhdZ0+DfJKReyrRlaj7fnTNhBLyODc0E=
X-Gm-Gg: ASbGncstvrIOfy1EfxgpEyOknp4SpgiJpy8Tk1mRSOrZnRPpe3RdGuju/XwSUbMQRqL
	W7K0vOcLY3K0LVNfanGqx56y05cK4gc6IwhODmsRhEsKVm+KVSuY8QlvDt8761mZemp9jyRqEBf
	pa73R7UUgzHpgiUI8DvatfoJ/bQWRThIWB4qSyIPXiaTV8kkcP1tRY9767IN+xwWo9IOfq3eMOM
	+ZQbjJBUzD9/CMYbjyoZ/L+lj/FNgaXpNjV0AdiuW3iCFn4bXMU/FOzNsshvKBQthFkF1ZAy5ad
	F5sgxnmT/CVovq5g7CtOCrmOUHMLtv/HamfUtopPZtK/Mc89wbUQ8LWna09L0EyhAsr28LQbBnf
	gBEMvc8nHY4d9PMU7fu3Tqg==
X-Received: by 2002:a17:90b:3511:b0:32e:51dd:46dd with SMTP id 98e67ed59e1d1-339a6e97a92mr6634312a91.16.1759356350774;
        Wed, 01 Oct 2025 15:05:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmr7R5I47BoSxuFE5aidJ6MkJoBIZ2dG5PdBMeCR3hmk/q1hEeSZK08XFxZ/maDOfJEkItaw==
X-Received: by 2002:a17:90b:3511:b0:32e:51dd:46dd with SMTP id 98e67ed59e1d1-339a6e97a92mr6634278a91.16.1759356350296;
        Wed, 01 Oct 2025 15:05:50 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339b4ea3c3dsm702085a91.5.2025.10.01.15.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 15:05:49 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v4 09/10] phy: qualcomm: m31-eusb2: Make clkref an optional resource
Date: Wed,  1 Oct 2025 15:05:33 -0700
Message-Id: <20251001220534.3166401-10-wesley.cheng@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68dda5c0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=8inbgvmG2iPteTk8MkMA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: ezp4yqRZi_ESuQmg3wKdD9zbC4j7etD9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfXzKF5LNOY6qcF
 dnbQgVYFvcmdq95ebqmcI0CKyYeFr4ZVALlwtSjqFUZqWEPat1wPYc8J/Snk0Np2N+g/dAf/ljj
 fON6OVOoi+affKw5YiqUvKPEA3V6Cv5Rcw/mzNEHAp4qq31KBwl1mlBES8fg5NJXXz5kQZjICnc
 XRoO/d8K8ntCg9YIjrOY+VrVMoPuzMSyrOYX+YD/0IhWIscTvvfjwBzdiy8hJyCn/Oj+UAOOGr7
 LmWP/8OGNjy0WG6JYPWw+OZfdlXxDvIdnf68XXQJMDC5BakKlfipl2hNQU0YhRf2wh4fVilu4fX
 /dKvZssbKPKxmRZlLNvFdn9vZwu6ckkL+uxz6KUMTVs+aST1Rk/ENl9dNemwOaUJ12bioP0YN6J
 mmxHTEGVAdZzrL/YNbebP/jTAa3cwQ==
X-Proofpoint-ORIG-GUID: ezp4yqRZi_ESuQmg3wKdD9zbC4j7etD9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033

Some USB subsystems that utlize the M31 eUSB2 PHY doesn't require a clkref.
One example is the Glymur platform, which contains 4 USB controllers that
all utilize the M31 eUSB2 PHY.  However, PHYs associated to the primary
and secondary controllers do not require a clkref resource.  Due to this,
mark this as an optional clock.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


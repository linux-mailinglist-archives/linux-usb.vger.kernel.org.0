Return-Path: <linux-usb+bounces-28661-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E86B9D2FA
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 04:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FFAB383DF1
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 02:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7C52EA732;
	Thu, 25 Sep 2025 02:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OCaEVAPv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7DC2EA736
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758767352; cv=none; b=q7Q+QtdSLcpBCOPBgTzQ8ZARF3bOxIxGnAG8O/TxxLWeQefNnTpRepV8OI+isxWso5h23U/bszQmmbukdigfcZjXh8w7mGP5WttMhpr+XIVzO3qTPvcYIgX6Y/IJ++kEpBdgLclRFJj4c9MXQ8RKS2sU7P8v6zqoUJAUy/z3oNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758767352; c=relaxed/simple;
	bh=KRfbO68RqNXGYUxEscJ9pAB4g2zVH9KTs2sCuSCOkhg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fX41K+4lDIc1nNu7oVtH2giASGuIOknMLB3ZE6cjZnqipl9evsBge6wnusL+o8bfOmXpLFGGyUk3H87pHwoCxs4nXOL3W9qtRdscRCkhrnwD1v1qT0RCOIWBhBTttQvxPHkRykM74YMYjAH4ZnYLctlejsyPJfbvJyFWvejV7KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OCaEVAPv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0mPHp029712
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NVYsIQDhA8R
	ySLuD9P7ecPi4IEalfEg3vxqe/TJrcfQ=; b=OCaEVAPvjxbkklv9I1axjPJpqwY
	ntg5/hTbvGbrGrrgMTERYh1AwxwWOjdIIG9XYAapcHT+TZsvEpr8cbgRu7bSsf/r
	LCbvSfAfZ0cKUyO42gkdOirH1ppfbnH0POCE6oUL65JGEn1vDNy0O7uD5h/zeLTw
	yPYLroGiKlxamAWZ8Ifvsl81/XaBQTzUHFBiF9fCWZ04RTn8IIkcY6v6iigZwjuV
	VfteZF6PqT80rX2VALY6574YKTmX7ftyu3OHzXbL4w+pulc9Xw1TAvCEF3gFTpIr
	VHqzZNu1whzZ2giqQcMcZrPTWfYOkrCBFumugIGz+g+mbcbjoL3fjnVuG2w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fpatj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:29:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33428befc3aso506887a91.2
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 19:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758767349; x=1759372149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NVYsIQDhA8RySLuD9P7ecPi4IEalfEg3vxqe/TJrcfQ=;
        b=RC9QAEX8Ol7D4R+fu0zrPjQtoP/O4B794R7PQ2UzHHe+SKo8x2dupCYPjb/L32xNyZ
         nLpYjp1VIOBgl0IZnvehhUvdpjfb061+4h12cavEkfufu+Qv7ZmKAO9i125uuOIkmhKH
         gr1AevV/zwuyik3hPgexq7VQV/I/HmLIVEIxU+BF4LkM64RR1keYyyOfC8vRWOXqDmRI
         Gngob9ktoYbVa2c2h7r99F+UH88N3CgmYPGlD2kM8seYJ1phB3c8uAM/XqYO1jPYLKl8
         o1gIRI3qZ09Ud8NCthh31g4APJOdEKwTuacHyMYsZdP5M3Y01bnQVkVfC9cGxT5MSYDQ
         EOyw==
X-Forwarded-Encrypted: i=1; AJvYcCXDo+/6aQC9LxfdqEfQ1iT3r0AsqsfF3SyTO7VIxAISFdm/UHvL0zUMe0twY1f0OPbY/RTCANXbunY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz94d0pwMLDMQmaledXzomEPHizBkyuxwignMBjDChTJguZPUKP
	ZNYIHZN1dAZuDlcF77xG8moHRQq27qHjAHLvWECiIuzE04sgTOSOK4XLouyoxUWlR57U0VKlVuT
	rdD7Qe/pr7KzxDzxxTEZXjvue3oo5W1xSEYoqGNROkCbqs1hj/bBOZVB1AKyZUck=
X-Gm-Gg: ASbGncv6liE+w1O0S5PKdh/CEgSim/nDGzGEbMd6XzbywtaEnyFKghfSGpL0Z2Om+43
	8F4JuhHNlJL/khNxKB7TmomKXHwIP8OB2lLOTy5SnqohPPzfNZ92kQs7WN9VoIMF8r1YooWSows
	3rRjN2bGPR8NipGXqezAlmF7vf+qD9wnensgChZOPmU9B48mJnJuXZ4jPkmHChTmSOL3IG1wnoz
	okLk3/fQk0KlCWlVHYDGCiPQhTLLI5ySAs83kqEcKWNLT2RMeYxdBJwQpYl6nYxt6HypoBrrULQ
	A1ngbxkRup8AcR3UrTyGzJq4yx8Pbv0m0CPDcBhSmr5Vbw6J0ZGp/Fos0HTUbRntKS/abbVqMvd
	EwDqoM1+2L9KXQx+4
X-Received: by 2002:a17:90b:4f47:b0:32e:9daa:7347 with SMTP id 98e67ed59e1d1-3342a242c87mr1559888a91.7.1758767349147;
        Wed, 24 Sep 2025 19:29:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECLCA3QwbkNEpn1Y33npnCoVwb/JYm/tQthSgy9u+tUbbw0LDLNGOOwLt4aOYfh2ilmfQULA==
X-Received: by 2002:a17:90b:4f47:b0:32e:9daa:7347 with SMTP id 98e67ed59e1d1-3342a242c87mr1559869a91.7.1758767348709;
        Wed, 24 Sep 2025 19:29:08 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33471d711ecsm499881a91.4.2025.09.24.19.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:29:08 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v3 10/10] phy: qualcomm: eusb2-repeater: Add SMB2370 eUSB2 repeater support
Date: Wed, 24 Sep 2025 19:28:50 -0700
Message-Id: <20250925022850.4133013-11-wesley.cheng@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: wAnR-xqkpOIl2cs-r6aVh3gW8ek-Rv7e
X-Proofpoint-GUID: wAnR-xqkpOIl2cs-r6aVh3gW8ek-Rv7e
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d4a8f6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Zq12RZiOzp0PcbRnEbUA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX+hEnJ6bZv2X2
 Rc5ix5a7c5lc9p94DOkmiLzQzfL4EV+2aM/AH5Mis12W+IJzWV32uXa2fItXifvzxnMTUr9HZ8k
 P1aVaR86Prb7NHbhdjvGZ4H6H9xfmGlY3xQfOPfwmS14cwj+Q4mLqcJTltnCxoVQAqSQUMAo/RF
 F9Y2AZt8G6Z5LdF8HAsLZMVvb1lGPrnacPfgZQCKVm4rYyCd91xAI+PeljO3xFQn7DJx85dRagA
 h1BTYXjN4vJ2CRwL/y7fr8/fvePrK7QY0G2R7dJ3W0jQKWYr1wC8CNDXTS+Mq8PvkKNZ9z1ZTeM
 h0hXlOhlYUoqdcf7kCJtVIKyORjd46xXg+M/6htBe5hn5oDPL341690jxQuil0y5hJ+TSCYumj2
 UG3nJI7E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

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


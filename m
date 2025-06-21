Return-Path: <linux-usb+bounces-24978-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93189AE2B18
	for <lists+linux-usb@lfdr.de>; Sat, 21 Jun 2025 20:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C7D83B514F
	for <lists+linux-usb@lfdr.de>; Sat, 21 Jun 2025 18:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED2126F45A;
	Sat, 21 Jun 2025 18:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZSq5Uatp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1A9271464
	for <linux-usb@vger.kernel.org>; Sat, 21 Jun 2025 18:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750529667; cv=none; b=XmiUA5QVAGie5R/w+eC28n5Mw/rfVDUBAm6hzIi9j/6cBanu81/ax+z5AzcBpVIuvbEgaI9bJIzo5VV285in9vaOS9ckFn1LL2ByrzZdep3jWAieyz4nSTT5iHPZarKZ0NGOhnt+EzUbUXJzVvtCknge6SHDYXNc6lL9w3qZMsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750529667; c=relaxed/simple;
	bh=Run+O2mI2A76noQdH2tqShWLEpuGZIuywf14cmX4Kk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kjd3vJXyfVeB2ooXvnZJ1grLjqOAFScPWRxCdPCL6NexA0tc/E8LsRxisIcUqNAjCsdUWxQnDYaVMaJUjVg37h0YxsjuSa4gRGRGu+9IEaop+MWXNc3FnS24sRp3VA66hE96U5MfLuctPmx/Rjznhk3jyNjfyN37iTehiexLMzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZSq5Uatp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LHoJiX007784
	for <linux-usb@vger.kernel.org>; Sat, 21 Jun 2025 18:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1aqIaLvUpP1zFWPwZcv8zHZi9hcPKnIY5YKRhPTvJuk=; b=ZSq5Uatp+fG9ELBr
	RRwTAdWxWNSz4z6UtG5++e+SRg5K4sGGGnzchc7TkXzBZjKYFSDXdL+FymHxFJW6
	S8Xlrm44tjahnBo/NVKVH06HOsYtT3gyP3ZAc1Jf948YfVeN1F/DzXKMhDh9djSD
	IIhrDSDVsjf8vWXx+KApWNY/oUwsgzRiDdmgo4UXWUO7J0Ls5lN8AE1mW+CDqbFv
	c1ZN2i4LuI0bYCHBTPtBPaO6TfgdsrthGJG3R9wt3H+14AWS3MwBEYn0vhu03cCj
	i2wICl4stcHVS8rF+EnwihaCGV1WNu044e6h8DJsbL28ra0pv5eNTSBJcBTo7wiq
	pdpEqA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dw9wraks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 21 Jun 2025 18:14:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3e90c3a81so242170885a.1
        for <linux-usb@vger.kernel.org>; Sat, 21 Jun 2025 11:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750529664; x=1751134464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1aqIaLvUpP1zFWPwZcv8zHZi9hcPKnIY5YKRhPTvJuk=;
        b=nRDTJ9ypojUJnBZmxAd6ltukbXf7dah2owHrzMMiB1JC8lbb/0IH7BDh6tqEwr/fxX
         zZa2X+rJnxTc1haTSYD2k8bfvbKtwdJJeop21FRWO8zHXgEpptmPKRoFYwU4OxdgoOYX
         O35BCGNS1n+UCaYjB+CPSQfj27T3HN0FyMZk66/EdrT7HiicH4H/x7kwUXkUrWdWZKVb
         sh5KZX3iD9Jrn9yLkHDz+rtpWhzHgK9UX/kZZYrOEh1WnropH1wqSht1CvxrOAq8xmDO
         89sv8SWWiaVhayGDJPNoCVXSbZtDMSt9DP00kWzeKyVBsv7bCmoV7LMT44WO8OWne/Jt
         zv9w==
X-Gm-Message-State: AOJu0Yz29tmE2BjBXjqCc9MBTmooMctgp1lYIxxY+Uo6WMmKQjQT/K2O
	PDXQ4I1ChG0b4imFUafwKZPA5OeWKDLO5jYEVbPEsBXwvG95CyGiioFMrvdMHLws50TvT/dzi+g
	TSfCCrLnrLTNtAsu6KkQ2cmGmYba/yU62hJu7x6bSf0KULPfuo1yLSDni90yIYPJA1aTXsraaNA
	==
X-Gm-Gg: ASbGnct+QNbT+GwNoDC9l9ixOT209bAEnLkv8/31Y3vUu68StFKbUQTWFtBDsGz8066
	DpVlJh1yqX+6WXQwBmuQ6Z8h2lVDGlKyhiE2ug1uKmsfLavw0XJ7urR2L5t2jIaw3frYP6lg0lt
	6cOV5TrY+PyBInxt3xfcVyCimEcwhyEskLCiUMJ8aGjFasBMGUEglBeN0tRIr1z9P0aRwTaLJzq
	vW7nMp1LxZW1WvxRxhq2ZA7dAzNGJC5feXiW0U2HBkbFRLJtxoej/DxYE/+ltRuu0z5XBPTnc2n
	k6qPS/4g0RpXnNuxrwknErbMiUnlQQLTB9frJCEYwsqRVPI7O6si7TtCzmK5yJBp//hTt2b5Vox
	/GEbpNYTmgmYyNs5K5mNYaSC3NuDqHpumdB0=
X-Received: by 2002:a05:620a:2693:b0:7d3:ed4c:fe84 with SMTP id af79cd13be357-7d3f991d7d9mr1216213685a.31.1750529663620;
        Sat, 21 Jun 2025 11:14:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELim/6+6aSoh9DCQhdH9yeSt9LxI2hvvLw6WOJeokVXk9fuz4Lf6Jl1owf+XMfbDNvPIp+vw==
X-Received: by 2002:a05:620a:2693:b0:7d3:ed4c:fe84 with SMTP id af79cd13be357-7d3f991d7d9mr1216210585a.31.1750529663236;
        Sat, 21 Jun 2025 11:14:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414cf36sm752336e87.86.2025.06.21.11.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 11:14:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 21:13:01 +0300
Subject: [PATCH 6/8] usb: typec: ucsi: yoga-c630: correct response for
 GET_CURRENT_CAM
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-c630-ucsi-v1-6-a86de5e11361@oss.qualcomm.com>
References: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
In-Reply-To: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1228;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Run+O2mI2A76noQdH2tqShWLEpuGZIuywf14cmX4Kk8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoVvZzwGwXYpmPvXDx4iRsvi9cjZU0WfvZSDkRh
 IDMJvCJeDyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFb2cwAKCRCLPIo+Aiko
 1RSLB/4obyjbVEnnrgRFrKXyP8J/IIWxADau7nzq5Ef21hBWZml2P4EjvzYsPPBuYZSTClzcuAj
 i9NZEYyViwIasFDsQU9aDXQ36I65lGrnjnnTl1ii2BiHQggjgHDrBkcvET281KnEXY/1CemYaIq
 o5gMtd+k4A2/zRLotSO3SH6SC/yulmYj7ESWJxLmwllFHF4SWEM5XqSgmklCvheY2QxYdFJjCms
 5enH57R56RTgJYT8bkt2k0GGIOSkW+1R7s3ZVFdLw4xeBHlp5oDjDucDFKS0KHIPvBM3Nuj5BEO
 kHqLWEgb46YmdGXSNyV5WOCM40B7wuDuRBgucsJl25ETxJax
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: ZTVIkk2SNweKf1Xn_SGOxEthFfJMNY4D
X-Authority-Analysis: v=2.4 cv=HcEUTjE8 c=1 sm=1 tr=0 ts=6856f680 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=btjbPSU_vhCAQAxPhXgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: ZTVIkk2SNweKf1Xn_SGOxEthFfJMNY4D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDExNSBTYWx0ZWRfX5jC7cjSDoUT7
 iV7dqlyMq3IszLEh5vJuJnZTx4Gu9hL2FwYuqSS6EF1/WCBGVO9Lsu8rVB1oWDOV98kd/86gBxO
 h0DsAuBV7g+zcKMkuxE8bk5FxnWtBQ0eCCnyTlVzJcftVnEt8XsjFDJAeQTZU4d7GjJkCo9t1zF
 QIyWYv3WaZDcXcAc1j0TS/vophf859pC8mflUQWKEVUBFkFOaaUFmt1WRh2Bv03pxIcA3MDsYXc
 XBVXONO9aLVw1MoY8m6hjTEKvsh79nqaPVjMXmFRTb/pSlwHunX7gyI0zasC7OzCq4SS2SqzofL
 Zn7YdZRp0KLT+Jb9i/Ehdk0+dgtnbpQ0U7F4uwP4alHAtH12r4JhUDjPwsPTTAMOhEkMlq64tsq
 KgC8Y7lmcdYKktDjmwmpIaBehdIU0b0M508yRwKnGLoRwrASyA1tKog4BY3vXaH3Ns7saTGs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 bulkscore=0 adultscore=0
 mlxlogscore=743 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506210115

On Lenovo Yoga C630 the EC handles GET_CURRENT_CAM command, but it
returns 1 if DisplayPort is active and 0 otherwise. However in order to
let UCSI drivers handle AltModes correctly, it should return 0 / 0xff.
Correct returned value.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
index 506faf31b6e3a056e067f2bb69f5e9e5ea40e514..76afd128d42a2573ff55433f815c2773462a6426 100644
--- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
+++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
@@ -111,7 +111,15 @@ static int yoga_c630_ucsi_sync_control(struct ucsi *ucsi,
 		return 0;
 	}
 
-	return ucsi_sync_control_common(ucsi, command, cci, data, size);
+	ret = ucsi_sync_control_common(ucsi, command, cci, data, size);
+	if (ret < 0)
+		return ret;
+
+	/* UCSI_GET_CURRENT_CAM is off-by-one on all ports */
+	if (UCSI_COMMAND(command) == UCSI_GET_CURRENT_CAM && data)
+		((u8 *)data)[0]--;
+
+	return ret;
 }
 
 static bool yoga_c630_ucsi_update_altmodes(struct ucsi *ucsi,

-- 
2.39.5



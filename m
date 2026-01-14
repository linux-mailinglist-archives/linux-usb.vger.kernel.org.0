Return-Path: <linux-usb+bounces-32352-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2BCD214DB
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 22:19:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3119F308A408
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 21:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC3E2ECEA5;
	Wed, 14 Jan 2026 21:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bNzrZMno";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dQGBD8iU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AF93587AA
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 21:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768425489; cv=none; b=CjFJDPhImfm7nrj5NrQ7URIwQyhWT5icjHRhZTrMpGq772s63dDTulko92ShY3HL2PCt1nccGILmEj7VHb+LqW3kUrhmTX0G65gV3xvjVSCe9x5WBKQh3ETpp5VQEYHxR8hmCgwt6Du6XLnGuwW3ljK4K/rb2IAfpz9QVPg1Aoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768425489; c=relaxed/simple;
	bh=EJ7d0Ndnig4nWkDLoi/NMmJhv2TXy74A0dReOD3DHy8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g/KO3uxV03mxkc+R/4mjUeXvggz8mM699LJHPaBw571lKs0gMlSS88PnfzEnuV7ZpjNXNDePB3tW/9a5seYF7OZ1itfU5tlShL9Xjy8FjBY2j26GK/N9QC9SyCKDfNQicp8rMG8yyAdF0V+PnSGk9xxAnYze2jCANpS/Diurt0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bNzrZMno; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dQGBD8iU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EKqedL495626
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 21:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=u2SXNrGrEV0
	PRwQj2xTrKkbIj9XU3CjNd0NJo1lMkv0=; b=bNzrZMnorDBctsgoFoMlc+kMJlK
	XTErHty2hPBgKSPuRq1tZ/eiT5DWdZFJaGywVCL81gW2hfO+3E8U7akxO2g+ee+X
	UFwjLw6wy8fVblcMaWmDVtLPWgvda0h1kPw+3NQbD0I+AL3esTjFNrvHMYs5wlIM
	i1QAHFsONAt7ohS8UUSdF9uS/ZXn6WKQPYU1h5qP8dxRnO+nG/lCOXMGMJP8WLi3
	vWbIUgTlxWxkVe+DsK5qeKWj1FZEUuk+w5H7+mtvqDpKQ6BvW3JBfHW9PvXHuLvK
	ZfAVNLTETAcO1dqlgQmw2thP2jS3jlXW+EKNcNFqbxA0LL5FDTjIDeZ/+QQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpjj9g2bu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 21:18:05 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12339eea50bso1000490c88.1
        for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 13:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768425485; x=1769030285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2SXNrGrEV0PRwQj2xTrKkbIj9XU3CjNd0NJo1lMkv0=;
        b=dQGBD8iUNoDvkZWlbcyOaslvFLuzqIGOnfPPtTF1Sj+D0G2l9fyHZXKYnNvz3/E8qN
         QvllrndhpsNpBPPODKNNBM0mKt1SH8Z1BMia2VgeUi76FxkgsDNwdTtVZHSNTTRV8eqb
         Xshn436IqC+86uDizHeoRN5AnGRSxUTUa4wIYB6QboNe7aqe4pgZw3B6SwhPTd+3qLbU
         j/BZkUiCKwX9WwRxEg9X/MqQzMoHJ4qsmblQ9tO3AWlbc2omyjQqwr+lKaNyFDug2K2x
         M8nFC3iPsGWSl7gwkTKbElDTIy48TTJsFiOSQDtg7YyjQeFm8UMU8UEt07oJccBAzxEU
         g3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768425485; x=1769030285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u2SXNrGrEV0PRwQj2xTrKkbIj9XU3CjNd0NJo1lMkv0=;
        b=v0+kYqBBi+eDGSCTH/7AKR7aeU1so4oYdEurbjOj7e6ioB+ct7UOYkq9Yf/kLSHnL+
         SHA2s2hUmcCGRbYbpglAzC0Z/GeEDBG6C8YEOpEkIuNo10jS0Lkj7eQc4S/mQy+tbMay
         lnINOK8lL3tAhUaoVFE7vJvi7cOCPVGka0QvIxnVOOdyN7aZaujlFEgqEiKzlDkb7KRQ
         qg3YkVUrON8ELPrDK2ouRFJftiZ6w+f99RIEqTOkKpJYt6JclhP2tZFDNUJ3GB7VWxO9
         gBiZqQvDEUDk4jT8aiggSFWwzTpzhysyy3qYg/aTal0+kgnIuhiqRYYU2458x18Gu5z5
         U99w==
X-Forwarded-Encrypted: i=1; AJvYcCULpTbSOZPHY+31tYmootkxq7mLFUzSTDAVmThO82mwOJKILOTrkF/41uzau4Z5utF3ENojvuCP0UU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yztff0RcsAvmhf1udCyCnh+Tmz7vp7YFXIHJWbat490eM/Jq4RI
	zOU5/e4g/7+TBg0yWCUgzvq1CxcaOl6TABYlLWFL3SuTqD7iT4yO055BzA+hN52hEgW5zBQFlDP
	0iVm+bwDFHwomk3yUVw1YogspAVJFgp2QZ6ObU5DTaMMo5HBFHJVaq44yw6oAJEk=
X-Gm-Gg: AY/fxX7ECMAiM29UpNU3wz1eItgRh+WujidhWQyS/skbAOGmXhMjnA7q4DMLmoQX0NJ
	w81cTlezPOaN+p50X8BcLKTCjccOAEW1Awo0IYbY6/ZUB3iCthNfc8HPE+Y24SN8Hp3Fs5bRHM+
	rDwOyksJ6YCn3fGkBd8LDOUJAs29Cze5/EdiFIYGFYHKdK4SBgEqA+b7n736GIfuiaBfINl7pWm
	0V1/jkdtng0RuoPs8C/zqO1mHoINSUAEvVlFbWjAZjD61zj2pwI2/XWTzuhmUeZg8+eE50fuVWA
	bGpOChE7MqwjIL5eCh+JTpRXxDrWe8zRzX3aPh5XGmyOWzFaNpiVg6fONfTDNDZIANc6uSxrOk0
	08vGcqY4lqssEeDnda25Ac8q18KrIyP26VcYTfhSON/LOTmVmvAV3qNkxK2bHYhV4OsPanQLe
X-Received: by 2002:a05:7023:88d:b0:11a:e426:911a with SMTP id a92af1059eb24-12336a5cbb3mr3795116c88.15.1768425484687;
        Wed, 14 Jan 2026 13:18:04 -0800 (PST)
X-Received: by 2002:a05:7023:88d:b0:11a:e426:911a with SMTP id a92af1059eb24-12336a5cbb3mr3795101c88.15.1768425484132;
        Wed, 14 Jan 2026 13:18:04 -0800 (PST)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f243421esm32167118c88.2.2026.01.14.13.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 13:18:03 -0800 (PST)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        abel.vesa@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v4 3/4] usb: typec: ucsi: ucsi_glink: Add support for X1E80100 compatible string
Date: Wed, 14 Jan 2026 13:17:58 -0800
Message-Id: <20260114211759.2740309-4-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260114211759.2740309-1-anjelique.melendez@oss.qualcomm.com>
References: <20260114211759.2740309-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WO24JRFRtYhadWb2AvcC9v-wiDWwBCvt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE3NCBTYWx0ZWRfX1uzP26NsfMm4
 oP0b8RH+EiPO3ng9MTgMfrujippKgVBjxh6ysOZtPJQY9FxGmxv8N80wxzFgAM+dDuJWI+aN8IE
 kX6Q3AW0l00mWOxoQw93ofrorLFyNVLMiD311C+ZPXnNiebfcS6RdaJUqXjt8U7fdYONFy8Sfwn
 2pYIwGD/S/NeiHna+VtdWE+a7wQvmUMrMGZ3mIHzXBcVZk9Jkm7byZuNiXxcaguZZXlysqgWreD
 12PZxFzJfmQokfctaTtYOY/af8U/Tvt7CUs6qaRnO7XI9b0nD0LdCQn8onhWOTDlXjG/MUkgxhw
 exeRm4Wm2+3sRY/iBcCMsnusKQy4WM+y4vaNs9Hs0lvtc87sOIE8FemJCKH82n5chRNst6ClFD3
 dXhFnkq/ovrRbKKlSy+VEdtbKzOW225nzyO7mUsxzUVjsi0Mtd8bmN99+/liUipgT4gtZKkNw6Y
 xl0u2b0/XFnIp487H1A==
X-Authority-Analysis: v=2.4 cv=dcCNHHXe c=1 sm=1 tr=0 ts=6968080d cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=5hyoARb301K5iUekGmwA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: WO24JRFRtYhadWb2AvcC9v-wiDWwBCvt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140174

Add support for the X1E80100 compatible string which needs UCSI_DELAY_DEVICE_PDOS quirk.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 11b3e24e34e2..e700c6a58a46 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -379,6 +379,7 @@ static const struct of_device_id pmic_glink_ucsi_of_quirks[] = {
 	{ .compatible = "qcom,sm8350-pmic-glink", .data = &quirk_sc8180x, },
 	{ .compatible = "qcom,sm8450-pmic-glink", .data = &quirk_sm8450, },
 	{ .compatible = "qcom,sm8550-pmic-glink", .data = &quirk_sm8450, },
+	{ .compatible = "qcom,x1e80100-pmic-glink", .data = &quirk_sm8450, },
 	{}
 };
 
-- 
2.34.1



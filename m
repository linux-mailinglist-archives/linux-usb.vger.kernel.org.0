Return-Path: <linux-usb+bounces-24973-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE25AE2B08
	for <lists+linux-usb@lfdr.de>; Sat, 21 Jun 2025 20:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8C8A1892CD7
	for <lists+linux-usb@lfdr.de>; Sat, 21 Jun 2025 18:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E32226FA6C;
	Sat, 21 Jun 2025 18:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oA3Ww1VI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CD4269880
	for <linux-usb@vger.kernel.org>; Sat, 21 Jun 2025 18:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750529658; cv=none; b=oBaz1V1c5G9gRmnxu8jlEB+jsRSr/lgTruOpEuj3u2ES+HcGVE0DWUzkn5WUhErk1ZHz/4HzknYmOldPS0/EVEvhlBxUIArayeDQorahT2c5ZBTf626dxy8LV6HLshweRdGZrNAlHY/XTw+JYgIjSLACUlI+bqmwkNcA0f2Pwbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750529658; c=relaxed/simple;
	bh=dSQFGNWG/Zf26SyfOt589O9Vx61eV+28LRkpnswAKEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TgEmzIVgTdweus1NGmgT7ez7oTpEihXdaYzLtnNERRsr8Hh1n5XkbkkdUKBAAeP8bkyCLxlUnL/3/sFMlk6ETy+hyxKbsnVNMYSzOD8RJ24aiHhX33EarlGsy1qL/y0N/gybxvyZ6/2UNBLsEzEWMQSbC5lGcsx/da4YSNyA0Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oA3Ww1VI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LHpbbW027514
	for <linux-usb@vger.kernel.org>; Sat, 21 Jun 2025 18:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bcQ/uB31Z3cDOfD3eWsCLPpsYTWEx+9S9C+nOkqBYN0=; b=oA3Ww1VIz1cpKZBe
	eTPM1nXYt16Hh2oYYoOKjy+sWt13kCla5iloWldXzSlUU5RnFFegMLiH0FxM/KVF
	8QTHeo4phR7rONv3mwUKY/nkhjG9xq8X3MUmp+GPy5pEAKQdYaHYu/2KyxIw/4Dn
	1If83H1hDgHpxClV84RvR3rIxctIjqpk5OwafT0U0YCPK5Y8MJ1krpHhgQm4qacE
	SqeGdeyWvr3ACHh4sCMHlsVh5gc3gtgD8MHKAtv+NWBHfZzm3Np1ExwBl+T0WKqF
	tWQckPZ1L1uDcYc5ZqvqMcd6N8aKsmzwJ9JFAqE1hy2CyKlU6tFk6jNpba4r+YG1
	E6pDyw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dyjhg54n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 21 Jun 2025 18:14:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c760637fe5so425668285a.0
        for <linux-usb@vger.kernel.org>; Sat, 21 Jun 2025 11:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750529655; x=1751134455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bcQ/uB31Z3cDOfD3eWsCLPpsYTWEx+9S9C+nOkqBYN0=;
        b=AJR0Gsv57nF87JuaEyHGJc+E4lb4ynYL/yGIV0kjiW+tvhoqclOFlRdHxR0ABtZLaa
         ZDc11iU1h7E/neU9rWVQjE4uiGxz4qTODsUrtrEpDSFejLzf41UYimsKmDx73fDPGHhU
         0erC+dIB+7q/Zzto6BWEFsxtJKt55EVSQhvEbzODnUJUPhdqAmlQZR66ebpcXLr81hr9
         oVPvQQKT3End6SxJfkotIIRhDA3SwlFBLHy4QmK/8S8w9X/bAMcP2dRASjA9Ssj253ws
         4oa2zecn8cIrRlGArMalgDyPlgoE0cvKv0bm6GGF/MbD37OLyMuma57Nix/x5JpY9s6W
         uFCA==
X-Gm-Message-State: AOJu0YyFdsEzjM91LuT47t2tHbD3dZFXPvYfIeaBw2F+ty6tERu4V4IY
	3n8RYdIjIkmOiZSnXN5snKdo/tOMooDoIJT9YSkzw5BiKDvHE+gtwCMBLckh2vOtP6ejAVFDXp8
	T+Rl3Zej6DSV2N1IuZI09AkZRM1RAekaCogb/xWAKl0DDAmvaqInCj7Oh4gFCYRY=
X-Gm-Gg: ASbGnctOIaTS+qperaiz3YJXcOryIKKoEFz2uaHWPdCnBmM6Q80b15Tqea4uf64T7Nr
	CM51kgA41RpiSPoJS3QAzGsxz6XxuV8/Czk95kRs8e5YSWL0JeHCHpT+99o5H7UM4i566yTzBvq
	9ggNkhhCDIZDQGDvO14riWhQ8vam6n11ABCxQhbW0gI26QsIrdnuWyu6pxwDIGSKLqB32muxjfk
	9I7xmxw5tolEv1Yy6seludRhFm+rFiFcywHCf6C6IbAt4E7BGFzKbyy59FhBvxGc05Boh89fng9
	w2hmki41eZCOI2JzNq/PxZOEpbyEFr5fyU282x+2pdjvIiKara4F+XC9cWl8cQDZvfA8J9p0rnL
	FQJJQ9AOSi3jzp7NwlmiXxwdZNEIG92UiCCg=
X-Received: by 2002:a05:620a:29d2:b0:7ca:c9cb:ab1 with SMTP id af79cd13be357-7d3f98c77e6mr1102347185a.7.1750529655173;
        Sat, 21 Jun 2025 11:14:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9y42uVOGByHIC2CBh6Ap0nz7GpIfl5u/D03eThzuzRkDRz+TR/dzqSjl234RVIJ6r6Kel8Q==
X-Received: by 2002:a05:620a:29d2:b0:7ca:c9cb:ab1 with SMTP id af79cd13be357-7d3f98c77e6mr1102343785a.7.1750529654719;
        Sat, 21 Jun 2025 11:14:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414cf36sm752336e87.86.2025.06.21.11.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 11:14:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 21:12:56 +0300
Subject: [PATCH 1/8] usb: typec: ucsi: yoga-c630: fix error and remove
 paths
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-c630-ucsi-v1-1-a86de5e11361@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1645;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dSQFGNWG/Zf26SyfOt589O9Vx61eV+28LRkpnswAKEg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoVvZyR3x2JVzH9HD3TQI4ofjUDHoHGx3Andr9b
 pMKv6svuPKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFb2cgAKCRCLPIo+Aiko
 1dNyB/4xVhi2i3qRu/UXloyqlOmjwZXkfGnQKJA19/28sTSvZSmYqkUwVjPR+rlBYXeD5ri+W+z
 hpgtM7ZFzm8FtToy6XwR/eDi6EA0ruS5wNCJ7GzXmcaI7+YwjBIyK5UDMMx8RdQ7RTYxBJ0Olhw
 ISyiLrr3hhXrHUb/hiRDI4igTussRWtKuK9hMUQ/4IB+4Fj5uN4/NcgbUkMzp6PYInoxS4WrKmX
 xP2ji4GdYqxa2FPbejzIiysLYe/qmiu3ih/2P7g9sS0W2Y05BTcDO7ckpjrUAZ7QJqyQx3Rdin5
 yklMXFcRY3QBW6pBERSfc79DHn0vzzRalx9ozwzEj8aZyo4N
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: kpfjndtRtQqtL4QPHZcpnfSa2RC79m1W
X-Authority-Analysis: v=2.4 cv=f9pIBPyM c=1 sm=1 tr=0 ts=6856f678 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=6GRmOlDtAtgjFoD-o_4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: kpfjndtRtQqtL4QPHZcpnfSa2RC79m1W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDExNSBTYWx0ZWRfX8DQIK/XvQGhF
 CxdfFXSDgL/0klsdyI820RrGPtBgqLi7LPAvcJzMAeYg45Db77YLrcMoylQ4wgLxQIgAHQXrfNQ
 zqdVdMIU9qLLYwl2QW/ARSYzzbrOemXNB7vFh0TDpxQgm9WdxYmWmN77Wa3yj5j9UWBmf/5MuFw
 pGcTedApQB1pJK0z+VJXJj0O+SO6MXKjEe+rD+auCR3ixjvhfD9vTjytVo1lym7HZVb1KXl1KxP
 b+GqtdETnMFltlycT8ZZ2J4TT/mlYVjyTeJ+K+Wu6m+mgcGzV4XSvR8fN7MZNl+kmliKpsT2De8
 zlCK59pFhQLzrhjA2QLgL82IhUOhHfLuLjyqXjfFkPoMKo1Y6Ac/M3J9lVHE/VEP2I48FT8Zliv
 IRZRmK8Do+1bswlmzxbr4ikd+NsjLp4+QP4cK8L14QJg7y6YqyNmUmOsLUOL8Qq0F/82j2kz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210115

Fix memory leak and call ucsi_destroy() from the driver's remove
function and probe's error path in order to remove debugfs files and
free the memory. Also call yoga_c630_ec_unregister_notify() in the
probe's error path.

Fixes: 2ea6d07efe53 ("usb: typec: ucsi: add Lenovo Yoga C630 glue driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
index d33e3f2dd1d80f7b49d9c5e7355fb14a97c74dd5..47e8dd5b255b2b306dd9c3d6ac8c3b896954981a 100644
--- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
+++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
@@ -133,17 +133,30 @@ static int yoga_c630_ucsi_probe(struct auxiliary_device *adev,
 
 	ret = yoga_c630_ec_register_notify(ec, &uec->nb);
 	if (ret)
-		return ret;
+		goto err_destroy;
+
+	ret = ucsi_register(uec->ucsi);
+	if (ret)
+		goto err_unregister;
+
+	return 0;
 
-	return ucsi_register(uec->ucsi);
+err_unregister:
+	yoga_c630_ec_unregister_notify(uec->ec, &uec->nb);
+
+err_destroy:
+	ucsi_destroy(uec->ucsi);
+
+	return ret;
 }
 
 static void yoga_c630_ucsi_remove(struct auxiliary_device *adev)
 {
 	struct yoga_c630_ucsi *uec = auxiliary_get_drvdata(adev);
 
-	yoga_c630_ec_unregister_notify(uec->ec, &uec->nb);
 	ucsi_unregister(uec->ucsi);
+	yoga_c630_ec_unregister_notify(uec->ec, &uec->nb);
+	ucsi_destroy(uec->ucsi);
 }
 
 static const struct auxiliary_device_id yoga_c630_ucsi_id_table[] = {

-- 
2.39.5



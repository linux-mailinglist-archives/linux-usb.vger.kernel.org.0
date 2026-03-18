Return-Path: <linux-usb+bounces-35031-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFX6HJxnumnnWAIAu9opvQ
	(envelope-from <linux-usb+bounces-35031-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 09:51:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA172B8709
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 09:51:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A10DD304707A
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 08:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54EA5391831;
	Wed, 18 Mar 2026 08:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bsw0P7Iz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SzYvmCNy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C367A3914E4
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 08:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823596; cv=none; b=eQxw3uNwXZkeXyimHGVJXKJMxlFZL5wLhMxCtjOQ5RhNQZsoN1jDUN2aw5wdjZrMApoNX6o45jbuheCy6Z0geJ7j8X5E2lwWA0noJpJngBezeiIFrNE1taZqXk6OLzgFoT7Ldrju6aSqxtTiCLzDRdztsw406nz6+U6VgJ/OdNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823596; c=relaxed/simple;
	bh=feU3bhi1EFcLPsMns/23hwfL6odQZUZiAE2YLq/awKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KQaZhpDDz/drkoM78TnJLBwqUlvWh8+cJN8oOheRXk965YUoVhARwpizfDqFmPN/x68f79p6/ohkJzBeW/zy++cmQ2zwkfZR+AwLhzJvcP+mg8h2FYGTsQCnfTpA9vaH/j9IZSRBed5nlGNw/jGHlaOW7phYxaPbkjP+E/1bKmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bsw0P7Iz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SzYvmCNy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I2eMmX2296910
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 08:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uo32oRrZn27QnOKsPwu5QCTTyPjXauI0api
	Xkj6/Jgk=; b=Bsw0P7Izn1nJlXmOqzQmR4GKsYqIDruLHh+1fMY0KLoRgHToQYm
	l/sPtGWrSyRdX6U2IO7JXEubsVJ7i9kXByP3zNcHnhQhdswB7z2rdgvwQq7+pOGm
	5zx1BIndlw2U1lCcEk0XTWjgolM6DGQ5n+8UJ6o4c63aMDc68Y+XLkeBger4WfXu
	CQM+OpbNhmIczKOX69dNDMI5RwIZ3zjKOg/ZUhlL/aKu1srSX9iihArarEyO2dLM
	7ADypAqDBxEUJ6OtiuP9Y0gU1IjQ76YlBI6e749XghLVOBh5W9h10VJ6+PApw9F2
	KDTg2ijjRFfQPnRqAPzbLelPdnnYR0tdkTQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cya83uh6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 08:46:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5091a96f0bcso49628571cf.1
        for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 01:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773823594; x=1774428394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uo32oRrZn27QnOKsPwu5QCTTyPjXauI0apiXkj6/Jgk=;
        b=SzYvmCNyUfvoDdMBbrY2SXtswJqiq5hyTTv0ZMLGdLNsaDtcCgGtgWqPS3L1svPwoT
         yqXQ8BxCPKizNU4JE9REzfhb5beYjVEr7SIeff83kvGPeS5X1/pwl0kTLhpa1Eolp9v4
         dyKLfME4KWg3PksqHpxaRyKhRRPUg5ZE/kQQ1iZqK/Cn0Kd3p8FvJlc9ttnI6RsQW46+
         SNDpAYfxrVXPAnbv8S8xO3O0rvxEfdp+HaUNRZld+dXsrF2dpfeDlg/DgYnKLWIeuSqD
         x++uJwV8k+ZoPZUYIOv2rzd27DKFjZWwrZK6l1oOFC8A2JWLsU7Oilmt1Pl+tQJHGGxL
         pCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773823594; x=1774428394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uo32oRrZn27QnOKsPwu5QCTTyPjXauI0apiXkj6/Jgk=;
        b=VhYj8dfjFo+kfWkHdb9lGp4eSnmAXPz69SdHgCiOQWgcMpiDrk5GylhMnDmd5/xfX6
         eHbchu0QVNqpatAPTS1A+3hhjF0ZxHxh2t3jxjuuV35bsnDHXAemGLXPQvMM+MBT18jG
         IYtaQgDFdFKVTGPOJR8xRWp8j12uGDbl7XgJNgF0pbCviCrVcclzcQxsNKyIUd8ADOMc
         mGRX6SwD3HoIp9Rr515TZ/UQqMYplYFT5yXzQTORGb89wkvPsR7sg6wsRYj3U/S4m1OI
         wroGUdgoLWc/fWWuV8+2e6hA3RF1JYJhS71f41KiYNzlw4+L60JkgtsUc8VA0rQoGXQO
         T1Rg==
X-Forwarded-Encrypted: i=1; AJvYcCXN3Q9FWVLsEnm/MSRo0iUy7ECvqzq02MRi1+7rYVpAzN3qCpXBXM9GXILc7weox915gz8kNqdtIC0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSXvAk2N9SBD++PrjiMXCkukuBD+kqQHuBcpfXFIo0rgoMnK/N
	JnipLGZ5po6t+FZ/ahuYkgHJbY87J/8yVFy+LuS0mhN5u2ti2ut4R4dL4mhiFWkANqx6AB3MGcB
	8fPte8XOo3r5kr9XDbfdpOc8RRbVVbyRM+NYP5nDO9jtFZ6IgAN0C1oXlpk7pPyjRcCMrGBI=
X-Gm-Gg: ATEYQzzQGCqCADO6tQ42XRtLaaVTBA6DitKd7hantECep8v81tdH3SeP8XzKN/vGNKn
	OX4jBtobvR+H6mP4ueIAz7a/+XoUUxQb62uXas15hN/QgTDA1baGFiWhJcMKprOOtll4PAbV3rf
	tBdOsEeoRzw2DNfCqTBsww0V0NbQQXRYc+B7DajHuCoEXY4b+Cb1VM4N3PnyFlAPwNKVW+28FKm
	wStOtNyaRglj2m2t31X/jnuIY1qymlObVdVCw2CX7Eh8U04eJDOSS6ibVABm3jUHwceta91ol9Y
	z6GnjrMAc11aa3y9faqnyiwy+BKXfNTXJz1pGL7XcDnLDQXQmlnEQiHgXLYu6LufDlYgIKUYvOR
	JOdWpLssUnnl8cVSJzrFCJkLlsCdYtVKCOeqF
X-Received: by 2002:a05:622a:64d:b0:509:16ba:d537 with SMTP id d75a77b69052e-50b14788cebmr31672261cf.19.1773823593766;
        Wed, 18 Mar 2026 01:46:33 -0700 (PDT)
X-Received: by 2002:a05:622a:64d:b0:509:16ba:d537 with SMTP id d75a77b69052e-50b14788cebmr31672121cf.19.1773823593346;
        Wed, 18 Mar 2026 01:46:33 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f463c9f3sm22231445e9.3.2026.03.18.01.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 01:46:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] usb: misc: onboard_dev: Remove duplicated static structures
Date: Wed, 18 Mar 2026 09:46:27 +0100
Message-ID: <20260318084626.34314-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2681; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=feU3bhi1EFcLPsMns/23hwfL6odQZUZiAE2YLq/awKo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpumZiicmmI1/v9IseeXVVL3ukni020kZgmcxP4
 ONAlFcseZeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabpmYgAKCRDBN2bmhouD
 150XD/9m2oI8zylrjicjCrr2RPgccjLwDy/NVldnkbhcCXarv11WPE160IoocJYfJtHpaWK2/Js
 COBlHnbMOTfvDmnAN3mSofzPoI6XL+lqip0D+AgY678FfSJI9Ml4yLHkACc21zeV6mYMM3lS40c
 s6GFNqc8rkpxJfYyNqQckEHYPdi2wuTO0vWrCnF67vpXd+kjlZkrBssQjx/ATBI9MmEYRiNggn8
 CTAXp+xH7ZwmySn6XoEwsVI+qaWT3t99zDn/RvAiBiT68n7qyoednubJQfrZApVCOExcd1ykBvq
 awvlobv790mzScIgWgXDHNEIh4HkHycmCXHj+6pn9tRbiciLoYI2qGL9UxEV6XmhrLmiF+yVcea
 7C7JGCprfDACsUGVqlLLaBaTijoKeKxWS1Fh43B0bPYtYaPftMfSIgHnNqX0+tcudyFJMFxEjna
 cULSHuu5r7pLMr2J6anrZgGzhFb9FHePWdt9wHhNuXIQficXgFuJSBS+TQECfFGRZODLkMvy3ne
 P7aCWBA5EKDWWop5SO+PSHm+jkAThbnN/AzyiaWByOFlLmnl0Io5j4Pz4E4TNlqJ4prkma6HF6D
 kcLUzRej9nfQlWqJCnGDC3P3B18ufrbT6fHYoq9/7MYlnBo2lP8yJ/Wz4kF8plqPQLOSuWVLbRi fd0r0mAzRG5IGFg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: P_2BWUwLnUWl6k4Uj8FDojI6tLiwSYnv
X-Proofpoint-GUID: P_2BWUwLnUWl6k4Uj8FDojI6tLiwSYnv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA3NCBTYWx0ZWRfX+W2Mh7qOT8ep
 ZsyI5Cai4G0VuEVF9npWwzfGM/Dscug/FLnOiik5KVFoyXuFfl29osoCFTvBLmiQ/ntR2prZJT7
 lsrqTDWnmV5WgVM5IGZ9Pv/0/HVdp1hVJVNVFgvU54VB9Y2fPKwt/5IlSGUMTmebUJqQdOOkNts
 a4/lqu7JiREbYf5nZCLepmI254fxB330bCr+OWmVlaO+mgRyXCuD/DvziKruG/hRpJqZ976nje9
 6eZXIO/TuJssnVSFwdeeWrCYJD5udS66VT4r/29Yr8jpUCawYqg+wXsTOWO35ihXEWNLU3SXj47
 XzBvC1JV+BrDaQWj3kCCphle5nj2LdVKitCAFnpIcSrfKrWaaaLf8vi4ipIfKh0/hpSFqfEX77v
 fKV46zrjpzeT40jtq20eju8/Lz6YbC2jg/Jb5pwapI+pBim0jayXzLi9Zsq5BoJc6r4OTU/2VYw
 tyvwBmoIRA5gCV/Viwg==
X-Authority-Analysis: v=2.4 cv=Y8n1cxeN c=1 sm=1 tr=0 ts=69ba666b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ev0ArXzve_pGzg10peQA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180074
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-35031-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CBA172B8709
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Static structure "ti_tusb8041_data" is exactly the same as
"ti_tusb8020b_data" and "cypress_hx2vl_data" is the same as
"microchip_usb424_data".  Drop the duplicated structures to reduce
driver size and memory usage without affecting functionality.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/usb/misc/onboard_usb_dev.h | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index 1a1e86e60e04..94ce93083635 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -66,13 +66,6 @@ static const struct onboard_dev_pdata ti_tusb8020b_data = {
 	.is_hub = true,
 };
 
-static const struct onboard_dev_pdata ti_tusb8041_data = {
-	.reset_us = 3000,
-	.num_supplies = 1,
-	.supply_names = { "vdd" },
-	.is_hub = true,
-};
-
 static const struct onboard_dev_pdata bison_intcamera_data = {
 	.reset_us = 1000,
 	.num_supplies = 1,
@@ -87,13 +80,6 @@ static const struct onboard_dev_pdata cypress_hx3_data = {
 	.is_hub = true,
 };
 
-static const struct onboard_dev_pdata cypress_hx2vl_data = {
-	.reset_us = 1,
-	.num_supplies = 1,
-	.supply_names = { "vdd" },
-	.is_hub = true,
-};
-
 static const struct onboard_dev_pdata genesys_gl850g_data = {
 	.reset_us = 3,
 	.num_supplies = 1,
@@ -137,13 +123,13 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb424,5744", .data = &microchip_usb5744_data, },
 	{ .compatible = "usb451,8025", .data = &ti_tusb8020b_data, },
 	{ .compatible = "usb451,8027", .data = &ti_tusb8020b_data, },
-	{ .compatible = "usb451,8140", .data = &ti_tusb8041_data, },
-	{ .compatible = "usb451,8142", .data = &ti_tusb8041_data, },
-	{ .compatible = "usb451,8440", .data = &ti_tusb8041_data, },
-	{ .compatible = "usb451,8442", .data = &ti_tusb8041_data, },
+	{ .compatible = "usb451,8140", .data = &ti_tusb8020b_data, },
+	{ .compatible = "usb451,8142", .data = &ti_tusb8020b_data, },
+	{ .compatible = "usb451,8440", .data = &ti_tusb8020b_data, },
+	{ .compatible = "usb451,8442", .data = &ti_tusb8020b_data, },
 	{ .compatible = "usb4b4,6504", .data = &cypress_hx3_data, },
 	{ .compatible = "usb4b4,6506", .data = &cypress_hx3_data, },
-	{ .compatible = "usb4b4,6570", .data = &cypress_hx2vl_data, },
+	{ .compatible = "usb4b4,6570", .data = &microchip_usb424_data, },
 	{ .compatible = "usb5e3,608", .data = &genesys_gl850g_data, },
 	{ .compatible = "usb5e3,610", .data = &genesys_gl852g_data, },
 	{ .compatible = "usb5e3,620", .data = &genesys_gl852g_data, },
-- 
2.51.0



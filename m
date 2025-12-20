Return-Path: <linux-usb+bounces-31648-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31498CD28C6
	for <lists+linux-usb@lfdr.de>; Sat, 20 Dec 2025 07:37:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3E203033DD9
	for <lists+linux-usb@lfdr.de>; Sat, 20 Dec 2025 06:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB42529D275;
	Sat, 20 Dec 2025 06:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SK9HEyo9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dAP7mV2c"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36492BD58C
	for <linux-usb@vger.kernel.org>; Sat, 20 Dec 2025 06:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766212571; cv=none; b=J6NDKliz4vYal6Z5yHv8L7pRYNFWbS+/W/VfXtLLK4z+XUsEfWtjBciRaDvgyVhr3AfsgYBwTnUmidsdcmohkmRb4BQPhktNkJySVJ2vN346qEMqszc/Y7NL/0IIdyKeo5Y/hFPfwQt70ER/eh2DZj6vSWdQgAUEP+NdcJyq+sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766212571; c=relaxed/simple;
	bh=G1gWv8618a7rqJzvKhye4h/vsqybaxCNL//qIdBIfmc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tyu3Qm2YMjdQaAYAn/TKtqoKHkXalFdmHUbKF/kEIYrACzoZl6hUOkTlYivC2VcjUz3Dx1+GAJILOx+639I8NK9h6/cBtBzj9z5fJSfqCkj9kOD/Q4WflW20HsPGgpSgaSpc0f/c6omfxI2hO23cLQgpmaeDs1a5DX/cd6yJClg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SK9HEyo9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dAP7mV2c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BK4tKHE2632276
	for <linux-usb@vger.kernel.org>; Sat, 20 Dec 2025 06:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dzx7C+q//Ee
	3OcHfJVXO31JMgk+3QiczRw+McarTXGM=; b=SK9HEyo9gk9DstMZfNsuVEFBeiX
	iuW12bfJkv1qqOMWsCoMKRH+mjI+o9uOiazES3FVe4hlQ9WE4XuAV7H/YZav5bT4
	jajcXpoGi3+gTLqFUcY/PLSmReZM4oHPGmJg9tjCEx22Vd6Bv4hRvNEri1ME6jYc
	zDGDDzDDNKp7TfKGfZxTD9DglrmedV2U4mF2Ajg+ActUSMtyX8NPzXQ98sBRWS7+
	F0udNRhYBNvkf/mhBmIa19EL0V4I1+5DMlNNo6Cgqx/us8xzJj5sVIuQyLWSG2Ad
	gHVJ2eV9g6k3Mr9ycF9qe0cEQuBgXEYHzb12qlvBvq/w5l4lFMEeixoWchw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mtqg5p2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 20 Dec 2025 06:36:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c43f8ef9bso3284551a91.1
        for <linux-usb@vger.kernel.org>; Fri, 19 Dec 2025 22:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766212567; x=1766817367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzx7C+q//Ee3OcHfJVXO31JMgk+3QiczRw+McarTXGM=;
        b=dAP7mV2cAquR9ENkLaU9yWE6GNCA/PemfEgyMGTO5LjfKmtI9QyVXwdVABY023ydih
         sXfJ/q8BOIXtU4/KfI5ljN1X6b/qKdJF+afSOQSaPKlWYR+bkdEGQkJEOQfJVJw0Hmv3
         RfIlBJjTUCtBJDpeUPqhK5/Z7XZgFjCwDF3dmtqmpXNb0LIUe/NODZbgdIcGQl65jWG4
         yPO7Tspvl6lhcNmvBNiEN1rgQbFllU/2Hw5mkk7/DhkuzNHBxJrRzmjSAzwfQjy8t2VP
         mRJaCeKxOrPDD3IQFvi2r1iRc9+kso2+wozNHEV2WMcZRWi2xV8yplDgjgkEvpasmyLe
         urIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766212567; x=1766817367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dzx7C+q//Ee3OcHfJVXO31JMgk+3QiczRw+McarTXGM=;
        b=E7aZCKpQqCP4SpsxxL5PxJfW7CSvpMXIzU6mUKs+Z69+V2imGOe6J6ZdcJMX7B9yUD
         emANY/Hya1JlVtovBdfca1AoHa7hllzJ1gRkUGDzt77oMlTjJqw3n5YnZB4HeWlQqpfK
         nEw2kzKO+EVnZdvZY3Yal01ZugK5lmiWPD1uYpbTG1di6J9vq07ZVoUFDwOUol0HtkpJ
         W9KYPvrKDwrxa9xoOAnjlfjWg8qiKoF+evuckrZQi2U7dlSeror4RCGA8WJI4m2I0Mkw
         o9pdmovOtJbtjuoS3jA2GsqaCtmZhYbheGlrC2vBCkTYR5IJt2qI86+pmMIBq/vhWFQ9
         9AmQ==
X-Gm-Message-State: AOJu0YxEnhgmHc0SqyRmcHkXjSzhR7GQv5pQLowDF19xZWAfMGDX2WCt
	eGtcQ/UQ1caVbQAvKngvmKwjMX4Idbu6LqAdZWqxqQI1lP+8hX8f+WcMJs1hE9VGOdUJ2JQqjbm
	mdgV7MKJVChc8Po1APg2vB8iktuXSslNdFb5QCvoQC4aC9+rTtwmgstC1tSPkg30=
X-Gm-Gg: AY/fxX7Qyufq/U+SUA4JIAx7wC+HQA5BDIo7uc78j0xHwvQZViH1TM5sf1o8Vf3eAM3
	WaqebKDPjrdNhpo6+WEBuDfiyNGOk2KmqDxXMnWWzXVam0eM/zrDMTEhpMW0RSo+/O0nDbBCYln
	lgT2++80Hd5d1v48EDDETl7ToH7PNCK1+R75xIrBKhPnSQoLT8DlVlR6KpGTo90UNGFrcl3jxyZ
	zz7JALVdGatL9OotN72Bo+k7TAfjNSRGnoQSK9ieU7dJMKJVe9yLPLsICosGzXM0yPNE2STFB7z
	/zrhi6551V3KcwnWb16YqitGPYHP8bvx7a2phOek8Swh+J2IzgWDuplC56mbGm8GjozMb27VrJN
	J/dInoBqChSRSwhwA5Hr3TmngeiGeyf9h1x9uo0XkEtw=
X-Received: by 2002:a17:90b:3843:b0:32e:4716:d551 with SMTP id 98e67ed59e1d1-34e90d6a42cmr4876266a91.6.1766212566519;
        Fri, 19 Dec 2025 22:36:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYBs2yDuHgDxwYW9beNVaEliIpFPtjmvVWuWEZ7C6xUwl7d8HnoyXdKA7TYDgRuBYV3SKxvw==
X-Received: by 2002:a17:90b:3843:b0:32e:4716:d551 with SMTP id 98e67ed59e1d1-34e90d6a42cmr4876235a91.6.1766212565931;
        Fri, 19 Dec 2025 22:36:05 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e7723b3a8sm2847143a91.3.2025.12.19.22.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 22:36:05 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pin-yen Lin <treapking@chromium.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v3 2/4] usb: misc: onboard_usb_hub: Add Genesys Logic GL3590 hub support
Date: Sat, 20 Dec 2025 12:05:35 +0530
Message-Id: <20251220063537.3639535-3-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com>
References: <20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qTQZI8KN9o8m7xFjCkKyG4Zd7pZL-jit
X-Authority-Analysis: v=2.4 cv=dPWrWeZb c=1 sm=1 tr=0 ts=694643d7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dwk_HVr8QTvVkdqdSRoA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: qTQZI8KN9o8m7xFjCkKyG4Zd7pZL-jit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDA1MCBTYWx0ZWRfXxvBBahGBDp4W
 ZFDsQHBiM6/NYwoGAaZQBR0sLyopAogCl2ljx3EPqy/hbeZNFXxzJJ4bCvcXAAlEvlHprYEHh7O
 thtIsBcowm6XCxJE9TxYRFqW6XVeBkwL3FjSv5dlYJLy33UgvA3JBEdvokLvi7MU0FKgH/gwx/F
 jy0kQfMYZAc9BR7Bzp+Qsubb+SRh34C33J0W5XgfS/5/noBhXPRvcJ0UzksIWLBlhzpc9aXcK8s
 pIkOTKvYFqjx2JkZMLQKcWV167z62k3BBfEbb6XX3/1pfZv8ikt1lwMAbFafA9TUryOWtI2ulUz
 3Ug8k5qtoj6qKN5HF3qxNxpGt8BQEoyzWJ6BEpqZceS9dt05dPfwqQRv2U+B4E9/EGo359QoMxO
 MjwhnWcf2Kbl7uiWeL6sf0s9SxRq4gk3BrTLCFvxdN/4o3adfsl2cH5n5qf3MngknyIRwA2Yw4R
 w+ewl2WCa27OdHLmJzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_01,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200050

Add support for the GL3590 4 ports USB3.2 hub. This allows to control its
reset pins with a gpio.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 drivers/usb/misc/onboard_usb_dev.c | 1 +
 drivers/usb/misc/onboard_usb_dev.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index 41360a7591e5..bde303b820d7 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -661,6 +661,7 @@ static const struct usb_device_id onboard_dev_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0608) }, /* Genesys Logic GL850G USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0610) }, /* Genesys Logic GL852G USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0620) }, /* Genesys Logic GL3523 USB 3.1 HUB */
+	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0625) }, /* Genesys Logic GL3590 USB 3.2 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2412) }, /* USB2412 USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2514) }, /* USB2514B USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2517) }, /* USB2517 USB 2.0 HUB */
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index c1462be5526d..7706a04f2630 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -140,6 +140,7 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb5e3,608", .data = &genesys_gl850g_data, },
 	{ .compatible = "usb5e3,610", .data = &genesys_gl852g_data, },
 	{ .compatible = "usb5e3,620", .data = &genesys_gl852g_data, },
+	{ .compatible = "usb5e3,625", .data = &genesys_gl852g_data, },
 	{ .compatible = "usb5e3,626", .data = &genesys_gl852g_data, },
 	{ .compatible = "usbbda,179", .data = &realtek_rtl8188etv_data, },
 	{ .compatible = "usbbda,411", .data = &realtek_rts5411_data, },
-- 
2.34.1



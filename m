Return-Path: <linux-usb+bounces-21114-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F735A46FF2
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 01:12:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32C6C188D4DA
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 00:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39BF63A1B6;
	Thu, 27 Feb 2025 00:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lMtqs4kt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B60CA6F
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 00:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740615113; cv=none; b=IwSz/XwrVvg5o1gRgHTARa4KwaCiCUAaepAaQVKuB2pwRgbMT2a7zGkjOP/de/Ak6oZy+j2vOi/20U4KT+enpexLIm8xLoB8hNCIuCVRvLkUryx/Nf3WipDN+cuqyLAeKVyiNvLYLbhd/d3wSRmvug0ETkZc1yqveb7PHYMX74k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740615113; c=relaxed/simple;
	bh=XMhUGa9jASilaYKmAqPhGJDF9Z/4W7QRLCZ3ziNou6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mb4ujWyeh9OOT1qJSEFxBK++XH+s0Ed8s2aWUBuojByYbdbBNXyP0BmMdgNFWlGyUTLcKjtkVNGz0JfDC8RVDUAXupCYUOb9jPKM+FdY6mb+5qZTeXH+sB/UQEthoWuXAJ15e1Dxu3sLb7X86NmHgu7GnQabvXgtVOAfnd1k/2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lMtqs4kt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QKnafX012246
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 00:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I+pBckYQT8kiWYR+JN/p8P4x1oQKu26Ua1lLR/Lpzog=; b=lMtqs4ktX3I6XegQ
	QEst9ApJ8GmUVbxSM0bf4GYYWxta4PFQusAIFU/Qv//NJ02MZc91LJRh9v5jDrrq
	maVpNqejhIUctqcRpBkdGxj054x5fMxU77OsJMWXenWrFmgtmATGTLDoRYyP/h9Z
	UOGZqMnvZLrnFZh4VdktkrovFX4FoGBGPe6ss6eoTGY2IckjcwPaWbWPVtlcAblX
	yXdhV/TDJgMUKw9LGMAx91zkjIAEomRKeDV6e7udSbRVTaDaK5jiHKJoD74YOtdw
	YHcRt3T5jew0fflNBoXLw7j3HVXRkY+0sT7OsbYwWEb75aHas8yULHtquI7Dpe+S
	PS3UQA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prk3p6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 00:11:50 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3f3a3c8eb5cso122223b6e.1
        for <linux-usb@vger.kernel.org>; Wed, 26 Feb 2025 16:11:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740615110; x=1741219910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+pBckYQT8kiWYR+JN/p8P4x1oQKu26Ua1lLR/Lpzog=;
        b=pjntAWd8YsMNJRvQMSHGUpNOy+UTdV2g9MOI8Vy/aiykpwPJwfsI92Vy8iy0QDH9q/
         PfL7057NUBfDPx6jeb7dK6j7s1V5q21MpJX8xupi8zWskGjNQZKYeOUvdLqKOMgmYNup
         ajk8mmA2j0fkbDleuHIIuG98t2Qz1fXotFebzA2dMcKP6Ltl858e3LxEpjWigKa7KFCf
         S3/kKpdmFr86L+7yEJOIwrH+BE0Z8gObViBvRTGpg4pLjlBm7vHeldVOXV3wlOzGJ8XB
         sTQWk0uLJkCn6QZd4Ad3NHLCyQcriPF08aoQjLA4S00fGLtoMA3kXzwXLuoo3oN/SEJH
         p1PA==
X-Forwarded-Encrypted: i=1; AJvYcCV7W8QYnGGMlFbTMIqvAQVVoXJnT5RBbZJlpUZUd+P0N2Yi1XUmNvQQuqT03k5IykdHovKm45x5mg4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgeS4/EMo5VvJTJIwa61jDZGRF09NhcC1tkx4Tz23ABAyvOfCL
	mKX+b9lgTBrmRN190/Wx5SdCWrgtAjw3j8C4zo39cnIv0r8w2YQPmrODA1u/dUpylDd1nCjiD8M
	MbhXSlD/UGGl6OyGT7Vz2Eb71y+FKJP8D3tROn2GqUbwCLSlc19GqAUq2qRw=
X-Gm-Gg: ASbGncu357shqWH2Xcro4uO+T5rUAkS50VD5cBChwtx0X/vew2Bt8YJ3cqcY64+kq3S
	Jnviu8n5ESdX/CCnRsCoHRfswve7GB3XIwdiQv8FgIDA8yQn6cEF67jBWOFIV3DM7886MJHollu
	y5gp7Y6cQnJMSZVOzA/gDb3pxsi2jb7K24lGQ4yuKETfifW6drdNasIekvQxMATKIJDCxXoP+Jg
	HgqMSJ8yLJ5f74sm00hQdFds6jvNnQDovPPfLt/3NpfT7jGDIW9oGuUCy7gqNEwvM4aLoM4HwVZ
	FcsmUz3+bvU0XBYH/hmoiuv677Xz/qKmdkxTYX3Il3qI78YMTCDc90fedVMbTRT01Xrhq3G+Pq8
	gMuXcQd9mPqAdafk=
X-Received: by 2002:a05:6808:f16:b0:3f4:1bc5:762f with SMTP id 5614622812f47-3f540ee6aeemr6301501b6e.22.1740615109790;
        Wed, 26 Feb 2025 16:11:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTUVixTDGEEl81DAEOdEGVGtdBZKlSFBnfLKsYSqCWRRalX20MmgbvsNSrh0BmmdhsWmtiXw==
X-Received: by 2002:a05:6808:f16:b0:3f4:1bc5:762f with SMTP id 5614622812f47-3f540ee6aeemr6301491b6e.22.1740615109472;
        Wed, 26 Feb 2025 16:11:49 -0800 (PST)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f5507c40c6sm33988b6e.45.2025.02.26.16.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 16:11:48 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Wed, 26 Feb 2025 16:17:51 -0800
Subject: [PATCH v4 4/7] usb: dwc3: qcom: Don't rely on drvdata during probe
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-dwc3-refactor-v4-4-4415e7111e49@oss.qualcomm.com>
References: <20250226-dwc3-refactor-v4-0-4415e7111e49@oss.qualcomm.com>
In-Reply-To: <20250226-dwc3-refactor-v4-0-4415e7111e49@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Saravana Kannan <saravanak@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3028;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=XMhUGa9jASilaYKmAqPhGJDF9Z/4W7QRLCZ3ziNou6Y=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBnv6844alxOBEiHFy7tkQ8r+iMslicLQHGKfOQg
 M8uN7dY4KCJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ7+vOBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVQ4g/+PSei/OGErkAjOgNnfPazDmLbsUg8mns6h+1L0e1
 /aCYPk7De/S7L+pA5HrAR984rAmJYLvWs+kNNteD4x0hMCZN1+9KhDJoPfChPLzCeQ0YA+5v+ys
 nZdF/efQATZiqV0XTUD+Bbiqh94czqM9YcQvPdP54qxaXrS2uMQZkmyZUfhnOt1fmpik3EKnG19
 r4m7TUEChr9SFLafGiruqStHPFZSvPf6jxicClscwGJ191IXJthvKplClfi7jpNVROZIPd9U9fu
 tWirh3SDUWU0PMs9kUspu+jeh8TfS+mlFEkCkXXTJf1l1j4Us6dXbNBtBmX9QiVg/mQPMiXIICe
 yT0nTXuIj3PTzWneuedi/Qpg5+zEwmZhJzg0uZTUHtnrcDNJjByElBu2Gb1Uk/qX3kpSl4ZLbAH
 nNVLEcIR110xyTlj06aC7mXiBxgvojOM38qleh5tABRVI/tM8Pkg/2Uf9d79H58aOM6pfBT9g8F
 xXSXZwGP86mKVHJzrX70JmiHjh4JoM/CdfbHoRpV5ela7aBnWG4ap7YHBrkmGVQgEFuZn5C498N
 pP/nzhnPmgGWYnRwzGN47/kGjiO3S83takAZ+weawAyvzzH1vI59Bmiuzo81VLiC0vtMygItLIO
 6hlMmjAdQur1nyvWQv6tkDyEStdS0XXy/BSzmqvFRoPI=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: zAqTf0Z_g8WZwdW8h0nEL9TS_UZjcoj8
X-Proofpoint-ORIG-GUID: zAqTf0Z_g8WZwdW8h0nEL9TS_UZjcoj8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_07,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 mlxscore=0 mlxlogscore=995 malwarescore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270000

With the upcoming transition to a model where DWC3 core and glue operate
on a single struct device the drvdata datatype will change to be owned
by the core.

The drvdata is however used by the Qualcomm DWC3 glue to pass the qcom
glue context around before the core is allocated.

Remove this problem, and clean up the code, by passing the dwc3_qcom
struct around during probe, instead of acquiring it from the drvdata.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 58683bb672e9..50b1da845113 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -547,9 +547,10 @@ static int dwc3_qcom_request_irq(struct dwc3_qcom *qcom, int irq,
 	return ret;
 }
 
-static int dwc3_qcom_setup_port_irq(struct platform_device *pdev, int port_index, bool is_multiport)
+static int dwc3_qcom_setup_port_irq(struct dwc3_qcom *qcom,
+				    struct platform_device *pdev,
+				    int port_index, bool is_multiport)
 {
-	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
 	const char *irq_name;
 	int irq;
 	int ret;
@@ -634,9 +635,8 @@ static int dwc3_qcom_find_num_ports(struct platform_device *pdev)
 	return DWC3_QCOM_MAX_PORTS;
 }
 
-static int dwc3_qcom_setup_irq(struct platform_device *pdev)
+static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *pdev)
 {
-	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
 	bool is_multiport;
 	int ret;
 	int i;
@@ -645,7 +645,7 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
 	is_multiport = (qcom->num_ports > 1);
 
 	for (i = 0; i < qcom->num_ports; i++) {
-		ret = dwc3_qcom_setup_port_irq(pdev, i, is_multiport);
+		ret = dwc3_qcom_setup_port_irq(qcom, pdev, i, is_multiport);
 		if (ret)
 			return ret;
 	}
@@ -700,9 +700,8 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
 	return 0;
 }
 
-static int dwc3_qcom_of_register_core(struct platform_device *pdev)
+static int dwc3_qcom_of_register_core(struct dwc3_qcom *qcom, struct platform_device *pdev)
 {
-	struct dwc3_qcom	*qcom = platform_get_drvdata(pdev);
 	struct device_node	*np = pdev->dev.of_node;
 	struct device		*dev = &pdev->dev;
 	int			ret;
@@ -778,7 +777,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		goto clk_disable;
 	}
 
-	ret = dwc3_qcom_setup_irq(pdev);
+	ret = dwc3_qcom_setup_irq(qcom, pdev);
 	if (ret) {
 		dev_err(dev, "failed to setup IRQs, err=%d\n", ret);
 		goto clk_disable;
@@ -793,7 +792,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ignore_pipe_clk)
 		dwc3_qcom_select_utmi_clk(qcom);
 
-	ret = dwc3_qcom_of_register_core(pdev);
+	ret = dwc3_qcom_of_register_core(qcom, pdev);
 	if (ret) {
 		dev_err(dev, "failed to register DWC3 Core, err=%d\n", ret);
 		goto clk_disable;

-- 
2.45.2



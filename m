Return-Path: <linux-usb+bounces-21861-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CD4A67CA3
	for <lists+linux-usb@lfdr.de>; Tue, 18 Mar 2025 20:06:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 137754213D5
	for <lists+linux-usb@lfdr.de>; Tue, 18 Mar 2025 19:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B4D21422A;
	Tue, 18 Mar 2025 19:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eIza6hXQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FDC212F8A
	for <linux-usb@vger.kernel.org>; Tue, 18 Mar 2025 19:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742324721; cv=none; b=LA6M+XpRCutmCUQKQHJZcFQK81tTHloFLaJxjqMXrr+Ab7eDRtBv4EPCThDB4Mq+fyjw7ATcXEJeSWmyhL+Mzmj2Rw79bt5lxNJ8XwrXBnaY5r5XO1zBZXcTanaK81MKUcQZyuSfuso+wmS8do9TwPGA1Zf7xFIuqXYoOz5RIGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742324721; c=relaxed/simple;
	bh=wAWUM3ffucxW+1g6lHY+OoHFAYGy2yWiORLWyxjTwt4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GtPABAhn6dT/2s3hBQoB8xeU6+bBXm7GjtQNIuyuwVplMhfI4Lv+6fqVQx0zWlDWhdfhVuyoYTJFgAm5GR4zwCPr0TDSxCISzmkSpJY+LJXTh9XFN/HDzTeer7JqqjCDpKy2drzD5tD2RIWctwywFKE0bszNYHNcT1V5GatGHgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eIza6hXQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IIBL19004551
	for <linux-usb@vger.kernel.org>; Tue, 18 Mar 2025 19:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HMZC9VkGCoUU7Q/SeMHW2tCY+RJpQ+s8b+qSPkLUVkA=; b=eIza6hXQ0PWfNukR
	zrVS+RJmSoA3Ka0+oIhPUMHaqCOJQozyTWzXJshqH3Efy1z90pMsUuxX4gOwtVIw
	Z+udJn9rFsUb7sYMPx6Mz5nrFsLA8C5IL6hEwn/w1gK6dHf6fle4vdv5Pgq48G8X
	CISUJLOIXkHfvpZpNlAIj+jqfRQS0Gg6k2gPxITXrpqqkuOgHBIRtg/7rBZPk8Wh
	ptOLK5+YAur0t9TZ8q1aL0GF+5Hy5dYyRlu3fY4vG6THSnTvzyJnSYuCqRhJR8uc
	ii2eQ0i/pRCis6azmA1i3uADEwOhzLYBbFHRDoPNrA/FBPkqQhXM7Km+OuMMhBW2
	juG2zg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45fdvxg457-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 18 Mar 2025 19:05:14 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3fdc9dc5c9dso945930b6e.3
        for <linux-usb@vger.kernel.org>; Tue, 18 Mar 2025 12:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742324714; x=1742929514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HMZC9VkGCoUU7Q/SeMHW2tCY+RJpQ+s8b+qSPkLUVkA=;
        b=LOmlScur6rcxuvgUJoAm+OlOLPL9ygLxTTdBZE6Knn7fURPc+ujJWff8jkHIxm+kGD
         lt1n1ysBlbc5Nykjrfj1T/uZGxWucer3yOzw/zROTNKeFpw4BanrOeaB2aqWCLYoOr+P
         b1Pz25iDLahOmQIvhW2SzVHqiQXYkzojlTrdOhdZM12KKp7LbjW9UB9DaiMu7X3Xem5+
         aEEqJYkkI8CnavVziCiw6hI5AoNMzfuWo50Jl2IIprx3AaPleoJ1fMfqAMrXbhDdV28i
         isN27T6cVO468RJ/rdYHjpnGAur429mxZ+I/t4TSiZhSVVH+pPIZDlkrBoOupz9jFJRN
         EWaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXt/wSxQO+CqWYd2FwOlnQipdxK6DEDFz3qVyqegBYYwjw1DmWmxfpNQSEtxIIN8/nPRvMWfuWX0z4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhQBbWigJDyKHzeePGf0mCZ0P9dfUkknJ58x7r+LdzgMFrqF1e
	PFRvwaumyQeDW/JzVndkFCaCR4XmBqQryCj+l53nHVCP1nGcc/68zjIdefcHZSpS4tdi7vCV3H6
	zz/svzQyN1OdDAGP2MjTTvwJyKKDm+Y+y9BkxnHmYIy41XTuOhGtw2jXsQOM=
X-Gm-Gg: ASbGncs8SrrlxNIiSBfaIWz6Kn9IP8de4T0LAtoKMFbLYzQPnJGj07+bu/RMty7RpRH
	ixt9pzhl1/NJYwBSXa0UHZcYdMat/+t5UDC5QxffbcDQyyrxyeX10z6xd4yCyAhneYmBGuZs77f
	6vbWzu8SjvV2W7vlKsmW5p5sudIKs8P3BUGt6DHQ+ODl6vi+dS1XGfUX24HQlN6jQaxZ6ZCqvt8
	H72UWNhSt8WffYsJ9ApY4KGXQSVDhagnzopvNoe6BC5DlnNjtuvpsN5hwBBJ3Srj/O0+xi8yGxa
	py9er7juyvslPN5bpM6Q5knZYVhd4/fy9QQYynqki/3cheixiP60aLbz3/xgO3ympmyPvcNAFJK
	gvdr3gItruFNw/V0=
X-Received: by 2002:a05:6808:1801:b0:3fa:1d22:6d2c with SMTP id 5614622812f47-3feac2a3786mr131258b6e.15.1742324713853;
        Tue, 18 Mar 2025 12:05:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvXyY2S5sGQHTlkQZEMYhM770zfAZyAg2bYMmMZTua9oAMTCBz5g5U/8JKmUdCYUo6ZH7cAA==
X-Received: by 2002:a05:6808:1801:b0:3fa:1d22:6d2c with SMTP id 5614622812f47-3feac2a3786mr131240b6e.15.1742324713465;
        Tue, 18 Mar 2025 12:05:13 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3fcd403b065sm2264273b6e.4.2025.03.18.12.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 12:05:12 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 14:05:03 -0500
Subject: [PATCH v5 3/7] usb: dwc3: core: Expose core driver as library
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-dwc3-refactor-v5-3-90ea6e5b3ba4@oss.qualcomm.com>
References: <20250318-dwc3-refactor-v5-0-90ea6e5b3ba4@oss.qualcomm.com>
In-Reply-To: <20250318-dwc3-refactor-v5-0-90ea6e5b3ba4@oss.qualcomm.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10136;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=wAWUM3ffucxW+1g6lHY+OoHFAYGy2yWiORLWyxjTwt4=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBn2cPjSJPDlDww96zN6653/MWcszDD3Ic5NpH1/
 1zAAvo3+T+JAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ9nD4xUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWgwRAAiyAVa0WXvVjJ8Bh1bb10NmIubWgXCVppAZGAO5b
 BGgJ/04dnqpCK72+1157yGxIG4OKUtfqrtZYgWPTdcS+LCDTLuu30fNwK9DDb+AnrCC1Tf/Pvld
 /SDxqU5bOutmmP68X0wspgerAcMigaMsx8soKdeWr1QHWChNwGr5qkpDxJBqkqOCavHAsJ3RyjG
 LzzIk4qJ6dk7XsgnsQROvLkBh4LiTXHuH2oEBB3hI0Q6+p7M/xfM/zsapIF7uBxiL048I0AmG/s
 SRxSXSsg7vt2r99KqGOBpYDu20HTZso7ngarfVmVbtG7mDUQwfqco5kwb+A4xuzWmd7PxLKAAPZ
 h/TlwPFj70GlrDW2zqO6tjebud4gToUtRHRCDha7gRDuHbZSLU7X/cvUzWD65J3W4lVKfsRbhkK
 9CU0A0raxjn8nPK7+FJ7oReymYRJgewImKc69pvjcliDgP32mmeVgIeXOfvePYfZKMZedDMF5Og
 MZpNeTf5Pu/ANbJZq0oJxYtMQjjIVOrkxmCw3O/3JOkRJ3uYznTJlk0bN/2WqWDA1GamqfZGgg6
 wMSqoNXKEjV6ovWd+9S7K7LrJQHCxjUjQM5Vpf1CtJgCFmzKY0KGo8dQf2LKqW8ypwS+7sq2pV4
 //O3xQh51CMPJy+4R8hzIhZNinDOTsGaNnrPq+6cKbSI=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Authority-Analysis: v=2.4 cv=SKhCVPvH c=1 sm=1 tr=0 ts=67d9c3ea cx=c_pps a=4ztaESFFfuz8Af0l9swBwA==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=bGkOf_LmPnIWPiKmcZAA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: RytQLWlgWlgmhXU5VNRZGkBvVIE8A7lG
X-Proofpoint-GUID: RytQLWlgWlgmhXU5VNRZGkBvVIE8A7lG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_08,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=996 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 mlxscore=0 suspectscore=0 phishscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503180137

The DWC3 IP block is handled by three distinct device drivers: XHCI,
DWC3 core and a platform specific (optional) DWC3 glue driver.

This has resulted in, at least in the case of the Qualcomm glue, the
presence of a number of layering violations, where the glue code either
can't handle, or has to work around, the fact that core might not probe
deterministically.

An example of this is that the suspend path should operate slightly
different depending on the device operating in host or peripheral mode,
and the only way to determine the operating state is to peek into the
core's drvdata.

The Qualcomm glue driver is expected to make updates in the qscratch
register region (the "glue" region) during role switch events, but with
the glue and core split using the driver model, there is no reasonable
way to introduce listeners for mode changes.

Split the dwc3 core platform_driver callbacks and their implementation
and export the implementation, to make it possible to deterministically
instantiate the dwc3 core as part of the dwc3 glue drivers and to
allow flattening of the DeviceTree representation.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.c | 142 +++++++++++++++++++++++++++++++++---------------
 drivers/usb/dwc3/glue.h |  32 +++++++++++
 2 files changed, 129 insertions(+), 45 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 66a08b5271653abd458f9ec85ca730afd7779d71..b428b6fc3d0a55811e2f75d33d79df4b0c67dcac 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -36,6 +36,7 @@
 
 #include "core.h"
 #include "gadget.h"
+#include "glue.h"
 #include "io.h"
 
 #include "debug.h"
@@ -2148,27 +2149,16 @@ static struct power_supply *dwc3_get_usb_power_supply(struct dwc3 *dwc)
 	return usb_psy;
 }
 
-static int dwc3_probe(struct platform_device *pdev)
+int dwc3_core_probe(const struct dwc3_probe_data *data)
 {
-	struct device		*dev = &pdev->dev;
-	struct resource		*res, dwc_res;
+	struct dwc3		*dwc = data->dwc;
+	struct device		*dev = dwc->dev;
+	struct resource		dwc_res;
 	unsigned int		hw_mode;
 	void __iomem		*regs;
-	struct dwc3		*dwc;
+	struct resource		*res = data->res;
 	int			ret;
 
-	dwc = devm_kzalloc(dev, sizeof(*dwc), GFP_KERNEL);
-	if (!dwc)
-		return -ENOMEM;
-
-	dwc->dev = dev;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(dev, "missing memory resource\n");
-		return -ENODEV;
-	}
-
 	dwc->xhci_resources[0].start = res->start;
 	dwc->xhci_resources[0].end = dwc->xhci_resources[0].start +
 					DWC3_XHCI_REGS_END;
@@ -2232,7 +2222,7 @@ static int dwc3_probe(struct platform_device *pdev)
 		goto err_disable_clks;
 	}
 
-	platform_set_drvdata(pdev, dwc);
+	dev_set_drvdata(dev, dwc);
 	dwc3_cache_hwparams(dwc);
 
 	if (!dwc->sysdev_is_parent &&
@@ -2327,12 +2317,35 @@ static int dwc3_probe(struct platform_device *pdev)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(dwc3_core_probe);
 
-static void dwc3_remove(struct platform_device *pdev)
+static int dwc3_probe(struct platform_device *pdev)
 {
-	struct dwc3	*dwc = platform_get_drvdata(pdev);
+	struct dwc3_probe_data probe_data;
+	struct resource *res;
+	struct dwc3 *dwc;
 
-	pm_runtime_get_sync(&pdev->dev);
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "missing memory resource\n");
+		return -ENODEV;
+	}
+
+	dwc = devm_kzalloc(&pdev->dev, sizeof(*dwc), GFP_KERNEL);
+	if (!dwc)
+		return -ENOMEM;
+
+	dwc->dev = &pdev->dev;
+
+	probe_data.dwc = dwc;
+	probe_data.res = res;
+
+	return dwc3_core_probe(&probe_data);
+}
+
+void dwc3_core_remove(struct dwc3 *dwc)
+{
+	pm_runtime_get_sync(dwc->dev);
 
 	dwc3_core_exit_mode(dwc);
 	dwc3_debugfs_exit(dwc);
@@ -2340,22 +2353,28 @@ static void dwc3_remove(struct platform_device *pdev)
 	dwc3_core_exit(dwc);
 	dwc3_ulpi_exit(dwc);
 
-	pm_runtime_allow(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
-	pm_runtime_put_noidle(&pdev->dev);
+	pm_runtime_allow(dwc->dev);
+	pm_runtime_disable(dwc->dev);
+	pm_runtime_dont_use_autosuspend(dwc->dev);
+	pm_runtime_put_noidle(dwc->dev);
 	/*
 	 * HACK: Clear the driver data, which is currently accessed by parent
 	 * glue drivers, before allowing the parent to suspend.
 	 */
-	platform_set_drvdata(pdev, NULL);
-	pm_runtime_set_suspended(&pdev->dev);
+	dev_set_drvdata(dwc->dev, NULL);
+	pm_runtime_set_suspended(dwc->dev);
 
 	dwc3_free_event_buffers(dwc);
 
 	if (dwc->usb_psy)
 		power_supply_put(dwc->usb_psy);
 }
+EXPORT_SYMBOL_GPL(dwc3_core_remove);
+
+static void dwc3_remove(struct platform_device *pdev)
+{
+	dwc3_core_remove(platform_get_drvdata(pdev));
+}
 
 #ifdef CONFIG_PM
 static int dwc3_core_init_for_resume(struct dwc3 *dwc)
@@ -2544,9 +2563,8 @@ static int dwc3_runtime_checks(struct dwc3 *dwc)
 	return 0;
 }
 
-static int dwc3_runtime_suspend(struct device *dev)
+int dwc3_runtime_suspend(struct dwc3 *dwc)
 {
-	struct dwc3     *dwc = dev_get_drvdata(dev);
 	int		ret;
 
 	if (dwc3_runtime_checks(dwc))
@@ -2558,10 +2576,11 @@ static int dwc3_runtime_suspend(struct device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dwc3_runtime_suspend);
 
-static int dwc3_runtime_resume(struct device *dev)
+int dwc3_runtime_resume(struct dwc3 *dwc)
 {
-	struct dwc3     *dwc = dev_get_drvdata(dev);
+	struct device *dev = dwc->dev;
 	int		ret;
 
 	ret = dwc3_resume_common(dwc, PMSG_AUTO_RESUME);
@@ -2571,7 +2590,7 @@ static int dwc3_runtime_resume(struct device *dev)
 	switch (dwc->current_dr_role) {
 	case DWC3_GCTL_PRTCAP_DEVICE:
 		if (dwc->pending_events) {
-			pm_runtime_put(dwc->dev);
+			pm_runtime_put(dev);
 			dwc->pending_events = false;
 			enable_irq(dwc->irq_gadget);
 		}
@@ -2586,10 +2605,11 @@ static int dwc3_runtime_resume(struct device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dwc3_runtime_resume);
 
-static int dwc3_runtime_idle(struct device *dev)
+int dwc3_runtime_idle(struct dwc3 *dwc)
 {
-	struct dwc3     *dwc = dev_get_drvdata(dev);
+	struct device *dev = dwc->dev;
 
 	switch (dwc->current_dr_role) {
 	case DWC3_GCTL_PRTCAP_DEVICE:
@@ -2607,12 +2627,28 @@ static int dwc3_runtime_idle(struct device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dwc3_runtime_idle);
+
+static int dwc3_plat_runtime_suspend(struct device *dev)
+{
+	return dwc3_runtime_suspend(dev_get_drvdata(dev));
+}
+
+static int dwc3_plat_runtime_resume(struct device *dev)
+{
+	return dwc3_runtime_resume(dev_get_drvdata(dev));
+}
+
+static int dwc3_plat_runtime_idle(struct device *dev)
+{
+	return dwc3_runtime_idle(dev_get_drvdata(dev));
+}
 #endif /* CONFIG_PM */
 
 #ifdef CONFIG_PM_SLEEP
-static int dwc3_suspend(struct device *dev)
+int dwc3_pm_suspend(struct dwc3 *dwc)
 {
-	struct dwc3	*dwc = dev_get_drvdata(dev);
+	struct device *dev = dwc->dev;
 	int		ret;
 
 	ret = dwc3_suspend_common(dwc, PMSG_SUSPEND);
@@ -2623,10 +2659,11 @@ static int dwc3_suspend(struct device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dwc3_pm_suspend);
 
-static int dwc3_resume(struct device *dev)
+int dwc3_pm_resume(struct dwc3 *dwc)
 {
-	struct dwc3	*dwc = dev_get_drvdata(dev);
+	struct device *dev = dwc->dev;
 	int		ret = 0;
 
 	pinctrl_pm_select_default_state(dev);
@@ -2645,10 +2682,10 @@ static int dwc3_resume(struct device *dev)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(dwc3_pm_resume);
 
-static void dwc3_complete(struct device *dev)
+void dwc3_pm_complete(struct dwc3 *dwc)
 {
-	struct dwc3	*dwc = dev_get_drvdata(dev);
 	u32		reg;
 
 	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST &&
@@ -2658,21 +2695,36 @@ static void dwc3_complete(struct device *dev)
 		dwc3_writel(dwc->regs, DWC3_GUCTL3, reg);
 	}
 }
+EXPORT_SYMBOL_GPL(dwc3_pm_complete);
+
+static int dwc3_plat_suspend(struct device *dev)
+{
+	return dwc3_pm_suspend(dev_get_drvdata(dev));
+}
+
+static int dwc3_plat_resume(struct device *dev)
+{
+	return dwc3_pm_resume(dev_get_drvdata(dev));
+}
+
+static void dwc3_plat_complete(struct device *dev)
+{
+	dwc3_pm_complete(dev_get_drvdata(dev));
+}
 #else
-#define dwc3_complete NULL
+#define dwc3_plat_complete NULL
 #endif /* CONFIG_PM_SLEEP */
 
 static const struct dev_pm_ops dwc3_dev_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(dwc3_suspend, dwc3_resume)
-	.complete = dwc3_complete,
-
+	SET_SYSTEM_SLEEP_PM_OPS(dwc3_plat_suspend, dwc3_plat_resume)
+	.complete = dwc3_plat_complete,
 	/*
 	 * Runtime suspend halts the controller on disconnection. It relies on
 	 * platforms with custom connection notification to start the controller
 	 * again.
 	 */
-	SET_RUNTIME_PM_OPS(dwc3_runtime_suspend, dwc3_runtime_resume,
-			dwc3_runtime_idle)
+	SET_RUNTIME_PM_OPS(dwc3_plat_runtime_suspend, dwc3_plat_runtime_resume,
+			   dwc3_plat_runtime_idle)
 };
 
 #ifdef CONFIG_OF
diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
new file mode 100644
index 0000000000000000000000000000000000000000..e73cfc466012f07214291abe56454934ab014013
--- /dev/null
+++ b/drivers/usb/dwc3/glue.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * glue.h - DesignWare USB3 DRD glue header
+ */
+
+#ifndef __DRIVERS_USB_DWC3_GLUE_H
+#define __DRIVERS_USB_DWC3_GLUE_H
+
+#include <linux/types.h>
+#include "core.h"
+
+/**
+ * dwc3_probe_data: Initialization parameters passed to dwc3_core_probe()
+ * @dwc: Reference to dwc3 context structure
+ * @res: resource for the DWC3 core mmio region
+ */
+struct dwc3_probe_data {
+	struct dwc3 *dwc;
+	struct resource *res;
+};
+
+int dwc3_core_probe(const struct dwc3_probe_data *data);
+void dwc3_core_remove(struct dwc3 *dwc);
+
+int dwc3_runtime_suspend(struct dwc3 *dwc);
+int dwc3_runtime_resume(struct dwc3 *dwc);
+int dwc3_runtime_idle(struct dwc3 *dwc);
+int dwc3_pm_suspend(struct dwc3 *dwc);
+int dwc3_pm_resume(struct dwc3 *dwc);
+void dwc3_pm_complete(struct dwc3 *dwc);
+
+#endif

-- 
2.48.1



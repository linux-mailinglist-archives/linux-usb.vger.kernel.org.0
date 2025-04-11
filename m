Return-Path: <linux-usb+bounces-22936-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DAAA85230
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 05:51:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B46391B8850C
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 03:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C0F27CCFA;
	Fri, 11 Apr 2025 03:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CR8uSCmr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6401E27CB3E
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 03:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744343430; cv=none; b=D4nWsvMrCCh333QrijjdeOh+3EJgn8i2STO2mgheJNXNBVH2ikAA6tctrejA+Rg6kTYL2tE9u6cwO3ym8ztSA6UmMslF11BHbip09JifzGBuYJB/SRKgRT865mc9Sn6pxqUhfMYzEIfqgACCsRdzFjVidGSKY9bhhoYKBo9Axec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744343430; c=relaxed/simple;
	bh=YWW7h0HqgMyquql1fS+ddwkaCtxiI0GAg99bBKTcrm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j1aEu+TQWl2zKVWCdZ1J6/h9MNS98G7EXdaGxzwrs7BxtkhOJZqUdVT4gA0W9yQPc1ZpMr7Da7Haq+ifDGwjjiLRWHYoydnEuVONyj1DUdTf9fEHb0iWFkMIXr7nEfBKDYfqR49QgHcSz5oKL7IO/g1ERGHvxW2Dyq8B3QZTRqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CR8uSCmr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFpdm6013884
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 03:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mibg4A5wcjWCC2c2KQWPOXgTNM8hWkyl49cSAZ9jgiw=; b=CR8uSCmrcDtI+eUo
	EeD38A63gW9oMEb/C5DCXy04RSECBUzDgHpCgUa66fr6uMCdyP2LEM1wPXJuMZ23
	CSFpQ1m/3qLf9S+gyDX8xKQdGACQgQs3tyk0Ax+/7Bks5DaXV9WNegtbb7O+RJsC
	Xx4Koo8yuatJt9Y8mtvskps/O42QP+Oy41UrLcmqZdn4rj/88j9d2SUv8jJMqhLX
	JqDDtNKeTySKnK9sxm0hEMNgVpC0Z7QFqXZsz+4VSUgM6W5zef+8joszdCNuSxJN
	g+POpTyZJRsSa0ho2k2cLmchgLUUbtBM2HpSg/Ces1MJJ8TIX1LVd5oaXbrA4PET
	eeGHlQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbeh4jp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 03:50:27 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-2c2a9abc5b2so441030fac.1
        for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 20:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744343426; x=1744948226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mibg4A5wcjWCC2c2KQWPOXgTNM8hWkyl49cSAZ9jgiw=;
        b=R5pok7dEASFuVVEYEyGWsb1UUCdA90Ps6GAKNqsGRj7Vnm5ZhItwuBQAVy6ltSYJJJ
         BQMgmbHAhCZC5KUzo0QOCK1mDKoIpL+Xh8TNEv2yTAAxr27+SIzKUdDmWQteJojpLQhs
         d30Qdh3wygC0q13/CktszgmiWRM5B4ZrLvFQnrGyBaOq+7gklBDI4xr2W/KQP3GyQY3c
         7AqdD+V6dtkqfMjHRF/jCrYUkKOb8Fy2Dt1PTbmDXWWppRd0IT/7J2ZHPoYazRcwR/ns
         q5P1wLOKoavBGaHAY6n3m2X3f8hkKIT0iIyHmTJUFObTGCWdD76gSMoKgIDn5CEaP1b6
         Ysow==
X-Forwarded-Encrypted: i=1; AJvYcCXsWrIS1leVgNiF/tDO1fmgc6WgY0x2awJccndMp9c4vpv1l8UkcqUphAox/kCts6ZkdpCGtXMZ5vs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8IBjvScF0IEn2TMA+JzOR/aXXsTT7H53AgaxW9oANempmu6ty
	QbfOIckn5s3bTY2A3FtZHKHv/pU4gK+qYf5qTeqRs/nLMUuJ1uV1u144PUj4wKXl1GNi/bZATO2
	m9MtVE5e6UHSDN9q1FDAx7i++Q+/hM7ms1nuFscKkbZxBnsEWU7pNMXuqbTw=
X-Gm-Gg: ASbGncvBoRE+06FStshnBs7wUGxgL/Ud7wY5FqkgYplGIhboBWxb56n+v2Np6lnSl1E
	z4O+VwioE/vT2CExApZGgI5F0MOi/AjkFhhoQQ3+WWbU+ztgxu/RNI4cmVtgxaulME7R+28NxWH
	t2uU45ffJ/JgQWmHHkhDN8fJDSceDH2p3TQ9uLBU5mBhfCoZIPTYsaOqUW6hXF3NDldHDDTDVB0
	F5Qv6kCXbBCY4vJ9RNuMUCyVwIkcMe+xurJ+90wOuyTco4L6Ob0/Hmgja0Aqju0ojV8tW/KTBpx
	l9ZmrnzAnNKwkvE7DwWax7cDnEvgxEfXeqHgDsTKNU1ms0G5y0kiHvkjDxLAVCpeS+xxi7ZfQV3
	CWdqpI7r1yLA=
X-Received: by 2002:a05:6871:a582:b0:2c2:c92a:5781 with SMTP id 586e51a60fabf-2d0d5ed9bc6mr710730fac.27.1744343426206;
        Thu, 10 Apr 2025 20:50:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCM5uRUxNmo8OjmkNzjASsAxb0t8uZgMe3M00GtjrExTBzyerRFo2u5RUSvt3F5lRIC2xwBA==
X-Received: by 2002:a05:6871:a582:b0:2c2:c92a:5781 with SMTP id 586e51a60fabf-2d0d5ed9bc6mr710726fac.27.1744343425793;
        Thu, 10 Apr 2025 20:50:25 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d0969589basm958677fac.19.2025.04.10.20.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 20:50:25 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 22:50:14 -0500
Subject: [PATCH v6 3/6] usb: dwc3: core: Expose core driver as library
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-dwc3-refactor-v6-3-dc0d1b336135@oss.qualcomm.com>
References: <20250410-dwc3-refactor-v6-0-dc0d1b336135@oss.qualcomm.com>
In-Reply-To: <20250410-dwc3-refactor-v6-0-dc0d1b336135@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10188;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=YWW7h0HqgMyquql1fS+ddwkaCtxiI0GAg99bBKTcrm4=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBn+JF9VxuKSCf5swaUGAlT+Y3KpsZkiVLxVd+bZ
 hqnC9HS9lOJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ/iRfRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVOMw//T6LuVh86V0bhjrPCzBaAXUxmKY2kr0oZxapsbGm
 XA9rgPdPqZyLamGOT54gDLlvR7ik/1vciKtKoJUir3AxMdmw9Y6ZCw8Fs88ryc03QmogZh4yh/T
 ZYa/xC9gemSquvSGTzadllCK2am0Pb860fIwLE3VuQL0lMwFVrzkrmWCjaX7UmxmvZ1T02RSK8g
 CDYYdb8siK1XFFe/ALgU8L2XVqzPwNKfGJdNzzLklO5Y0MT7QhI6Td7aVplhPcLR7PlIjRRs/cV
 TnS1riHqW6Wb6pC6Go8rAvCjovBk4ionp2kCe+YSl0jf74teJClB6vz4H7nqMHsfaSc+omeAiim
 q03qSyl3TsGqngMLyFxNwa6E+kYdjDJ4Fv8RqGbmnyKut3qaeHgw4vslxXUIN3E/Sj3sveVvNLq
 MrR2n4vo4RXd2Avcw0qfsGaDiVFGLJL7tmTH18tmGqEKU9RdbPd8HSDgg8UKkJsQnS0YcEf/c09
 /vuUw8D9mzV+hckjTZvdA5FdvVnNlK/N1HPfl+HPLXf5oQ2y/qmtPT2cDkt7cQYtjRvwFenOe1C
 TAEyBSgPGKR4K9x6eo9EOZAVp1cuG0VjTaJjBS+odV+aujGU6sVJI0742v8BR0PS3GHRII+9V6n
 zBD1KTWMCZ6+Ft0F2nShQxvqXL0fE5qMF9T/ojlCf42k=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: w4GR_e8kfYZMgcvOEtO-51Ff-YtFq8QF
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f89183 cx=c_pps a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8 a=bGkOf_LmPnIWPiKmcZAA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-ORIG-GUID: w4GR_e8kfYZMgcvOEtO-51Ff-YtFq8QF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110026

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

Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
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
2.49.0



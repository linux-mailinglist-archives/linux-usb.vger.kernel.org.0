Return-Path: <linux-usb+bounces-26250-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE387B14B41
	for <lists+linux-usb@lfdr.de>; Tue, 29 Jul 2025 11:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78D537AE786
	for <lists+linux-usb@lfdr.de>; Tue, 29 Jul 2025 09:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A2A286D7C;
	Tue, 29 Jul 2025 09:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hIOvAMhr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FD5286D57
	for <linux-usb@vger.kernel.org>; Tue, 29 Jul 2025 09:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753781239; cv=none; b=qKUIfcJiYAAiTomKACGR90wO5gvErcHUd1IkAy+p1aLurTV9gaLdz3RiESyjlDAj3rAsl+q/gdvFWTYdQM8NtnGzKs7OJtaT8m5pC8hR0oPIEaggXyuhqQXgKz2C0TBDlAwBN4EGJmWzH8mQPyKeEFLL8gPkdQWb2rl9HwkZPkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753781239; c=relaxed/simple;
	bh=E5sgvRGyJvY0ywG/TpftKEB2PoyatbUe79ibF/HCX08=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Bk5mURu9+tNbZHoxsKV7ufrO1Z+iPp46RVhzSXQHPzPpdWtXwOpvfnOcyBiG/qVyt+zY2I+fIpT/KGYw6UehB0iXORpra9TZ/NvzZoMUKk/zdcn0Nw2HAIZRFpaNALWCf/jbuudZVs7ttnMfgi9OM28h88AekaEv0BF9uffNigU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hIOvAMhr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8FfGu027637
	for <linux-usb@vger.kernel.org>; Tue, 29 Jul 2025 09:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TGeF+77gagv28O0Vm/mRw8LNgpNhO5PoJ9Q
	779Io/uU=; b=hIOvAMhreBbK1U/0GUsxj9ttdR4G8gdxHk6n3xEaYHmumDk6guH
	ZINmnYmTAXaQXtkUd8KQkPbugaJn2l1GFmqWdKsjUJhaGXXuC4qn56uWAx1fzSua
	NEYeu+nod8k5ublF1LSOwo+ducFJJ7StT7BVrv1dxROh0cOXnh9ZD8FGG/sTxMFk
	srBqU+vPoeqO7T+N3N2sNdPXhh60O/eXIucukftFcZNJXkWJN/9EyEsYnEt0qXAI
	5kT3jamxmvQ/cWuMMvs4OTmJd7ydcVog06Rtv76Bw56JWOuC9MbX4mMzm4oh+17M
	TfNtDTwwqypr8eB715u622oUdhVPHDztuTw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4860envsr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 29 Jul 2025 09:27:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2363bb41664so7354725ad.0
        for <linux-usb@vger.kernel.org>; Tue, 29 Jul 2025 02:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753781235; x=1754386035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGeF+77gagv28O0Vm/mRw8LNgpNhO5PoJ9Q779Io/uU=;
        b=wEBczar++RJhWdty7oVwtIpq85hltDAV1mTCH5MsAgUeD5v8W/2w0eS7699LO1F27c
         tp60zk5VtawrMs7yby2RlVbNcGTEhd++cOXzZUhELS/xu3ZrXI2OWXnD0fjShn15ZLA2
         jIdqDmoMHH+JLB1mmyor0CAey22IAGx88gj7GOUZBwaid5250ugk4YQzsOVcvmdXEwZ1
         cLaG1Jponopk08UHuSpOhaud36FbrchcEvQ41CWP91nHAE4lPQg1aKMN3XwazzYeIBLM
         2Rw5+LARZKh/jJADItpZTjnasAPYT5W8hDmcH9CdC17xLj8B0px+csQFJoYcpY5lZQ7i
         SEjA==
X-Forwarded-Encrypted: i=1; AJvYcCVp6oviivJuPVQnbFSRdqty0sKTSAwLETeRm7W8T/mEv/+NsxpMHSoYAxNUH7xxrxmTGrirQ1PB6bc=@vger.kernel.org
X-Gm-Message-State: AOJu0YygR2BXBr0BwFZGcjQsRexLdx9b93luoozr7x4+NZW+FUkQgvha
	MwWhHLiVQ19il4TIQt9EnSIEroTeyk59NPake8sx7qDXg6rdMzFr0s+y+uaWr4YUnSTvYZ0s9+d
	v8tJvYI5NtUW+UJ9ZOzv6l1K/t4oEN54Ae+M210zgZ7RrjrjtnO8MzkvzeY9dJ3Y=
X-Gm-Gg: ASbGncvMi0/BUdGU8UtTXmImarVm8jzG5M2qEIwFMRgEuC5ZjN8xUU2J9j+SkaOzb2r
	jwC7UYnePJzuGNQe+xbyHmEvi/4Vw4HarWmTSPoTuOvgT2tbons2sWE8kyRtI3pVSKnhPdJfcav
	LYhOwxdPhvTGu3LW0SyXV2lD5yqy+T2ouWMsu4RSjChcjjKQGnFlNZdL6CC55fg0rmMoK9MKi2+
	TGzuoABuzYul7jCe6eZpCPLECq2dXcjzNB0uoVG9ihwoGNqIEi3lTQbTKeAjjFxHeHYeSYfZPR3
	M/165H1fCQjCRjLNhiQCHW2EQ9eIdA7BVsavz9Ey8191yoaEtJpKBeS1jD3jPVyN+9bORX64VX9
	OCg==
X-Received: by 2002:a17:902:e889:b0:234:9dce:74e3 with SMTP id d9443c01a7336-24063cbd923mr41478535ad.2.1753781235178;
        Tue, 29 Jul 2025 02:27:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFl7bXUTl3H/0+BAkUxMsRmAjKnF3GBZ6RnoI7cHnmms2nEhsF6yNofg2B6g9W1peIBWR1lQQ==
X-Received: by 2002:a17:902:e889:b0:234:9dce:74e3 with SMTP id d9443c01a7336-24063cbd923mr41478265ad.2.1753781234709;
        Tue, 29 Jul 2025 02:27:14 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2407087eeb0sm12005935ad.87.2025.07.29.02.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 02:27:14 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v5] usb: dwc3: qcom: Remove extcon functionality from glue layer
Date: Tue, 29 Jul 2025 14:57:08 +0530
Message-Id: <20250729092708.3628187-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eVA6Vj8jwR2HbuykkjcIJ2Mi9q32EWQN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA3MiBTYWx0ZWRfXyK+feMntiimq
 fpEZcf2JW2ogpQ2ODeXat3vg+9ARCPd928EZ7P71Q4GZcQ6d8ZTzHDsb3r6a/FspHQeZ9O9AWQd
 WA7ClNfTFkPdyZLMRHf+lrVBHiHLB2QczYLr10QTpyQb0ENCLSlt72jlVzQ/i4Z4G8wNPJnW4Cf
 jQYS/FwCUza1jJ17Uxic2QUIqgt5lQ4V/+oOAV7Qx2eW3Foq1xjlerVxiNdoSNqZuBeVe1uTDq1
 CE9eZ9FQRRz3fmapjOqWTvIQBo3xXjovY/OyAWfaIvyu1/GjCMK1xQdiXOTXqvervcixpibZzDO
 XpsIVkiayGL+rKl3iRqyCm+4XiY1mUW0GJQ+MH0/rQwKU7xPYftU40DpZRrFhbD1wzkk9rEJFnk
 U6tA0s2E+cPeRtBMLGDSskKv+piNJgMJxO1eMSX9nahoJfsHOkvKepA8ZVVthy90zsIhE1Q7
X-Authority-Analysis: v=2.4 cv=DIWP4zNb c=1 sm=1 tr=0 ts=688893f4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pl63_STlR_f733i2M8sA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: eVA6Vj8jwR2HbuykkjcIJ2Mi9q32EWQN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_02,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290072

Historically Qualcomm DWC3 glue driver supported both extcon and
usb-role-switch kinds of notifications. When Bjorn contributed [1] the
flattened representation for the DWC3 host controller, he also kept both
extcon and usb-role-switch support in the flattened driver & bindings.

Currently there are no in-kernel users for flattened DWC3 and extcon. As
device's DT needs to be manually converted from legacy to the flat DWC3
representation, we can drop (legacy / deprecated) extcon support from
the new DWC3 glue driver, significantly simplifying the code.

This potentially affects flattening effort for the following platforms:

Platforms currently using linux,extcon-usb-gpio device that need to
switch to gpio-usb-b-connector:
- apq8096-db820c,
- msm8996-sony-xperia-tone-dora

Platforms currently using linux,extcon-usb-gpio device that need to
switch to gpio-usb-c-connector (not supported at this moment) or to
implement typec support
- msm8996-sony-xperia-tone-kagura
- msm8996-sony-xperia-tone-keyaki
- msm8998-fxtec-pro1
- msm8998-sony-xperia-yoshino-lilac
- msm8998-sony-xperia-yoshino-maple
- msm8998-sony-xperia-yoshino-poplar
- sda660-inforce-ifc6560
- sdm630-sony-xperia-nile-discovery
- sdm630-sony-xperia-nile-pioneer
- sdm630-sony-xperia-nile-voyager
- sdm660-xiaomi-lavender
- sm6125-sony-xperia-seine-pdx201
- sm6125-xiaomi-ginkgo
- sm6125-xiaomi-laurel-sprout

Platforms using TI TUSB320L chip need to switch to represent the USB-C
connector properly (and to have a typec-class driver for the TUSB320L
chip):
- msm8996-xiaomi-gemini
- msm8996pro-xiaomi-natrium
- msm8996pro-xiaomi-scoprpio

Commit message suggested by Dmitry Baryshkov.

[1]: https://lore.kernel.org/all/20250414-dwc3-refactor-v7-0-f015b358722d@oss.qualcomm.com/

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Changes in v5:
Changed commit message to explain the issue in more detail.

Link to v4:
https://lore.kernel.org/all/20250718053856.2859946-1-krishna.kurapati@oss.qualcomm.com/

Changes in v4:
Updated commit text to reflect the patch doesn't affect in-kernel users.
Removed RB tags from v3 since commit text is changed.

Link to v3:
https://lore.kernel.org/all/20250714044703.2091075-1-krishna.kurapati@oss.qualcomm.com/

Changes in v3:
This change was 4rth patch in [1]. It was suggested to make this as the
first patch of the series. Since this is independent of role switch
patches, sending this out separately. Removed RB Tag of Dmitry since the
patch has been changed.

[1]: https://lore.kernel.org/all/20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com/

 drivers/usb/dwc3/dwc3-qcom.c | 90 +-----------------------------------
 1 file changed, 1 insertion(+), 89 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ca7e1c02773a..a7eaefaeec4d 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -11,7 +11,6 @@
 #include <linux/of_clk.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
-#include <linux/extcon.h>
 #include <linux/interconnect.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
@@ -79,11 +78,6 @@ struct dwc3_qcom {
 	struct dwc3_qcom_port	ports[DWC3_QCOM_MAX_PORTS];
 	u8			num_ports;
 
-	struct extcon_dev	*edev;
-	struct extcon_dev	*host_edev;
-	struct notifier_block	vbus_nb;
-	struct notifier_block	host_nb;
-
 	enum usb_dr_mode	mode;
 	bool			is_suspended;
 	bool			pm_suspended;
@@ -119,8 +113,7 @@ static inline void dwc3_qcom_clrbits(void __iomem *base, u32 offset, u32 val)
 
 /*
  * TODO: Make the in-core role switching code invoke dwc3_qcom_vbus_override_enable(),
- * validate that the in-core extcon support is functional, and drop extcon
- * handling from the glue
+ * validate that the in-core extcon support is functional
  */
 static void dwc3_qcom_vbus_override_enable(struct dwc3_qcom *qcom, bool enable)
 {
@@ -137,80 +130,6 @@ static void dwc3_qcom_vbus_override_enable(struct dwc3_qcom *qcom, bool enable)
 	}
 }
 
-static int dwc3_qcom_vbus_notifier(struct notifier_block *nb,
-				   unsigned long event, void *ptr)
-{
-	struct dwc3_qcom *qcom = container_of(nb, struct dwc3_qcom, vbus_nb);
-
-	/* enable vbus override for device mode */
-	dwc3_qcom_vbus_override_enable(qcom, event);
-	qcom->mode = event ? USB_DR_MODE_PERIPHERAL : USB_DR_MODE_HOST;
-
-	return NOTIFY_DONE;
-}
-
-static int dwc3_qcom_host_notifier(struct notifier_block *nb,
-				   unsigned long event, void *ptr)
-{
-	struct dwc3_qcom *qcom = container_of(nb, struct dwc3_qcom, host_nb);
-
-	/* disable vbus override in host mode */
-	dwc3_qcom_vbus_override_enable(qcom, !event);
-	qcom->mode = event ? USB_DR_MODE_HOST : USB_DR_MODE_PERIPHERAL;
-
-	return NOTIFY_DONE;
-}
-
-static int dwc3_qcom_register_extcon(struct dwc3_qcom *qcom)
-{
-	struct device		*dev = qcom->dev;
-	struct extcon_dev	*host_edev;
-	int			ret;
-
-	if (!of_property_present(dev->of_node, "extcon"))
-		return 0;
-
-	qcom->edev = extcon_get_edev_by_phandle(dev, 0);
-	if (IS_ERR(qcom->edev))
-		return dev_err_probe(dev, PTR_ERR(qcom->edev),
-				     "Failed to get extcon\n");
-
-	qcom->vbus_nb.notifier_call = dwc3_qcom_vbus_notifier;
-
-	qcom->host_edev = extcon_get_edev_by_phandle(dev, 1);
-	if (IS_ERR(qcom->host_edev))
-		qcom->host_edev = NULL;
-
-	ret = devm_extcon_register_notifier(dev, qcom->edev, EXTCON_USB,
-					    &qcom->vbus_nb);
-	if (ret < 0) {
-		dev_err(dev, "VBUS notifier register failed\n");
-		return ret;
-	}
-
-	if (qcom->host_edev)
-		host_edev = qcom->host_edev;
-	else
-		host_edev = qcom->edev;
-
-	qcom->host_nb.notifier_call = dwc3_qcom_host_notifier;
-	ret = devm_extcon_register_notifier(dev, host_edev, EXTCON_USB_HOST,
-					    &qcom->host_nb);
-	if (ret < 0) {
-		dev_err(dev, "Host notifier register failed\n");
-		return ret;
-	}
-
-	/* Update initial VBUS override based on extcon state */
-	if (extcon_get_state(qcom->edev, EXTCON_USB) ||
-	    !extcon_get_state(host_edev, EXTCON_USB_HOST))
-		dwc3_qcom_vbus_notifier(&qcom->vbus_nb, true, qcom->edev);
-	else
-		dwc3_qcom_vbus_notifier(&qcom->vbus_nb, false, qcom->edev);
-
-	return 0;
-}
-
 static int dwc3_qcom_interconnect_enable(struct dwc3_qcom *qcom)
 {
 	int ret;
@@ -737,11 +656,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (qcom->mode != USB_DR_MODE_HOST)
 		dwc3_qcom_vbus_override_enable(qcom, true);
 
-	/* register extcon to override sw_vbus on Vbus change later */
-	ret = dwc3_qcom_register_extcon(qcom);
-	if (ret)
-		goto interconnect_exit;
-
 	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
 	device_init_wakeup(&pdev->dev, wakeup_source);
 
@@ -749,8 +663,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
 	return 0;
 
-interconnect_exit:
-	dwc3_qcom_interconnect_exit(qcom);
 remove_core:
 	dwc3_core_remove(&qcom->dwc);
 clk_disable:
-- 
2.34.1



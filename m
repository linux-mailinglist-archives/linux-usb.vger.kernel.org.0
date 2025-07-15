Return-Path: <linux-usb+bounces-25835-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D825B05913
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jul 2025 13:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 951B64A1027
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jul 2025 11:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA502D77E4;
	Tue, 15 Jul 2025 11:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="evj1ggfT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084BF273D8C
	for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 11:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752579947; cv=none; b=ADmfegJfrjuIzceaj8xt9ronLm0ZVlKFMty+wWFEJYY8kUJiY27SA8cgq9DFWwxkTPQGuAN3RdQ9Q8KLYXpXcOtuen99WOeEEKocIE6Du5RpICfzPv2ADR38vZj0F2OHSVKimn9dYJj8XTnqPCAD28IurbR6L3pvEpuqtytjBew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752579947; c=relaxed/simple;
	bh=Tq765yXvIRwDEMQ1PzkrTV8Mrf0NdnijTymUrObKAHg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mgQh3hu8jIAtpSqFcfa22CAETl6Jzp+ZDjno8wgomnoIpd3Ke5U6nkFockbiw/T13fgRwrvysFacCRyIr3ChuXKAB4MflVSm4WFLu0F/qdWEuWVG9hjHEab+cHm8y8thPs/eIFVyQBfqyAfbEQm8gGmR2LtRke8UYj4Y1MDCzC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=evj1ggfT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FBHmLj004275
	for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 11:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fn0voADRuZMFcYi7vrpOpN
	WJrE41l6dzredqEZfHl1o=; b=evj1ggfTLISIYfZgBhC7p4GGHwiu1QhjiPWjjI
	v+dtchlx6SpCCjudeSWv5tsYtXyY9zXRCzveYxUIPRj4s7jT94Zpz7tKvpmwaEPB
	kBZPSwqSRF3WPWZXMfht4oTu+7y56yfeMTUaRtLz007oFTGCKifdwGKCb+sBF2lu
	j1LUIfVzFvpyI9xdg4pJWnMJfD2vl7Y6HcVqOmibxtWJsiZgJpgPZJ6k33JWuIMn
	NCI8QGCO/efKS0ynoT1brqK88yrdzDspM6jOHvy4Ha88tL1mBv+kaDrIVgcvfhjs
	4n8TI9MBDv5xes8vYQ7x6VxEixRUFfvVpnegSA6wzMG0h0IQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfca1bfs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 11:45:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b2fcbd76b61so6731702a12.3
        for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 04:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752579943; x=1753184743;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fn0voADRuZMFcYi7vrpOpNWJrE41l6dzredqEZfHl1o=;
        b=VvTzvFZf3a82/V9EMBroTHrtxvu13yp7246CApY1tdzCFbFjm3qpP2NIeZNckAn7iE
         DHwwpQ7ilQGoBpLpv9dpSEbyI0vmdEzIm4AFKNou8UjAefD3+iuhUU65DZCIHUoiDF2i
         EK2uZO2Bbg2zlEUstoafi7x6t/DiMYB4DFSocbJNU43PH+EUyO44bbkZ6iBgLSKLu5Jy
         Jd+RMLyVq/eCztEt05/1GfdikIQXN7+5Vyqzj0z96+9kWvJ4GOvsXXC49qkdMW3B05Gi
         ewyautuen9+9y18Y0QxNF0K40JfeXUEhPC4rFkGoaJjLkw6JN1FoezxWMnl9kXGccTF8
         GoWQ==
X-Gm-Message-State: AOJu0YyHEitEe7H/73QhO2zjGBdJoS+eaQQRIKhVPV2qEBKohBKOaI3Z
	JDefvvlw2l9PCQgwptmVIHtNiaIWfwlt3Miz3OqDPCo1QIptEQRL0IXg9XlkH058aagct6nbQFm
	Hw4Ocq4QUCL7QriCULJ/q6Nmeofq1DqEOniwHp6cHh6wTiKABiI41x0jKXF1Fnb8bKNZVNHmI6w
	==
X-Gm-Gg: ASbGnctfxDtF+x+6OuO7jPscEEhmBFq2rhsc3+yIWTP3S33m7KXZhNdxX59pxVxGj/f
	SbNkOh+R87xdOfwx2IPti1QWBnHaTm6Q0m1yvwsUCO6c566c+8VGYPg/Is57XKUNRXibwV78pru
	WhpJJ+3Tk251dSqyPbBLinL0ZNa7lOH+3tNhUFbKEjkT1B0Gl9CVVDpyQ13fZYbfXBrQKlqpvkO
	rv26KO8PiYYMWDfuXKK/hzwCRMwHS6ZFUJTwFDGx9v7TrYX/RolvQttHljN/2AnhY7hoagN+N3C
	kk8ZS/RO/5S/uE99ux1PcU1zyh560PKH6J+xaHfO9pNXcur1yc9cUmRM8y1FDgNczBIC
X-Received: by 2002:a05:6a20:431a:b0:225:c286:5907 with SMTP id adf61e73a8af0-23135d64236mr32648636637.3.1752579943099;
        Tue, 15 Jul 2025 04:45:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6xQvemovlAM2BHDvBkmvw3Kw1jCclEVoZw4DjbKySw3yIcZMZNQwhLTNmeN9NLItWsj8Tqw==
X-Received: by 2002:a05:6a20:431a:b0:225:c286:5907 with SMTP id adf61e73a8af0-23135d64236mr32648577637.3.1752579942675;
        Tue, 15 Jul 2025 04:45:42 -0700 (PDT)
Received: from hu-kbajaj-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe6f4fc8sm11983047a12.51.2025.07.15.04.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 04:45:42 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 17:15:27 +0530
Subject: [PATCH v5] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250715-eud_mode_manager_secure_access-v5-1-e769be308d4a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFY/dmgC/03NQQ7CIBCF4asY1kIolRJdeQ9jyEinLbUUnbHGp
 OndJa7cvOTb/G8VjBSRxWm3CsJ35JjnArvfiTDA3KOMbbEw2ljtKitxaX3KLfoEM/RInjEshB5
 CQGbZoHVYB1dhMKJEHoRd/PwOLtfijnKSr4EQ/rL6qBtr61oZ68xBVvKeE0zqBiOM58ysngtMI
 aekyoht+wJBAJictgAAAA==
X-Change-ID: 20250715-eud_mode_manager_secure_access-6e57e3c71ec2
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Melody Olvera <quic_molvera@quicinc.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752579940; l=5066;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Tq765yXvIRwDEMQ1PzkrTV8Mrf0NdnijTymUrObKAHg=;
 b=VWj7jhO6ZW+rUI+Dvo9L5Z5nODeKNAHmsAtBeRCGZHXvEKdWInd9D3P9hqBIqs/LM7BVvhOSr
 zs6enswjOzbAak8sbh6SLvIZm1eOW99LdTDSe5RJ2XEmEs+XTLdtsNh
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDEwNyBTYWx0ZWRfX9wIFU2tbWVJt
 ul4w7MnDbTGgRKavXUSA0uPT0s8PyFz8lz258TyMa8sr+SqBFjmJSr0MbE4XopaPi01HlIJ5Eoo
 H9lOGIDR2d7Z3eK3Ma9iJsbVO4MZfDLF8ofZ6fl9h+Y6dMoImgu8vyLlMDDSlZqjfFBFvt96DDA
 77oYVdkB9Kd4hSgRw8OThWM+kOUxbxJaUcSulB9gpWLleA9V/7Xm6CsUaRfW7MpSQcOSJFZ2uKm
 qSYyFn9zfzlOonhLn5aQstuORr/tmigwaIFDtSs7J4GE4QQ0oyPYWjAWlTdR7URQSnXj3NYxYEp
 p7jJYbpsLAWQne8CZS/sFdRIUxMwTXJhElOGgLTUaw3tCwBiPwZyLTwj1Dqj4RGcW/UF6CWjlXA
 ABKkkjVWcsVz5A24flqz1jr18EO9Y9z1pKxIsEzwRitDR7GTRI+pcWC7qRHx8CDRE6e+JsEN
X-Proofpoint-GUID: hehkmKGcXjC5VFkoA04Z9tfGG9p963LZ
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=68763f68 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=eSh0DRBKNElbVECXfMQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: hehkmKGcXjC5VFkoA04Z9tfGG9p963LZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150107

EUD_MODE_MANAGER2 register is mapped to a memory region that is marked
as read-only for HLOS, enforcing access restrictions that prohibit
direct memory-mapped writes via writel().

Attempts to write to this region from HLOS can result in silent failures
or memory access violations, particularly when toggling EUD (Embedded
USB Debugger) state. To ensure secure register access, modify the driver
to use qcom_scm_io_writel(), which routes the write operation to Qualcomm
Secure Channel Monitor (SCM). SCM has the necessary permissions to access
protected memory regions, enabling reliable control over EUD state.

SC7280, the only user of EUD is also affected, indicating that this could
never have worked on a properly fused device.

Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded USB Debugger(EUD)")
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v5:
* Changed select QCOM_SCM to depends on QCOM_SCM in Kconfig per Greg's review
* Link to v4: https://lore.kernel.org/all/20250709065533.25724-1-komal.bajaj@oss.qualcomm.com/

Changes in v4:
* Added error logging in disable_eud() for SCM write failures, per Konrad’s suggestion
* Link to v3: https://lore.kernel.org/all/20250708085208.19089-1-komal.bajaj@oss.qualcomm.com/

Changes in v3:
* Moved secure write before normal writes
* Added error checking in disable_eud()
* Use ENOMEM error code if platform_get_resource() fails
* Select QCOM_SCM driver if USB_QCOM_EUD is enabled
* Link to v2: https://lore.kernel.org/all/20250627125131.27606-1-komal.bajaj@oss.qualcomm.com/

Changes in v2:
* Drop separate compatible to be added for secure eud
* Use secure call to access EUD mode manager register
* Link to v1: https://lore.kernel.org/all/20240807183205.803847-1-quic_molvera@quicinc.com/
---
 drivers/usb/misc/Kconfig    |  1 +
 drivers/usb/misc/qcom_eud.c | 27 +++++++++++++++++++++------
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
index 6497c4e81e951a14201ad965dadc29f9888f8254..73ebd3257625e4567f33636cdfd756344b9ed4e7 100644
--- a/drivers/usb/misc/Kconfig
+++ b/drivers/usb/misc/Kconfig
@@ -147,6 +147,7 @@ config USB_APPLEDISPLAY
 config USB_QCOM_EUD
 	tristate "QCOM Embedded USB Debugger(EUD) Driver"
 	depends on ARCH_QCOM || COMPILE_TEST
+	depends on QCOM_SCM
 	select USB_ROLE_SWITCH
 	help
 	  This module enables support for Qualcomm Technologies, Inc.
diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 83079c414b4f281b2136d0d1eb39418c7f94ff8c..a58081f53db32935f09c685e4599985285133891 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/sysfs.h>
 #include <linux/usb/role.h>
+#include <linux/firmware/qcom/qcom_scm.h>
 
 #define EUD_REG_INT1_EN_MASK	0x0024
 #define EUD_REG_INT_STATUS_1	0x0044
@@ -34,7 +35,7 @@ struct eud_chip {
 	struct device			*dev;
 	struct usb_role_switch		*role_sw;
 	void __iomem			*base;
-	void __iomem			*mode_mgr;
+	phys_addr_t			mode_mgr;
 	unsigned int			int_status;
 	int				irq;
 	bool				enabled;
@@ -43,18 +44,30 @@ struct eud_chip {
 
 static int enable_eud(struct eud_chip *priv)
 {
+	int ret;
+
+	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
+	if (ret)
+		return ret;
+
 	writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
 			priv->base + EUD_REG_INT1_EN_MASK);
-	writel(1, priv->mode_mgr + EUD_REG_EUD_EN2);
 
 	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
 }
 
 static void disable_eud(struct eud_chip *priv)
 {
+	int ret;
+
+	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 0);
+	if (ret) {
+		dev_err(priv->dev, "failed to disable eud\n");
+		return;
+	}
+
 	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
-	writel(0, priv->mode_mgr + EUD_REG_EUD_EN2);
 }
 
 static ssize_t enable_show(struct device *dev,
@@ -178,6 +191,7 @@ static void eud_role_switch_release(void *data)
 static int eud_probe(struct platform_device *pdev)
 {
 	struct eud_chip *chip;
+	struct resource *res;
 	int ret;
 
 	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
@@ -200,9 +214,10 @@ static int eud_probe(struct platform_device *pdev)
 	if (IS_ERR(chip->base))
 		return PTR_ERR(chip->base);
 
-	chip->mode_mgr = devm_platform_ioremap_resource(pdev, 1);
-	if (IS_ERR(chip->mode_mgr))
-		return PTR_ERR(chip->mode_mgr);
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	if (!res)
+		return -ENODEV;
+	chip->mode_mgr = res->start;
 
 	chip->irq = platform_get_irq(pdev, 0);
 	if (chip->irq < 0)

---
base-commit: 347e9f5043c89695b01e66b3ed111755afcf1911
change-id: 20250715-eud_mode_manager_secure_access-6e57e3c71ec2

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>



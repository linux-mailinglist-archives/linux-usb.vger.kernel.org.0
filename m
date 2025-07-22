Return-Path: <linux-usb+bounces-26080-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 683DEB0D842
	for <lists+linux-usb@lfdr.de>; Tue, 22 Jul 2025 13:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E3811895A13
	for <lists+linux-usb@lfdr.de>; Tue, 22 Jul 2025 11:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29BFE28CF67;
	Tue, 22 Jul 2025 11:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nwx5Mbfg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAEFAD23
	for <linux-usb@vger.kernel.org>; Tue, 22 Jul 2025 11:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753183927; cv=none; b=lvSMh74UAqt4+b+Cpwsp7b2u1tRjFadEQEknMoKES1mrB7Sio9ZL2VEO11tWEhRvQo/lOUR8ZFvH4GkGKmPqxpM3O7qG955wd/nrbV/c3WdsqUX7QE6S4ChNY6y+AbyfbrqQvSejmFObL4H+7Ox8aK4i9Z9Zksj2JQKOHRK4oQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753183927; c=relaxed/simple;
	bh=kZHjtIJ7Z7gxE1Sv7gu5xdXvow5NCtj8P0E7pJpY/kU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KkeMxBdSjNczuYG6u92mEXWsgm0OBrkQJDbkG6hjVXdaDRaUdCycga05H+DpqFxPjTZFOHcQU8tkHIzPa1XJUDuH2N3qcrllE4GIA5etsShCFfawP8srvs6yC4LvPks6oMMejtUFH4jPAPfLBkLblaJOk4keqTZJctOThH1lh7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nwx5Mbfg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7lX75004629
	for <linux-usb@vger.kernel.org>; Tue, 22 Jul 2025 11:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KHEzHWFh7z5g93ZF2fOjyn
	2gvZGMTJQhu/RCq8JTXM0=; b=Nwx5Mbfgcf2zlq88j0svs/22rw0ZUzcrOMGj8U
	DZguVosPt1pvW6iRUPkSk7L7z0ap6246TeTZyny0tgdeF//HsY2hXYwajtm4x4n1
	sHWo873sYj9bxyCozbz5A6afRI2/zqttA+RXIlcml/jHAwmFwdC/VHjJCs5M+tCz
	lK67O4v4lDQCzYci9hlLueDdpoAq3tsfUBFMt1+OQSRoVwANIFv887YBGpAM8RRV
	JVkD+JqOF407hEwHYQ7Oxkpn4zcffI+GwRUz6t9EQRHZVhQX5CAXbi19Ummw0SD1
	WzSOrw6MiMoZE2/pz2riY6w2gA20WSvCZTVs9yVqbSYPCZaA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048v7jg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 22 Jul 2025 11:32:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-234b133b428so41673575ad.3
        for <linux-usb@vger.kernel.org>; Tue, 22 Jul 2025 04:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753183924; x=1753788724;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KHEzHWFh7z5g93ZF2fOjyn2gvZGMTJQhu/RCq8JTXM0=;
        b=TwWrv9WaFM1irkBXibJcyfWIvyIpZnNOd9VD59MQrdah2vhUzoSiutnv5cCCHSxk4U
         ZI5XbisYPnXb+toIEoZ7qYCkuhCsxLIB3FCqhRLPYsDizj9i/Gc9lXeEPHjs7Yg99NtO
         igaxDByK1+SbH1zVWosEvF1F+Uguueji5a7PXGzh+iSVBC+Bw1qSRZxDcLNvRbik9ckZ
         qXuZtTowx3Nzvl6f55+bRTB3YfpAqvhLOSwTd7rXyj/ZMTeeUdeoOq0GPubEANDtTWh7
         XY1+yLwx3sG9LfRLd8Ibkiaq8yKbZviJELjzTQyO5CTowiNJZ3o92c2nGLbYB5ZzmH31
         CnMg==
X-Gm-Message-State: AOJu0YyFHFLbu6pZlO4AMBbfoY9ww36kLThRlpKwlB+Eh2jacnLDpVci
	aGhCnP9IrrAQ+dS2ClR6g8oNlOhVQ/nOIj/8FjTxMVHpoJACRvS8XqAGjjILuy47mr2TfHJWUIR
	1VPKqt0Rsw/z6xL1TgPPO1Hmmy0uo+xsfVkzaLraq3C3tvCdzG20tPrGFrB8PdIc=
X-Gm-Gg: ASbGncsLZ8ZXDK2qlDNtejz9dtSQFVKfDEoehEcUl/24x00kHxPTyWobaM8a/jBWgbt
	MyoJOL+JwfVHPGAP4BWYbkaY5CgoI9CRso75p8Q09/UXhRWtsXqA34JRgCX7L6dYBFIULsWXKSL
	mV3ILK5oy+oagapMMJJ2a55jcY376nCd7MFSxEt5LvXRE8kVJvDAG8O9ZLjnfn65qCMB3zj1w3P
	Rsj9Af+4aQItt2V4gsSIQF8kIog88Oc+Zvnknz/hGODcle7LGqmko3TtDA+XLVE3WZRB58CrSkB
	yQpjN7DhFdAuL5URzglErD+2WJk0uZQGpubC2PRSseV4BJ/aPfY6R+q+zIpcJSCGtkkg
X-Received: by 2002:a17:902:f790:b0:235:e8da:8d1 with SMTP id d9443c01a7336-23e24f363c8mr332032885ad.8.1753183923995;
        Tue, 22 Jul 2025 04:32:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF51G0VHwEbCxXaIW9PUWL3BEHTsLcIpufqm3lqrcgr98fkvtlOFSCW6YBW/pZm/rTwqu9y1Q==
X-Received: by 2002:a17:902:f790:b0:235:e8da:8d1 with SMTP id d9443c01a7336-23e24f363c8mr332032415ad.8.1753183923548;
        Tue, 22 Jul 2025 04:32:03 -0700 (PDT)
Received: from hu-kbajaj-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b4ae8sm74532145ad.95.2025.07.22.04.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 04:32:03 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 17:01:53 +0530
Subject: [PATCH v7] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250722-eud_mode_manager_secure_access-v7-1-40e9a4569895@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKh2f2gC/43OwWrDMBAE0F8JOkdGlrxS0lP/oxSzkdexkshqt
 bFpCf73yjkFWmguA3N5MzfBlAOxeNncRKY5cEhjKW67EX7A8UgydKULrTQoV4OkqWtj6qiNOOK
 Rcsvkp0wtek/M0hI4Mt7V5LUoyEemPnzdB97eS+9zivI6ZMIHVu2VBTCm0uB0I2t5ThEv1QFPe
 HpNzNXnhBefYqxKrOoQ+Jry9/31DKv99MEZik/O7g9k1K5r8PfA+nO2D6qu/1VtUXuyyhgN6FX
 zh7osyw+8A+fAbwEAAA==
X-Change-ID: 20250715-eud_mode_manager_secure_access-6e57e3c71ec2
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Melody Olvera <quic_molvera@quicinc.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753183920; l=5866;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=kZHjtIJ7Z7gxE1Sv7gu5xdXvow5NCtj8P0E7pJpY/kU=;
 b=Uq3E0fQt4r2ISl/7ZGqA1BfXFVwXef7Ietnp6G3JvQqh2qdE/yW6p1co1h3/yrgG/6odaCO3S
 X/bl1w5S6UGCtHSUG8nlZOKwHa7IivilxVar0dueoQhrcpoOOHcTQB8
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: Ss0ju9UyBt8JWZLWuNoJPNBJA6p268X3
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=687f76b5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=lmNMGcLygp3pFLK-ZoUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA5MyBTYWx0ZWRfX6VP7pMaRqzki
 4aSsJHEgjv33axfwjmR56fZm9v2z3IDMjMk/IWJ1qPXVnQ6i6CT45S2Qs2CSU62XN2ZL8P49G3K
 QCqFcBiXIFn8FWPvmFflKhgbdRMvRPCcnkso01/TLUANr70KsdbgrSstLMsIWE14nFfhmrtStGn
 vjsqJ6c3TOjY10O+pKSHD8KEVmwZ0K4Ob5pxUnVpLrfKuC6IU4+SfjU3R1Tz0RV+IzEM49IVntx
 GFAYSKe9p14rW4XL5PuAOwHL9RQrrPultUHj78xGqkTQ3O5m9qfXZcgpOJYmcBwNb6HmsBR4ArZ
 X8TUyz/yQPr7rMW5BZN4v4wHbbPQ4y3Egd5J6bpZKlqVBtN1wjdZFvi8Jl5J2eWVxgXDMUkRv+d
 Y6Zd/aW/t4E+C/YbxgWuhdpNr+nFLnaWubk8QXT03RVx+zXBaILZf9o2BF3rHi5zg1Af0VJf
X-Proofpoint-ORIG-GUID: Ss0ju9UyBt8JWZLWuNoJPNBJA6p268X3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220093

EUD_MODE_MANAGER2 register is mapped to a memory region that is marked
as read-only for operating system running at EL1, enforcing access
restrictions that prohibit direct memory-mapped writes via writel().

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
Changes in v7:
- Updated the commit message as per Greg's comment
- Link to v6: https://lore.kernel.org/r/20250721-eud_mode_manager_secure_access-v6-1-fe603325ac04@oss.qualcomm.com

Changes in v6:
- Propagating the error code from disable_eud(), per Dmitry's suggestion
- Link to v5: https://lore.kernel.org/r/20250715-eud_mode_manager_secure_access-v5-1-e769be308d4a@oss.qualcomm.com

usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through secure calls

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
 drivers/usb/misc/qcom_eud.c | 33 ++++++++++++++++++++++++---------
 2 files changed, 25 insertions(+), 9 deletions(-)

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
index 83079c414b4f281b2136d0d1eb39418c7f94ff8c..05c8bdc943a88dab6159a05c2d770484c084f7b7 100644
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
@@ -43,18 +44,29 @@ struct eud_chip {
 
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
 
-static void disable_eud(struct eud_chip *priv)
+static int disable_eud(struct eud_chip *priv)
 {
+	int ret;
+
+	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 0);
+	if (ret)
+		return ret;
+
 	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
-	writel(0, priv->mode_mgr + EUD_REG_EUD_EN2);
+	return 0;
 }
 
 static ssize_t enable_show(struct device *dev,
@@ -82,11 +94,12 @@ static ssize_t enable_store(struct device *dev,
 			chip->enabled = enable;
 		else
 			disable_eud(chip);
+
 	} else {
-		disable_eud(chip);
+		ret = disable_eud(chip);
 	}
 
-	return count;
+	return ret < 0 ? ret : count;
 }
 
 static DEVICE_ATTR_RW(enable);
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



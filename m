Return-Path: <linux-usb+bounces-25165-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D31AEB82B
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 14:51:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C47935624FA
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 12:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E42A2D9780;
	Fri, 27 Jun 2025 12:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IbMBNwYC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC87E2D3EEC
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 12:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751028699; cv=none; b=Pe1Ck8A1LUDvJ7pgpN3NDyTqZAixOcR5sH0AaT9qLoVfeOWjFlY1jizFfw5Zz5T/SQRANHbR4VyCivxVL9628rOc/7+AkCI6lHC4byC7EcpHNxKFCH1uL+ecJ7qKWLFXyJmfuzACLtoeurcsVcajoY6D0apmuWthnPG6hgoaFKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751028699; c=relaxed/simple;
	bh=si5pkg3D7M7AemArS/xiRGGpBgK97TaRSQ8mXnLW03I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e/xB8mxmxlcXednuEfRXWmSnWhTQ6yqs7KQFgSsHdzTxs7lj/HxXTYUdCYZo9yojZAdOgLZ97nrH2VHf+fsxS6dxDFCDoN81TKFt2O70tS6vNt+NtsMVrAs9b51Fm3Vu2b/4UVVHNSzJfEyqrRXy/SO1kBkqa8xoOOb7OmkFkKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IbMBNwYC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCULOV009555
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 12:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ZrQ8AHkAD30tuUld9m43KAGRDqt8gThRB6o
	xUrxVwDo=; b=IbMBNwYCkXD5hjWt97lAhSiAVOC6h7oxNUV2kyldYK+XeLJ11DI
	hwqWLN13j41143FRF0SO817fOdVUt9pSIe7UkdkN9ldbhFw5JWJMXDJiItHDqgZx
	0kBBkcv4PNCVGBin7uvk5lk1NlXw+TxkqTuC2jUEDbXxuasvtH/wY6bUfTZEXTXp
	WxfmqAw6qIcQ+rY2+XG0cXbA925UEr4ROCJiJRFvsRrhZVCO86mfLz1MwvMwdPHJ
	CX+gwA3lY1yLPphga2ENcgDKTJsJ+B7KE6DhXO0nKR08nrrZp2/XrHehbtAKMVDE
	L/ToiV/xiULMEFu4QhcmYogoP2QYh76eHiA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b46spp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 12:51:36 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b31ca4b6a8eso1267357a12.1
        for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 05:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751028696; x=1751633496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZrQ8AHkAD30tuUld9m43KAGRDqt8gThRB6oxUrxVwDo=;
        b=AmLZ4iVOfDTY8NSwPEplmz5L5V0MCH2DDP4g9aLXLwHJd2S6bi6DAVL9CL7wcA8sUx
         bitB03LhUknkVJIAZWjTJpdbYueauZVs0TQeXemz+JLvFKrKOtQW6pzZg5J+9/Dr9ckU
         fo+pw2zi2adPmpu0aecKiOU6wjvL+uWYYjTUqUA6B/vHZJgkRF6u+3i88RsgRgCkqtod
         L50JjbuOK+XecJ8LHuxp9x8XDxOYRtI+p7EaFlIhXbJQ3Ba5U7VnOfNunloajlSyZhfd
         mpLCxVV0ISZb2ZTuGktPZy+wMrOQEtGYy2fktQZYkJ8PTpCOmH5zQmmtz6PuTJUmmoja
         sJqw==
X-Forwarded-Encrypted: i=1; AJvYcCXMlWzD0LSOjkpIIOuqC6d8eTrADeKo/cWqU8Ha1KMzVyktc0xF2NJenpgWXGSyHSK9MR+o7o+EyLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyOOiZpF81XXKuJQCLll/nZDpZAn3cEDbonzhCF4f0aJRB9Gfz
	qhsl9VqFUu2imhRpyOJI1Huq2wQhyqVekzOsq+NwwN6VVkYLdbzQwg6AG8zsbWI50NcJidhN+CC
	J2+ffdNeX+pegGfw2kd66GKR2yP0Zmdepuy1AVwM0T96zirtd1PiUWo1mpuUiqtw=
X-Gm-Gg: ASbGncseh52pi3sbvjawrqE9ubQF5DkDiwh8oOl2sAMJEfB7RxJmH06cWucQtX3LOyQ
	yjosInytSjGn0AfkA2suKdgsCSkH92P4nMeTrxuBCEhARRRkW5bP0Mk7/KEz5XEr1Vvi66wR5We
	8vNdT3P9s8dRVPZd+VCRyzu/fb6G/dEHqa8EGJS6vvu65/jV+eUJ2hqnDjFPM/mtUFV3gX4fBph
	1hBE8aAT+FRSaKNqOc+tbFt53+FfDNPHs5YpvipNZL1UVxA4bjc9DFVpnMNlCPWMjhjkVKkruhL
	dZ52FRzIh3VAYn9fgHoUZ72QItmorhLsnljF6IewthQ5hdE0J8o=
X-Received: by 2002:a05:6a20:4327:b0:220:7b2e:5b3f with SMTP id adf61e73a8af0-220a16b18d4mr4802826637.19.1751028695839;
        Fri, 27 Jun 2025 05:51:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF26C8dtDNtXckzHuaNi47xMdSgfo4gkIZBa3WflpXjgfUX5aXrSLsxvdSTRWWbJGV3ZuUfmQ==
X-Received: by 2002:a05:6a20:4327:b0:220:7b2e:5b3f with SMTP id adf61e73a8af0-220a16b18d4mr4802762637.19.1751028695329;
        Fri, 27 Jun 2025 05:51:35 -0700 (PDT)
Received: from hu-kbajaj-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e3200874sm1570337a12.69.2025.06.27.05.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 05:51:35 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through secure calls
Date: Fri, 27 Jun 2025 18:21:31 +0530
Message-ID: <20250627125131.27606-1-komal.bajaj@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwNiBTYWx0ZWRfX8VLQaJva9tNw
 gkg/RvTqXTgFYvBxnoIeFPVKsAURgVGkaHFHDnsByKsffrYCQyPiwwFgmCcZjiiyIjjqSTNoR3/
 Sj5oVbx+fNpgMSPp5jy9J/hhqrkF/bBJ3bVPJEQnZrzlvr7N9AVHEAeZE1nhgU3bmSHDAQD7BMp
 yEd63H04rvcYj4OwAj3q4RYsxaQL25MEs+ovymUzmTMFAe/Ci6GpZZJZp4Ppe846AVw3sp8u6E9
 j7hDIp4s6mW83JY0lNccL/i+H47q1o0nXiXGjP8bTDvRg166d6cUiKr9hvwUCvNRPILFXjn1lpX
 xRLINVHpSGJWra49J5v+NsrW5f6rDBJuy8Y6ii3L/V3d4B45j3KsyDlp0e7EkRUdetZc4NIa75z
 M5giR3YjzvmgXO3wmiJHSM0W79zNB4WQAwbFjtACdUSTsoFhQHybIHZGz0rUp4b3oFgVV2X9
X-Proofpoint-ORIG-GUID: TdM3TGYX44HMCbCNVkWloE5FlqUr7JUA
X-Proofpoint-GUID: TdM3TGYX44HMCbCNVkWloE5FlqUr7JUA
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685e93d8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=RCjrDKQIKzBwdYVaOqUA:9 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1011 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270106

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
Changes in v2:
* Drop separate compatible to be added for secure eud
* Use secure call to access EUD mode manager register
* Link to v1: https://lore.kernel.org/all/20240807183205.803847-1-quic_molvera@quicinc.com/

 drivers/usb/misc/qcom_eud.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 83079c414b4f..30c999c49eb0 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -16,6 +16,8 @@
 #include <linux/sysfs.h>
 #include <linux/usb/role.h>
 
+#include <linux/firmware/qcom/qcom_scm.h>
+
 #define EUD_REG_INT1_EN_MASK	0x0024
 #define EUD_REG_INT_STATUS_1	0x0044
 #define EUD_REG_CTL_OUT_1	0x0074
@@ -34,7 +36,7 @@ struct eud_chip {
 	struct device			*dev;
 	struct usb_role_switch		*role_sw;
 	void __iomem			*base;
-	void __iomem			*mode_mgr;
+	phys_addr_t			mode_mgr;
 	unsigned int			int_status;
 	int				irq;
 	bool				enabled;
@@ -43,10 +45,14 @@ struct eud_chip {
 
 static int enable_eud(struct eud_chip *priv)
 {
+	int ret;
+
 	writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
 			priv->base + EUD_REG_INT1_EN_MASK);
-	writel(1, priv->mode_mgr + EUD_REG_EUD_EN2);
+	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
+	if (ret)
+		return ret;
 
 	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
 }
@@ -54,7 +60,7 @@ static int enable_eud(struct eud_chip *priv)
 static void disable_eud(struct eud_chip *priv)
 {
 	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
-	writel(0, priv->mode_mgr + EUD_REG_EUD_EN2);
+	qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 0);
 }
 
 static ssize_t enable_show(struct device *dev,
@@ -178,6 +184,7 @@ static void eud_role_switch_release(void *data)
 static int eud_probe(struct platform_device *pdev)
 {
 	struct eud_chip *chip;
+	struct resource *res;
 	int ret;
 
 	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
@@ -200,9 +207,10 @@ static int eud_probe(struct platform_device *pdev)
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
-- 
2.48.1



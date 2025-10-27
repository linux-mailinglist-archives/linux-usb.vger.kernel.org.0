Return-Path: <linux-usb+bounces-29683-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F73DC0C217
	for <lists+linux-usb@lfdr.de>; Mon, 27 Oct 2025 08:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 363DB3BD3D1
	for <lists+linux-usb@lfdr.de>; Mon, 27 Oct 2025 07:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1402DE718;
	Mon, 27 Oct 2025 07:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aXEOm9T6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133342DF131
	for <linux-usb@vger.kernel.org>; Mon, 27 Oct 2025 07:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761550083; cv=none; b=SnpvTbkyr3F/sWZt6Y8xc5xSbRlkTxYlGJC+XaQ/NJUjI0TGbnE1qR2lVBHdu9RrAgRrExETkKvCPJF9Dl3qZhbMgo/BNcTryChD3DfRVi2vrv5q3Vm5AybHgjSoKdeCYQ2HI23/Ca+NY0GbvaOpNR5WhvB0LmbCCM074tFyrHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761550083; c=relaxed/simple;
	bh=E4Je2rPViKLDFP+GJRJLkbrj7w2wfCy8afgxPyLEqSo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r8i3NWf3cXS45o4Ew7wyMU4zUtQk+IOL3Swy8dYZ2QXsArDIe9h1eEAym7IyMKKapkt5mti5sRx50+XLopdEC2V4zr4fxNiQX9DtlQbuc9MHcL/3VzFGEjv6TlQT2ElSZ7Tg9QHLOpxmRDnr174+115ji2OtyEyV468aY39JXq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aXEOm9T6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59QLQTcB900127
	for <linux-usb@vger.kernel.org>; Mon, 27 Oct 2025 07:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=i1gNHOGlPF7
	+NDlQ8YU12ofupiA74QfpuNeFA2SP8Ho=; b=aXEOm9T6K7JOHpamJRR1Ku4pdlg
	Im4D9qD3CwehbFuJFUWwSNvqRY47qrUt48dFbe1KxXYbON8aUb4ZJ9x7TsNeQV1J
	8NceBe9PYf8jJ4kFGcQZ1oC5kdKaTjHw4AOKQ3K4aiozZEcwwJiKA4xoeIOL9swO
	clJGJ0eKITdnB98J7Dhp7nDeusnNqeQBb1MRSkbre+74WkzeJJ1mbeUcf+Uns2D4
	8cgfTQ4iBVTorYTnQsBci3SHNUSX3EDzYgntmQdW6qfw0UFWoLlhcSaFNQN/cOMQ
	EYj7MnhDEN18wlP3hJCPvpS30ErW8bdOsXJc2ICqsXLAwh6Yk2gRMNlrcBQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0nkakqpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 27 Oct 2025 07:28:00 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6ce15aaa99so3167111a12.0
        for <linux-usb@vger.kernel.org>; Mon, 27 Oct 2025 00:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761550080; x=1762154880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i1gNHOGlPF7+NDlQ8YU12ofupiA74QfpuNeFA2SP8Ho=;
        b=bBk2/MnQ5dvHNaD3o4OTTb107eE694NoXya1801NjdK+yGzNuo9AqqJzvJ73+jcWfS
         k2GOdrxMVVcStkYP7LRHa3JV+RBZzh6V1p6nPgrXyBSUEfYAqx35TfH2E0TG/0mhLWj2
         HrEm0iB/XXBE8kqWwfJqvU+VuGSwoikRFQRuJ3Ptvblti4xQ27W7oK5+qamo1Cbw6o+Z
         BvhAGpO4tGtGDV7pBmavnrPWV0MZ+02sqQdlBgdIOWHRVndIFat5Cc4kp5pgrHxifEJ8
         ZwZeWNv/+AxABSQBqT6FuFBUqnJYCuPzL9xRIJPYk3wVMxEGdqmDY348g4f+JAGKy0Lo
         K5mQ==
X-Gm-Message-State: AOJu0YwpuBMZqbEmqWs05AbSmM9WvqxJ47kcd+SEfza8joh53qlQUe91
	cFrBne6wNLQuz3q7feZNbvPrwukndyC0vDLbFgFb5fluUnPESZJnM2sXVy0RSxJ2R8kslsVbxCx
	vAEQwHldY5MYdxELcfdFS3GCEMvysOR46iSWXU50IrRSyUL+nh8TM9ifQFCnmpBg=
X-Gm-Gg: ASbGncsWeFKPE0v9F0OXJ5MrUC0rwSHlEBu36VZ0CvGsgNNfPGCm1dHH+0zTJimu7+V
	I1gWsBvDdwuB+2MjJc9MetQDkO3deBeCKNiNQHFTRUm2G83g/yZftcPfcDoYMLo2c0vaHJ7NvuY
	8vl4MnvtZQ6+pTQI+2kcimFgqybfbQRwggWH2pRMWhlROShiA4Pk4BdYXO/yb977ZxMRCIiHhIn
	SOLacm+tYM2lYVRNYSKLs3xrojlmzopEQuKdMYmGbt1zMWtQnkN0thFWfzQQCwO1vhLXdmzAonP
	8fxO91cmWdoPgQ8FKFsfuqoeiIfyU0lVW9EoCYvnDyFO0sYTAESrDHHbAmrkh9Y9f8xmH8bikNF
	FHKTQBMwg5aft6msccmEtal3vRiJtH25Y9izs
X-Received: by 2002:a17:903:b48:b0:290:29ba:340f with SMTP id d9443c01a7336-290cb17c05fmr458121515ad.42.1761550079834;
        Mon, 27 Oct 2025 00:27:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO2bHBpzl/TELOhb9izc16IAllt2WXipWLIt7QEoIl6UWefgCqunkcnTKWKnKsOYg5kuqFSg==
X-Received: by 2002:a17:903:b48:b0:290:29ba:340f with SMTP id d9443c01a7336-290cb17c05fmr458121195ad.42.1761550079287;
        Mon, 27 Oct 2025 00:27:59 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e45a4csm70710965ad.108.2025.10.27.00.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 00:27:59 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v5 2/2] usb: typec: hd3ss3220: Enable VBUS based on ID pin state
Date: Mon, 27 Oct 2025 12:57:41 +0530
Message-Id: <20251027072741.1050177-3-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027072741.1050177-1-krishna.kurapati@oss.qualcomm.com>
References: <20251027072741.1050177-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AYW83nXG c=1 sm=1 tr=0 ts=68ff1f00 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=3eHL1KmHa9FwJ4YL2wMA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 5eT9SeDlsr-x3B-HQ8zkqjJfLVGcr-Jv
X-Proofpoint-GUID: 5eT9SeDlsr-x3B-HQ8zkqjJfLVGcr-Jv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA2OCBTYWx0ZWRfXzs/BURNBSFYT
 m87H4O9jvgOLMvAed7c5DsyF2F0/gaiYt17QccWbfUtfooBMgYMUI+hKEVstSY5gek2zY4ic7DA
 qTd9tCx6fRDbq/i0NGbqCLgD19afPiXanFNx0UT2Gn6ijVhccT0Rx96DPvFNKe1M+egqslF8q+0
 qVsbjhUWhq9c16YkJkXcv9gDqgOR9SNj9jyOscgCU/jDIb864AMwDep/mx6GokppkaTx446w/v8
 6sLpSdOk0EheLBDYsNgzWLe9p2otIsnJsptXcJ7v8uJYkr0QkwNmQjapnswcW+dK3HPkuTJPxpU
 hzD56yrU/Vcu5dcdTk9xHoWsPRfkiQumZZCWE/1sWaIuJCcfZVbQPtQVuU8WpPmjRqsOkSrj12u
 BNU8AYBmEmaV/LA0OLmzfMR4Bjc/jg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270068

There is a ID pin present on HD3SS3220 controller that can be routed
to SoC. As per the datasheet:

"Upon detecting a UFP device, HD3SS3220 will keep ID pin high if VBUS is
not at VSafe0V. Once VBUS is at VSafe0V, the HD3SS3220 will assert ID pin
low. This is done to enforce Type-C requirement that VBUS must be at
VSafe0V before re-enabling VBUS"

Add support to read the ID pin state and enable VBUS accordingly.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/typec/hd3ss3220.c | 74 +++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index 3ecc688dda82..8614c71d7ae5 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -15,6 +15,9 @@
 #include <linux/usb/typec.h>
 #include <linux/delay.h>
 #include <linux/workqueue.h>
+#include <linux/gpio/consumer.h>
+#include <linux/regulator/consumer.h>
+#include <linux/of_graph.h>
 
 #define HD3SS3220_REG_CN_STAT		0x08
 #define HD3SS3220_REG_CN_STAT_CTRL	0x09
@@ -54,6 +57,11 @@ struct hd3ss3220 {
 	struct delayed_work output_poll_work;
 	enum usb_role role_state;
 	bool poll;
+
+	struct gpio_desc *id_gpiod;
+	int id_irq;
+
+	struct regulator *vbus;
 };
 
 static int hd3ss3220_set_power_opmode(struct hd3ss3220 *hd3ss3220, int power_opmode)
@@ -319,6 +327,48 @@ static const struct regmap_config config = {
 	.max_register = 0x0A,
 };
 
+static irqreturn_t hd3ss3220_id_isr(int irq, void *dev_id)
+{
+	struct hd3ss3220 *hd3ss3220 = dev_id;
+	int ret;
+	int id;
+
+	if (!hd3ss3220->vbus)
+		return IRQ_HANDLED;
+
+	id = hd3ss3220->id_gpiod ? gpiod_get_value_cansleep(hd3ss3220->id_gpiod) : 1;
+
+	if (!id) {
+		ret = regulator_enable(hd3ss3220->vbus);
+		if (ret)
+			dev_err(hd3ss3220->dev, "enable vbus regulator failed\n");
+	} else {
+		regulator_disable(hd3ss3220->vbus);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int hd3ss3220_get_vbus_supply(struct hd3ss3220 *hd3ss3220)
+{
+	struct device_node *hd3ss3220_node = hd3ss3220->dev->of_node;
+	struct device_node *np;
+
+	np = of_graph_get_remote_node(hd3ss3220_node, 0, 0);
+	if (!np) {
+		dev_err(hd3ss3220->dev, "failed to get device node");
+		return -ENODEV;
+	}
+
+	hd3ss3220->vbus = of_regulator_get_optional(hd3ss3220->dev, np, "vbus");
+	if (IS_ERR(hd3ss3220->vbus))
+		hd3ss3220->vbus = NULL;
+
+	of_node_put(np);
+
+	return 0;
+}
+
 static int hd3ss3220_probe(struct i2c_client *client)
 {
 	struct typec_capability typec_cap = { };
@@ -354,6 +404,30 @@ static int hd3ss3220_probe(struct i2c_client *client)
 		hd3ss3220->role_sw = usb_role_switch_get(hd3ss3220->dev);
 	}
 
+	hd3ss3220->id_gpiod = devm_gpiod_get_optional(hd3ss3220->dev, "id", GPIOD_IN);
+	if (IS_ERR(hd3ss3220->id_gpiod))
+		return PTR_ERR(hd3ss3220->id_gpiod);
+
+	if (hd3ss3220->id_gpiod) {
+		hd3ss3220->id_irq = gpiod_to_irq(hd3ss3220->id_gpiod);
+		if (hd3ss3220->id_irq < 0)
+			return dev_err_probe(hd3ss3220->dev,
+					     hd3ss3220->id_irq, "failed to get ID gpio\n");
+
+		ret = devm_request_threaded_irq(hd3ss3220->dev,
+						hd3ss3220->id_irq, NULL,
+						hd3ss3220_id_isr,
+						IRQF_TRIGGER_RISING |
+						IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+						dev_name(hd3ss3220->dev), hd3ss3220);
+		if (ret < 0)
+			return dev_err_probe(hd3ss3220->dev, ret, "failed to get ID irq\n");
+	}
+
+	ret = hd3ss3220_get_vbus_supply(hd3ss3220);
+	if (ret)
+		return dev_err_probe(hd3ss3220->dev, ret, "failed to get vbus\n");
+
 	if (IS_ERR(hd3ss3220->role_sw)) {
 		ret = PTR_ERR(hd3ss3220->role_sw);
 		goto err_put_fwnode;
-- 
2.34.1



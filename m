Return-Path: <linux-usb+bounces-29648-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4C2C09051
	for <lists+linux-usb@lfdr.de>; Sat, 25 Oct 2025 14:30:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3444A3AA87D
	for <lists+linux-usb@lfdr.de>; Sat, 25 Oct 2025 12:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974942FC00B;
	Sat, 25 Oct 2025 12:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eg8zh72s"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFEE2FBE03
	for <linux-usb@vger.kernel.org>; Sat, 25 Oct 2025 12:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761395360; cv=none; b=jrF6kQXRduAgCjxL6xSoRPOxyP+XHl9sX3cjnA7odYseYUoMF4CeugT3VunVZ0B37fdqDqY3q6Nuqi9p/CDlg1cuAZaipF3FXdTl5lfcSKEfX7YSU0rftMGG4LES3gz7pR/gXht/j70PAMHcAQFGzpqxIxFRRHdcJ+qkLmo6iOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761395360; c=relaxed/simple;
	bh=3oKD9asDeu7dq9BdQ/6zM3oxTs7BSpgeYTy2Ty1s0fo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tLZnt4dw/xVXWe+vYKCwuDR6kUO4r7fHeeW6Wh7RNTDjBO8KCKjANkmugMrpwqLa2k8Bpc7qwhLF8oxbeqApwzAFRTAcAfD1OEGZ64p+7lmO6B+TgsqeWnWBfgYEjizuSpPC6tB4rZuSWs+3+wBb4tKy9spe/+0iXpUUY490+dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eg8zh72s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59P3YZ8X140666
	for <linux-usb@vger.kernel.org>; Sat, 25 Oct 2025 12:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=a/p/A1eGBzF
	kzx4/F5s4V+NhINxV6WPbC6T+eR2JzaU=; b=eg8zh72sXGTQKFBfQtHW9UHHAqj
	mfvDhxPG7sHAMEnI2ovhywB9HcCj3bc9B1ycUm9ETbY6+DAuiu2H7I+cti/H44W0
	W6N6lEjmuUaS4AvQ1FFzYsLfff7Jx5aHDkoMJM31wj9GMZGflN/eK+MD/NLfVCkw
	zgxrz0v+PT0vcfXYqYzNb5OxpTHmE4IK3rDlHldHCYT85O3vJoYi3BoXRb4DAMss
	BQiEBTy5G7tD1a2yHOp7RCrUPQXTx0ty7RmGrhZUlp4caaJP9s+wtBNlU7Ze+4Nx
	3ISt3O+h/hWHdGguVQUAKPhJfWNjWAmeTihptN9phjGxUbYqy2f8BnBM4gw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0ps10jf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 25 Oct 2025 12:29:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2698b5fbe5bso40914285ad.0
        for <linux-usb@vger.kernel.org>; Sat, 25 Oct 2025 05:29:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761395357; x=1762000157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/p/A1eGBzFkzx4/F5s4V+NhINxV6WPbC6T+eR2JzaU=;
        b=U6AXxIJdtXMC/rcJKAI7upBv00zjfmN0FbwYCrh97AMjWB3bSvY5wcCuVk1HZcOEc/
         mBT+sLW6s8cUd8DOzXbn84nykh+2R3UYLuAOkbSvRdr/KS5dXBj9z4voy6yUnjO7Mz0v
         j9rAjx6viVtNUkcAAcEBHcXA9NxCbzXxZIYFMWMQ8iX+5KPWtTCeNszsUY8nwjq2fIlf
         phZvUeU1lbvoKgwVJpJ5GA/dE7QM3mytQmNHTLXZT+BEA9aZpZHt4WYokJ+ED0zEJu5s
         j9sgzJ0WqDIF1oJ0/PSVmg69xulfz4eoELRCpWMs106JeCk9ivInQQxpKfT0F1wHO/Ox
         ahHw==
X-Gm-Message-State: AOJu0YyTs4ZAHB8Xglp/uRSpkjQxAsyIz/9h5UnPLJjPmwLj8u+FsRRp
	aEvsUo6zOFysg/COE1PUUy2UVANiqVpodhpFswt8hwAiervUoh8Ag41W4OxbuMbBPq3SNpcpu40
	w4PIMupdXutVOXQQwxg2V1nTnf9licEgjzrbvWUvldTBYYRbM9YGJ5AT2TQgwm+I=
X-Gm-Gg: ASbGncsyf1KiDwjgm8ehMla8OJfU9Nn0favqc1Vj+E62EAGJ10vnoHYg2P6/gIfOyLK
	nN+I4VEghLto4R01b5sz8HxGuKij2hy10TByjVtzTe9d4043RZFoNuMjYDBhvlHs0KLddDDTLL8
	u2Pq+DLcPMrJpWYVrVvsQXeceeETZM/GL546rd2E3qDWnqSQ3bmNAgCRJCq835xmaW8qxiErGo9
	70YbOBFSszPRtZI2DHUAM6JcmnIMHab4h98T3AwRI6nc6rDXM8F3x1GrDb+v2gM4BLxodgZYKBZ
	hT+r2ukFDBsXb9846jtE/UBsqcv5U5jGLOfnmfm5YNUlH6d8NKtGI+wnthS7KLDPxk/jEL3lW9+
	zimEicQvPNRxfqVxOBWC1CS5jwYe4UXmoS0+U
X-Received: by 2002:a17:903:1a4c:b0:24c:c8e7:60b5 with SMTP id d9443c01a7336-290c9cb6243mr167541965ad.16.1761395357400;
        Sat, 25 Oct 2025 05:29:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4owedQc9Nh9sSLnEvDQXTX/A45HjRThim/34DYcbRkjJsoKGERXS0kQwcEv6sbfD8wRTZuw==
X-Received: by 2002:a17:903:1a4c:b0:24c:c8e7:60b5 with SMTP id d9443c01a7336-290c9cb6243mr167541705ad.16.1761395356936;
        Sat, 25 Oct 2025 05:29:16 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d2317csm22381325ad.48.2025.10.25.05.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 05:29:16 -0700 (PDT)
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
Subject: [PATCH v4 2/2] usb: typec: hd3ss3220: Enable VBUS based on ID pin state
Date: Sat, 25 Oct 2025 17:58:54 +0530
Message-Id: <20251025122854.1163275-3-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251025122854.1163275-1-krishna.kurapati@oss.qualcomm.com>
References: <20251025122854.1163275-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ju78bc4C c=1 sm=1 tr=0 ts=68fcc29e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=3eHL1KmHa9FwJ4YL2wMA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: l3gmqYjfr_tt-WzkqOUdq6iEv3fHR3r6
X-Proofpoint-GUID: l3gmqYjfr_tt-WzkqOUdq6iEv3fHR3r6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI1MDExMyBTYWx0ZWRfX5OQGvPa8x0ZL
 sMlkGr4ci7pKtx14u6F48UERgfcR4i6E4um0OCKWucvOyJfMHa5kWgA/DVkqclG+1WcfCeNh3F3
 PFPcOttxq6fAt6LwYVgE9F6G3pwayGcjqy6Wilwb2XmwKp1thUc8grkxORqlK/IGOSeFmqYfzDO
 ich9NSmL8M+iMor4jg0aWnww51NBi8V6x4cFoE6zvIdrYdDDVegNJhFGsCNl0wc7D1hSU8x011z
 6oNRjaktllheMj8khAo0yDf248bPnzd4+3UbLRFTTFEmSXL4NJpz7TragWpr67YpvQdF2De0mlL
 /5ioNAn1tWCQq9I+vk9RIT0msY396x37cOc2mBilkoK1vA+NRx4yuipnCeWllkelsj33OtlX4nO
 2uAZVZcXH4V29pGThsejDAc+E1j1qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-25_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510250113

There is a ID pin present on HD3SS3220 controller that can be routed
to SoC. As per the datasheet:

"Upon detecting a UFP device, HD3SS3220 will keep ID pin high if VBUS is
not at VSafe0V. Once VBUS is at VSafe0V, the HD3SS3220 will assert ID pin
low. This is done to enforce Type-C requirement that VBUS must be at
VSafe0V before re-enabling VBUS"

Add support to read the ID pin state and enable VBUS accordingly.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/typec/hd3ss3220.c | 79 +++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index 3ecc688dda82..970c0ca8f8d4 100644
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
@@ -319,6 +327,49 @@ static const struct regmap_config config = {
 	.max_register = 0x0A,
 };
 
+static irqreturn_t hd3ss3220_id_isr(int irq, void *dev_id)
+{
+	struct hd3ss3220 *hd3ss3220 = dev_id;
+	int ret;
+	int id;
+
+	if (IS_ERR_OR_NULL(hd3ss3220->vbus))
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
+	int ret = 0;
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
+	return ret;
+}
+
 static int hd3ss3220_probe(struct i2c_client *client)
 {
 	struct typec_capability typec_cap = { };
@@ -354,6 +405,34 @@ static int hd3ss3220_probe(struct i2c_client *client)
 		hd3ss3220->role_sw = usb_role_switch_get(hd3ss3220->dev);
 	}
 
+	hd3ss3220->id_gpiod = devm_gpiod_get_optional(hd3ss3220->dev, "id", GPIOD_IN);
+	if (IS_ERR(hd3ss3220->id_gpiod))
+		return PTR_ERR(hd3ss3220->id_gpiod);
+
+	if (hd3ss3220->id_gpiod) {
+		hd3ss3220->id_irq = gpiod_to_irq(hd3ss3220->id_gpiod);
+		if (hd3ss3220->id_irq < 0) {
+			dev_err(hd3ss3220->dev, "failed to get ID IRQ\n");
+			return hd3ss3220->id_irq;
+		}
+
+		ret = devm_request_threaded_irq(hd3ss3220->dev,
+						hd3ss3220->id_irq, NULL,
+						hd3ss3220_id_isr,
+						IRQF_TRIGGER_RISING |
+						IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+						dev_name(hd3ss3220->dev), hd3ss3220);
+		if (ret < 0) {
+			dev_err(hd3ss3220->dev, "failed to get id irq\n");
+			return ret;
+		}
+	}
+
+	ret = hd3ss3220_get_vbus_supply(hd3ss3220);
+	if (ret)
+		return dev_err_probe(hd3ss3220->dev,
+				     PTR_ERR(hd3ss3220->vbus), "failed to get vbus\n");
+
 	if (IS_ERR(hd3ss3220->role_sw)) {
 		ret = PTR_ERR(hd3ss3220->role_sw);
 		goto err_put_fwnode;
-- 
2.34.1



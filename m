Return-Path: <linux-usb+bounces-30384-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C07C4C165
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 08:21:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 282D734F6CA
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 07:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 428AD34888C;
	Tue, 11 Nov 2025 07:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LYo+k4Y1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AJzRU6OB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F29343D95
	for <linux-usb@vger.kernel.org>; Tue, 11 Nov 2025 07:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762845647; cv=none; b=Lgs2IA6Tb3STGogSPODk7vAVNMtvu13noyfLsqtxKWOCBzV11jVTaPwAjBHxiUPn7HHTH65EikosBB19dmpmuBPMen0Su04WPoqLoWgOnFPZFkONTo0mxq5OG7ii1XpLIo+NxZLN6pvaenLX9slD+V3KzCSexidnuBHH8f61RB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762845647; c=relaxed/simple;
	bh=33eSTx9s687i+R/31PHmHqpxSEXCtm42TjcIqH6hs5I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QcyZPYD5nPTParg/LtKLtht6XtNQtby/PRSnoMRUBn6cW7k3pqWxWvQbKtP/6Yh+2WU44hwu8XenFkypO7cm+ZC4QelqhlLZAxCDVGNI1ChRXMWq4m76fb10v8Oz2eGVcTftFNxZzsj3D1/QmXzpUxGVuV7jzbicBYxYjLfCWY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LYo+k4Y1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AJzRU6OB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AB4sbPU1326844
	for <linux-usb@vger.kernel.org>; Tue, 11 Nov 2025 07:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HDhE10Qg4cu
	RKBdz41UIDRkfnA5iYlOO05SwyDWiYGA=; b=LYo+k4Y143jkhaXUQAHEpDRn5z9
	bdBVV5Xy0SYKnyoXqsbEbt1wQfryHitQ5qBUgikrZjVX2skHdJVWyfse2k4akSVE
	uxyFdfaYwT9l2BqCOdFw87D6TVTqNxhHbbNqFi2qPf/5S1sNr3Nxnf543Gyw5ZnT
	XyfBtqrfFjnUvHezP/5GkOClTPJC67NIMgH7S0M0OpewyWd8PNWDiPPRXrsas4qm
	OIXn9VEwE7FHVyu4cZshiEJJ6fA8J0jU+775Hb/358ay/a2/GHYH6L5x3EIug633
	HNbaOM32YR+b+m4bb2pB1fGyRogGQjlQaX5cNdPONny6vGWwv+gv91CrEBg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abxhhgcuq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 11 Nov 2025 07:20:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3436e9e3569so6709984a91.2
        for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 23:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762845644; x=1763450444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDhE10Qg4cuRKBdz41UIDRkfnA5iYlOO05SwyDWiYGA=;
        b=AJzRU6OB7Fj7YhVdydJF3HB9o5DWwra1yJfseZY+flNehf6pSOH1oDxc31YCpHdhhx
         IMEtbkktMQJMNJ7LE1dsvKOAhe+Qa6EajN7kIhno/dAdXJb12kS9lDEydn/IWCCOCweE
         3QkvtHhtEkDbmIGWGHqu37rxnj58fzgOiaj6iCbHG7yargri2kb6vpwCYlM5n0SlvoU5
         E5BInh+bHtuLj5ub1u3Jmou/3xaUCVqsE/BIOrqSESzyqD+pXt131kfbhZDNIpHM8TnZ
         M23mscCCk1KsVV87XTAQD8eL1ShU5+3cBCFig6xA28LZZkWWX+4cjrGUytJo4A9b2BRf
         MfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762845644; x=1763450444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HDhE10Qg4cuRKBdz41UIDRkfnA5iYlOO05SwyDWiYGA=;
        b=EZ5B2nTS+vAP/mrA5DOlSruIfOGGpO0Nqu7vgYqG04Fvp6RlBZ4ebNvQa34VrZvkaE
         Oj9+L4kvyuzQucbIZiD5ACOiYH6bkz48N7Ne/Wxr7g9s8zrldF4pBkK2pp7cAapKs2Bz
         0yRoy2B/umku7JpvPWkcWfW/R4WciHjrjnqQZBBhrSvvc517FVqNNpA89HrxKb5PK7u1
         mh1ljiREaEV7tBzkVUQ0kpKZwwaKJcHy755M0ZPejurAPyNdfXuJ84nWs8UIsE3OnZJI
         wFwWh12+xGqdnGeUAiekGvsTj63gHN2c7f3RL3XJNL+X5yl6L64Ia2cLFT+n7qD9nyKx
         OxuA==
X-Gm-Message-State: AOJu0YyuQiPXbnRfsIkqYbQ4/kU6HTK2eoO677cWVO9fpjKyKTwyW9NZ
	xy68hZi3HryRs7d9ubuZqRtcfAu0+i0iE8Kq0Dkq5qzsvaaWFPxAZzRUyTBI+iAGWGLLS8j54U4
	YCDkDaQq883ztxuYUNu5i44pSJcDvOAHRqPbImAIf/LvX1Dlf8D5xjVBy21/C+ac=
X-Gm-Gg: ASbGncvwiqt/rLvgeH8fWlTkNijhRg+dzMruCk26YJsTl+tOzJDmkpB4D+NWdIlAGWh
	XbIboi8xoDSTFtTTC2jINZee/EsTrfxj3omryIv/lY2n+YXSAbMB9lf9f3IwYrcrMYH5dlsS3qu
	bGXpVhRYD19929AU1nV8LLevULL35JqMS6uSZC9dg78+qbpPPquPyKv7ZMgOFcAujCeBYPmaewC
	/JehPK48LxUt9mwmKucPt4YiFgT6geMK9PfvgueB0JX9aHS/iCELVDtDDkAL/3Qs4eV3rsQJ+D4
	uLyC7HohMxODbwek4y+hfonG47Igt1M1NIawxyaIghzj2CQ6cdm1b7W9zi301gfm9LcExboamGk
	dzZj8NQl59ElXi6SXxG12M4sIgqBtOyiJk9OI
X-Received: by 2002:a17:90b:3811:b0:341:b5a2:3e7b with SMTP id 98e67ed59e1d1-3436cb7dd8bmr14579622a91.4.1762845643917;
        Mon, 10 Nov 2025 23:20:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfTAn5ML62xtoUcmtUSozXX5ZTbUXWpWJAFvpzbHis7mS8ieTf5W5ysF8Vp15hlnqjpN9YTA==
X-Received: by 2002:a17:90b:3811:b0:341:b5a2:3e7b with SMTP id 98e67ed59e1d1-3436cb7dd8bmr14579587a91.4.1762845643395;
        Mon, 10 Nov 2025 23:20:43 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68c822dsm20035604a91.8.2025.11.10.23.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 23:20:42 -0800 (PST)
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
Subject: [PATCH v7 2/2] usb: typec: hd3ss3220: Enable VBUS based on ID pin state
Date: Tue, 11 Nov 2025 12:50:25 +0530
Message-Id: <20251111072025.2199142-3-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251111072025.2199142-1-krishna.kurapati@oss.qualcomm.com>
References: <20251111072025.2199142-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Pc3yRyhd c=1 sm=1 tr=0 ts=6912e3cc cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3eHL1KmHa9FwJ4YL2wMA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: MvOtK1r7xwCjhz-XbEXXviYChSvg613x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA1NiBTYWx0ZWRfX+0SevwuseH4v
 vVB6zgq5WRA3OM+MSDIGr7oAsAqjOUOrXjz2ta9jDC9fvf5xhH/ARcbmBVqIEN2pe+x4lzWzkyl
 5xBIHWB1GmoQb/77OFqJoKtfyuSjQwOTkb3u3I5es9nxyVX4WHd8ECSQ/eeWdhxho6wHnuuok5V
 uC8yCkI/bWqNxEdhDHnxrOjzM3Smx+woA84YT1D9woc+P6LSmo54ujntN/DMzXTMAPsQEwsdb3p
 jOA/ZLaZB5fkj6Xfk3QVHVbDdxmOjNZLWd3ya5ZU3HznBuqo476EidKFCpMDknP+lpSXg8oSIGZ
 8xcjpVFK4ul/pw6ZE74W79cGULs/JNwSU+iveKGB1OMyRonJqcJeRTuiJyxSwBtnUb+yVHluF71
 MbZvnRvQqsUMxurZGAJFBpgXo8QIfQ==
X-Proofpoint-GUID: MvOtK1r7xwCjhz-XbEXXviYChSvg613x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_01,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110056

There is a ID pin present on HD3SS3220 controller that can be routed
to SoC. As per the datasheet:

"Upon detecting a UFP device, HD3SS3220 will keep ID pin high if VBUS is
not at VSafe0V. Once VBUS is at VSafe0V, the HD3SS3220 will assert ID pin
low. This is done to enforce Type-C requirement that VBUS must be at
VSafe0V before re-enabling VBUS"

Add support to read the ID pin state and enable VBUS accordingly.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/typec/hd3ss3220.c | 75 ++++++++++++++++++++++++++++++++++-
 1 file changed, 73 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index 3ecc688dda82..3876f4faead6 100644
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
@@ -319,13 +327,33 @@ static const struct regmap_config config = {
 	.max_register = 0x0A,
 };
 
+static irqreturn_t hd3ss3220_id_isr(int irq, void *dev_id)
+{
+	struct hd3ss3220 *hd3ss3220 = dev_id;
+	int ret;
+	int id;
+
+	id = gpiod_get_value_cansleep(hd3ss3220->id_gpiod);
+	if (!id)
+		ret = regulator_enable(hd3ss3220->vbus);
+	else
+		ret = regulator_disable(hd3ss3220->vbus);
+
+	if (ret)
+		dev_err(hd3ss3220->dev,
+			"vbus regulator %s failed: %d\n", id ? "disable" : "enable", ret);
+
+	return IRQ_HANDLED;
+}
+
 static int hd3ss3220_probe(struct i2c_client *client)
 {
 	struct typec_capability typec_cap = { };
-	struct hd3ss3220 *hd3ss3220;
 	struct fwnode_handle *connector, *ep;
-	int ret;
+	struct hd3ss3220 *hd3ss3220;
+	struct regulator *vbus;
 	unsigned int data;
+	int ret;
 
 	hd3ss3220 = devm_kzalloc(&client->dev, sizeof(struct hd3ss3220),
 				 GFP_KERNEL);
@@ -359,6 +387,49 @@ static int hd3ss3220_probe(struct i2c_client *client)
 		goto err_put_fwnode;
 	}
 
+	vbus = devm_of_regulator_get_optional(hd3ss3220->dev,
+					      to_of_node(connector),
+					      "vbus");
+	if (IS_ERR(vbus) && vbus != ERR_PTR(-ENODEV)) {
+		ret = PTR_ERR(vbus);
+		dev_err(hd3ss3220->dev, "failed to get vbus: %d", ret);
+		goto err_put_fwnode;
+	}
+
+	hd3ss3220->vbus = (vbus == ERR_PTR(-ENODEV) ? NULL : vbus);
+
+	if (hd3ss3220->vbus) {
+		hd3ss3220->id_gpiod = devm_gpiod_get_optional(hd3ss3220->dev,
+							      "id",
+							      GPIOD_IN);
+		if (IS_ERR(hd3ss3220->id_gpiod)) {
+			ret = PTR_ERR(hd3ss3220->id_gpiod);
+			goto err_put_fwnode;
+		}
+	}
+
+	if (hd3ss3220->id_gpiod) {
+		hd3ss3220->id_irq = gpiod_to_irq(hd3ss3220->id_gpiod);
+		if (hd3ss3220->id_irq < 0) {
+			ret = hd3ss3220->id_irq;
+			dev_err(hd3ss3220->dev,
+				"failed to get ID gpio: %d\n",
+				hd3ss3220->id_irq);
+			goto err_put_fwnode;
+		}
+
+		ret = devm_request_threaded_irq(hd3ss3220->dev,
+						hd3ss3220->id_irq, NULL,
+						hd3ss3220_id_isr,
+						IRQF_TRIGGER_RISING |
+						IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+						dev_name(hd3ss3220->dev), hd3ss3220);
+		if (ret < 0) {
+			dev_err(hd3ss3220->dev, "failed to get ID irq: %d\n", ret);
+			goto err_put_fwnode;
+		}
+	}
+
 	typec_cap.prefer_role = TYPEC_NO_PREFERRED_ROLE;
 	typec_cap.driver_data = hd3ss3220;
 	typec_cap.type = TYPEC_PORT_DRP;
-- 
2.34.1



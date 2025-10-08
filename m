Return-Path: <linux-usb+bounces-29047-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B4113BC639E
	for <lists+linux-usb@lfdr.de>; Wed, 08 Oct 2025 19:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B65E24EACA2
	for <lists+linux-usb@lfdr.de>; Wed,  8 Oct 2025 17:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F30F42C0F96;
	Wed,  8 Oct 2025 17:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PX9lRh/P"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2512C0294
	for <linux-usb@vger.kernel.org>; Wed,  8 Oct 2025 17:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759946300; cv=none; b=ffTaFb9wn+G+6sXlIpe8M2vcIjcAnc4tWrN8Fc2h1wHNIkF0IQA8WsLqlnHUJ1PkYrSrUwP1x6eKrUEgu0iAgMu1/Cfv+Rq3nUg8TZe3KjZRmjIwKlu1Dr6LfDM6Nm4ZRSGpDGLq+9zQylHJuFOXbsHwMNX5p0vGjUKnzua2NIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759946300; c=relaxed/simple;
	bh=HLIAZSi34247RaLpZred5z6QQNJ8JD4vy4SJe5suOTw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aLVsSIM8PWiDznd14jTve+owzKHcWFqHI05zNPZ7hcmAm9mbwdd43ssV4LKLJWtuN5mqqk5u6JIchacSREMhuc4AKp5aCZtOMzr4mCiNHu1GDcosXRiA1lhUvKe6IHBsZQQYVIZrFfWgdcGwD4vEI42GG3SXbaosB0WbDymio8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PX9lRh/P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598HBBMl012670
	for <linux-usb@vger.kernel.org>; Wed, 8 Oct 2025 17:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=81UhKZbZqiQ
	3FBxbCNxzpKfrvsglVuqKJ2pg4yT9dwQ=; b=PX9lRh/Px7lUxAdDETHz3kchLSR
	rnjSicCjJfTVe0rmfTBQO3qIBDNw9WWfAQiwbwSw/VVQMG1UqtD8M6bfkfVsvfkW
	OdK2X6/xhkZK8ZVaeoCLdrcig/NbVERVYZuoCmPZwx4m0niHwjg/9vq9GTB/igpf
	0ek142jDbDvo4skFpwHcevNiDlS1Q3cczK7Xr7VpVKPU2nR8dS7Xdq7iwjpsu0pV
	uk03QFGi4o3dFXEqneTiM6NvOu6uF08AfcP/qQAtBX05k+fKi0x/yFFDFFPTZeLH
	hbPBuZe2wCt0/FVQgUops9H2vlP8FEDt5sJsVchViuioUHc27mGAQbrPikw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4sg525-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 08 Oct 2025 17:58:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32eae48beaaso391157a91.0
        for <linux-usb@vger.kernel.org>; Wed, 08 Oct 2025 10:58:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759946296; x=1760551096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81UhKZbZqiQ3FBxbCNxzpKfrvsglVuqKJ2pg4yT9dwQ=;
        b=UiPwFf3zOXqgWvAqY+NZMaLd6zfvf7N39vaFEYjDWQ6WaXqFqutn3Bm0WLnnYThqma
         IFDUBXNpR6twnPUfSrl48M7WkEIQ5rjDP1oehWuj1tmdMkoyjvRQdtLqquKH1Qlgz/LX
         73/CoNvy5dBpsYrstoJQPfP+oewQkF+s/9hdInawC2notRX1LkCRm3VYHSSWxkwovl3W
         am766sehZnPK3VImaGKYrEpFGYa7GHA2NXjr6VZ3DASNkvHFC1OgXbIQCMccMZ2bEYXK
         BoLn/7+bJq7JSC1ii7mq18xC/SMVxDVQ2358d4Y9T1lbVAdkmS9tZLkV6VHSh9qXmEAt
         75aw==
X-Gm-Message-State: AOJu0YxJ7DAp8FXa9ZuKNnLnXVdynlcSJTyN4p0utFOU2s4J6WIHx5l3
	XiwUE+hzM6uT4Q7xVBDkaNiAh6ptUNOn21X2lnT6AAt3FH8PRY4Y+AfWK3oi4t5FD7xyYFD/pbp
	K1Dy5EDtGEYVJ3kwBZMLl4pACDX/Mr4R2pSdSarAXcSeLlPCaRXFDXJdJt2QCkno=
X-Gm-Gg: ASbGnctcNtnkSPMsJXaRg05y5WLjZcePu/rEXUSxwkYDmEbtQl25ZaoKCUC1jz4zzVf
	fSevxj0PO5Dl1uHiDjAVayzbYuEOa0LmoWUeQLN/eGrj5P0vGp8USzVNGqvQ9MnpzY6yG72hYXC
	XvXjxJ25HnOab4qvLOqQLSyYeIOjpV9k8ihgoyQ2dcIdcbCDwonXyJjb7JT7xc80gDqt3LV/Nag
	deiqA077mQ8HVHBX3vT+gbo+OqmdVci79W1Ir6F9MjJu8ezpCBQbV/f/t8iWbdfJ5XPSh08MM2p
	meZFe/zj9dVigPqDGEp3b29UCwa5FvfGlzkHqXFpn5SUSboToOJD32FL3tTawOEui8yw6Jdr/2J
	l0xOcra0=
X-Received: by 2002:a17:90b:1b04:b0:32b:6145:fa63 with SMTP id 98e67ed59e1d1-33b5114d48fmr5471935a91.4.1759946295970;
        Wed, 08 Oct 2025 10:58:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGY4sUxC2tkm7oYuuyKz8ydAmypwi3ie0On6gCk1oXghiSu6JmLInMP6vDCt0OA/hoeAYbvzg==
X-Received: by 2002:a17:90b:1b04:b0:32b:6145:fa63 with SMTP id 98e67ed59e1d1-33b5114d48fmr5471911a91.4.1759946295416;
        Wed, 08 Oct 2025 10:58:15 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b529f51b5sm1275726a91.7.2025.10.08.10.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 10:58:15 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 2/2] usb: typec: hd3ss3220: Enable VBUS based on ID pin state
Date: Wed,  8 Oct 2025 23:27:50 +0530
Message-Id: <20251008175750.1770454-3-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008175750.1770454-1-krishna.kurapati@oss.qualcomm.com>
References: <20251008175750.1770454-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: N5Jv42azu2pej-K6AWO6B-LqDQW5M-8u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX30KxN47YW+ez
 CD0Ap5n8fw2KUEDahoobCio05Lh7q+1F1NKMM/CUTmraRCDrigXAMq9udbgVdPTK/DS2+7vlvIj
 8YjuO0QaP2rB0PF+Ylt1KRDp6tciYGG6lDPoygW33MJ7CH5Ly0F67nAJUigUkP+MmsYXE4ITu2h
 5DF4Ix4Zj9p2oPiUqXBK8XCTBHUFMbJlCq2kBhx+jL1cZrWX+ZjrJ+FmXi9ubVD3n8Vot8C+Gdi
 HoLeytjyDxdZWOfNyU05uR/hf8q7rSfVyUldUfEgRs5hRZWXGl+2s0e2Iwjez+KjHHmXUUarktO
 sdcnOlb5YPXEzlgv422L068G+lE9jx2Yo384y81+AlCZayS2l5L3hRP2g5HYrn/URu4XZnHGzVS
 74I+bkN4Kn5z2BrloZY25HdTqKknjQ==
X-Authority-Analysis: v=2.4 cv=SfL6t/Ru c=1 sm=1 tr=0 ts=68e6a639 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=3eHL1KmHa9FwJ4YL2wMA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: N5Jv42azu2pej-K6AWO6B-LqDQW5M-8u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

There is a ID pin present on HD3SS3220 controller that can be routed
to SoC. As per the datasheet:

"Upon detecting a UFP device, HD3SS3220 will keep ID pin high if VBUS is
not at VSafe0V. Once VBUS is at VSafe0V, the HD3SS3220 will assert ID pin
low. This is done to enforce Type-C requirement that VBUS must be at
VSafe0V before re-enabling VBUS"

Add support to read the ID pin state and enable VBUS accordingly.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/typec/hd3ss3220.c | 60 +++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index 3ecc688dda82..0e81e92f253c 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -15,6 +15,8 @@
 #include <linux/usb/typec.h>
 #include <linux/delay.h>
 #include <linux/workqueue.h>
+#include <linux/gpio/consumer.h>
+#include <linux/regulator/consumer.h>
 
 #define HD3SS3220_REG_CN_STAT		0x08
 #define HD3SS3220_REG_CN_STAT_CTRL	0x09
@@ -54,6 +56,11 @@ struct hd3ss3220 {
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
@@ -319,6 +326,28 @@ static const struct regmap_config config = {
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
 static int hd3ss3220_probe(struct i2c_client *client)
 {
 	struct typec_capability typec_cap = { };
@@ -354,6 +383,37 @@ static int hd3ss3220_probe(struct i2c_client *client)
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
+	hd3ss3220->vbus = devm_regulator_get_optional(hd3ss3220->dev, "vbus");
+	if (PTR_ERR(hd3ss3220->vbus) == -ENODEV)
+		hd3ss3220->vbus = NULL;
+
+	if (IS_ERR(hd3ss3220->vbus))
+		return dev_err_probe(hd3ss3220->dev,
+				     PTR_ERR(hd3ss3220->vbus), "failed to get vbus\n");
+
 	if (IS_ERR(hd3ss3220->role_sw)) {
 		ret = PTR_ERR(hd3ss3220->role_sw);
 		goto err_put_fwnode;
-- 
2.34.1



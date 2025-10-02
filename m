Return-Path: <linux-usb+bounces-28874-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00667BB4B15
	for <lists+linux-usb@lfdr.de>; Thu, 02 Oct 2025 19:28:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A832D1652D3
	for <lists+linux-usb@lfdr.de>; Thu,  2 Oct 2025 17:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB992765E3;
	Thu,  2 Oct 2025 17:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ajv4vE7M"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA6B275AF1
	for <linux-usb@vger.kernel.org>; Thu,  2 Oct 2025 17:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759425963; cv=none; b=Ej/ssf6b5hcHyfeyaRhywNYltNNaPtc1EbJQsKbn8BUoOuF90TGnu6ZAp1Os8FppTlvrovAiGp8X1l6NHcNgk3Bg0wztq/izY+sC1XEGnJO8UhB0U1CXrKPPnQpNJwbI6FFqumWP7loESMxiJjhnJcdra+n6JJJUmhdzLPug/40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759425963; c=relaxed/simple;
	bh=KpJUhLHlhpfLyU7v5hWLmJqH5SP+8qByBBw5bJBqoe4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ail0mlYBLEN8aCJ5apZUxkKfRrDBHjkzPA9G2xzfdfZN/Xcyn7/P4bprtgq4o0HCI3pDXagngl1neFNbPca0nFYU8KwuTNOa6VeWMom4GwXm1UhB2smBSjVFtoBm0xrSz8CgddlrGDnXZZSKTDQV5LvAIiA1H8PeQVcHV8KIIg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ajv4vE7M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59292bqj031462
	for <linux-usb@vger.kernel.org>; Thu, 2 Oct 2025 17:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dZF5G3OllrQ
	VIzCtQTPcNpCQm6618iDRuW3sNgs9wT8=; b=ajv4vE7MXKnJVmnN2oMeYShjOvR
	qg64a8b+edOYUATr7JgEOmRGlVfCzVfUwq/QF02DTudgF47jOHkOGLFcyhNFOeFY
	WuRtva8uH7W/ZQqOvh5fLgbKLmqy2O/tmLJ23nm4tYsrVz0sXBvcSlWCzMyNhP4y
	34yNycPYDlAfGRmkyGCdX8sPeufnd9oA8kVdxeRvW8kkGm0277aq9OT+x31wt/jR
	WCDF1pQTX82j06mw9Rd2ywz+u77tFZ+iTKS17A1y2xUDXl1gzlqZqkL/HA+a7ZQZ
	1hQqcrTcbsT8RQBY3E4gJ9Ip9aEKbWYVtyd14A41oAaJxujuK6J/HXoun6g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vr8gq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 02 Oct 2025 17:26:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b5516e33800so1704161a12.0
        for <linux-usb@vger.kernel.org>; Thu, 02 Oct 2025 10:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759425960; x=1760030760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZF5G3OllrQVIzCtQTPcNpCQm6618iDRuW3sNgs9wT8=;
        b=vBeMViaE9/3bQuBabAi4oxVXAqtNF0EE3c66Yq5+HE8nsuk2ZDGizdXDNW5/tkNUlW
         B38zssCRSjMs6gg2GgYDao+0wrW+vS8jKcm4imGsdv+YECkobqMhDm0MbAFMDtx23uaG
         bw9lO4JNQVdw5eJJRVFtpb8E+A8KJxhVFmVcYJ0a/wlog2USmEmBjw7es9u0zPRYlzCx
         dckW4u3xxeDEZ2zC6P5ExeV/Ir+5qAkaPSYFA16SHzX1G2OqAhtO7v0/DIw6kGfHz+qS
         8wEQoDVQEWvHwv0JD7Dw7sIVxbnEMpcxWW+vCAJDojeHr9ZN3R6qQbn4yIUuu91BwG8c
         ouTQ==
X-Gm-Message-State: AOJu0YwEFIa+XpetjLP++4z+R2VJkZ06tFmvROThdELPU6oWU335Pfu2
	It5bSdoj3moHP19Am+6vMl4l3Yc1jtIkJTbZvrIdXj0FxD+Dbl+f//OFB5gwgIRtqSxPlTKIx1b
	Y2ejbl/7CcH/TH2Vq5S1SOxqSiLYRGePpapvD/nVriZqzmeZ9qrMDU0lPJFZzIsE=
X-Gm-Gg: ASbGncsi9fR1pYMVYTTk5dWcLkIa5IAna+q46d9GdfgEC6Tma1w61xELsn7FE37/QW2
	HKotixoDLW/qsZVZGYqf15gW4T+LDC4BO6t2CSof2c8v62P5PX9G6QFy55XYq0ueHAaBjesSaIy
	n+MMzz27SJmGIMh9tv6fDnluSSkD3/KkZcCs3XXKHHvsVDlenJZcBOCrAqF4BvC+J0NwxMliujR
	pOK0+TdisbzA1v8rX7RZYuJoIJKtvGnTTbjnyrDik7dIueD57BaUawLmv1srqorEtMkz53kEcie
	qTiJDapq0P5bjInoKuIeT3A/Zcv1gVSoS3lZHq4JwaF1e5S8kvzHBgLb6k17zRBa/I5whtMJ7Al
	0Blxg1B8=
X-Received: by 2002:a05:6a21:6d9b:b0:2f6:cabe:a7ac with SMTP id adf61e73a8af0-32b620946bfmr267583637.34.1759425959788;
        Thu, 02 Oct 2025 10:25:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBdBouPUdDeim0CeupGCCbGHi5OzKKAktzwICCdkbUIZj19Y9+1mzW+TAuT6J/3p4skOgJZQ==
X-Received: by 2002:a05:6a21:6d9b:b0:2f6:cabe:a7ac with SMTP id adf61e73a8af0-32b620946bfmr267540637.34.1759425959285;
        Thu, 02 Oct 2025 10:25:59 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099f5b6e9sm2387423a12.40.2025.10.02.10.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 10:25:58 -0700 (PDT)
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
Subject: [PATCH 2/2] usb: typec: hd3ss3220: Enable VBUS based on ID pin state
Date: Thu,  2 Oct 2025 22:55:39 +0530
Message-Id: <20251002172539.586538-3-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002172539.586538-1-krishna.kurapati@oss.qualcomm.com>
References: <20251002172539.586538-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Z8iVf5GuCVB-DszQ925tRmKZAxxG0IEd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfXzDBJmckzx4Ag
 5Kk5RUnlV/HTdDPINILniHU87jL1tlnWYzG/7NJC/MxONFHEwzsOQjTbfTDXBK2onoDhTDD80oi
 o7ZTVXGijNmvyv1va8GNiQFIBKdy9WDFyGoV01qTHtopWqKdZIcO/3XEJifb1dEya3fYXySvfNB
 baEK/SmyemNQNgeRw+OJMOJTXGmaBRGh58eLB4grubE1/jm7GmWCtvZg4KFzZNZnLgCt7XXRnJ8
 7pYY8J7mkfZYIMPuTBr03DSqTHLrxaiV1WR/aafHb2DkMM2mzEPwPRoREg4MG9TOgXxQzcBV9UZ
 LQhxR6rE2mxHjAboYKWKfypWr4Y3RdJYBb+S7sH7TqZbBth369EzQgJlPjWEIvKn6txG7jCknNH
 ThsXIiGl2wwTj3nKenrRrE61aszx8Q==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68deb5a8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=UqlIXWcyfNZJISXVOQ4A:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Z8iVf5GuCVB-DszQ925tRmKZAxxG0IEd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_06,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017

Enable VBUS on HD3SS3220 when the ID pin is low, as required by the Type-C
specification. The ID pin stays high when VBUS is not at VSafe0V, and goes
low when VBUS is at VSafe0V.

Add support to read the ID pin state and enable VBUS accordingly.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/typec/hd3ss3220.c | 58 +++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index 3ecc688dda82..44ee0be27644 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -54,6 +54,11 @@ struct hd3ss3220 {
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
@@ -319,6 +324,28 @@ static const struct regmap_config config = {
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
@@ -354,6 +381,37 @@ static int hd3ss3220_probe(struct i2c_client *client)
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



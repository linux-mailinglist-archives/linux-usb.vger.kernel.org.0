Return-Path: <linux-usb+bounces-19303-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF9EA10018
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 06:06:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F0907A3920
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 05:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C035223A0E7;
	Tue, 14 Jan 2025 05:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1kTa67A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC232343B5
	for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 05:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736831151; cv=none; b=rfZayQ2C/o3Rabo0TMFCkRGCNP4QOSucq9iXZMjHykRjHcrCWTrWiGeSRJfSC3HANGcfK3vjb6aHyOq7za5li1kpg/+tco52efGiieTLx1DWl4eyb1gWRFaNWorHw0d4TNlGmqDOHDF6inMEH4qiCTlnHgrRPPNmNZ5rLWx8xKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736831151; c=relaxed/simple;
	bh=cEWULSiGoWIr4uAoz57xnHYom3cCE6za+4sS6e97+6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DExUgknCeYZwJZpspmcJGmJcyn7h9dnZ9tUFV4Pq/zrB4QbU738jMZoKnouNRMudiCZB4DZmaunYHr7koPBlmwiedft/nY1SEw+Wd7GkcirWjSHCV3fwnotHbMUOTP752SUlXFoWToiyew/dp0uiSbG1chA4G5BXpOAa/v9su+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1kTa67A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E40Q3e020687
	for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 05:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+VkUXrOLcLDpSxofU5hRKw+Y1fiuNviLtTxMsES8ipI=; b=J1kTa67A9rOEL9kr
	o+gjpSXV4RpgrN23L6Gs52iqfVyQ11AR/JyWCmMg/xawhLDOsulFRL2LdLjITnqq
	0RgIcuwOLYth9Q9yWRTrGJIp1ikXoHOkLY98F+SrN9MXZhRD3FtCOmvvIRtbmtC/
	h+a85Orzjm+1ETpHZr82/NDR14DSz7pquJqldnGbEwjJEUoAy2IaYfbg3f+FB44z
	ZUlfX7fLZVKbnZtGpV8Rt162tDgv3DHpA3GR+ZVe8kepjfFjb7Pju5mU8Bn6WDWK
	DcJzRr+5jtftOy/pZ92Klj+hlnlhGjNsELW77HGmgj3u3kbvVpgVOC2obR/WrsJt
	tp7eUQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445gh603ah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 05:05:48 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3eb8138cb32so3491197b6e.2
        for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2025 21:05:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736831147; x=1737435947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+VkUXrOLcLDpSxofU5hRKw+Y1fiuNviLtTxMsES8ipI=;
        b=K/ksnMUNmYf5lvDSWmcxJxYxSYcnwLvzCS3YkASd4wbSCmMI+VfIweoBrTbMNXUM2F
         u8MG03VP2tgZi7XWY3d3tO6D0KEF4f4M7F5YWYBH0rNfL2vMSMdRxQxmLPkzOi2Az6lz
         e2uQDLUDgQzMnjP3el1uOmJZ208dxOOCF+X529SzsMG5CkArytooQO3bjiZHptRQktZS
         j9mTgTs6Y+cj+Y6b165m/S4zj3askBgtaM2u8JL3SgGhEYRp53wPdkRXrBs6B6ec/3WW
         +9ehlf0LzYwz9OH+R7vCLZapR2/9m6VLfq2426VDdVrXEIrW9WiVNoyvllCd7Fxul/4D
         sAuA==
X-Forwarded-Encrypted: i=1; AJvYcCVib4uSdV4+sCyajoTfyt2cTlM4/EqXi4ORoaUN1m2AZVJAil7dneqwcp40I5F6XmlNhXi9uETlC8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjBO0pyyEDsnpMqo7P2Id4NlriPWNozFkwUIoO4v3vzJEaDYRc
	1sYXRGEBiM+ZOeQ7wb/0WqIPwAPjdyGS+bINyz9NmM8vL5b6XuY0u6hMSbc2fpQoAurcRZZNhEL
	qpMOeZoUmWCMK4NgW9q54GKEOLb1W6RLiaBpT2hli/ZkH+IWFy3iptF8wRyY=
X-Gm-Gg: ASbGncuJiCvZRBGOlWDt+MyjjOEmWIHnyPKi8fGXbZbjD/8xBUXjlOywoGZ+jlH26jF
	GiOEMFCveTj5XaFSh8gbstQdQ0y4BEnkpf/m2QFc348qY/VvS3s/rNJS3z4wL8ptIYw07gsuJsO
	mhtTc6Vn4PiFloqEo1kseXq5RaJsaOe3W3sqO5zMSk7jnVY3aIYPAUNozrJEv3LdQE25DD2hFx1
	QptmxQO4yqXhebtwSbxWFE2XenCTMqVgsfdz1IzDuNjImFtJbbzxDq+S4sDh3kqK/Axhe4EpwHB
	pVRtwCF5AGp1MOkosYl0R5fySUdmmqE1Ce4M3OVuaFMKzwpJouzkc3fP
X-Received: by 2002:a05:6808:6396:b0:3f0:e42:4dab with SMTP id 5614622812f47-3f00e425c3bmr9849873b6e.33.1736831147417;
        Mon, 13 Jan 2025 21:05:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF48gmKNJ7kvN2MsPkkY4TVIyrGT0lQ2sF5JyRVS+J4uOenMZH+1AAMJf2LdNd32YErsixZcw==
X-Received: by 2002:a05:6808:6396:b0:3f0:e42:4dab with SMTP id 5614622812f47-3f00e425c3bmr9849852b6e.33.1736831147117;
        Mon, 13 Jan 2025 21:05:47 -0800 (PST)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f882756603sm4001750eaf.29.2025.01.13.21.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 21:05:46 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 13 Jan 2025 21:11:36 -0800
Subject: [PATCH v3 03/12] of: dynamic: Add of_changeset_add_prop_copy()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-dwc3-refactor-v3-3-d1722075df7b@oss.qualcomm.com>
References: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
In-Reply-To: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
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
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2203;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=cEWULSiGoWIr4uAoz57xnHYom3cCE6za+4sS6e97+6E=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBnhfIVESRHXDU5xGo0wLQM+Yn/AExNqBNW8EdSt
 NuzfG1DIU2JAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ4XyFRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVWhw//WKnIBpDCTavyrPXwLpmezKe+u3AEL2Ncbr4RQMx
 bCAeTAdvL/tJh9aYXQTsQb2W9HEpjgAzLYdg6XYd6T5TlZoMLH13WQyKlpruTtQ7DweN8YH451D
 3BYwQbPqOVOBKSgg3xU/jNUgY44U0eidfat/m4bXm/c8kC+HUdygPSj20S3BSrmFfIW9peE0u/t
 Z2E1plVpFMuOkYHvIYRBN1T5n0h72UiwReUPETMbHhIk4LJGy7okp57usO1sSQ5KEXyRj2LUEjU
 s/jebX1avnVzryHlXKTMLPjA9n7BBN8uMq1bJskRW0lJKlUkiBZqlJVShhboUmv4FFJSsBuDtGG
 1u5SkgfK6O3mpWbEbAyD1aFsfudmwaGbYonENWUM3MjIg5GOMpbJv10nQUcn95V9z80xuTQ3T5U
 cw5JouNJWrhGVnt4i80hse4+AFWdhXzj3hGSypc3tGFm73Slug421961CXYE6HDmFYe/CjR53Ny
 i52SqwtxKfBw1p+tgNacPTUq3n3R/Uq1qxSOrXDz0jTlNecpdw1GmlxYYtbCjG95ivcPNED7t0n
 nDGw5t6B3RGZu1FpTv16I8aKIrNHfgtqOVDtojh30yyiJCadyUkv4567wkaquHtX2LwzMacJbF8
 tGf07oz+iMfexBd4Y87FK6JjetCVdN+TxK3O6Mhz4EWY=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: DdzRp52Hsw6PAQqQDi79SBWWIcifUJZs
X-Proofpoint-GUID: DdzRp52Hsw6PAQqQDi79SBWWIcifUJZs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 clxscore=1011
 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501140039

When implementing migration between bindings with different structure,
properties might move from one node to another.

Introduce a helper function to do this, releaving the caller from having
to care about the datatype of the property and/or peek into the struct
property.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/of/dynamic.c | 20 ++++++++++++++++++++
 include/linux/of.h   |  3 +++
 2 files changed, 23 insertions(+)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 0aba760f7577..e4d7ff53a892 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -1073,6 +1073,26 @@ int of_changeset_add_prop_bool(struct of_changeset *ocs, struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(of_changeset_add_prop_bool);
 
+/**
+ * of_changeset_add_prop_copy() - Add a property with name and value copied
+ * from an existing property, to a changeset.
+ *
+ * @ocs:	changeset pointer
+ * @np:		device node pointer
+ * @prop:	existing property to copy
+ *
+ * Create a new property with name and value copied from a provided property,
+ * to a changeset.
+ *
+ * Return: 0 on success, a negative error value in case of an error.
+ */
+int of_changeset_add_prop_copy(struct of_changeset *ocs, struct device_node *np,
+			       const struct property *prop)
+{
+	return of_changeset_add_prop_helper(ocs, np, prop);
+}
+EXPORT_SYMBOL_GPL(of_changeset_add_prop_copy);
+
 static int of_changeset_update_prop_helper(struct of_changeset *ocs,
 					   struct device_node *np,
 					   const struct property *pp)
diff --git a/include/linux/of.h b/include/linux/of.h
index f921786cb8ac..6a9bcdf9d629 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1667,6 +1667,9 @@ int of_changeset_update_prop_string(struct of_changeset *ocs,
 int of_changeset_add_prop_bool(struct of_changeset *ocs, struct device_node *np,
 			       const char *prop_name);
 
+int of_changeset_add_prop_copy(struct of_changeset *ocs, struct device_node *np,
+			       const struct property *prop);
+
 #else /* CONFIG_OF_DYNAMIC */
 static inline int of_reconfig_notifier_register(struct notifier_block *nb)
 {

-- 
2.45.2



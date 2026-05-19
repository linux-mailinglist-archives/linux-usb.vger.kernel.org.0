Return-Path: <linux-usb+bounces-37685-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KkCAjdCDGq4bwUAu9opvQ
	(envelope-from <linux-usb+bounces-37685-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 12:57:59 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DA00057D022
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 12:57:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 314C430F783F
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 10:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03B9D369D69;
	Tue, 19 May 2026 10:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BThaFmD3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CzGCluYl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810B332B13F
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 10:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187695; cv=none; b=BA8lgl7tGWooOErnwet6wCYqyFjPlMFF05hr64KV3tdakxsAUcMnCfhA3E7HEtlubWDhRpJ8RWJR/hZqJDxdGYBUaC+c+QMJ09NmThO2hyxkv04TO+jXrudA+3u6eXLVI6M5hAzIsmz540DlbM3MSe5d9LUjOuORhme+uiaBoic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187695; c=relaxed/simple;
	bh=APxUCObf8BVPKtv0F42GaM+94TzT8vxNnWzyBapE4EI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HHZOwkKdtkUhScerE8Rn+u43QDptujxhONZLo+gZf0Rr9PoYKgd6RMHbIaNlUcUIQqPYle61BOf0co6DXRNUmctrL1eLehD9iss1zKWf8LQs6er1CRsNb8tP22EGOILaVLSrdB0f00theFm57CO5KKvpCVIeLToGNGdCWXT0XwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BThaFmD3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CzGCluYl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5xUGk2438146
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 10:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gDa9ZMVWMhuQ1GptplD39wcf8xmC1uYPFbYSE44QLjc=; b=BThaFmD3LgMtG9hO
	r1zVtSH4x1z1pj85LWEZMYuTJjKITxdDUHwKwPhrYmbEaXRMA/j0U8iMrFNE6sky
	NzzpoDXqNWRyxG7OaNjke+Ap+R84oUb5I8WjhJrOLrnf9Lz0C2OqLPoI0vXA+qLd
	iEkqztjoGjEnfk7DvycEJMklAt0VBsCxHSQS1rJTRIfXdww9xgi8+2oMUD3FbqQf
	bxxiK+Y3koykq17E/cpCL/hhrCo5wGWyPdaMtPRrrSjYjbt5LpgTxe6dTPgW4ccb
	4RLThpCPTnCtZovdpiOrUw+sXDff8jKgaeg7wlm1YeAOEk8l85Nhr/495w2u1PRR
	WtOfJQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e834v4m1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 10:48:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8e8c47a3so100104341cf.0
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 03:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779187692; x=1779792492; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDa9ZMVWMhuQ1GptplD39wcf8xmC1uYPFbYSE44QLjc=;
        b=CzGCluYl1YSWCuJvqGNlW5uETxEYrRJMQDe7r3U9eJxQYUhT/D05tLdT2dmrscCqfa
         VYfU3zajlVZ8amaS4L5QECpv3RvhDkUXCA8y0zqEtskFpIuFD8vM9FT8t7mveMN3EeLT
         6/nHzm2ynznoIOCBglPH0jmcc9E76RauvTMPiUXl0BYQUqnApoLKWckz3i9OLpt6KzAN
         Hw/r/YBJJEuWOn0azRl7AmBdWjABEcMUBJMnrnCgXQ4o0gr9K7ihWqZlY4PLs+qn0tLp
         7GmhZFTUQODmsKhy4frwLIrwtOGnEcyWb2GNRFSdIU6s+OIQek/1YqpHyzqNwQxkrOEF
         Ik5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779187692; x=1779792492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gDa9ZMVWMhuQ1GptplD39wcf8xmC1uYPFbYSE44QLjc=;
        b=n2799lE89h0t57Ug5qLoH0oz3z/NEg3sDrJHm+J4YEYcAkoE0AXUB5LsuvmaQT0Hj8
         UlckMSj2MhBIAM31HwhOe6zJ91vaGXCLOIAgSxAP6atMg5/XXaWjiALpZWyGYQoUXwpa
         dQWz5xHLhitN0FFRW2thbF6J+v7WnjZbActgzUgEzy4IOlxFp+2RKnzqxYAvLTU36nOc
         58e2zpHQob2ID1boPg6kiHVYUnxR6pkrOI4psCaz7o+01b4pyMI3wHpItiV/XnIZkJeT
         ZQXl4IBw8Pms41C4ICvQu7MH6nOV7pVHXa8U/JD9ZxXRea7oyHpndoiNSLvm42801XEg
         CbQQ==
X-Forwarded-Encrypted: i=1; AFNElJ8oKuLhthNslgCRuOH0ElreJP7gosCRZmARQ3jaXK8HaMB5Hb29vqm1uLQUkqyR2KydwcGgXFsx/Pk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy95SO4X7q6O3AsSJhEy3mJngFQb3ydUgLTgCIOr8f0hKpcGdG8
	t+NNq5XPOlHTLM1klHTvQ4kS5v+RvJo8zGhRKDqHEczQ8ANs7GNFh+BLqNTbAZ2wXXLdNwebCQE
	daCPpHCALOZnHhft3CTyJGYypvA1qd089UfRBt5YQmqFWLciT8RCfXeRCJcg8tR4=
X-Gm-Gg: Acq92OHmuAAsI8GPJrjJjjX6RXS260LG0rs9sUVaaazMi5SQNNhMzJ8WH7I7jPElkul
	ykF2KHhEo8j1aOukkKpufZsIGFUY8yWbzA7ab5261by3EDi0YzF8esLkfy02rt2nybIFCJ2q4+/
	hhJspa25VbYtIBhLgFhPf2c8FsWarm5fal4p45MOmzMykyxwgj8sCI37vm0YN0FiOh6DjdY8kry
	7unG93b48ZRpBBuGN3pfaD9RlnstFGouMujLBUQidD5uFmQXD2I6+NhkEw2Wg48S1QnLsNGwSHf
	M3C+ctr+kgPO2SP/u0xFL8LDv2OSuYDHgnW+Ry6Jr66iLosqFdLDkImESCgDH+aCJA0rZwSTCKy
	io3Rrs6TBgvKV8RsMbX5s1mctVCIEZjyN9af/k7Jv9n1EFHrVLwD7T+g4UEiZKkgajCpijFTVk3
	bSvbgWeCH4op4JAn74QPAMdqMFsrMBpArIvU4=
X-Received: by 2002:a05:622a:544d:b0:50f:b17d:7e4a with SMTP id d75a77b69052e-5165a2766b0mr269662401cf.57.1779187691890;
        Tue, 19 May 2026 03:48:11 -0700 (PDT)
X-Received: by 2002:a05:622a:544d:b0:50f:b17d:7e4a with SMTP id d75a77b69052e-5165a2766b0mr269662001cf.57.1779187691409;
        Tue, 19 May 2026 03:48:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a59dsm4031413e87.25.2026.05.19.03.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:48:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:48:04 +0300
Subject: [PATCH 2/6] usb: typec: tcpm: qcom: prefer VBUS supply from the
 connector node
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-fix-tcpm-vbus-v1-2-14754695282d@oss.qualcomm.com>
References: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
In-Reply-To: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2062;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=APxUCObf8BVPKtv0F42GaM+94TzT8vxNnWzyBapE4EI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDD/mLbDeCaZaOwdAtlRsxQUtqIaE6KgbcJOqB
 4UxcFqW2qeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagw/5gAKCRCLPIo+Aiko
 1aE3B/wM4WHeEGwJ8kusNlI/jxbyTXEEuI5rSqyleiLE/17Ept7BtiW9EI8ljRMaDlK95WE6MZI
 as8oX1aKHlLRAGoOy9f/QLlqTkpUAELGv7UfFEdKwlKn8qdzwmUrAYlZZyYl1n9tWVft8FHniz+
 FHNwB1hG4c56CCQ9cl/38ftQ07hsHJKEt7R+BCRx6DTrqX6JVKDlC17Kj3v6LfI22VVZNYlRGG4
 LQEpG1w284WX2/02V9zwAjuCyViouhT6S16PQV8uA1bUJrYcg2787R//x5SQbtHrN7anSBSIDVT
 8cJzshglqnRP2AepWiUDF54158Ek35ONbsHkdycPuKFsEsWn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=F9ZnsKhN c=1 sm=1 tr=0 ts=6a0c3fec cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=3Ip0nfeMyQuR1jy_OcYA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: h1rasx3P_Mpu0lOd_uIig8VhoPHvRrg8
X-Proofpoint-GUID: h1rasx3P_Mpu0lOd_uIig8VhoPHvRrg8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNiBTYWx0ZWRfX2rCl6dKkj8kp
 l9ZIpTWUftpISKyVYcdkaDW8+X3PTAJW5ZICzeBLpyQNpYUNdOC0fNwKvWUDLQr3k7k8R1xo9Io
 zT4PvAu0xIO8uRY3bd+PiSd6/WschH7K/KgfP0dZ0fbzQXvoNDIDt/FAWtDc7pfHho8alND5sIZ
 hKgKwOv346xybt4qXJE2gv/tTycHAYKMlnKiH7SFsWBoEGqLu4cwQ1rTCf/uZFOPcLjLLArFP85
 ECzuz1Ngn2IwMjVX1tnFV+XmDy5rF9ABEwsRIxLMbxWDMkKOaUpBrU+JGvVzNX3Doh8fw67JPQl
 k0Hyfguc5X1Bug2Lnp9VpjUWHrAVLNo3OSjOiB7vjE75AwT7guEk/mqmy5d3TScu5o5wfzmLhpm
 OjJVl7q/wh+E8pGaUnITwKq9KUf7jystBS4aIPh0IjoYy7QaMqaxe4YGoiyd0AfOcLm0QdcooIN
 AuGKgEPHfTeLWjBbTog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190106
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37685-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,linuxfoundation.org,kernel.org,linux.intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DA00057D022
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Current way of specifying VBUS supply (via the device's vdd-vbus-supply
property) is not ideal. In the end, VBUS is supplied to the USB-C
connector rather than the Type-C block in the PMIC. Follow the standard
way of specifying it (via the connector node) and fallback to the old
property if there is no vbus-supply in the connector node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index 8051eaa46991..429bd42a0e62 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
@@ -704,6 +705,7 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
 	struct device *dev = &pdev->dev;
 	struct pmic_typec_port_irq_data *irq_data;
 	struct pmic_typec_port *pmic_typec_port;
+	struct fwnode_handle *connector;
 	int i, ret, irq;
 
 	pmic_typec_port = devm_kzalloc(dev, sizeof(*pmic_typec_port), GFP_KERNEL);
@@ -720,7 +722,15 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
 
 	mutex_init(&pmic_typec_port->vbus_lock);
 
-	pmic_typec_port->vdd_vbus = devm_regulator_get(dev, "vdd-vbus");
+	connector = device_get_named_child_node(dev, "connector");
+	if (!connector)
+		return -EINVAL;
+
+	pmic_typec_port->vdd_vbus = devm_of_regulator_get_optional(dev,
+								   to_of_node(connector),
+								   "vbus");
+	if (pmic_typec_port->vdd_vbus == ERR_PTR(-ENODEV))
+		pmic_typec_port->vdd_vbus = devm_regulator_get(dev, "vdd-vbus");
 	if (IS_ERR(pmic_typec_port->vdd_vbus))
 		return PTR_ERR(pmic_typec_port->vdd_vbus);
 

-- 
2.47.3



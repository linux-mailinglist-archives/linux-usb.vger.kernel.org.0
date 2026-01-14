Return-Path: <linux-usb+bounces-32353-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A933D214E7
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 22:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3632303C9E3
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 21:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55DD36167A;
	Wed, 14 Jan 2026 21:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aK8k78L7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NE9agfyQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D8B36166A
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 21:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768425493; cv=none; b=M4ehsgJ8esa9KJFwT5E0/na6it0JqURFnXfajEUL1uzaeKParXgoxxehBOLg04HnnH+r6Wwfs5UaeC1zQkOQldBUexaUGFOuLPDOZfsmb/JzIRns5HzB6L1NA5lCHnpx9lCW94lM63AzoPY0gAH749cSmeyZMMripj2q6S+RFXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768425493; c=relaxed/simple;
	bh=ecY11OcBKXMq1MGLCiWZ0y7+hdHphUxMDqj2qDFYseQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tzTtR+0hwTHOAvn/dDPUh7K0uRZBiZGs4Vf9x0Brz9TzjqfP2WmfAA6qm71lF5DPiUiTwcuvhkYUsXsJCLPR8J6PmL02BPwq/ziAIFCFsmZi9pMx4q7vBlDZlQgZ6QAIV/wWNsvKuIOLo+7hOEQG5MPvIEWF/PyIPqh1cwShOOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aK8k78L7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NE9agfyQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EKGV0D4136102
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 21:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WdRL0KAbzlU
	oIRwhSbOkMecyH3ewE7SUBGAdWwEOO/k=; b=aK8k78L7yu6GCJ7osxivzv9EbSQ
	9o4pTHhgDpYUfxyWv7VXF60wwJER+xJeQfDZbFQkUANDj0/pQ2h3hJHOVaN05qJ1
	CRuP5Iq70+r8p9hfkvGMCq7eR15MzG1egwjOrc+ZnwKJ3JzBt6G/mkBtq2qLrP+e
	gycBonO0jlwOkg1zYpXbC0polAFk8Xvd/EKKe7Szxzhk2kNfP3Hq0Bs9uQcov1Fk
	qgdsU3inE/bTsX3Q31eu7VrRe7EG/XNjsN/L4hIJISxlL6/3wBqoRaijRCQwfkco
	h3NeHJaRoqK2DoSmy1EUQZJrIr8yrWtubiRhmTNS6szhcDnVqKlMqxAoESg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpj1pr4f6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 21:18:07 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1232dd9a256so1175220c88.1
        for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 13:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768425486; x=1769030286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WdRL0KAbzlUoIRwhSbOkMecyH3ewE7SUBGAdWwEOO/k=;
        b=NE9agfyQQMOWSBWFKOp630wsO4//GsWtKFZGCjC+LX3tICR2Bh+C04ZsIJS8MMZoQ7
         EV+YlhXyXDAlprRLz7l6/BaLXeqgG5BXGdNRk9uU8Jh87uhu4ryvu5uWERZ21EgDh12A
         IXA5uq1wqM4/mA++6wG23R8A0VGVUBtj4UPpKSu7kO81Joc/YKrc6SL1ieP4ZixVoyeH
         y4hNuNBaIIDNER/XPIi1OgEKgIu9THBVk9EHT1ALR8iWXzaEYBTOhO5JRIdiU+uSpD9T
         OsxHBGY/v6EQXYHyCs83KCOv3icRvZhWY2xAshlUoeYGQOobmm35gtcUPJXoDaVI9Hxb
         mDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768425486; x=1769030286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WdRL0KAbzlUoIRwhSbOkMecyH3ewE7SUBGAdWwEOO/k=;
        b=D/CSp22iLG/5Sv1Ramqo6tEzOxB2Lan6mx7d5YfIRhCYV9Cr1FzqLpN4I5b40Vn+Lb
         c2dXpxx2RDwd5R1hUM2Db/wBnOg0s0iRJyr740ex0KJNb/m0+zxApmWT2GdiUVb8SxZ8
         0CvID39UZbllJIfSY5oWTpBaFZVRqyXU+ka3jCeePOspE1TaTRanzD3cKesshx2PHR5b
         VxlIIgWNJOVrI4NM+Rzc7/GH1v1Vfi+9cLFUV92qBdi1PnWzEV4IcmOwldJvbOxr6JXV
         p8IZHj+949MhaIFlD93hnQ5HdpauPnEz6wflowrJ6k/IH+SFPMLMHmkgME44l2esuW7w
         1HdA==
X-Forwarded-Encrypted: i=1; AJvYcCUZIgE6WkFg6U6bhMsFqQL9RCLOn34uGUF6nmBxgJ+5rbCCrwfntfYpabDkHWwuVWh2fEZEwu4bKuo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIiOz8SarvVX05kA24XjOXe6Xr6Ydptq11UUwwGOawJDoNgtyu
	Axfzbn6S2BDS5R/Nweuq0Q4NZlC/O1p5BaadyRG3kUrUeAU3lO1SfhB5ptW0QkQD+JiCjEXGFjT
	sei2TqvthXG/RvpSpIhXyLiN/BlXqB5GBPckx5UgZdAipSi/lZ1595XMKmujTDh4=
X-Gm-Gg: AY/fxX6X1V9syX/eARIQ8CWe4Ftjvmgu8rwUdrgunZj1QUhxbbiXvBYQEvwsqSjoL+S
	9gDCjmMjDH2/mh7PE1e/SEKIbgwthCBlH+RbS6Wq+8Z5jEMv4yVjpo5YWBi2gzWG78YHs6tUuz9
	tAv3snVz9uIFD6hGHOzTuqMWJ0eBnjBFwupGBYmmnkqxa7Mj5oem57KRPqHlZmqUxTUaey04mvV
	hycvjNT8+84h9ApVJp5ZnXx9Vpt25T2w9bllzjvoh3HJF+B0Ck1sOJRESHEnH/VpZxQMpCEng+X
	t8cko37XDFuLlcfu2Ppa69Z3QYq1aJ9uUQtRJ7j7CFq8hPyBSUj+S99/kn/M+clbRGLup3I4lEB
	uwLlnMn75gVgaZp9ChWMr6qDQueQm7mPYBVhGTUnJGjKy823M0402d0D+LH4V5pw9atOapwVk
X-Received: by 2002:a05:7022:910:b0:11e:4fc:9b33 with SMTP id a92af1059eb24-1233cfac8c6mr816293c88.1.1768425485893;
        Wed, 14 Jan 2026 13:18:05 -0800 (PST)
X-Received: by 2002:a05:7022:910:b0:11e:4fc:9b33 with SMTP id a92af1059eb24-1233cfac8c6mr816258c88.1.1768425485241;
        Wed, 14 Jan 2026 13:18:05 -0800 (PST)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f243421esm32167118c88.2.2026.01.14.13.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 13:18:04 -0800 (PST)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        abel.vesa@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v4 4/4] soc: qcom: pmic_glink: Add charger PDR service path and service name to client data
Date: Wed, 14 Jan 2026 13:17:59 -0800
Message-Id: <20260114211759.2740309-5-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260114211759.2740309-1-anjelique.melendez@oss.qualcomm.com>
References: <20260114211759.2740309-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE3NCBTYWx0ZWRfX6oGG0VMFpfkr
 03oGOiRKvZfgRmuT6aZ6SNznD5X/S5LbVhA5u3LQk3Hv34JtjRiIpHAsIOEydTI7NFPQR74Rn89
 9I2tHHkGvlPn6QuJb6Lf7JKdFJ3hHiNvJI6W1QmSzIPi49K98uPF/VUgTxrJDVPx1DvSSoqULT4
 NtBmc/p8/1FfpqYh7L7AFm2ck8AzvXeHvNB3UuT80/wSogPP6902S7T13+OzM83n5n6QBzw86gB
 So3/CKHsxMkfar8yDIJLyRhcOzmUEC8jVF7bzSw8njEma13EIo1LquLdCfw1nb2GHEunMGDpwu7
 Ax4nCizhdPCrAjzQpKe2CnYjuOfkrTzoaO3vdu8mv0U7Hfs+1E+DBhQCoks2jNuu8yZoxs3tuYE
 rvkV/XTllEqy7Ac4bBssDEaJp2HDpRoAQc/VTG2v6jN3qEQ6iwlgLAqck9RwMivl/mRJl8Grhtu
 a9XJ2fl0Ghvty4/LO5A==
X-Authority-Analysis: v=2.4 cv=J+KnLQnS c=1 sm=1 tr=0 ts=6968080f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=X7TptQfD4XCScbvf-kcA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: onHbyuAUI8KoEcRecGf8LSl7Lrc1Jxym
X-Proofpoint-ORIG-GUID: onHbyuAUI8KoEcRecGf8LSl7Lrc1Jxym
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1011 suspectscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140174

Currently, the charger PD service path and service name are hard coded
however these paths are not guaranteed to be the same between SOCs. For
example, on Kaanapali and Glymur, Charger FW runs on SOCCP(another subsystem)
which does not have any specific charger PDs defined.

Define charger PDR service path and service name as client data so that
each PMIC generation can properly define these paths.

While at it, add qcom,kaanapali-pmic-glink and qcom,glymur-pmic-glink
compatible strings.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink.c | 66 ++++++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 24 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index 627f96ca322e..3042261578aa 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -23,13 +23,19 @@ enum {
 	PMIC_GLINK_CLIENT_UCSI,
 };
 
+struct pmic_glink_data {
+	unsigned long	client_mask;
+	const char	*charger_pdr_service_name;
+	const char	*charger_pdr_service_path;
+};
+
 struct pmic_glink {
 	struct device *dev;
 	struct pdr_handle *pdr;
 
 	struct rpmsg_endpoint *ept;
 
-	unsigned long client_mask;
+	const struct pmic_glink_data *data;
 
 	struct auxiliary_device altmode_aux;
 	struct auxiliary_device ps_aux;
@@ -292,7 +298,6 @@ static struct rpmsg_driver pmic_glink_rpmsg_driver = {
 
 static int pmic_glink_probe(struct platform_device *pdev)
 {
-	const unsigned long *match_data;
 	struct pdr_service *service;
 	struct pmic_glink *pg;
 	int ret;
@@ -309,12 +314,10 @@ static int pmic_glink_probe(struct platform_device *pdev)
 	spin_lock_init(&pg->client_lock);
 	mutex_init(&pg->state_lock);
 
-	match_data = (unsigned long *)of_device_get_match_data(&pdev->dev);
-	if (!match_data)
+	pg->data = of_device_get_match_data(&pdev->dev);
+	if (!pg->data)
 		return -EINVAL;
 
-	pg->client_mask = *match_data;
-
 	pg->pdr = pdr_handle_alloc(pmic_glink_pdr_callback, pg);
 	if (IS_ERR(pg->pdr)) {
 		ret = dev_err_probe(&pdev->dev, PTR_ERR(pg->pdr),
@@ -322,27 +325,30 @@ static int pmic_glink_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI)) {
+	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI)) {
 		ret = pmic_glink_add_aux_device(pg, &pg->ucsi_aux, "ucsi");
 		if (ret)
 			goto out_release_pdr_handle;
 	}
-	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE)) {
+	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE)) {
 		ret = pmic_glink_add_aux_device(pg, &pg->altmode_aux, "altmode");
 		if (ret)
 			goto out_release_ucsi_aux;
 	}
-	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_BATT)) {
+	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_BATT)) {
 		ret = pmic_glink_add_aux_device(pg, &pg->ps_aux, "power-supply");
 		if (ret)
 			goto out_release_altmode_aux;
 	}
 
-	service = pdr_add_lookup(pg->pdr, "tms/servreg", "msm/adsp/charger_pd");
-	if (IS_ERR(service)) {
-		ret = dev_err_probe(&pdev->dev, PTR_ERR(service),
-				    "failed adding pdr lookup for charger_pd\n");
-		goto out_release_aux_devices;
+	if (pg->data->charger_pdr_service_name && pg->data->charger_pdr_service_path) {
+		service = pdr_add_lookup(pg->pdr, pg->data->charger_pdr_service_name,
+					 pg->data->charger_pdr_service_path);
+		if (IS_ERR(service)) {
+			ret = dev_err_probe(&pdev->dev, PTR_ERR(service),
+					    "failed adding pdr lookup for charger_pd\n");
+			goto out_release_aux_devices;
+		}
 	}
 
 	mutex_lock(&__pmic_glink_lock);
@@ -352,13 +358,13 @@ static int pmic_glink_probe(struct platform_device *pdev)
 	return 0;
 
 out_release_aux_devices:
-	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_BATT))
+	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_BATT))
 		pmic_glink_del_aux_device(pg, &pg->ps_aux);
 out_release_altmode_aux:
-	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE))
+	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE))
 		pmic_glink_del_aux_device(pg, &pg->altmode_aux);
 out_release_ucsi_aux:
-	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI))
+	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI))
 		pmic_glink_del_aux_device(pg, &pg->ucsi_aux);
 out_release_pdr_handle:
 	pdr_handle_release(pg->pdr);
@@ -372,23 +378,35 @@ static void pmic_glink_remove(struct platform_device *pdev)
 
 	pdr_handle_release(pg->pdr);
 
-	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_BATT))
+	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_BATT))
 		pmic_glink_del_aux_device(pg, &pg->ps_aux);
-	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE))
+	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE))
 		pmic_glink_del_aux_device(pg, &pg->altmode_aux);
-	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI))
+	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI))
 		pmic_glink_del_aux_device(pg, &pg->ucsi_aux);
 
 	guard(mutex)(&__pmic_glink_lock);
 	__pmic_glink = NULL;
 }
 
-static const unsigned long pmic_glink_sm8450_client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
-							   BIT(PMIC_GLINK_CLIENT_ALTMODE) |
-							   BIT(PMIC_GLINK_CLIENT_UCSI);
+static const struct pmic_glink_data pmic_glink_adsp_data = {
+	.client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
+		       BIT(PMIC_GLINK_CLIENT_ALTMODE) |
+		       BIT(PMIC_GLINK_CLIENT_UCSI),
+	.charger_pdr_service_name = "tms/servreg",
+	.charger_pdr_service_path = "msm/adsp/charger_pd",
+};
+
+static const struct pmic_glink_data pmic_glink_soccp_data = {
+	.client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
+		       BIT(PMIC_GLINK_CLIENT_ALTMODE) |
+		       BIT(PMIC_GLINK_CLIENT_UCSI),
+};
 
 static const struct of_device_id pmic_glink_of_match[] = {
-	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_sm8450_client_mask },
+	{ .compatible = "qcom,glymur-pmic-glink", .data = &pmic_glink_soccp_data },
+	{ .compatible = "qcom,kaanapali-pmic-glink", .data = &pmic_glink_soccp_data },
+	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_adsp_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, pmic_glink_of_match);
-- 
2.34.1



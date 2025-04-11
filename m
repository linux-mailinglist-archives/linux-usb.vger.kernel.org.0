Return-Path: <linux-usb+bounces-22939-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFA0A8523C
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 05:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65D8F8C7A47
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 03:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 514C127E1B9;
	Fri, 11 Apr 2025 03:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O56/WXgu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759D127CCCA
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 03:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744343432; cv=none; b=jALIBpevSZyEEWwO37cdqyL1cYpNn2LPO+oNCEjp9i59AlQenYsX+am7ITukQP3LVzR/MjNUJ1NQyTfRFREY29meUtGcsbJ0RenOWSo5EXwZjb2oAdCBkX56mU/fc0p9eZIPj1d4waJbuHF7lBnZXPts79NImepAF7X6U9VwkC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744343432; c=relaxed/simple;
	bh=eylNP/MVwmIZO0WiTuDeQRw5pwyO60eLvuDpJ+DFfAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YPo/qji1ctfKw7rbFLjA95o04xbjGBXXWh4D9coxdVGfZJFMAI57AOpG7ixwvcxieaun4DHDTERi+sfvepw5ouVaomQLu4GZaHi8inJDANKFoSUnsWS+F8ZEx2zFxDM6Um0LzkPYeA0wTD3mI9Qb/yh1GrAhuIkHaDnjTCY7B9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O56/WXgu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFpgW5018740
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 03:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L9awIOHbW/9d99fkXNWdgA+NRLgt9qUgdqf8RZPTDbE=; b=O56/WXguWyDosGOM
	0T+hSgKMoQzo0d9n2S6xHpRF+HBBWaOJbLYT5gnBMiCitVyvZ00tnFFJwc3PL4A6
	kUsv8RKpsRu/OWxo3FtwTR5dAGDla3XUG3r6yhZZFZrm8Tl4tCOVM6uWJ1qJaas4
	cDnilOWrWlPRQazLQnLExUbL0BiPMgJtAwQTQ11LH7gsAXJfA/lb3dOLyH1yTBND
	rR760LWTmlm1EE+i/SFUdBoD5gV92E9bdzWk8nsT2gx2ALohahXUvS711O5CZInO
	pPD7Bb3rgKz8AaJ1e1prJIq3qlebMwJOkL0XnIEaQTIHvgnOqi5AOrm2dWMSlrj9
	OjNUXA==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdgs8bs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 03:50:27 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-2c6eb3e0b2aso429892fac.0
        for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 20:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744343427; x=1744948227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9awIOHbW/9d99fkXNWdgA+NRLgt9qUgdqf8RZPTDbE=;
        b=Mlevb9nO5j07DRVes7t0DO6Aal4OdHnXBX8+9K03aqoYmREOdt1Z44ugz7+qJc2BRi
         x6/ghj0QFVVF72Mak+icpevVPNd+PZXV5u9T3bsVISuPhQ8FkQK9g1+6Hcr27YJiIQCn
         ++jOm3eKeqbNPnuYsZHhRdluyqF8jpsDORdvBCukHnq0vFPBRJ4XViS7XLDrMNsE8bIj
         7m2cEL6fOJhYb0ADQ1S31oL/VT3IQc2X/tjQxeD/BkgtQctrpMriShoMH/CiIo3zjwZS
         yOx9NRmpU8Sn8EvQdTjvmuCO9FMOT4AzHrlOj8sLJAIjWa/0zGA5g0AApqQMswkEDsiq
         SYww==
X-Forwarded-Encrypted: i=1; AJvYcCWcy2YDRJLGrI1zQ/ZloAioS0VL3FYEL79WHgBMNTp0Ue7xDakQgKQDFfHV3zU1mtger3eEKUmI+SA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzial6G2hdTl1b5/+zL1dYeYY2aptYHRC3ez6gYfz4CtYYDfauK
	YDgyRUGNBt3i+22X0GJAHL2JVKOFFHtcTThEItuZw4IkCipNtJ90z4yfIoKdQeK3+glhggpeb44
	/RwzQS8n1HYI/W0Y1Cgl/5a1P+1gKj0g4WDOOmrF6aLRj5TVx116MsvZ7ggY=
X-Gm-Gg: ASbGncu7d7u+t2FyehChUDtIi1tfJ436gCz4IouxMHvxI89I3IIluQuKQLOH8c0qBQ9
	9pa/qE8XmgRRvJca4wxW5BqoGZs0THBxccSRLVDeoPHtJ1X4ngJ71RylEWhnbInyOfFuW2jhK7d
	DnfXgtXlKWSkSyielvJrVFewC5wJ7fiA4ULT3ZdpJgSk98OzNf+VZgIxHcxeqHRZkl1eNnEK7Ec
	FIDgEsDbWKz94AlTK0Ytgn8McfQ0EHgND8wePDURKTRIS/EyUxgqrGOFIP0zOf9df1UV7ZQVuMp
	54xiGPl8Hk1Fq7ehi0lPVCob23HqnQzAvUebywMB+9Wnd94st058tXHgIbejYcB9XfftDvBLJwy
	iep5RyC8i6W0=
X-Received: by 2002:a05:6871:6086:b0:29e:5e83:150e with SMTP id 586e51a60fabf-2d0d5f408f3mr726963fac.27.1744343427007;
        Thu, 10 Apr 2025 20:50:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGds5or6itv0cAXIy25Pi0bWS79kT90catOfm7KwC3Kc36Ct8qPOt/2sNNXS0xVNhRGl+sB4g==
X-Received: by 2002:a05:6871:6086:b0:29e:5e83:150e with SMTP id 586e51a60fabf-2d0d5f408f3mr726951fac.27.1744343426717;
        Thu, 10 Apr 2025 20:50:26 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d0969589basm958677fac.19.2025.04.10.20.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 20:50:26 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 22:50:15 -0500
Subject: [PATCH v6 4/6] usb: dwc3: core: Don't touch resets and clocks
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-dwc3-refactor-v6-4-dc0d1b336135@oss.qualcomm.com>
References: <20250410-dwc3-refactor-v6-0-dc0d1b336135@oss.qualcomm.com>
In-Reply-To: <20250410-dwc3-refactor-v6-0-dc0d1b336135@oss.qualcomm.com>
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
        Frank Li <Frank.Li@nxp.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2709;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=eylNP/MVwmIZO0WiTuDeQRw5pwyO60eLvuDpJ+DFfAM=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBn+JF9cyHT6TOW0ZmSORd1KwgaYZBE5K95tm2F8
 ZzbXG1zBqiJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ/iRfRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXUbQ//dPUpUHbtFTycWDJh7RBbuCyuPg8FJz/yUCuOtLs
 2SrFBAjgwL0UR2tVxIqFmOL+iUlZyY5920w1hQHxgLqO/eAmspwghsRbefQ01lkGk9kwGwXmwU2
 LUBRI9FsK1FqNXntNVSFVRpFsjAH9MQejRQIQHIhwkxWVVqfgjIuDejwNupjlIDkG4n9lG0SAsL
 nOrtgSG6pXf2UzayQtioDAQoYwmOeXxaGRhAeumY79RvO1zDClLx6xch5442ziCQak4Wunz81/q
 5xxBXaxRV3+mwTOS8S+P0gWViw54U07rk8nHdwgo+RzNDyp0h//gmHF42aekt37A6bL7yn6w9O1
 qZJGAjf6aIHKKZvB8FsuBbfCMEYMlc2Q02nI/RtcrvgDzH8/1RRpJcxKRfsYrzuZRCakTdHgezn
 4BkXtGDXR7iQefIlFU3qLAqHbBFSEyB9F+kHNyEevWojPRu8xnw1awo/+L8HJBrU3oB6pp4KBTc
 Pl8FyuuP+ntfZU7aH8oBjsAqi1AePOTKAeVO9r0OZEMR8J4yvwASgLCFb+uXaE2pmZaasGA5RA4
 A4Rhd4pG1bsnhX7u3LvDrF1Sd19HEtexn76a22ns1euuwKzdkw5cUnqoDQEIIP6YyVOd4OcjXOp
 BUE+8QJYGTsKHkrX4QmAzqm9+zGEFU6yT/eHR/KjpSww=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f89183 cx=c_pps a=Z3eh007fzM5o9awBa1HkYQ==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=8AirrxEcAAAA:8 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8 a=8-AmaxdNuiZsqJm69HAA:9
 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: epU9gK8ZHQ494nnON7G90qh8x7bBEVv7
X-Proofpoint-GUID: epU9gK8ZHQ494nnON7G90qh8x7bBEVv7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110026

When the core is integrated with glue, it's reasonable to assume that
the glue driver will have to touch the IP before/after the core takes
the hardware out and into reset. As such the glue must own these
resources and be allowed to turn them on/off outside the core's
handling.

Allow the platform or glue layer to indicate if the core logic for
clocks and resets should be skipped to deal with this.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.c | 20 +++++++++++---------
 drivers/usb/dwc3/glue.h |  3 +++
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index b428b6fc3d0a55811e2f75d33d79df4b0c67dcac..77a9848a0ac70fbe563988cecbe489130989aadc 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2198,15 +2198,17 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
 	if (IS_ERR(dwc->usb_psy))
 		return dev_err_probe(dev, PTR_ERR(dwc->usb_psy), "couldn't get usb power supply\n");
 
-	dwc->reset = devm_reset_control_array_get_optional_shared(dev);
-	if (IS_ERR(dwc->reset)) {
-		ret = PTR_ERR(dwc->reset);
-		goto err_put_psy;
-	}
+	if (!data->ignore_clocks_and_resets) {
+		dwc->reset = devm_reset_control_array_get_optional_shared(dev);
+		if (IS_ERR(dwc->reset)) {
+			ret = PTR_ERR(dwc->reset);
+			goto err_put_psy;
+		}
 
-	ret = dwc3_get_clocks(dwc);
-	if (ret)
-		goto err_put_psy;
+		ret = dwc3_get_clocks(dwc);
+		if (ret)
+			goto err_put_psy;
+	}
 
 	ret = reset_control_deassert(dwc->reset);
 	if (ret)
@@ -2321,7 +2323,7 @@ EXPORT_SYMBOL_GPL(dwc3_core_probe);
 
 static int dwc3_probe(struct platform_device *pdev)
 {
-	struct dwc3_probe_data probe_data;
+	struct dwc3_probe_data probe_data = {};
 	struct resource *res;
 	struct dwc3 *dwc;
 
diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
index e73cfc466012f07214291abe56454934ab014013..703d40c189565b1e28ae28afb8728b78f4cd2fca 100644
--- a/drivers/usb/dwc3/glue.h
+++ b/drivers/usb/dwc3/glue.h
@@ -13,10 +13,13 @@
  * dwc3_probe_data: Initialization parameters passed to dwc3_core_probe()
  * @dwc: Reference to dwc3 context structure
  * @res: resource for the DWC3 core mmio region
+ * @ignore_clocks_and_resets: clocks and resets defined for the device should
+ *		be ignored by the DWC3 core, as they are managed by the glue
  */
 struct dwc3_probe_data {
 	struct dwc3 *dwc;
 	struct resource *res;
+	bool ignore_clocks_and_resets;
 };
 
 int dwc3_core_probe(const struct dwc3_probe_data *data);

-- 
2.49.0


